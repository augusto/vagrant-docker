# A Docker sandbox
Build this to play with some of the docker features that are still hot.

Vagrantfile facts
* Running ubuntu Wily
* Latest released docker
* Docker compose 1.6.2
* Userns remap enabled
* Needs vagrant 1.8+ and remember to do a `vagrant box update` in case things go awry.

For my lack of memory, this is the command to update the docker daemon startup parameters
```
systemctl enable docker
```
