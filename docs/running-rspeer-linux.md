---
id: running-rspeer-linux
title: How To Run RSPeer On Linux
sidebar_label: How To Run RSPeer On Linux
---

# **Requirements**

To run RSPeer on Linux, you must be using a graphical user interface, 
attempting to run RSPeer over SSH will not work.

There are many guides on how to do this. Doing a Google search for "install gui and vnc" will lead you some guides.

One such as this one: **https://www.interserver.net/tips/kb/how-to-install-vnc-on-linux-gui-for-your-linux-vps/**

# Install Java & Dependencies
Before you can run RSPeer, Java must be downloaded and installed in path.

Run the following commands per your OS.

### **Ubuntu:**

```
sudo apt-get update
```

```
sudo apt install default-jre
```

```
sudo apt-get install wget
```



### CentOS / Fedora:

```
sudo yum install java-1.8.0-openjdk
```

```
sudo yum install wget
```



# Downloading & Running RSPeer

Run the following commands in your terminal based on your Linux bistro.



**Linux x64, Ubuntu x64, CentOS x64, Fedora x64**

```
wget https://rspeer.nyc3.digitaloceanspaces.com/console_launcher/rspeer-launcher-x64-linux 
```

```
sudo chmod +x rspeer-launcher-x64-linux
```

```
./rspeer-launcher-x64-linux
```



**Linux ARM (Raspbery Pi, etc)**

```
wget https://rspeer.nyc3.digitaloceanspaces.com/console_launcher/rspeer-launcher-arm-linux
```

```
sudo chmod +x rspeer-launcher-arm-linux
```

```
./rspeer-launcher-arm-linux
```



Thats it, once you have run it, you should be greeted with a UI that looks similar to this after you login.

![](https://d.pr/i/Q7BDWC+)

You may now launch a client or launch via quick-start from the Bot Management Panel.



Having trouble with your client not starting? Check out: [/docs/client-wont-start](/docs/client-wont-start)

