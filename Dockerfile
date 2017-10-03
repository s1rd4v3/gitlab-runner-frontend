FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node, npm, bower, grunt, lftp, ruby and sass
RUN apt-get update && \
    apt-get install software-properties-common -y && \
    apt-add-repository ppa:brightbox/ruby-ng -y && \
    apt-get update && \
    apt-get install -y nodejs ruby2.4 ruby2.4-dev make lftp && \
    sudo su -c "gem install sass" && \
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    npm update npm -g && \
    npm install -g grunt-cli && \
    npm install -g bower


#ADD entrypoint /
#RUN chmod +x /entrypoint

#ENTRYPOINT ["/entrypoint"]
