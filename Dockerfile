FROM node:alpine as builder
WORKDIR '/react-app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /react-app/build /usr/share/nginx/html


