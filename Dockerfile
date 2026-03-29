FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
# npm ci yahan aksar fail (peer deps / lock vs npm 10). CRA + React 19 ke liye install + legacy-peer-deps stable.
RUN npm install --legacy-peer-deps --no-audit --no-fund
COPY public ./public
COPY src ./src
RUN npm run build

FROM nginx:1.27-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
