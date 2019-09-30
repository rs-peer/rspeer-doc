---
id: client-wont-start
title: How to resolve issues related to RSPeer not starting.
sidebar_label: Help! My Client Wont Start
---

If your client will not open, it is usually caused by a simple reason. 



### **Verify your Proxy**

1. If you are using a **proxy**, verify that your proxy is a correct and valid SOCKS5 proxy. HTTP Proxies will NOT work.
   1. If you have verified your proxy is valid and it is still not loading, try loading the client without the proxy.
   2. If the client still does not load without a proxy, If it does load, your proxy is the issue.



### Delete all **RSPeer** Related Folders.

1. ​	Delete the two following folders:

   1. **HOME_DIRECTORY/RSPeer** on Mac/Linux and **My Documents/RSPeer** on Windows.

      ![](https://download.rspeer.org/uploads/forum/1-fcf93a0a-d70a-446a-b45d-2b5b3131bfe8.png)

   2. **HOME_DIRECTORY/.rspeer**. It might be hidden, be sure to show hidden folders.

      ![](https://download.rspeer.org/uploads/forum/1-fe42ef48-f20b-446d-9fca-7bce536225c0.png)

2. Once those folders are deleted, **re-run the launcher** and let it re-download everything and try again.



### **Resetting Your Firewall**

You may have a weird firewall rule that blocks outgoing connections within Java applications to certain websites. We recommend resetting your firewall to default settings. 

> https://www.top-password.com/blog/reset-firewall-settings-to-default-in-windows-10



### **Changing Your DNS**

If none of the above have worked for you, your ISP may be blocking connections to RSPeer services as well. I have seen a few issues where certain users ISP's did not resolve DNS connections to https://api.rspeer.org, which resulting in their client not loading.

We recommend updating your DNS provider to Cloudflare 1.1.1.1's free DNS service. 

> https://1.1.1.1/dns/

There is a very simple guide at the bottom of the page on how to change your DNS records.



### **Uninstall all Java Versions and Install AdoptOpenJDK 11.**

You may have an incompatible java version installed on your computer, we recommend removing all Java versions and installing AdoptOpenJDK 11.

You can uninstall Java on Windows through the **Control Panel**. 

> https://adoptopenjdk.net/?variant=openjdk11&jvmVariant=hotspot



### **Run the RSPeer Jar Directly (Without The Launcher)**

You may be having some sort of startup error on the client, to better troubleshoot this, we need to run the client directly to see proper error output.

To do this, please follow the video guide below to run the client directly using the same java version as the launcher.

This video was made for Windows, but the steps should be re-creatable in each different OS.

**Please note:** Your Java folder name may be different due to the version you picked, this is fine.

> **Video Guide:** **https://d.pr/v/U9M7Dz**



### Discord Support Channel

Still having issues with the client loading? Please try our Discord support channel for further assistance.![](https://d.pr/i/AF4CKc+)

> https://discordapp.com/invite/UVp7Evz