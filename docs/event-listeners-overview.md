---
id: event-listeners-overview
title: Event Listeners Overview
sidebar_label: Event Listeners Overview
---
RSPeer provides a large range of event listeners for you to 
write code that reacts to certain events.

An example of this would be if you wanted to do something when
another player trades you, or an NPC takes damage, etc.

Writing your scripts to react to events is a great way to speed
them up, increase reliability, and reduce CPU usage.



### **Provided Events and Listeners**

**ChatMessageEvent** - Executes when a message is received via public chat, server, clan chat, private, etc.

**DeathEvent** - Executes when any entity (npc, player) dies.

**TargetChangeEvent** - Executes when any entity (npc, player) changes their target.

**NpcSpawnEvent** - Executes when a NPC is spawned in-game.

**ObjectSpawnEvent** - Executes when a SceneObject is spawned in-game.

**GameStateEvent** - Executes when the game start is changed, such as loading, logged in, etc.

**HitSplatEvent** - Executes when any entity (npc, player) hit splat is shown, such as when taking damage.

**BankLoadEvent** - Executes when the bank items are loaded.

**MapRegionChangedEvent** - Executes when you have changed map regions.

**VarpEvent** - Executes when varp values have changed.

**WorldChangeEvent** - Executes when the world changes.

**ItemTableEvent** - Executes when the inventory or bank changes.

Checkout the JavaDocs for more information.



### **Using These Listeners**

To utilize the listeners, you need to implement the specific listener with your class.

For example, if I wanted to execute code any time I received a trade request, I could do the following:

```
@ScriptMeta(developer = "MadDev", name = "Pro Woodcutter", desc = "Cuts anything")
public class Main extends Script implements ChatMessageListener {

    private String toTrade;

    @Override
    public int loop() {
        Player player = null;
        if(toTrade != null) {
            player = Players.getNearest(toTrade);
        }
        if(player != null) {
            System.out.println(player.getName() + " wants to to trade me.");
        }
        return 450;
    }

    @Override
    public void notify(ChatMessageEvent e) {
        // You should NOT put lots of logic in here because events run on the official game thread.
        // If you put a lot of logic in the listeners, you risk crashing the game by slowing down their
        // game loop. It is recommended to set values and then handle that value in the loop itself.
        if(e.getMessage().contains("wishes to trade with you")) {
            toTrade = e.getSource();
        }
    }
}
```

I did not put any actual game manipulation logic in my listener because listeners are run on the official RuneScape game thread. Adding lots of blocking logic to these listeners will slow down the game and potentially cause it to crash. 

It is **recommended** to set values in the listeners only and act on them in the loop.



### **Implementing Listeners Outside Script Class**

If you implement a listener from the class that extends Script, that listener is automatically registered to receive events.

If you choose to register a separate class that does not extend Script, you will need to register and deregister the listener manually.

```
public class MessageHandler implements ChatMessageListener, AutoCloseable {

    public MessageHandler() {
        Game.getEventDispatcher().register(this);
    }

    @Override
    public void notify(ChatMessageEvent e) {
        System.out.println(e.getMessage());
    }

    @Override
    public void close() {
        Game.getEventDispatcher().deregister(this);
    }
}
```

```
public class Main extends Script {

    private MessageHandler handler;

    @Override
    public void onStart() {
        handler = new MessageHandler();
        super.onStart();
    }

    @Override
    public void onStop() {
        handler.close();
        super.onStop();
    }

    @Override
    public int loop() {
        return 400;
    }
}
```

