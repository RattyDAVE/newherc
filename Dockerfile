FROM alpine:edge

ENV BUILDPKGS "git perl autoconf automake flex gawk gcc m4 make g++"
ENV RUNPKGS "mc"

RUN apk --update --no-cache add $RUNPKGS && \
    apk --no-cache add --virtual build-dependencies $BUILDPKGS && \
\
    mkdir /usr/src && cd /usr/src && \
    git clone https://github.com/SDL-Hercules-390/hyperion.git && \
    cd /usr/src/hyperion && \
    ./autogen.sh
    
RUN cd /usr/src/hyperion && \
    ./configure --enable-ipv6=no
    
    #apk del build-dependencies && \
    #rm -rf /var/cache/apk/* && \
  
ENTRYPOINT ["busybox", "sh"]
