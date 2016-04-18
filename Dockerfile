FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node, npm, bower, grunt, lftp and sass
RUN apt-get update && \
    wget https://nodejs.org/dist/v4.4.3/node-v4.4.3-linux-x64.tar.gz && \
    tar xzf node-v4.4.3-linux-x64.tar.gz && \
    ln -s /usr/bin/nodejs /usr/local/bin/node && \
    sudo cp -rp node-v4.4.3-linux-x64 /usr/local/ && \
    sudo ln -s /usr/local/node-v4.4.3-linux-x64 /usr/local/node && \
    apt-get install -y npm ruby lftp && \
    sudo su -c "gem install sass" && \
    npm install -g grunt-cli && \
    npm install -g bower

#ADD entrypoint /
#RUN chmod +x /entrypoint

#ENTRYPOINT ["/entrypoint"]
