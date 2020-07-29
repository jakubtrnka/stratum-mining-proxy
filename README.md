stratum-mining-proxy
====================

Installation on Linux using Git
-------------------------------
This is advanced option for experienced users, but give you the easiest way for updating the proxy.

1. install python2 and python2-virtualenv for your distribution
1. `git clone git://github.com/jakubtrnka/stratum-mining-proxy.git`
1. `git clone git://github.com/braiins/stratum.git`
1. `cd stratum-mining-proxy`
1. `virtualenv .env --python=/usr/bin/python2.7`
1. `. .env/bin/activate`
1. `python -m pip install PyInstaller==3.6`
1. `python -m pip install -e ../stratum`
1. `pyinstaller -F mining_proxy.py --name stratum-mining-proxy`
1. Resulting binary is in `dist/stratum-mining-proxy`

Troubleshooting: Installation on Ubuntu/RaspberryPi
-------------------------------
This is advanced option for experienced users, but give you the easiest way for updating the proxy.

1. install python2 and python2-virtualenv for your distribution
1. `git clone git://github.com/jakubtrnka/stratum-mining-proxy.git`
1. `git clone git://github.com/braiins/stratum.git`
1. `cd stratum-mining-proxy`
1. `virtualenv .env --python=/usr/bin/python2.7`
1. `. .env/bin/activate`
1. Manually build PyInstaller:
    1. `sudo apt-get install clang`
    1. `git clone https://github.com/pyinstaller/pyinstaller.git`
    1. `cd pyinstaller/bootloader/`
    1. `python ./waf all --target-arch=32bit --clang`
    1. `sudo apt-get remove clang   # remove the clang, it is not needed anymore`
    1. `cd ..`
    1. `python setup.py install`
    1. `cd ..`
1. `python -m pip install -e ../stratum`
1. `mkdir -p .env/local/include/python2.7`
1. `ln -s /usr/include/python2.7/pyconfig.h .env/local/include/python2.7/pyconfig.h`
1. `pyinstaller -F mining_proxy.py --name stratum-mining-proxy`
1. Resulting binary is in `dist/stratum-mining-proxy`

Installation on Arch Linux
--------------------------
1. `git clone https://aur.archlinux.org/stratum-mining-proxy.git`
1. `cd stratum-mining-proxy`
1. `makepkg -sri`
1. run `stratum-mining-proxy -o us-east.stratum.slushpool.com -p 3333 -sh 0.0.0.0 -sp 3333 --enable-stratum-extensions`
