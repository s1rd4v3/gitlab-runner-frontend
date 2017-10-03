FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install node, npm, bower, grunt, gulp, less
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    npm update npm -g && \
    npm i -g grunt-cli gulp bower less

# install lftp
RUN apt-get install lftp

# install sass
RUN apt-get install software-properties-common -y && \
    apt-add-repository ppa:brightbox/ruby-ng -y && \
    apt-get update && \
    apt-get install -y ruby2.4 ruby2.4-dev make && \
    sudo su -c "gem install sass"


#ADD entrypoint /
#RUN chmod +x /entrypoint

#ENTRYPOINT ["/entrypoint"]
