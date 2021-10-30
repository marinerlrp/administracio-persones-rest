FROM openshift/spring-base-logback-encoder-tomcat9:latest

MAINTAINER Llorenc


ENV CONTEXT="administracio-persones-rest"
ENV ENTORN="preproduccio"
ENV VERSIO="2.3.2"
ENV SNAPSHOT=""
ENV VERSIOTOMCAT="spring-base-logback-encoder-tomcat9"
ENV NOMCONTEXTCANVIAT=""
COPY start.sh /home/tcuser/
RUN chmod a+x /home/tcuser/start.sh
RUN id
RUN ls -alh /home/tcuser/
#RUN chmod a+x /home/tcuser/start.sh
RUN su tcuser -c "/home/tcuser/start.sh $ENTORN $CONTEXT $VERSIO $SNAPSHOT $NOMCONTEXTCANVIAT"
#RUN chown -R 2000:0 /home/tcuser
#RUN chmod -R g+rwx  /home/tcuser/


EXPOSE 10180
#USER 2000
#CMD /usr/bin/sleep 100000
CMD env; echo "Han de existir i tenir valor les variables: ENTORN,VERSIO,CONTEXT"; cd /home/tcuser; . /home/tcuser/server/$ENTORN/entorn.sh; /home/tcuser/server/tomcat/bin/catalina.sh run
#CMD /bin/bash
