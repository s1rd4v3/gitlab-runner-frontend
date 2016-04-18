FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node, npm, bower, grunt, lftp and sass
RUN apt-get update && \
    apt-get install -y nodejs && \
    ln -s /usr/bin/nodejs /usr/local/bin/node && \
    apt-get install -y npm ruby lftp && \
    sudo su -c "gem install sass" && \
    npm install -g grunt-cli && \
    npm install -g bower

#ADD entrypoint /
#RUN chmod +x /entrypoint

#ENTRYPOINT ["/entrypoint"]
