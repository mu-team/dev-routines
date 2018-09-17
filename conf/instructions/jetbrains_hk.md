JetBrains hotkeys issues
=================================

Solving the problem with hotkeys for the keyboard layout, 
different from the English for JetBrains products on Linux distributions.

> Example for a `${HOME}` directory and `PyCharm`.

1. Clone repository with hotkeys fix:

```bash
git clone https://github.com/zheludkovm/LinuxJavaFixes.git ${HOME}/fix
```

2. Edit JetBrains product (PyCharm, IDEA, WebStorm, etc.) vmoptions:

```bash
JAVAAGENT="-javaagent:${HOME}/fix/build/LinuxJavaFixes-1.0.0-SNAPSHOT.jar"
echo ${JAVAAGENT} >> /opt/pycharm/bin/pycharm.vmoptions
echo ${JAVAAGENT} >> /opt/pycharm/bin/pycharm64.vmoptions
```
