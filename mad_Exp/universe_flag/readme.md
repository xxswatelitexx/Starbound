This experiment was to see the capabilities of universe flag.

###Experiment 1
A quick experiment to see how universe flags are listed.

```lua
function onInteraction(args)
  uflag = world.universeFlags()
  sb.logInfo(#uflag)
  for i,v in ipairs(uflag) do
	   if v == "test01" then
       sb.logInfo("Match Found")
     else
       sb.logInfo("Does not match")
     end
  end
  world.setUniverseFlag("test01")
end
```

On pressing the object it first lists how many items are in the list.
Then goes through each item individually in the entire table to look for a match.

In my case my table size was 10, so it listed 10 items where one was a match.
```
[13:23:52.151] [Info] 10
[13:23:52.151] [Info] Does not match
[13:23:52.151] [Info] Does not match
[13:23:52.151] [Info] Does not match
[13:23:52.151] [Info] Does not match
[13:23:52.151] [Info] Does not match
[13:23:52.151] [Info] Match Found
[13:23:52.151] [Info] Does not match
[13:23:52.152] [Info] Does not match
[13:23:52.152] [Info] Does not match
[13:23:52.152] [Info] Does not match
```

Unfortunately once a flag is "enabled" it cannot be disabled.
Flags do not have a binary state, or any state for that matter.

This really forces a more creative approach when utilizing them. 
