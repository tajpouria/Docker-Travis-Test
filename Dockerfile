FROM node:alpine as builder

WORKDIR /usr/react-app

COPY ./package.json .

RUN npm i

COPY . .

RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /usr/react-app/build /usr/share/nginx/html