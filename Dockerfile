FROM archlinux

RUN useradd -r -m -g users proxy

WORKDIR /home/proxy

RUN pacman -Syy --noconfirm sudo && \
    echo "proxy ALL=(ALL) NOPASSWD: /usr/bin/pacman" >> /etc/sudoers && \
    echo "Defaults lecture=never" >> /etc/sudoers && \
    pacman -S --noconfirm --needed base-devel git python2 python2-pip vim

RUN git clone https://github.com/braiins/stratum.git && \
    git clone https://github.com/braiins/stratum-mining-proxy.git

RUN  pip2 install -e ./stratum && pip2 install -e ./stratum-mining-proxy

EXPOSE 3333

USER proxy

ENTRYPOINT ["python2", "./stratum-mining-proxy/mining_proxy.py"]
