stratum-mining-proxy
====================

Application providing bridge between old HTTP/getwork protocol and Stratum mining protocol
as described here: http://mining.bitcoin.cz/stratum-mining.

Packaging for Debian
--------------------

1. Install devscripts, debhelper, pbuilder.
2. Download and unpack a tarball or clone this repository. Enter the unpacked/cloned direcotry.
3. Type "debuild-pbuilder -b -uc -us". You will be asked your password for sudo command. If you're a sudoer, skip to the last step.
4. If you're not a sudoer, an error will occur. Do `apt-get -f install' as root to correct the situation and call "debuild -b -uc -us".
5. A .deb package will be generated in parent directory. Use it to install stratum-mining-proxy on a Debian compatible system.


Installation on Linux using Git
-------------------------------
This is advanced option for experienced users, but give you the easiest way for updating the proxy.

1. install python2 and python2-virtualenv for your distribution
1. `git clone git://github.com/jakubtrnka/stratum-mining-proxy.git`
1. `git clone git://github.com/jakubtrnka/stratum.git`
1. `cd stratum-mining-proxy`
1. `virtualenv .env --python=/usr/bin/python2.7`
1. `. .env/bin/activate`
1. `python -m pip install PyInstaller==3.6`
1. `python -m pip install -e ../stratum`
1. `pyinstaller -F mining_proxy.py --name stratum-mining-proxy`
1. Resulting binary is in `dist/stratum-mining-proxy`

Installation on Arch Linux
--------------------------
1. `git clone https://aur.archlinux.org/stratum-mining-proxy.git`
1. `cd stratum-mining-proxy`
1. `makepkg -sri`
1. run `stratum-mining-proxy -o us-east.stratum.slushpool.com -p 3333 -sh 0.0.0.0 -sp 3333 --enable-stratum-extensions`

Installation with Docker
------------------------

This works on any system with Docker (Linux/Mac/Windows) and doesn't need anything other than Git and Docker.

1. git clone https://github.com/jakubtrnka/stratum-mining-proxy.git
2. cd stratum-mining-proxy
3. docker build -t stratum-mining-proxy .
4. Run interactively: docker run --rm -p 3333:3333 -it stratum-mining-proxy [-o eu.stratum.slushpool.com -p 3333 ...]
5. Run as a service: docker run -d --name stratum-mining-proxy --restart unless-stopped -p 3333:3333 stratum-mining-proxy [-o eu.stratum.slushpool.com -p 3333 ...]

Compiling midstate C extension
------------------------------
For some really big operations using getwork interface of this proxy, you'll find
useful "midstatec" C extension, which significantly speeds up midstate calculations
(yes, plain python implementation is *so* slow). For enabling this extension,
just type "make" in midstatec directory. Proxy will auto-detect compiled extension
on next startup.

Contact
-------

This proxy is provided by Slush's mining pool at http://mining.bitcoin.cz. You can contact the author
by email slush(at)satoshilabs.com.

Donation
--------
This project helps thousands of miners to improve their mining experience and optimize bandwidth of large
mining operations. Now it is listed on tip4commit service, so if you find this tool handy, feel free
to throw few satoshis to the basket :-).

[![tip for next commit](http://tip4commit.com/projects/322.svg)](http://tip4commit.com/projects/322)
