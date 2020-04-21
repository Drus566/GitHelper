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
