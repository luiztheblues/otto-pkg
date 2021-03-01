# otto-pkg
Eine Paketverwaltungs-Toolchain

# Flags and usage (will be added later to a real man page):
> \>  help (-H)    - Show this help message.  
> \>  info (-I)    - List info about the software.  
> \>  find (-f)    - Search for content in Otto's files.  
> \>  dig  (-d)    - Install package.  
> \>  bury (-b)    - Remove package.  
> \>  up2date (-u) - Update repository index and packages.  
> \>  mkpkg (-m)   - Build a package (using source code or binaries).  
> \>  list  (-l)   - List installed packages.
 
# Goals:
+ Have a portable and fast package manager in ports-style (basically Gentoo's Portage done right);
+ Have a SRV4-like "local" source-code packaging (see .psl packages), that will works perfectly with the actual ports-like model;
+ Have a community-driven package sharing, without depending totally on a localized server;
+ In short, have a respectable "official" package managnment toolchain to [Pindorama's Copacabana](http://projeto-pindorama.neocities.org/_projetos/copacabana.html).  

# Dependencies:
## This list is separated in three categories, respectively: interpreters, www-resources and command-line utilities/libaries.
+ Korn Shell (tested using [OpenBSD's impementation of ksh](http://github.com/ibara/oksh));
+ [Python 3.(4,8)](http://www.python.org/);
+ [Libtorrent](http://libtorrent.org/) and Libtorrent bindings for Python 3.x;
+ cURL ([curl(1)](http://curl.se/));
+ Linus Torvalds' Git ([git(1)](http://git-scm.com/));
+ POSIX 7-Zip ([7z(1)](http://sourceforge.net/projects/p7zip/));
+ fd ([fd(1)](https://github.com/sharkdp/fd));
+ tar(1) (tested using [Jörg Schilling's fork of Sun Microsystems' tar(1)](http://freshmeat.sourceforge.net/projects/star), but it shall works with POSIX tar(1) or any other implementation of tar(1) compatible with POSIX standards. **NOTE**: Plan 9's tar(1) won't work with it, unfortunately, because files generated with it aren't compatible with POSIX tar(1) as far i tested);
+ bc(1) (tested using [Galvin D. Howard's implementation of bc(1)](http://git.yzena.com/), but it shall work with any implementation);
+ sed(1) (tested using GNU's implementation of sed(1), with some extensions that i will need to remove later);
+ awk(1) (tested using GNU's implementation of awk(1), but in theory it works with Sun Microsystems' nawk(1) too. If it not, [send me an e-mail](mailto:luiz.antonio.rangel@bol.com.br) or a pull request, please);
+ cut(1) (tested using [OpenBSD's cut(1) via lobase](http://github.com/ataraxialinux/lobase/tree/master/usr.bin/cut));
+ grep(1) (tested using GNU's implementation of grep(1), but in theory it works with the POSIX implementation too. If it not, [send me an e-mail](mailto:luiz.antonio.rangel@bol.com.br) or a pull request, please);
+ Otto's libaries (see [usr.lib/otto](http://github.com/luiztheblues/otto-pkg/tree/master/usr/lib/otto));
+ [pico-torrent(1)](http://github.com/luiztheblues/otto-pkg/blob/master/usr/bin/pico-torrent).

# TO DO:
+ Make it portable;
+ Fix the inconsistent code style;
+ Change variable names from "snake case" to a more styled "snake case", like Sun Microsystems' code);
+ Create a log function, for save every operation log in /var/otto/system/logs/otto_`date`. A little useless for now;
+ Add long name options;
+ Rewrite find() and CheckDependencies() function;
+ Check if everything works properly;
+ May implement IPFS;
+ Create a USE Flags-like system;
+ ~~Rewrite it in Go or C, because Shell sucks for big projects like this one.~~

# I want to contribute, how could i do?
Send me an [e-mail](mailto:luiz.antonio.rangel@bol.com.br), as well to [Pindorama Foruns](https://pindorama.boards.net/board/5/otto-pkg) if i don't answer you.

# License, copying, call it what you like
[Caldera License](http://projeto-pindorama.neocities.org/_arquivos/licencas/copycenter/CALDERA_LICENSE.html), directly from 2002.  
And no, i will not change it to a liberal version of BSD [just because your demigod Stallman told us to do it](http://www.gnu.org/licenses/bsd.en.html) neither because you want to use parts of my code at your harmful GPL'd project.  
Do not bother me with this, otherwise i will not be polite (as i usually am) with you. :^)
