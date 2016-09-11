In this set of experiments we will look at how to store data in an object and retain it on destruction.
A lot of mods have been doing this such has Improved Containers or Enhanced storage so I wanted to see how.

###Experiment 1
This experiment was made possible to v6ooo without him I don't think the information provided here would have ever been known.
In this test we use a parameter which was added in back in 2014 which is rarely if ever used.

```JSON
"retainObjectParametersInItem" : true,
```

By adding this value into the JSON file I was able to retain the JSON stored data even after destruction.

Log Result Below:
```
[16:50:03.427] [Info] Has been removed
[16:50:05.364] [Info] bca
[16:50:05.878] [Info] Has been interacted with
[16:50:05.927] [Info] abc
[16:50:06.007] [Info] abc
[16:50:07.481] [Info] Has been removed
[16:50:09.342] [Info] abc
[16:50:09.421] [Info] abc
```
From the results you can tell the data was retained after it was removed and replaced on the ground.


###Experiment 2
So in this experiment I am doing the classical method that other mods use to store data. This is done by destroying the object and creating a new object with the parameter stored.
The important part of the code is shown below.
```lua
tValue = {test="abc"}
world.spawnItem(object.name(), entity.position(), 1, tValue)
```
As you can see we first created a table with new value
Then in spawn item parameters we kept that as a custom parameter.
If we wanted we could add more parameters by separating them inside the tValue table.

Log Result Below:
```
[21:40:04.471] [Info] bca
[21:40:04.552] [Info] bca
[21:40:04.599] [Info] Has been interacted with
[21:40:04.629] [Info] Has been removed
[21:40:06.801] [Info] abc
[21:40:06.880] [Info] abc
```
As you can see - the new value was stored even after removing and replacing the item.

On a side note we added an extra parameter
```lua
object.smash(true)
```
Since we set smash to true - it prevents the object item from being generated when destroyed. Otherise we would have 2 items - one from spawnitem and the object it self.

###Experiment 3
So now we know the different methods of storing data - it is time to take it up a notch. One of the most common things I have seen a lot of advanced mods do is store complex data tables in the lua instead of the JSON.
So this experiment is about how complex of a data table can we store and read through the object.

So we are going to store data simply as a basic table (test1) and a table inside a table (test2).
```JSON
"test" : [ "one", "two", "three"],
"test2" : [ "four", {"five": "cat"} ]
```
Now as for the lua - the rest of it is really straight forward. The only part I want to comment on is here.
```lua
test2a["five"])
```
Since we are specifically using a string to define the value - as opposed to numerical data - we must specifically call upon that string.

Now to check the log,
```
[07:54:57.169] [Info] Has been interacted with
[07:54:57.169] [Info] one
[07:54:57.169] [Info] two
[07:54:57.169] [Info] three
[07:54:57.169] [Info] ### LINE BREAK FOR PART 2###
[07:54:57.169] [Info] four
[07:54:57.169] [Info] cat
```
As you can see with your own eyes, it is a complete success.
