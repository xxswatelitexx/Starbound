I had a question about starbound pets and wanted to see what was possible.
The first issue I wanted to tackle was the pet generation, felt limiting it to a specific type per race just seemed wrong.
Through this experiment I learned a few things primarily that math.random alone does not work on init. It always returns the lowest number.
In order to fix this I had to use math.randomseed(ostime()) before calling math.random in order to generate a random number. 

I also noticed that the monster.type was actually controlled directly by the tech station and in effect "stored" as a static value.
In order to make the pet type work though, I had to add it into a storage value instead so now pets can truely be randomized and remain the same type. Before that the pets would change on every reload. 