This experiment comes in multiple flavours.

==
Experiment #1
The first thing I wanted to know is if I could spawn an Item with a consumable.
Which apparently you can. Instead of doing entity.position() you instead use mcontroller.position() 
This seems to be because the player is not a scripted entity, hence the mcontroller.
==
Experiment #2
After learning I could spawn a consumable I wanted to know if I could manipulate how many is spawned. Especially if can be based on a player stat.
A stat value can be used to be referenced to anything. So I could use player stat as a "skill" which can be manipulated by items [ consumables \ armor \ etc ]
By having the item apply a status effect on consumption it was able to read the player stat value and do steps accordingly
==