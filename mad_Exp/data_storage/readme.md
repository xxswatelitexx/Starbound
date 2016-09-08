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
So in this experiment I am doing the classical method that other mods used to store data. By destroying the object and creating a new object with the parameter stored.
The important part of the code is shown below.
```
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
The new value was stored even after removing and replacing the item.
