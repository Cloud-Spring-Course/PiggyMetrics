FROM mongo:3
MAINTAINER vgrigor <vgrigor@mail.ru>

ADD init.sh /init.sh
ADD init_2.sh /init_2.sh
ADD init_3.sh /init_3.sh
ADD rm.sh   /rm.sh
ADD ./dump /
ADD ./ssss /ssss

RUN \
 chmod +x /init_2.sh && \
 chmod +x /init_3.sh && \
 chmod +x /init.sh && \
 apt-get update && apt-get dist-upgrade -y --force-yes && \
 apt-get install psmisc -y -q && \
 apt-get autoremove -y && apt-get clean && \
 rm -rf /var/cache/* && rm -rf /var/lib/apt/lists/* 

EXPOSE 27017

#ENTRYPOINT [ "sh", "-c", "echo $HOME" ]
#ENTRYPOINT ["/init.sh"]
#ENTRYPOINT ["/rm.sh"]

#COMMENT THIS IF NOT WORKING
#ENTRYPOINT ["/bin/sh", "-c"]

ENTRYPOINT ["/init_3.sh"]

#CMD nohup  ./init_2.sh  &
#CMD   mongo  

