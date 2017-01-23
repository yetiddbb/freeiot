FROM node:wheezy

ENV APP_HOME /app/
ENV TEMP_NPM /tmp

RUN mkdir $APP_HOME

# caching npm packages
WORKDIR $TEMP_NPM
COPY package.json $TEMP_NPM
RUN echo "Asia/Shanghai" > /etc/timezone
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install -g pm2
RUN npm install
RUN cp -a $TEMP_NPM/node_modules $APP_HOME

WORKDIR $APP_HOME

COPY ./ $APP_HOME

EXPOSE 80
