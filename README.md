## QQ群669756510

## 使用教程(Quick start)

### 获取镜像方式1：直接下载
```
docker pull 2233466866/rabbitmq
```

### 获取镜像方式2：自己构建
```
git clone https://github.com/2233466866/book_amqp.git
cd book_amqp
docker build -t [镜像] .
```

### 启动(Start)
```
# 启动[容器]
docker run -dit -p 5672:5672 -p 15672:15672 -p 25672:25672 --name=[容器] [镜像] /usr/sbin/rabbitmq-server

# 启动管理插件
docker exec -it [容器] rabbitmq-plugins enable rabbitmq_management

# 删除默认用户
docker exec -it [容器] rabbitmqctl delete_user guest

# 创建定制用户(假设用户为：rabbitmq，密码为：****************)
docker exec -it [容器] rabbitmqctl add_user rabbitmq '****************'

# 用户设为管理员(假设用户为：rabbitmq)
docker exec -it [容器] rabbitmqctl set_user_tags rabbitmq administrator

# 给与用户操作vhost的所有权限(假设用户为：rabbitmq，vhost为：/，权限为：'.*' '.*' '.*')
docker exec -it [容器] rabbitmqctl set_permissions -p / rabbitmq '.*' '.*' '.*'

# 测试下效果
curl http://127.0.0.1:15672
```

### 配置(Config)
```
# 配置文件路径(Config file path)
/etc/rabbitmq/rabbitmq-env.conf
/etc/rabbitmq/rabbitmq.config
/etc/rabbitmq/advanced.config
```

