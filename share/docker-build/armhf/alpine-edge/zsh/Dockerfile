FROM arm32v7/alpine:edge
VOLUME /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static
ENV HOME=/root \
    PULSE_SERVER=172.17.0.1 \
    TMOE_PROOT=false \
    TMOE_CHROOT=true \
    TMOE_DOCKER=true
RUN apk update \
    ; apk upgrade \
    ; apk add tar grep curl wget zstd bash tzdata newt git \
    ; ln -svf /usr/share/zoneinfo/UTC /etc/localtime \
    ; cd /tmp \
    ; curl -LO 'https://github.com/2moe/tmoe-zsh/raw/master/zsh.sh' \
    ; bash zsh.sh --tmoe_container_auto_configure \
    ; mkdir -pv /usr/local/etc/tmoe-linux \
    ; cd /usr/local/etc/tmoe-linux \
    ; printf "%s\n" "podman" > container.txt  \
    ; git clone --depth=1 https://github.com/2moe/tmoe-linux git || git clone --depth=1 git://github.com/2moe/tmoe-linux git \
    ; cp -fv git/tool.sh /tmp \
    ; cd /tmp \
    ; sed -i 's@*) #main@2333)@g' tool.sh \
    ; rm -rf /var/cache/apk/* ~/.cache/* 2>/dev/null \
    ; rm -rfv /tmp/* ~/.vnc/*passwd

CMD [ "/usr/local/bin/startx11vnc" ]