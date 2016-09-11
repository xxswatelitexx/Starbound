This experiment focuses on checking to see if the player is wearing all the specific pieces of a set of clothes.
After all in RPG's having "Full Item Sets" is all the rage.

###Experiment 1
So this experiment is pretty straight forward in each clothing item we added a stat modifier "tchest".
```json
"statusEffects" : [
    {
      "stat" : "tchest",
      "amount" : 1
    }

  ],
  ```
Here we can see we added the stat "thelm".
In helm we added one extra parameter - the actual status effect "fsuit".
```json
"statusEffects" : [
    "fsuit",
    {
      "stat" : "thead",
      "amount" : 1
    }
  ],
```

Next in the Lua we setup a condition to check to see if all 3 stats are present before applying the status effect.
```Lua
if status.stat("thead") == 1 and status.stat("tchest") == 1 and status.stat("tleg") == 1 then
```

Because we kept this in initialize as opposed to update, the order we put on the clothes is important since init is only called once.
So if we put helmet first and the other 2 after, nothing would happen.
While if we put on the other 2 first then the helm you will turn blue.
