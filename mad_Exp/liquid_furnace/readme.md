One thing I was not fond about in starbound is not being able to interact with the world elements directly.
Almost all interactions dealt with converting elements into items then running them through a crafting table.

So with that said I wanted to always create a furnace which converted a liquid into an item - without actually picking up the liquid first and converting it directly.
Now unfortunately the Starbound Developers decided not to be able to have direct access to the liquid name. So you must use the liquid ID # in the liquid config file.
This makes things increasingly complicated in mod compatibility stand point. So I am not going to worry about that.

###Experiment 1
So this experiment has a few movement parts that need to work together in order for it to work.
First and foremost we added a new config parameter to our object file.

'''Json
"1" : "ice"
'''

Since starbound uses the Liquid ID to identify the type of liquid.
We can leverage that to make it much more compatible with custom mods my adding JSON config settings.
Basically all it is saying is if Liquid ID #1 is found ( water ) then produce the item "ice"

Now to look at the Lua aspect
'''
liqTable = world.liquidAt(object.position())
liqID = config.getParameter(liqTable[1], "money")
'''
First we store the information of the liquid in a variable then find the first value in that table ( which is the liquid ID number )
Just to make sure nothing goes wrong if it can't find a matching ID we make the default value money.

'''
if liqTable[2] >= 0.99 then
  sb.logInfo("Passes Liquid Quantity Check")
  world.destroyLiquid(objPos)
  world.spawnItem(liqID, objPos, 1)
'''

Now we just add in a simple condition so it has some sort of requirement to spawn the item
We destroy the liquid at the object position
Finally spawn a resulting item based on the liquid Id number set in the JSON file.
