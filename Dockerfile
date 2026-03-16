FROM alpine:3

ARG TARGETARCH

RUN apk --no-cache --no-progress upgrade \
        && apk --no-cache --no-progress add \
            bash \
            curl \
            ip6tables \
            iptables \
            openvpn \
            su-exec \
            tini \
            tzdata \
    && rm -rf /tmp/*

COPY openvpn.sh /usr/bin/

VOLUME ["/vpn"]

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/openvpn.sh"]
