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
