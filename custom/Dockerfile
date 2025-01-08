FROM timbru31/ruby-node:2.7 as builder

RUN apt-get update -qq && apt-get install -y wget && apt install -y git

RUN git clone https://github.com/openMF/community-app.git; cd community-app ;

WORKDIR /community-app

ADD fxlogo.png app/images/mifos-logo-flat.png
RUN node -v
RUN npm -v
RUN npm install -g grunt-cli
RUN npm install -g bower
RUN bower install
RUN npm install phantomjs-prebuilt@2.1.13 --ignore-scripts
RUN grunt prod --force

FROM nginx
COPY --from=builder /community-app/dist/community-app/ /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
