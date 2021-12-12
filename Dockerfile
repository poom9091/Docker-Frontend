FROM node:14-alpine3.12 as builder
WORKDIR /app
COPY package.json .
RUN yarn
COPY . . 
RUN yarn build

FROM nginx:1.21.4-alpine 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
