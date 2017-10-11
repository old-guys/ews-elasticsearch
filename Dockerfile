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

RUN echo "exec command"
RUN mkdir -p /acs/conf

WORKDIR /usr/share/elasticsearch

RUN rm -rf /var/log/elasticsearch
RUN ln -sf /acs/log /var/log/elasticsearch
RUN chown elasticsearch:elasticsearch /var/log/elasticsearch

EXPOSE 9200 9300

VOLUME /var/lib/elasticsearch

COPY entrypoint.sh /app/
ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
