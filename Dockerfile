# FROM ubuntu AS build
# WORKDIR /src

# Clone the latest source 
# RUN git  -c http.sslVerify=false clone https://github.com/marbellacovino/react-test.git
# Checkout the master branch --  no action needed as its default branch

# RUN npm install
# RUN npm run build

# stage: 2 — the production environment
FROM nginx:alpine
# COPY --from=build /src/app/default.conf /etc/nginx/conf.d
COPY build/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]