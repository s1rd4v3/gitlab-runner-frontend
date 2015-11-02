## gitlab-runner-frontend

This is a custom build of the original gitlab-runner Docker image from https://gitlab.com/gitlab-org/gitlab-ci-multi-runner. I've simply added some fronted tools i need to deploy my stuff.

Toolchain:
* [NodeJS](https://nodejs.org)
* [NPM](https://www.npmjs.com/)
* [Grunt](http://gruntjs.com/)
* [Bower](http://bower.io/)
* [Ruby](https://www.ruby-lang.org)
* [SASS](http://sass-lang.com/)
* [lftp](http://lftp.yar.ru/)

### .gitlab-ci.yml example

```yml
publish:
  stage: build
  script:
    - npm install
    - bower install
    - grunt
    - cd build
    - lftp -u $FTP_USER,$FTP_PASS -e 'mirror --only-newer --reverse --verbose ./ ./' $FTP_HOST
  only:
    - master
  tags:
    - sass
    - bower
    - npm
    - grunt
    - lftp
```

> In Gitlab-CI project settings, i'm creating secret project variables for FTP_USER, FTP_PASS and FTP_HOST.

> If you are defining tags like i did in my example, you need to set those tags on your runner via Gitlab-CI settings too. If not, your build status will stay pending!

### Add submodule support and fix lftp certificate validation error
You need to perform the following actions as gitlab-runner user ('sudo su gitlab-runner')
- create ssh keys  for submodules which are linked via ssh urls
- set .ssh folder permission to 700
- set id_rsa.pub file permission to 644
- set id_rsa permission to 600
- add the ssh key to your user account which has the permission to at least read your submodules
- create ~/.lftprc file with 'ssl:verify-certificate false' if certificate validation fails

### Usefull links
* [gitlab-runner config](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/configuration/advanced-configuration.md)
* [.gitlab-ci.yml](http://doc.gitlab.com/ci/yaml/README.html)
