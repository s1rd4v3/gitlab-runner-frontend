FROM ubuntu:14.04

MAINTAINER S1rd4v3

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y ca-certificates wget apt-transport-https vim nano

# install gitlab-ci-multi-runner
RUN echo "deb https://packages.gitlab.com/runner/gitlab-ci-multi-runner/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/runner_gitlab-ci-multi-runner.list && \
    wget -q -O - https://packages.gitlab.com/gpg.key | apt-key add - && \
    apt-get update -y && \
    apt-get install -y gitlab-ci-multi-runner

# install node, npm, bower, grunt and sass
RUN apt-get install -y nodejs && \
    ln -s /usr/bin/nodejs /usr/local/bin/node && \
    apt-get install -y npm && \
    apt-get install -y ruby && \
    sudo su -c "gem install sass" && \
    npm install -g grunt && \
    npm install -g bower

ADD entrypoint /
RUN chmod +x /entrypoint

VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
ENTRYPOINT ["/entrypoint"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]
