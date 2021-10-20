#!/bin/sh

# 取得参数
FILENAME=$1

# 输出日志
echo "处理文件：${FILENAME}"

# 处理标签
protoc-go-inject-tag -input="${FILENAME}"
