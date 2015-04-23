FROM nginx

MAINTAINER Travis Swicegood <travis@domain51.com>

ADD nginx.conf /etc/nginx/nginx.conf
ADD runner /bin/runner

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stdout /var/log/nginx/error.log

EXPOSE 80

CMD ["/bin/runner"]
