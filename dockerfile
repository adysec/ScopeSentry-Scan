FROM debian:10-slim

WORKDIR /apps

# 更新软件包列表并安装必要的软件包
RUN apt-get update && apt-get install -y \
    libexif-dev \
    udev \
    chromium \
    vim \
    tzdata \
    && rm -rf /var/lib/apt/lists/*
# 拷贝当前目录下的可执行文件到容器中
COPY dist/linux_amd_x64/ScopeSentry /apps/ScopeSentry

# 设置时区为上海
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

# 设置编码
ENV LANG C.UTF-8

# 运行golang程序的命令
ENTRYPOINT ["/apps/ScopeSentry"]