FROM gitlab/gitlab-runner

LABEL maintainer="Dave Steck"
LABEL description="Gitlab runner with Node, NPM, Bower, Grunt, Gulp, Less, Sass preinstalled"

# install lftp & sudo
RUN apt-get update && apt-get install lftp sudo -y


# Prepare node and npm installation
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
# Install nodejs
RUN sudo apt-get install -y nodejs
RUN ln -s nodejs node
RUN npm install npm@latest -g

# install bower, grunt, gulp, less
RUN npm i -g grunt-cli gulp bower less

# install sass
RUN sudo npm install -g sass
