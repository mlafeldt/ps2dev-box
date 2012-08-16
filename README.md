A Virtual Machine for PS2 Development
=====================================

For the motivation, you may want to read [this blog post.][blog]


Requirements
------------

- The virtual machine runs on top of [VirtualBox].
- [Vagrant] is used to build and provision the virtual machine.


## How to build the VM

First, clone the repo:

    $ git clone git://github.com/mlafeldt/ps2dev-box.git
    $ cd ps2dev-box/

Now you have two options to provision the box. Both will give you the same
result.

a) Provision with Shell:

    $ cd shell/
    $ vagrant up

b) Provision with Chef Solo:

    $ cd chef-solo/
    $ vagrant up

That's it.


## Contact

* Web: <https://github.com/mlafeldt/ps2dev-box>
* Mail: <mathias.lafeldt@gmail.com>
* Twitter: [@mlafeldt](https://twitter.com/mlafeldt)


[Vagrant]: http://vagrantup.com
[VirtualBox]: https://www.virtualbox.org
[blog]: http://mlafeldt.github.com/blog/2012/08/system-provisioning-with-vagrant/
