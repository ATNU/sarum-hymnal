FROM node:8 as builder

WORKDIR /usr/local/app

COPY ./services/client .

RUN npm install
RUN npm rebuild node-sass
RUN npm run build

FROM nginx
COPY --from=builder /usr/local/app/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/local/app/dist /usr/share/nginx/html