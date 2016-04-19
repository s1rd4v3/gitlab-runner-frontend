FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node, npm, bower, grunt, lftp and sass
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
    apt-get install -y nodejs ruby lftp libfontconfig && \
    sudo su -c "gem install sass" && \
    npm update npm -g && \
    npm install -g grunt-cli && \
    npm install -g bower


#ADD entrypoint /
#RUN chmod +x /entrypoint

#ENTRYPOINT ["/entrypoint"]
