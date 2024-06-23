FROM node:alpine as builder
WORKDIR /app
COPY package.json /app/
RUN npm install -g pnpm
RUN pnpm install
COPY . /app/
RUN pnpm run build

FROM nginx:latest
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html