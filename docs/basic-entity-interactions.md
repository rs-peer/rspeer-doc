---
id: basic-entity-interactions
title: Interacting with an Npc, GameObject (SceneObject), Player, or GroundItem (Pickable)
sidebar_label: Interacting With The Game
---
At the very core of scripting, you will be interacting with various entities throughout Runescape. These include Npc's, GameObjects, Players, GroundItems.

------

**What is a Npc?**

An npc is a non playable character. A few examples of these include: **Man, Cow, Chicken, Guard, Seagull, Goblin.**

**What is a GameObject / SceneObject?**

A  game object, or scene object, is an entity that is not classified a any of the other types, but is seen throughout RuneScape. These include **trees, bank booths, stairs**, etc. Basically anything that is not an NPC, Player, or GroundItem.

**What is a Player?**

A player is classified as your local player (the character you control in the game), or any other character in the game that is being played by another person. An example of this would be your own character or other players you see through Runescape, such as at the Grand Exchange, Wilderness, etc.

------

### **Interacting with one of these entities**

To interact with a specific entity, such as a tree, you must first select the entity you are looking for. There are multiple ways to do this.

The most common and easiest way is to use **getNearest**. This method will load every entity in your area (around 50+ tiles), and return the closet entity to you based on your criteria.

The **getNearest** method provides 3 different call signatures, meaning it allows you to select an entity by either its name, id, or a predicate (filter) to narrow down and select the correct entity.



**Example: Selecting an oak tree by name:** 

```java
SceneObject oakTree = SceneObjects.getNearest("Oak tree")
```

**Example: Selecting an oak tree by a predicate (filter):** 

If you are unfamiliar with a predicate, basically it gives you a way to filter on any property of an entity, instead of just the name or id.

```
SceneObject oakTree = SceneObjects.getNearest(s -> s.distance() <= 3 && s.getName().equals("Oak tree"));
```

This predicate above will select any oak tree that is within 3 tiles of our location.

**Example: Selecting an oak tree by query:**

```java
SceneObject oakTree = SceneObjects.newQuery().names("Oak tree").results().nearest();
```

You can also filter your results just like the predicate example by using `.filter()`

```java
SceneObject oakTree = SceneObjects.newQuery().names("Oak tree").filter(s -> s.distance() <= 3).results().nearest();
```

**Example: Interacting with an oak tree**

```java
SceneObject oakTree = SceneObjects.getNearest("Oak tree")
if(oakTree != null) {
   oakTree.interact("Chop down");
   Time.sleep(400, 850); // Sleep a random duration after interacting.
}
```

For this example, we are selecting the tree, verifying that a tree to chop down actually exists, and then chopping the tree down. We added in the random sleep after chopping so that we are not constantly spamming the chop down even if we are walking towards it. 

This sleep is not the most ideal option, but it is fine for now. If you would like to read more about better sleep options, checkout our dynamic sleeping tutorial.

------

#### **Ways To Select Different Entities**

**Example: Selecting an NPC by name.**

```java
Npc goblin = Npcs.getNearest("Goblin")
```

**Example: Selecting an NPC by name who does not have a health-bar showing.**

```
Npc goblin = Npcs.getNearest(n -> n.getName().equals("Goblin") && !n.isHealthBarVisible());
```

**Example: Selecting an NPC who is currently not interacting with anything else.**

```
Npc goblin = Npcs.getNearest(n -> n.getName().equals("Goblin") && n.getTarget() == null);
```

**Example: Selecting your local player**

```
Player me = Players.getLocal();
```

**Example: Selecting another player by name.**

```
Player durial = Players.getNearest("Durial321");
```

**Example: Selecting a SceneObject by name.**

```
SceneObject booth = SceneObjects.getNearest("Bank booth");
```

**Example: Selecting a GroundItem (Pickable) by name.**

```
Pickable feathers = Pickables.getNearest("Feather");
```

**Example: Selecting all Npc in the local area with a certain name.**

```
Npc[] goblins = Npcs.getLoaded(s -> s.getName().equals("Goblin"));
```


