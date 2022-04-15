FROM node:lts-alpine as builder
WORKDIR /app
COPY package*.json pnpm-lock.yaml ./

RUN npm install -g pnpm && \
    pnpm install
COPY . .
RUN pnpm run build

FROM bitnami/nginx:1.21
# https://hub.docker.com/r/bitnami/nginx

COPY --from=builder /app/dist/ /app
COPY nginx/server-block.conf /opt/bitnami/nginx/conf/server_blocks/