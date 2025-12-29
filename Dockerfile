FROM node:20-alpine AS builder
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build


FROM httpd:2.4-alpine
COPY --from=builder ./dist/ /usr/local/apache2/htdocs/
EXPOSE 80



