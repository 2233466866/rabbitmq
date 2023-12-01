FROM centos:7
ADD * /root/
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;\
cd /root;\
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
\cp rabbitmq-server.service /usr/lib/systemd/system/rabbitmq-server.service;\
rabbitmq-plugins enable rabbitmq_management;\
rabbitmqctl delete_user guest;\
rabbitmqctl add_user rabbitmq 'ASDFqwer1234!@#$%)(*&^';\
rabbitmqctl set_user_tags rabbitmq administrator;\
rabbitmqctl set_permissions -p / rabbitmq '.*' '.*' '.*'
# 环境变量
ENV PATH $PATH
# 创建卷
VOLUME ["/data/rabbitmq"]
