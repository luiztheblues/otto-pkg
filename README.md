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
+ Korn Shell (93,PD) (tested using [OpenBSD's impementation of ksh](http://github.com/ibara/oksh));
+ [Python 3.(4,8)](http://www.python.org/);
+ [Libtorrent](http://libtorrent.org/) and Libtorrent bindings for Python 3.x;
+ [cURL](http://curl.se/);
+ [Linus Torvalds' Git](http://git-scm.com/);
+ POSIX 7-Zip ([p7zip](http://sourceforge.net/projects/p7zip/));
+ Sed (tested using GNU's implementation of sed, with some extensions that i will need to remove later);
+ Awk (tested using GNU's implementation of awk, but in theory it works with Sun's nawk too. If it not, [send me an e-mail](mailto:luiz.antonio.rangel@bol.com.br) or a pull request, please);
+ Cut (tested using [OpenBSD's cut via lobase](http://github.com/ataraxialinux/lobase/tree/master/usr.bin/cut));
+ Grep (tested using GNU's implementation of awk, but in theory it works with POSIX grep too. If it not, [send me an e-mail](mailto:luiz.antonio.rangel@bol.com.br) or a pull request, please);
+ Otto's libaries (see [usr/lib/otto](http://github.com/luiztheblues/otto-pkg/tree/master/usr/lib/otto));
+ [pico-torrent(1)](http://github.com/luiztheblues/otto-pkg/blob/master/usr/bin/pico-torrent).

# TO DO:
+ Make it portable;
+ Fix the inconsistent code style;
+ Change variable names from "snake case" to a more styled "snake case", like Sun Microsystems' code).
+ Create a log function, for save every operation log in /var/otto/system/logs/otto_`date`. A little useless for now;
+ Add long name options;
+ Rewrite find() and CheckDependencies() function;
+ Check if everything works properly;
+ May implement IPFS;
+ Add fn_ before the function name itself;
+ Make something that replaces "/usr" or "/bin" with "${USRDIR}" or "${BINDIR}", respectively, in preference using POSIX regex for applications in MakePackage();
+ ~~Rewrite it in Go or C, because Shell sucks for big projects like this one.~~

# I want to contribute, how could i do?
Send me a [e-mail](mailto:luiz.antonio.rangel@bol.com.br), as well to [Pindorama maillists (only in portuguese)](mailto:pindorama-users@googlegroups.com) if i don't answer you.  
I will be offline in the coming three months, praticing "NoSurf" (just a nice name for "investing in knowledge and leading to better fitness"), at least in the majority of this time, so don't expect a fast response from me. Just make a patch and send it.

# License, copying, call it what you like
[Caldera License](http://projeto-pindorama.neocities.org/_arquivos/licencas/copycenter/CALDERA_LICENSE.html), directly from 2002.  
And no, i will not change it to a liberal version of BSD [just because your demigod Stallman told us to do it](http://www.gnu.org/licenses/bsd.en.html) and because you want to use parts of my code on your harmful GPL'd code.  
Do not bother me with this, otherwise i will not be polite (as i usually am) with you. :^)