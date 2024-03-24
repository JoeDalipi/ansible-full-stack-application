FROM gitea/gitea
RUN apk add sudo
RUN chmod 777 /home
COPY entrypoint /usr/bin/custom_entrypoint
COPY gitea-cli.sh /usr/bin/gitea-cli.sh
ENTRYPOINT [ "/usr/bin/custom_entrypoint" ]