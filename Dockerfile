FROM registry.acs.aliyun.com/open/centos:3.0.0

RUN yum install -y sudo
RUN yum install -y java-1.8.0-openjdk.x86_64

ENV ELASTICSEARCH_VERSION 5.6.0
ENV ELASTICSEARCH_DEB_VERSION 5.6.0

# wget "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.0.rpm"
COPY elasticsearch-5.6.0.rpm /tmp/elasticsearch-5.6.0.rpm
RUN rpm -i /tmp/elasticsearch-5.6.0.rpm

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-smartcn
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v5.6.0/elasticsearch-analysis-ik-5.6.0.zip
RUN echo "network.bind_host: 0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml

ENV PATH /usr/share/elasticsearch/bin:$PATH

WORKDIR /usr/share/elasticsearch

RUN rm -rf /var/log/elasticsearch
RUN ln -sf /acs/log /var/log/elasticsearch
RUN chown elasticsearch:elasticsearch /var/log/elasticsearch

EXPOSE 9200 9300

VOLUME /var/lib/elasticsearch

ENTRYPOINT sudo -u elasticsearch /usr/bin/java -Xms2g -Xmx2g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -XX:+AlwaysPreTouch -server -Xss1m -Djava.awt.headless=true -Dfile.encoding=UTF-8 -Djna.nosys=true -Djdk.io.permissionsUseCanonicalPath=true -Dio.netty.noUnsafe=true -Dio.netty.noKeySetOptimization=true -Dio.netty.recycler.maxCapacityPerThread=0 -Dlog4j.shutdownHookEnabled=false -Dlog4j2.disable.jmx=true -Dlog4j.skipJansi=true -XX:+HeapDumpOnOutOfMemoryError -Des.path.home=/usr/share/elasticsearch -cp "/usr/share/elasticsearch/lib/*" org.elasticsearch.bootstrap.Elasticsearch -p /var/run/elasticsearch/elasticsearch.pid -Edefault.path.logs=/var/log/elasticsearch -Edefault.path.data=/var/lib/elasticsearch -Edefault.path.conf=/etc/elasticsearch
