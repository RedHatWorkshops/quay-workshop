---
layout: lab
title: CoreOS Config Transpiler
permalink: /lab/provisioning/configtranspiler/
module: Provisioning
---

Download the config-transpiler binary.

```
wget https://github.com/coreos/container-linux-config-transpiler/releases/download/v0.5.0/ct-v0.5.0-x86_64-unknown-linux-gnu
sudo cp ct-v0.5.0-x86_64-unknown-linux-gnu /usr/local/bin/ct
```

Move the binary into a convenient location on the host as necessary.

```
sudo cp ct-v0.5.0-x86_64-unknown-linux-gnu /usr/local/bin/ct
```

Convert a Container Linux config to the ignition format.

```
ct --in-file ...
```
