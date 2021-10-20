FROM golang:alpine AS builder


# 标签修改程序版本
ENV TAG_VERSION 1.3.0


# 安装标签处理程序
RUN go get github.com/favadi/protoc-go-inject-tag@v${TAG_VERSION}



# 打包真正的镜像
FROM storezhang/alpine


MAINTAINER storezhang "storezhang@gmail.com"
LABEL architecture="AMD64/x86_64" version="latest" build="2021-10-20"
LABEL Description="修改Golang代码的Tag标签"


# 复制文件
COPY --from=builder /usr/local/go/protoc-go-inject-tag /usr/bin/protoc-go-inject-tag
COPY --from=builder /usr/local/go/bin/go /usr/bin/go
# 增加这一步是因为go命令在执行时，需要GOROOT目录，而正常的GOROOT目录是/usr/local/go
COPY --from=builder /usr/local/go/VERSION /usr/local/go/VERSION
COPY tag.sh /bin



RUN set -ex \
    \
    \
    \
    # 增加执行权限
    && chmod +x /bin/tag.sh \
    \
    \
    \
    && rm -rf /var/cache/apk/*



ENTRYPOINT /bin/tag.sh
