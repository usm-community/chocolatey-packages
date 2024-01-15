# GLPI Agent

Agent allowing to communicate with a GLPI server.

It introduces new features and a new protocol to communicate directly with a GLPI server and its native inventory function.
Based on the FusionInventory agent (v2.6), it also supports communication with the FusionInventory plug-in for GLPI and will remain fully compatible in its 1.x versions.

## Install Arguments

- `SERVER=https://your_glpi_server:port` Specify the inventory server and port.

- `TAG=YourTAG` Specify the tag to send to the server.

Command-line options for installer configuration. See the [official page](https://glpi-agent.readthedocs.io/en/latest/installation/windows-command-line.html#command-line-parameters) for details and defaults.

### Examples

`choco install glpi-agent --install-arguments="SERVER=https://inventory.glpi.org/glpi/"`

`choco install glpi-agent --install-arguments="SERVER=https://inventory.glpi.org/glpi/ TAG=InstalledByChocolatey RUNNOW=1"`