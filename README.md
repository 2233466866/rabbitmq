## QQ群669756510

## 使用教程(Quick start)

### 下载(Download)
docker pull 2233466866/rabbitmq
```

### 配置(Config)
```
# 配置文件路径(Config file path)
/etc/rabbitmq/rabbitmq-env.conf
/etc/rabbitmq/rabbitmq.config
/etc/rabbitmq/advanced.config
```

### 启动(Start)
```
docker run -dit -p 5672:5672 -p 15672:15672 -p 25672:25672 --name=rabbitmq 2233466866/rabbitmq /usr/sbin/rabbitmq-server
```

### 连接(Connect)
```
docker exec -it rabbitmq /bin/bash
```
