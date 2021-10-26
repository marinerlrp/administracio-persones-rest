FROM openshift/spring-base-logback-encoder-tomcat9:latest

MAINTAINER Llorenc

ARG build_nom_app=administracio-persones-rest
ENV env_nom_app=$CONTEXT
ARG build_vers=1.1.2
ENV env_vers=$VERSIO
ARG entorn=integracio
ENV env_entorn=$ENTORN
ARG env_snapshot=$SNAPSHOT
ENV env_nomcontextcanviat=$NOMCONTEXTCANVIAT
COPY start.sh /home/tcuser/
RUN su tcuser -c "/home/tcuser/start.sh $env_entorn $env_nom_app $env_vers $env_snapshot $env_nomcontextcanviat"


EXPOSE 10180
USER 2000
CMD env; echo "Han de existir i tenir valor les variables: ENTORN,VERSIO,CONTEXT,build_vers, build_nom_app,build_entorn i SNAPSHOT i SNAPSHOT si es snapshot"; cd /home/tcuser; . /home/tcuser/server/$ENTORN/entorn.sh; /home/tcuser/server/tomcat/bin/catalina.sh run
