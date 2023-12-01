FROM centos:7
ADD * /root/
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;\
cd /root;\
yum -y install logrotate;\
rpm --import gpg.E495BB49CC4BBE5B.key;\
rpm -ivh erlang-26.0.2-1.el7.x86_64.rpm;\
rpm --import gpg.9F4587F226208342.key;\
rpm -ivh rabbitmq-server-3.12.1-1.suse.noarch.rpm;\
mkdir -p /data/rabbitmq/log;\
mkdir -p /data/rabbitmq/data;\
chown -R rabbitmq:rabbitmq /data/rabbitmq;\
\cp rabbitmq-env.conf /etc/rabbitmq/rabbitmq-env.conf;\
\cp rabbitmq.config /etc/rabbitmq/rabbitmq.config;\
\cp advanced.config /etc/rabbitmq/advanced.config;\
\cp rabbitmq-server.service /usr/lib/systemd/system/rabbitmq-server.service
# 环境变量
ENV LC_ALL en_US.UTF-8
# 创建卷
VOLUME ["/data/rabbitmq"]
