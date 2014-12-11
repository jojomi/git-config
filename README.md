git-config
==========

Modular git config including a rich set of aliases you can use to quickly use
git on the commandline.


Why not Tower*?
--------------

Git is extremely powerful on the commandline. GUI tools like Tower* are doing a
great job leverage this power to their user interface. I love using Tower on the
desktop, but git-config does have its advantages:

* it can be used in **any git environment** *(i.e. especially non-graphical systems)*
* it can be **easily customized** to your personal workflows and needs *(try this with your favourite graphical tool, keep it if it works fine!)*
* it is **pretty portable** *(at least on unixoid systems with sh installed)*
* best of all: **it's free and open-source** *(deploy it a hundred times for free if you need to)*


How to use git-config
---------------------

Clone the repo:

    git clone https://github.com/jojomi/git-config.git

Change to cloned directory:

    cd git-config

Copy the files to a temporary directory to see which files would be overwritten:

    ls -la `./bootstrap.sh`

Copy the files to your home directory activating git-config globally:

    ./bootstrap.sh ~ --global

Or **alternatively** copy the files to your project directory activating git-config project-specifically:

    ./bootstrap.sh /path/to/project


Customizing
-----------

You can create a custom git-config file named `.gitconfig-custom` which will be deployed using `bootstrap.sh` script. It will be included after `.gitconfig-repo` thus be able to overwrite values set there.


More info
---------

see [Wiki](https://github.com/jojomi/git-config/wiki)


<hr>
\* replace with your favourite GUI git tool
