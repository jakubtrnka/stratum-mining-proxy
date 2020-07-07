FROM archlinux

RUN useradd -r -m -g users proxy && echo "proxy ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers && pacman -Sy --needed --noconfirm sudo

USER proxy

WORKDIR /home/proxy

RUN sudo pacman -S --noconfirm --asdeps --needed base-devel git python2-pip && sudo pacman -S --noconfirm vim && git clone https://aur.archlinux.org/stratum-mining-proxy.git  && cd stratum-mining-proxy && makepkg -sri --noconfirm --skippgpcheck && sudo pacman -Rns $(pacman -Qtdq) <<< $'y\n' && sudo pacman -Sc --noconfirm

EXPOSE 3333

ENTRYPOINT ["stratum-mining-proxy"]
