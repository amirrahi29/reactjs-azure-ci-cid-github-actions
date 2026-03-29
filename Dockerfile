FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
# npm ci = fast + reproducible jab package-lock.json ho; warna npm install (branch par lock missing hone par CI fail na ho)
RUN if [ -f package-lock.json ]; then npm ci; else npm install; fi
COPY public ./public
COPY src ./src
RUN npm run build

FROM nginx:1.27-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
