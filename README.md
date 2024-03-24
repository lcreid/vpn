# README

This is a repository of files I used to build a simple tunneling VPN. For a more complete description, read [this](https://jadesystems.ca/knowledgebase/vpn.html#how-does-it-work/).

The security world is ever-evolving. If you want to use these scripts, you're welcome, but I give no guarantee that they're up-to-date, nor that they offer the level of security that your situation requires.

Note that the generated `.ovpn` file for the client allows anyone who has it to connect to your VPN. That means the `.ovpn` file itself should be owned by `root` and be `600` until it gets imported on the client, and should then be deleted.

## Files

| File | Description |
| --- | --- |
| `server-common-name.conf` | Template for the VPN server's configuration file. |
| `base.conf` | Template for the client's configuration file, that will be included in the `.ovpn` file. |
| `make_config.sh` | Script from Digital Ocean that packages the keys and configuration file into an `.ovpn` file that the client imports into its VPN client software. |
| `make-client-ovpn-part-*.sh` | Files to run to generate all the keys needed for a new VPN client. |

## `make_config.sh`

`make_config.sh` builds the `.ovpn` from all the generated keys and certificates. You need to modify this file before you use it, replacing "path-to-working-directories", with the path to your VPN working directories. (The rest of the instructions assume that the working directories are directly under your home directly, so that's likely what you should use for "path-to-working-directories".)

The script can't simply use `$HOME` or `~` because it has to be run as `root`. It has to run as `root` because some of the files it reads are owned by `root` and not accessible to others.
