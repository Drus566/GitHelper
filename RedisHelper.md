## An introduction to Redis data types and abstractions
* Binary-safe strings.
* Lists: collections of string elements sorted according to the order of insertion. They are basically linked lists.
* Sets: collections of unique, unsorted string elements.
* Sorted sets, similar to Sets but where every string element is associated to a floating number value, called score. The elements are always taken sorted by their score, so unlike Sets it is possible to retrieve a range of elements (for example you may ask: give me the top 10, or the bottom 10).
* Hashes, which are maps composed of fields associated with values. Both the field and the value are strings. This is very similar to Ruby or Python hashes.
* Bit arrays (or simply bitmaps): it is possible, using special commands, to handle String values like an array of bits: you can set and clear individual bits, count all the bits set to 1, find the first set or unset bit, and so forth.
* HyperLogLogs: this is a probabilistic data structure which is used in order to estimate the cardinality of a set. Don't be scared, it is simpler than it seems... See later in the HyperLogLog section of this tutorial.
* Streams: append-only collections of map-like entries that provide an abstract log data type. They are covered in depth in the Introduction to Redis Streams.

### Redis keys

Redis keys are binary safe, this means that you can use any binary sequence as a key, from a string like "foo" to the content of a JPEG file. The empty string is also a valid key.

A few other rules about keys:

* Very long keys are not a good idea. For instance a key of 1024 bytes is a bad idea not only memory-wise, but also because the lookup of the key in the dataset may require several costly key-comparisons. Even when the task at hand is to match the existence of a large value, hashing it (for example with SHA1) is a better idea, especially from the perspective of memory and bandwidth.
* Very short keys are often not a good idea. There is little point in writing "u1000flw" as a key if you can instead write "user:1000:followers". The latter is more readable and the added space is minor compared to the space used by the key object itself and the value object. While short keys will obviously consume a bit less memory, your job is to find the right balance.
* Try to stick with a schema. For instance "object-type:id" is a good idea, as in "user:1000". Dots or dashes are often used for multi-word fields, as in `"comment:1234:reply.to"` or `"comment:1234:reply-to"`.
* The maximum allowed key size is 512 MB.

### Redis Strings
```
> set mykey somevalue
OK
> get mykey
"somevalue"
```
Values can be strings (including binary data) of every kind, for instance you can store a jpeg image inside a value. A value can't be bigger than 512 MB.

The SET command has interesting options, that are provided as additional arguments. For example, I may ask SET to fail if the key already exists, or the opposite, that it only succeed if the key already exists:
```
> set mykey newval nx
(nil)
> set mykey newval xx
OK
```

Even if strings are the basic values of Redis, there are interesting operations you can perform with them. For instance, one is atomic increment:
```
> set counter 100
OK
> incr counter
(integer) 101
> incr counter
(integer) 102
> incrby counter 50
(integer) 152
```
> The INCR command parses the string value as an integer, increments it by one, and finally sets the obtained value as the new value. There are other similar commands like INCRBY, DECR and DECRBY. Internally it's always the same command, acting in a slightly different way.

There are a number of commands for operating on strings. For example the GETSET command sets a key to a new value, returning the old value as the result. You can use this command, for example, if you have a system that increments a Redis key using INCR every time your web site receives a new visitor. You may want to collect this information once every hour, without losing a single increment. You can GETSET the key, assigning it the new value of "0" and reading the old value back.
```
 redis>  SET mykey "Hello"

"OK"

redis>  GETSET mykey "World"

"Hello"

redis>  GET mykey

"World"

redis>  
```

The ability to set or retrieve the value of multiple keys in a single command is also useful for reduced latency. For this reason there are the MSET and MGET commands:
```
> mset a 10 b 20 c 30
OK
> mget a b c
1) "10"
2) "20"
3) "30"
```
> When MGET is used, Redis returns an array of values.

### Altering and querying the key space
For example the EXISTS command returns 1 or 0 to signal if a given key exists or not in the database, while the DEL command deletes a key and associated value, whatever the value is.
```
> set mykey hello
OK
> exists mykey
(integer) 1
> del mykey
(integer) 1
> exists mykey
(integer) 0
```

There are many key space related commands, but the above two are the essential ones together with the TYPE command, which returns the kind of value stored at the specified key:
```
> set mykey x
OK
> type mykey
string
> del mykey
(integer) 1
> type mykey
none
```

### Redis expires: keys with limited time to live
A few quick info about Redis expires:
* They can be set both using seconds or milliseconds precision.
* However the expire time resolution is always 1 millisecond.
* Information about expires are replicated and persisted on disk, the time virtually passes when your Redis server remains stopped (this means that Redis saves the date at which a key will expire).

Setting an expire is trivial:
```
> set key some-value
OK
> expire key 5
(integer) 1
> get key (immediately)
"some-value"
> get key (after some time)
(nil)
```

(it can also be used in order to set a different expire to a key already having one, like `PERSIST` can be used in order to remove the expire and make the key persistent forever). However we can also create keys with expires using other Redis commands. For example using SET options:
```
> set key 100 ex 10
OK
> ttl key
(integer) 9
```
> In order to set and check expires in milliseconds, check the PEXPIRE and the PTTL commands, and the full list of SET options.

### Redis Lists
From a very general point of view a List is just a sequence of ordered elements: 10,20,1,2,3 is a list. But the properties of a List implemented using an Array are very different from the properties of a List implemented using a Linked List.

Redis lists are implemented via Linked Lists. This means that even if you have millions of elements inside a list, the operation of adding a new element in the head or in the tail of the list is performed in constant time. The speed of adding a new element with the `LPUSH` command to the head of a list with ten elements is the same as adding an element to the head of list with 10 million elements.

The `LPUSH` command adds a new element into a list, on the left (at the head), while the `RPUSH` command adds a new element into a list, on the right (at the tail). Finally the LRANGE command extracts ranges of elements from lists:
```
> rpush mylist A
(integer) 1
> rpush mylist B
(integer) 2
> lpush mylist first
(integer) 3
> lrange mylist 0 -1
1) "first"
2) "A"
3) "B"
```

As you can see RPUSH appended the elements on the right of the list, while the final LPUSH appended the element on the left.

Both commands are variadic commands, meaning that you are free to push multiple elements into a list in a single call:
```
> rpush mylist 1 2 3 4 5 "foo bar"
(integer) 9
> lrange mylist 0 -1
1) "first"
2) "A"
3) "B"
4) "1"
5) "2"
6) "3"
7) "4"
8) "5"
9) "foo bar"
```

An important operation defined on Redis lists is the ability to pop elements. Popping elements is the operation of both retrieving the element from the list, and eliminating it from the list, at the same time. You can pop elements from left and right, similarly to how you can push elements in both sides of the list:
```
> rpush mylist a b c
(integer) 3
> rpop mylist
"c"
> rpop mylist
"b"
> rpop mylist
"a"
> rpop mylist
(nil)
```

### Common use cases for lists
Lists are useful for a number of tasks, two very representative use cases are the following:
* Remember the latest updates posted by users into a social network.
* Communication between processes, using a consumer-producer pattern where the producer pushes items into a list, and a consumer (usually a worker) consumes those items and executed actions. Redis has special list commands to make this use case both more reliable and efficient.

For example both the popular Ruby libraries resque and sidekiq use Redis lists under the hood in order to implement background jobs.

### Capped lists
The `LTRIM` command is similar to `LRANGE`, but instead of displaying the specified range of elements it sets this range as the new list value. All the elements outside the given range are removed.

An example will make it more clear:
```
> rpush mylist 1 2 3 4 5
(integer) 5
> ltrim mylist 0 2
OK
> lrange mylist 0 -1
1) "1"
2) "2"
3) "3"
```

### Blocking operations on lists
So Redis implements commands called `BRPOP` and `BLPOP` which are versions of `RPOP` and `LPOP` able to block if the list is empty: they'll return to the caller only when a new element is added to the list, or when a user-specified timeout is reached.

This is an example of a BRPOP call we could use in the worker:
```
> brpop tasks 5
1) "tasks"
2) "do_something"
```

There are more things you should know about lists and blocking ops. We suggest that you read more on the following:
* It is possible to build safer queues or rotating queues using `RPOPLPUSH`.
* There is also a blocking variant of the command, called `BRPOPLPUSH`.

### Automatic creation and removal of keys
Basically we can summarize the behavior with three rules:
* When we add an element to an aggregate data type, if the target key does not exist, an empty aggregate data type is created before adding the element.
* When we remove elements from an aggregate data type, if the value remains empty, the key is automatically destroyed. The Stream data type is the only exception to this rule.
* Calling a read-only command such as `LLEN` (which returns the length of the list), or a write command removing elements, with an empty key, always produces the same result as if the key is holding an empty aggregate type of the type the command expects to find.

Examples of rule 1:
```
> del mylist
(integer) 1
> lpush mylist 1 2 3
(integer) 3
```

However we can't perform operations against the wrong type if the key exists:
```
> set foo bar
OK
> lpush foo 1 2 3
(error) WRONGTYPE Operation against a key holding the wrong kind of value
> type foo
string
```

Example of rule 2:
```
> lpush mylist 1 2 3
(integer) 3
> exists mylist
(integer) 1
> lpop mylist
"3"
> lpop mylist
"2"
> lpop mylist
"1"
> exists mylist
(integer) 0
```
The key no longer exists after all the elements are popped.

Example of rule 3:
```
> del mylist
(integer) 0
> llen mylist
(integer) 0
> lpop mylist
(nil)
```

### Redis Hashes
```
> hmset user:1000 username antirez birthyear 1977 verified 1
OK
> hget user:1000 username
"antirez"
> hget user:1000 birthyear
"1977"
> hgetall user:1000
1) "username"
2) "antirez"
3) "birthyear"
4) "1977"
5) "verified"
6) "1"
```

While hashes are handy to represent objects, actually the number of fields you can put inside a hash has no practical limits (other than available memory), so you can use hashes in many different ways inside your application.

The command `HMSET` sets multiple fields of the hash, while `HGET` retrieves a single field. `HMGET` is similar to `HGET` but returns an array of values:
```
> hmget user:1000 username birthyear no-such-field
1) "antirez"
2) "1977"
3) (nil)
```
There are commands that are able to perform operations on individual fields as well, like `HINCRBY`:
```
> hincrby user:1000 birthyear 10
(integer) 1987
> hincrby user:1000 birthyear 10
(integer) 1997
```
> It is worth noting that small hashes (i.e., a few elements with small values) are encoded in special way in memory that make them very memory efficient.

### Redis Sets 
Redis Sets are unordered collections of strings. The `SADD` command adds new elements to a set. It's also possible to do a number of other operations against sets like testing if a given element already exists, performing the intersection, union or difference between multiple sets, and so forth.
```
> sadd myset 1 2 3
(integer) 3
> smembers myset
1. 3
2. 1
3. 2
```
Redis has commands to test for membership. For example, checking if an element exists:
```
> sismember myset 3
(integer) 1
> sismember myset 30
(integer) 0
```
One illustration is tagging news articles. If article ID 1000 is tagged with tags 1, 2, 5 and 77, a set can associate these tag IDs with the news item:
```
> sadd news:1000:tags 1 2 5 77
(integer) 4
```
We may also want to have the inverse relation as well: the list of all the news tagged with a given tag:
```
> sadd tag:1:news 1000
(integer) 1
> sadd tag:2:news 1000
(integer) 1
> sadd tag:5:news 1000
(integer) 1
> sadd tag:77:news 1000
(integer) 1
```
To get all the tags for a given object is trivial:
```
> smembers news:1000:tags
1. 5
2. 1
3. 77
4. 2
```
There are other non trivial operations that are still easy to implement using the right Redis commands. For instance we may want a list of all the objects with the tags 1, 2, 10, and 27 together. We can do this using the `SINTER` command, which performs the intersection between different sets. We can use:
```
> sinter tag:1:news tag:2:news tag:10:news tag:27:news
... results here ...
```
The command to extract an element is called `SPOP`, and is handy to model certain problems. For example in order to implement a web-based poker game, you may want to represent your deck with a set. Imagine we use a one-char prefix for (C)lubs, (D)iamonds, (H)earts, (S)pades:
```
>  sadd deck C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 CJ CQ CK
   D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 DJ DQ DK H1 H2 H3
   H4 H5 H6 H7 H8 H9 H10 HJ HQ HK S1 S2 S3 S4 S5 S6
   S7 S8 S9 S10 SJ SQ SK
   (integer) 52
```

Now we want to provide each player with 5 cards. The `SPOP` command removes a random element, returning it to the client, so it is the perfect operation in this case.

However if we call it against our deck directly, in the next play of the game we'll need to populate the deck of cards again, which may not be ideal. So to start, we can make a copy of the set stored in the deck key into the game:1:deck key.

This is accomplished using `SUNIONSTORE`, which normally performs the union between multiple sets, and stores the result into another set. However, since the union of a single set is itself, I can copy my deck with:
```
> sunionstore game:1:deck deck
(integer) 52
```

Now I'm ready to provide the first player with five cards:
```
> spop game:1:deck
"C6"
> spop game:1:deck
"CQ"
> spop game:1:deck
"D1"
> spop game:1:deck
"CJ"
> spop game:1:deck
"SJ"
```
One pair of jacks, not great...

This is a good time to introduce the set command that provides the number of elements inside a set. This is often called the cardinality of a set in the context of set theory, so the Redis command is called `SCARD`.
```
> scard game:1:deck
(integer) 47
```
The math works: 52 - 5 = 47.

When you need to just get random elements without removing them from the set, there is the `SRANDMEMBER` command suitable for the task. It also features the ability to return both repeating and non-repeating elements.

### Redis Sorted sets
Moreover, elements in a sorted sets are taken in order (so they are not ordered on request, order is a peculiarity of the data structure used to represent sorted sets). They are ordered according to the following rule:
* If A and B are two elements with a different score, then A > B if A.score is > B.score.
* If A and B have exactly the same score, then A > B if the A string is lexicographically greater than the B string. A and B strings can't be equal since sorted sets only have unique elements.

Let's start with a simple example, adding a few selected hackers names as sorted set elements, with their year of birth as "score".
```
> zadd hackers 1940 "Alan Kay"
(integer) 1
> zadd hackers 1957 "Sophie Wilson"
(integer) 1
> zadd hackers 1953 "Richard Stallman"
(integer) 1
> zadd hackers 1949 "Anita Borg"
(integer) 1
> zadd hackers 1965 "Yukihiro Matsumoto"
(integer) 1
> zadd hackers 1914 "Hedy Lamarr"
(integer) 1
> zadd hackers 1916 "Claude Shannon"
(integer) 1
> zadd hackers 1969 "Linus Torvalds"
(integer) 1
> zadd hackers 1912 "Alan Turing"
(integer) 1
```

Implementation note: Sorted sets are implemented via a dual-ported data structure containing both a skip list and a hash table, so every time we add an element Redis performs an O(log(N)) operation. That's good, but when we ask for sorted elements Redis does not have to do any work at all, it's already all sorted:
```
> zrange hackers 0 -1
1) "Alan Turing"
2) "Hedy Lamarr"
3) "Claude Shannon"
4) "Alan Kay"
5) "Anita Borg"
6) "Richard Stallman"
7) "Sophie Wilson"
8) "Yukihiro Matsumoto"
9) "Linus Torvalds"
```

What if I want to order them the opposite way, youngest to oldest? Use `ZREVRANGE` instead of `ZRANGE`:
```
> zrevrange hackers 0 -1
1) "Linus Torvalds"
2) "Yukihiro Matsumoto"
3) "Sophie Wilson"
4) "Richard Stallman"
5) "Anita Borg"
6) "Alan Kay"
7) "Claude Shannon"
8) "Hedy Lamarr"
9) "Alan Turing"
```

It is possible to return scores as well, using the `WITHSCORES` argument:
```
> zrange hackers 0 -1 withscores
1) "Alan Turing"
2) "1912"
3) "Hedy Lamarr"
4) "1914"
5) "Claude Shannon"
6) "1916"
7) "Alan Kay"
8) "1940"
9) "Anita Borg"
10) "1949"
11) "Richard Stallman"
12) "1953"
13) "Sophie Wilson"
14) "1957"
15) "Yukihiro Matsumoto"
16) "1965"
17) "Linus Torvalds"
18) "1969"
```

Sorted sets are more powerful than this. They can operate on ranges. Let's get all the individuals that were born up to 1950 inclusive. We use the `ZRANGEBYSCORE` command to do it:
```
> zrangebyscore hackers -inf 1950
1) "Alan Turing"
2) "Hedy Lamarr"
3) "Claude Shannon"
4) "Alan Kay"
5) "Anita Borg"
```

It's also possible to remove ranges of elements. Let's remove all the hackers born between 1940 and 1960 from the sorted set:
```
> zremrangebyscore hackers 1940 1960
(integer) 4
```
> `ZREMRANGEBYSCORE` is perhaps not the best command name, but it can be very useful, and returns the number of removed elements.

Another extremely useful operation defined for sorted set elements is the get-rank operation. It is possible to ask what is the position of an element in the set of the ordered elements.
```
> zrank hackers "Anita Borg"
(integer) 4
```
> The ZREVRANK command is also available in order to get the rank, considering the elements sorted a descending way.

### Lexicographical scores
For example, let's add again our list of famous hackers, but this time use a score of zero for all the elements:
```
> zadd hackers 0 "Alan Kay" 0 "Sophie Wilson" 0 "Richard Stallman" 0
  "Anita Borg" 0 "Yukihiro Matsumoto" 0 "Hedy Lamarr" 0 "Claude Shannon"
  0 "Linus Torvalds" 0 "Alan Turing"
```
Because of the sorted sets ordering rules, they are already sorted lexicographically:
```
> zrange hackers 0 -1
1) "Alan Kay"
2) "Alan Turing"
3) "Anita Borg"
4) "Claude Shannon"
5) "Hedy Lamarr"
6) "Linus Torvalds"
7) "Richard Stallman"
8) "Sophie Wilson"
9) "Yukihiro Matsumoto"
```
Using `ZRANGEBYLEX` we can ask for lexicographical ranges:
```
> zrangebylex hackers [B [P
1) "Claude Shannon"
2) "Hedy Lamarr"
3) "Linus Torvalds"
```

### Updating the score: leader boards
Just a final note about sorted sets before switching to the next topic. Sorted sets' scores can be updated at any time. Just calling `ZADD` against an element already included in the sorted set will update its score (and position) with O(log(N)) time complexity. As such, sorted sets are suitable when there are tons of updates.

Because of this characteristic a common use case is leader boards. The typical application is a Facebook game where you combine the ability to take users sorted by their high score, plus the get-rank operation, in order to show the top-N users, and the user rank in the leader board (e.g., "you are the #4932 best score here").

### Bitmaps
Bits are set and retrieved using the `SETBIT` and `GETBIT` commands:
```
> setbit key 10 1
(integer) 1
> getbit key 10
(integer) 1
> getbit key 11
(integer) 0
```
There are three commands operating on group of bits:
* `BITOP` performs bit-wise operations between different strings. The provided operations are AND, OR, XOR and NOT.
* `BITCOUNT` performs population counting, reporting the number of bits set to 1.
* `BITPOS` finds the first bit having the specified value of 0 or 1.

Both `BITPOS` and `BITCOUNT` are able to operate with byte ranges of the string, instead of running for the whole length of the string. The following is a trivial example of `BITCOUNT` call:
```
> setbit key 0 1
(integer) 0
> setbit key 100 1
(integer) 0
> bitcount key
(integer) 2
```

Common use cases for bitmaps are:
* Real time analytics of all kinds.
* Storing space efficient but high performance boolean information associated with object IDs.

### HyperLogLogs
While you don't really add items into an HLL, because the data structure only contains a state that does not include actual elements, the API is the same:
* Every time you see a new element, you add it to the count with `PFADD`.
* Every time you want to retrieve the current approximation of the unique elements added with `PFADD` so far, you use the `PFCOUNT`.
```
    > pfadd hll a b c d
    (integer) 1
    > pfcount hll
    (integer) 4
```
> An example of use case for this data structure is counting unique queries performed by users in a search form every day.

# Securing Redis
* Make sure the port Redis uses to listen for connections (by default 6379 and additionally 16379 if you run Redis in cluster mode, plus 26379 for Sentinel) is firewalled, so that it is not possible to contact Redis from the outside world.
* Use a configuration file where the bind directive is set in order to guarantee that Redis listens on only the network interfaces you are using. For example only the loopback interface (127.0.0.1) if you are accessing Redis just locally from the same computer, and so forth.
* Use the requirepass option in order to add an additional layer of security so that clients will require to authenticate using the AUTH command.
* Use spiped or another SSL tunneling software in order to encrypt traffic between Redis servers and Redis clients if your environment requires encryption.

# Using Redis from your application

These instructions are Ruby specific but actually many library clients for popular languages look quite similar: you create a Redis object and execute commands calling methods. A short interactive example using Ruby:
```
>> require 'rubygems'
=> false
>> require 'redis'
=> true
>> r = Redis.new
=> #<Redis client v2.2.1 connected to redis://127.0.0.1:6379/0 (Redis v2.3.8)>
>> r.ping
=> "PONG"
>> r.set('foo','bar')
=> "OK"
>> r.get('foo')
=> "bar"
```

# Redis persistence
You can learn how Redis persistence works on this page, however what is important to understand for a quick start is that by default, if you start Redis with the default configuration, Redis will spontaneously save the dataset only from time to time (for instance after at least five minutes if you have at least 100 changes in your data), so if you want your database to persist and be reloaded after a restart make sure to call the `SAVE` command manually every time you want to force a data set snapshot. Otherwise make sure to shutdown the database using the `SHUTDOWN` command:
```
$ redis-cli shutdown
```
This way Redis will make sure to save the data on disk before quitting. Reading the persistence page is strongly suggested in order to better understand how Redis persistence works.
