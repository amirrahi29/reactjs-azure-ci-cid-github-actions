# Stage 1: CRA production build (sirf zaroori files — layer cache ke liye pehle package*.json)
FROM node:20-alpine AS build
WORKDIR /app

COPY package*.json ./
# React 19 + react-scripts: npm ci strict peer-deps par CI mein fail ho sakta hai
RUN npm install --legacy-peer-deps --no-audit --no-fund

COPY public ./public
COPY src ./src

ENV NODE_ENV=production
ENV GENERATE_SOURCEMAP=false
RUN npm run build

# Stage 2: nginx sirf static (image chhoti, attack surface kam)
FROM nginx:1.27-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
