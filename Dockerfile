# Building app
FROM node:alpine as build

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

# Starting NGINX
FROM nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/dist /usr/share/nginx/html