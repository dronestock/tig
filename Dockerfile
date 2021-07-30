FROM golang

MAINTAINER storezhang "storezhang@gmail.com"
LABEL architecture="AMD64/x86_64" version="latest" build="2021-07-30"
LABEL Description="Protobuf生成的Golang代码后，处理自定义Tag的Docker镜像"



# 复制文件
COPY docker /



RUN set -ex \
    \
    \
    \
    # 安装标签处理程序
    && go get github.com/favadi/protoc-go-inject-tag \
    \
    \
    \
    # 增加执行权限
    && chmod +x /usr/bin/drone



ENTRYPOINT /usr/bin/drone
