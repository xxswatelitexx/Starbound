In this experiment I wanted to know if it is possible to make certain conditions for a plant to grow. Unfortunately the farming code is part of the backend. So it will need more experimentation to see how much it can be manipulated [forcing frame change to modify "Stage" ? ]

The code which check for the liquid
	if world.liquidAt({pos[1], pos[2]+2}) == nil then

This method is a really a poor method of implementation. What happens is if there is no liquid at this location, it will kill the entity. You can be more specific by returning the table and seeing which liquid it is and then smashing it also. It really is upto you on how to implement it, this is just one of the most basic methods. 

==
Experiment #2 - automatoseed
Well here I wanted to make things more interesting and give conditions to other seeds so here I made automatoseeds require it to be placed on iron blocks. 
I also wanted it to "consume" the block when removed. 
==
Experiment #3 - wheatseed
Update 2:
After realizing the code for the original wheat seed is far beyond complex. I simplified to a much more basic level where it will be useful to more users.
Also one major change is world.objectCOnfigParamater to entity.configParameter - since it was improper to call it on it self either way when there was a function to do so.

Now before you ask, "What about plants I don't want to drink a liquid? They just die off if there is no liquid!!" 
The real question you should ask your self is why did you add a script for drinking liquid to a plant that doesn't need too.

==

Other Notes: 
entity.smash() --> will destroy the object 
entity.break() --> will break the object and return the item.