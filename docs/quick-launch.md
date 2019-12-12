---
id: quick-launch
title: How to Launch RSPeer Automatically
sidebar_label: How to Launch RSPeer Automatically
---
RSPeer's *Quick Launch* feature allows users to start the client with a
preconfigured Runescape account, proxy, and script without any user interaction.
Using this feature, users are able to spawn clients through the Bot Management
interface, developers are able to quickly test their scripts without manually
activating them, and large-scale deployments are able to run in a completely
automated fashion.

## Basic Usage

The easiest way to generate a configuration is through the QuickLaunch
Generator, which can be accessed through the settings menu:

![Settings &rarr; QuickLaunch Generator](assets/quick-launch/menu.jpg)

Through this interace you can specify various startup options:

![QuickLaunch Generator window](assets/quick-launch/window.jpg)

Saving these options will create a file at
`cache/quicklaunch/<RsUsername>(<ScriptName>).json` in your RSPeer directory,
found at the following locations:

- **Windows:** `%USERPROFILE%\My Documents\RSPeer` (e.g.,
  `C:\Users\YourName\My Documents\RsPeer`)
- **macOS/Linux:** `~/RSPeer` (e.g., `/home/YourName/RSPeer` or
  `/Users/YourName/RSPeer`)

## Command-Line Usage

This next section is only relevant to the RSPeer client. See
[this thread][launcher-docs] for information about the launcher. To use a quick
launch configuration on the command-line, it's helpful to know a bit about
[JSON][json] and [Base64][base64]. If you're unfamiliar with these technologies,
the short explanation is that JSON is the language RSPeer uses to specify its
configuration settings while Base64 makes it easy to pass that data to the
client on the command-line.

[launcher-docs]: https://discourse.rspeer.org/t/how-to-use-quick-start-arguments-with-the-launcher/2323
[json]: https://en.wikipedia.org/wiki/JSON
[base64]: https://en.wikipedia.org/wiki/Base64
[check-config]: https://jsonlint.com/

### Example

Here's an example command-line:

```
java -jar path/to/rspeer-client.jar -qs 'ewogICJSc1VzZXJuYW1lIjogInVzZXJAZXhhbXBsZS5jb20iLAogICJSc1Bhc3N3b3JkIjogInBAc3N3MHJkISIsCiAgIldvcmxkIjogMTMzNywKICAiU2NyaXB0TmFtZSI6ICJDb29sIFNjcmlwdCIsCiAgIklzUmVwb1NjcmlwdCI6IHRydWUsCiAgIlNjcmlwdEFyZ3MiOiAiIiwKICAiVXNlUHJveHkiOiB0cnVlLAogICJQcm94eVBvcnQiOiAiODA4MCIsCiAgIlByb3h5SXAiOiAiMTI3LjAuMC4xIiwKICAiUHJveHlVc2VyIjogIiIsCiAgIlByb3h5UGFzcyI6ICIiLAogICJDb25maWciOiB7CiAgICAiTG93Q3B1TW9kZSI6IGZhbHNlLAogICAgIlN1cGVyTG93Q3B1TW9kZSI6IGZhbHNlLAogICAgIkRpc2FibGVNb2RlbFJlbmRlcmluZyI6IGZhbHNlLAogICAgIkRpc2FibGVTY2VuZVJlbmRlcmluZyI6IGZhbHNlCiAgfQp9Cg=='
```

In the above example, `-qs` is the flag that indicates to the RSPeer client that
a quick start configuration is being supplied. The long string of gibberish that
follows is the Base64-encoded configuration. *nix and WSL users can decode this
with the following command:

```
base64 -d <<< 'ewogICJSc1VzZXJuYW1lIjogInVzZXJAZXhhbXBsZS5jb20iLAogICJSc1Bhc3N3b3JkIjogInBAc3N3MHJkISIsCiAgIldvcmxkIjogMTMzNywKICAiU2NyaXB0TmFtZSI6ICJDb29sIFNjcmlwdCIsCiAgIklzUmVwb1NjcmlwdCI6IHRydWUsCiAgIlNjcmlwdEFyZ3MiOiAiIiwKICAiVXNlUHJveHkiOiB0cnVlLAogICJQcm94eVBvcnQiOiAiODA4MCIsCiAgIlByb3h5SXAiOiAiMTI3LjAuMC4xIiwKICAiUHJveHlVc2VyIjogIiIsCiAgIlByb3h5UGFzcyI6ICIiLAogICJDb25maWciOiB7CiAgICAiTG93Q3B1TW9kZSI6IGZhbHNlLAogICAgIlN1cGVyTG93Q3B1TW9kZSI6IGZhbHNlLAogICAgIkRpc2FibGVNb2RlbFJlbmRlcmluZyI6IGZhbHNlLAogICAgIkRpc2FibGVTY2VuZVJlbmRlcmluZyI6IGZhbHNlCiAgfQp9Cg=='
```

There are also [tools](http://www.utilities-online.info/base64/) available
online for handling Base64. You should see the following result:

```json
{
  "RsUsername": "user@example.com",
  "RsPassword": "p@ssw0rd!",
  "World": 1337,
  "ScriptName": "Cool Script",
  "IsRepoScript": true,
  "ScriptArgs": "",
  "UseProxy": true,
  "ProxyPort": "8080",
  "ProxyIp": "127.0.0.1",
  "ProxyUser": "",
  "ProxyPass": "",
  "Config": {
    "LowCpuMode": false,
    "SuperLowCpuMode": false,
    "DisableModelRendering": false,
    "DisableSceneRendering": false
  }
}
```

This is the same exact format written by the QuickLaunch Generator (see
[Basic Usage](#basic-usage)).

## Reference

| **Name** | **Date Type** | **Description** |
| -------- | ------------- | --------------- |
| `RsUsername` | *string* | Login name or email of the Runescape account. |
| `RsPassword` | *string* | Login password of the Runescape account. |
| `World` | *integer* | World to join (use `-1` or `null` to pick any world). |
| `ScriptName` | *string* | Name of the script to start. |
| `IsRepoScript` | *boolean* | `true` if the script should be executed from the SDN, `false` if it's available locally. |
| `ScriptArgs` | *string* | Custom arguments to pass to the script on startup. |
| `UseProxy` | *boolean* | `true` to connect via proxy. |
| `ProxyIp` | *string* | IP address of the proxy. |
| `ProxyPort` | *string* | Port of the proxy. |
| `ProxyUser` | *string* | Username for proxy authentication. |
| `ProxyPass` | *string* | Password for proxy authentication. |
| `Config` | *object* | Additional client configuration, see [Config](#config) below. |

### Config

| **Name** | **Date Type** | **Description** |
| -------- | ------------- | --------------- |
| `LowCpuMode` | *boolean* | `true` to enable low CPU mode. |
| `SuperLowCpuMode` | *boolean* | `true` to enable *super* low CPU mode. |
| `EngineTickDelay` | *integer* | Delays  (`SuperLowCpuMode` sets this to `5`). |
| `DisableModelRendering` | *boolean* | `true` to disable model rendering (`LowCpuMode` does this automatically). |
| `DisableSceneRendering` | *boolean* | `true` to disable scene rendering (`LowCpuMode` does this automatically). |

## Troubleshooting

If you find that you're having problems getting the client to run with your
desired configuration, be sure to double-check your settings with the
[available options](#options) and [check your config][check-config] for
syntax errors.
