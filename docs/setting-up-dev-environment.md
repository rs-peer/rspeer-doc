---
id: setting-up-dev-environment
title: Setting Up Your Development Environment
sidebar_label: Setting Up Your Development Environment
---

#### **Video Guide For This Tutorial**

Having trouble following along with just text? Checkout the step by step video guide.

[Link To Video Guide](https://d.pr/v/rA55WT)


To begin scripting, we must setup your development environment and setup a project with the proper dependencies.

**Download and Installing RSPeer:**

Before we setup a development environment, we must download and run RSPeer at-least once to retrieve the required dependencies for development. Head on over to https://rspeer.org/resources/download/ to download and install RSPeer. 

Once run, you should have a **.rspeer** folder in your Home directory that will contain the latest RSPeer jar file. It may be hidden. We will utilize this file later in the guide.

![.rspeer folder](https://d.pr/i/XJ0F3A+)


**Downloading an installing Java JDK**

If you do not have Java JDK downloaded and installed, please do that now. We recommend **AdoptOpenJDK 8**

https://adoptopenjdk.net/ Download and install Java 8 JDK latest release. Java 11 JDK can also be used, but your Java project must target **Java 8** to work on the RSPeer public script repository. **Java 11** can be used for local scripts or the private script repository if desired. We do **NOT** recommend Java 12 at this time.

![adoptopenjdk](https://d.pr/i/Z9HCAB+)


**Installing a Java IDE:**

Scripts are written in the Java or Kotlin programming language. It is recommended to use an IDE to write them. The most popular and recommended IDE to use is **Jetbrains Intellij**.

https://www.jetbrains.com/idea/ 

Download and install their **community** edition, this will be enough for script development.


**Setting up a project:**

Once installed and the setup as been run through, you should be greeted with a similar interface that looks similar to: 

![interface](https://d.pr/i/RWvSSP+)

**Select "Create New Project" and follow the steps below.**

1. Select your Java JDK as a Project SDK that you've downloaded if IntelliJ did not find it automatically. 

2. Create a new basic Java project. Select **"Command Line App**" under Create Project From Template.
   You can set your base package to anything you please. I chose **org.maddev** because my username is MadDev.

3. Right click your project, open module settings -> dependencies, and add the RSPeer jar from earlier as a **provided** dependency.

   It is recommended that you update this jar file to the newest jar for every RSPeer update, as the API may have changed. You can change it by going back to module dependencies and changing the jar to the latest version in that folder.

4. Create a build artifact under the **Artifacts** tab to automatically build a script jar when you compile. 
   Click + -> JAR -> From **Module with Dependencies**. Leave all settings as default (You should not have a main class), and then click OK. 

   Change the output directory to go to your RSPeer/scripts folder (**NOT** .rspeer). This will be located in My Documents on **Windows**, or Home directory on **Mac OSX / Linux.**

   Verify that the RSPeer Jar dependency that we added earlier is **NOT** included in this output. We prevented that by setting the dependency as **provided** under the module dependencies tab.

   ![artifact](https://d.pr/i/Nqv8bB+)

5. Remove the Java main method and extend your class with **Script** from **org.rspeer.script** and implement the methods.



**Running your first script.**

We will create a very simple script to log a message to the console on the bot and then run it. 

As of now, your current project should contain one file called **Main** (or whatever you so choose, the class name is not important.). This class should be extending **Script** and have a single method called **loop** inside of it.

![loop](https://d.pr/i/ENInw6+)

1. Update the loop return to be a random interval. The loop return is how long your script should sleep between execution. Your script will automatically keep calling the loop method as it is run. We recommend changing this value from 0 to around **400 - 600** by default to reduce CPU usage.

   The **RuneScape** game tick is around 600ms, so by having your script execute a large amount of times between Runescape game ticks is mostly pointless, as it the game cannot keep up with your actions.

   We can make this return value random by using the RSPeer Random class **nextInt** method.

   ![loop return](https://d.pr/i/mcKXxn+)

   Make sure you have implemented the RSPeer random class and **not** the official Java random class.

2. Add our log message to print out using the RSPeer Log class.

3. Add a **ScriptMeta** annotation with your script name, description, version, and author.
   The ScriptMeta annotation is a way to tell RSPeer how to display your script on the SDN and the script selector. If you do **NOT** fill this out, your script will **NOT** show up.

   ![template](https://d.pr/i/ry8PSy+)

4. Our script is now ready to be run, choose Build -> Build Module. This should build your script and place an artifact (jar file) in the RSPeer scripts folder. If it does **NOT** build a Jar file, make sure you have selected "Include in project build" in your IntelliJ artifact settings.

   ![build](https://d.pr/i/AKIW1b+)

   ![jar](https://d.pr/i/S70QM0+)

5. Open RSPeer via the launcher or client jar directly. You can open the client via the same jar that you added as a dependency from earlier. I prefer opening it with the terminal so that I am able to see logs from System.out.println().

   ![](https://d.pr/i/P0FyoB+)

   **DO NOT** open the client with your IDE. If you do so, you will have to restart the client each time you make a script change. This is a known bug that is hard to fix due to file locking issues. To prevent this, just open the client jar directly. 

6. Check "Local Scripts", and select your script. 
   If your script does **NOT** show up, verify the following:

   1. The jar file exists in RSPeer/scripts directory.
   2. You added a ScriptMeta.
   3. Click Settings -> Debug -> Expand Logger, and verify there are no errors in the logger.
   4. You compiled the script with the same or lower Java version than you ran the bot with. This means you did NOT compile the script with Java 11 but ran the bot with Java 8. If you did, you will see a class version error in the logger when you try to run it. To fix this, compile your script with Java 8 or run your bot with Java 11.

   ![selector](https://d.pr/i/LCtOSp+)

7. Run your script.

Congratulations! Assuming everything went smooth and you see your text being logged to the console, click Settings -> Debug -> Expand Logger to see it, you have just created your first script! 

You are now setup and ready to go to start creating any type of script that you can dream of.
