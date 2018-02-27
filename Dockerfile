#Dockerfile-latest

FROM alpine:edge

ENV BUILDPKGS "git gcc libc-dev make vde2-dev libpcap-dev linux-headers readline-dev cmake alpine-sdk"
ENV RUNPKGS "net-tools vde2 vde2-libs libpcap nano readline bash curl wget unzip"

RUN apk --update --no-cache add $RUNPKGS && rm -rf /var/cache/apk/* && \
    apk --no-cache add --virtual build-dependencies $BUILDPKGS && \
\
    mkdir /usr/src && cd /usr/src && \
    git clone https://github.com/hercules-390/hyperion.git  && \
    cd hyperion
    #sed -e "s/\$(error Retry your build without specifying USE_NETWORK=1)/# SUPRESSED /g" makefile > makefile2 && \
    #make LIBPATH=/usr/lib INCPATH=/usr/include USE_NETWORK=1 -j $(nproc) -f makefile2 all && \
    #make LIBPATH=/usr/lib INCPATH=/usr/include -j $(nproc) all && \
\
    #apk del build-dependencies && \
    #rm -rf /var/cache/apk/* && \
    #mkdir /machines
  
#ENV PATH /usr/src/simh/BIN:$PATH

#EXPOSE 2323-2326

ENTRYPOINT ["busybox", "sh"]
