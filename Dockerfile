FROM gitlab/gitlab-runner

MAINTAINER Dave Steck

# install lftp & sudo
RUN apt-get update && apt-get install lftp sudo -y

# install node, npm, bower, grunt, gulp, less
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    apt-get install -y nodejs && \
    npm update npm -g && \
    npm i -g grunt-cli gulp bower less

# install sass
RUN sudo npm install -g sass
