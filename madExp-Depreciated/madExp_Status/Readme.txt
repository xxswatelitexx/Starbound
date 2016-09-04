Experiment 1: Evolving Status Effect
Status Effects give you quite a bit of control over the character and a great way to manipulate the game.
WIth that said this experiment is designed to push conceptual limits.
The idea is to create a status effect which "upgrades" it self if the effect already exists.

What I have learned is when the same status effect is applied it "resets" the status effect completely.
With that said I cannot store a value the conventional way. One work around which I did is add a specific counter into player resources
which adds up as long as the effect exists. An will reset on bandage use and death. 
I tried to get it to reset when duration hits 0 - but as mentioned earlier the effect "completely resets" meaning it will drop down to 0
even when a new one is applied.

--
Experiment 2: Status Effect Variation Based on Species
In this experiment I wanted to make species specific status effects. Where certain species are allergic to particular types of foods.
I also wanted it to be JSON customizable to add maximum mod compatibility.
How it essentially works is through the statuseffect file \ effect config.
When a race has an allergy the effect config mentions "race" : 1
1 being boolean for true. 
Since the Lua function effectConfig allows you to put a default value if non exists, you do not need to add 0 for races which do not have the allergy.
Making it convenient for custom race authors and increasing mod compatibility even more.
The rest is explained in the Lua file. 

The item associated is statusA - the result is found in the starbound.log file.