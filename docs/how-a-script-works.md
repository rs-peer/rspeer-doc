---
id: how-a-script-works
title: How A Script Works
sidebar_label: How A Script Works
---

#### **What is a script?**

A script is code that runs on top of the RSPeer client that manipulates the actual game using our provided API.

The RSPeer client provides hooks and api methods for you to write these scripts to interface with the game.



### How does a script run?

At its most basic level, a script is implemented as a simple loop. 

```java
public class Main extends Script {

    @Override
    public int loop() {
        return 200;
    }
}
```

This loop will be executed by the client until the script is stopped.  

The return value is how long the client will sleep before re-running your loop.

It is recommended to make this value around 400-600ms, so that it is similar to a RuneScape game tick.

The loop is the starting point from where you should supply all of your logic to interface with the game.



### **OnStart**

When a script is started, theres is a method called onStart that is executed once before the loop is called.

This is the recommended place to put initialization things such as loading configuation that your loop may need.

```java
public class Main extends Script {

    @Override
    public void onStart() {
        Log.fine("This will be executed once on startup.");
        super.onStart();
    }

    @Override
    public int loop() {
        return 450;
    }
}
```



### **OnStart Caveats**

The onStart method executes even if the player is not logged into the game. Do not try to reference in-game values, such as local player, a SceneObject, etc, in the onStart.

Those methods will break and throw an error because the game may not be logged in.

```java
public class Main extends Script {

    @Override
    public void onStart() {
        Player me = Players.getLocal(); // DO NOT do this. 
        // Local player will be null if the script is started while not logged in.
        if(me.getCombatLevel() == 3) {
            
        }
        super.onStart();
    }

    @Override
    public int loop() {
        return 450;
    }
}
```



### **How do you stop a script?**

A script can be stopped via the UI, but it can also be stopped programmatically.

There are a few different ways this can be done.

1. Stopping the script via setStopping(true) in the class that extends Script.

   ```java
   public class Main extends Script {
   
       @Override
       public int loop() {
           setStopping(true);
           return 200;
       }
   }
   ```

   Please note: This is an instance method on Script, you will need to pass the script context to another class if you wish to call it from there.

2. Returning -1 from the loop.



### **Script Metadata Annotation** (ScriptMeta)

Every script needs a script needs a ScriptMeta annotation so that way the script can be properly displayed in the script selector.

It needs to go above your class that extends **Script**. If you do not put this, your script will NOT show up.

```java
@ScriptMeta(developer = "MadDev", name = "Pro Woodcutter", desc = "Cuts anything")
public class Main extends Script {

    @Override
    public int loop() {
        return 450;
    }
}
```