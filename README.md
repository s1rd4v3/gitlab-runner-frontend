## gitlab-runner-frontend

This is a custom build of the original gitlab-runner Docker image from https://github.com/ayufan/gitlab-ci-multi-runner. I've just added some fronted tools i need to deploy my stuff.

Toolchain:
* [NodeJS](https://nodejs.org)
* [NPM](https://www.npmjs.com/)
* [Grunt](http://gruntjs.com/)
* [Bower](http://bower.io/)
* [Ruby](https://www.ruby-lang.org)
* [SASS](http://sass-lang.com/)
* [lftp](http://lftp.yar.ru/)

### Usage
Register this gitlab-runner on your Gitlab CI
```bash
gitlab-ci-multi-runner register
```
Follow this process until the end and you're already done and ready to build!

#### All commands
All commands can be printed out by typing:

```bash
gitlab-ci-multi-runner help
```

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

> In Gitlab-CI project settings, i'm creating secret project vars for FTP_USER, FTP_PASS and FTP_HOST.

> If you are defining tags like i did in my example, you need to set those tags on your runner via Gitlab-CI settings too. If not, your build status will stay pending!

### ToDo
* Decrease the size of the image to a minimum
