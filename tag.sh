#!/bin/sh

# 如果没有设置文件匹配模式，使用默认值
[ -z "${PLUGIN_PATTERN}" ] && PLUGIN_PATTERN='*.pb.go'

# 处理配置带环境变量的情况
PLUGIN_FOLDER=$(eval echo "${PLUGIN_FOLDER}")

# 遍历目录，处理标签
protoc-go-inject-tag -input="${PLUGIN_FOLDER}/${PLUGIN_PATTERN}"
