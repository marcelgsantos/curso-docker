FROM debian:wheezy
RUN  apt-get update && \
     apt-get install -y nginx && \
     rm -rf /var/lib/apt/lists/*
RUN  ln -sf /dev/stdout /var/log/nginx/access.log
RUN  ln -sf /dev/stderr /var/log/nginx/error.log
RUN  echo "Hello world!" > /usr/share/nginx/html/index.html
VOLUME ["/var/cache/nginx"]
EXPOSE 80 443
CMD  ["nginx", "-g", "deamon off;"]