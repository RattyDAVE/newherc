FROM alpine:edge

ENV BUILDPKGS "git"
ENV RUNPKGS "mc"

RUN apk --update --no-cache add $RUNPKGS && \
    apk --no-cache add --virtual build-dependencies $BUILDPKGS && \
\
    mkdir /usr/src && cd /usr/src && \
    git clone https://github.com/SDL-Hercules-390/hyperion.git
    
    #apk del build-dependencies && \
    #rm -rf /var/cache/apk/* && \
  
ENTRYPOINT ["busybox", "sh"]
