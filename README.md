## Mitchell's development setup

Hello! If you've found this page, take a look around and hopefully you'll
learn something cool and new. I use this page to store everything that I
personally use for developing code in my main OS which at the time of writing
is Ubuntu 20.04. This repository comes complete with a Makefile that will
automatically install everything onto a fresh machine. I ultimately plan to
create vagrant test scripts to test the installation script.

## List of tested machines:

| Distribution | Status |
| ------------ | ------ |
| Ubuntu 20.04 |  Pass  |
| Ubuntu 18.04 |  Not Tested   |
| Ubuntu 16.04 |  Not Tested   |


## List of vim plugins installed:

| Plugin | Purpose |
| ------------ | ------ |
| YouCompleteMe | tab Autocompletion |
| vim-surround | automates characters surround text |


To install everything onto a fresh machine run the following:

```
$ make all
```

if you want to see more commands, run `make help`

## bashrc color scheme example
The point of this addon to bashrc is to automatically show you which branch of
the git repository you are on. The below gif indicates what I'm talking about
:smile:
![bash color scheme](images/bash_color_example.gif)

---

# Q&A
## Q: Why use makefile?
A: to be quite honest, I have no idea. Version 1 of my auto set up script used
a raw bash script. I just want to have some fun with makefiles, and since
the auto install script will only be used on Linux machines, I don't care
for cross platform in this case. Plus, I eventually plan to create a
`make remote-dev` with the purpose of installing development environments on
servers that don't have an X11 server built-in.

## Q: What is the archive folder?
archive hosts some config files I don't use but might go back to using in the
future.
