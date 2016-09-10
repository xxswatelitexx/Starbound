In this experiment I wanted to create an object that when submerged in liquid would create an item based on the liquid it is submerged in.

###Experiment 1
So in this experiment has a few moving parts that need to work together in order for it to work.
First and foremost we added a new config parameter to our object file.

```Json
"1" : "ice"
```

Since starbound uses the Liquid ID to identify the type of liquid simply by making it as a parameter we can make configuration settings through JSON.
This allows for other modders not versed in lua to add easy and quick compatibility with the mod.
Basically all it is saying is if Liquid ID #1 is found ( water ) then produce the item "ice".

Now to look at the Lua aspect
```Lua
liqTable = world.liquidAt(object.position())
liqID = config.getParameter(liqTable[1], "money")
```
First we store the information of the liquid in a variable then find the first value in that table ( which is the liquid ID number ).
Just to make sure nothing goes wrong if it can't find a matching ID we make the default value money.

```lua
if liqTable[2] >= 0.99 then
  sb.logInfo("Passes Liquid Quantity Check")
  world.destroyLiquid(objPos)
  world.spawnItem(liqID, objPos, 1)
```

Now we just add in a simple condition so it has some sort of requirement to spawn the item.
We destroy the liquid at the object position.
Finally spawn a resulting item based on the liquid Id number set in the JSON file.
