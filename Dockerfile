FROM jekyll/jekyll:latest

RUN gem sources --remove https://rubygems.org/
RUN gem sources -a https://ruby.taobao.org/

WORKDIR /srv/jekyll
VOLUME  /srv/jekyll
EXPOSE 35729 4000
CMD [ \
  "/usr/local/bin/jekyll", \
  "--help" \
]

# 创建 images：docker build -t zengleipro/jekyll:17.07.03 .
# docker run --rm -d -v ~/Dropbox/Develop/Docker/jekyll/zenglei.net:/srv/jekyll -p 4000:4000 zengleipro/jekyll:17.07.03 jekyll serve
# docker run --rm -d -v ~/Dropbox/Develop/Docker/jekyll/zenglei.net:/srv/jekyll zengleipro/jekyll:17.07.03 jekyll build --watch