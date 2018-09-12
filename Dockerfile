FROM brpedromaia/hadoop
LABEL Pedro Maia Martins de Sousa <brpedromaia@gmail.com> and  Rodolfo Silva <Homaru> 


#######################################################
### Sqoop Installation
#######################################################

ADD sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz /usr/local/
RUN mv /usr/local/sqoop-1.4.7.bin__hadoop-2.6.0 /usr/local/sqoop

ENV SQOOP_HOME /usr/local/sqoop
ENV SQOOP_CONF_DIR $SQOOP_HOME/conf
ENV PATH $SQOOP_HOME/bin:$PATH


#ADD mysql-connector-java-5.1.4-bin.jar $SQOOP_HOME/server/lib/
RUN mkdir -p $SQOOP_HOME/server/lib/
COPY mysql-connector-java-5.1.4-bin.jar $SQOOP_HOME/server/lib/
COPY ojdbc6.jar $SQOOP_HOME/lib/
ADD sqoop.properties $SQOOP_HOME/conf/

#######################################################
### Test file
#######################################################
#ADD jarwget /usr/bin/
#RUN chmod 777 /usr/bin/jarwget

#######################################################
### Expose Ports
#######################################################

EXPOSE 22 9000 12000

#######################################################
### Entrypoint
#######################################################

ADD sqoop-entrypoint.sh /
ENTRYPOINT [ "/sqoop-entrypoint.sh" ] 
