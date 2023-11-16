FROM node:18-alpine

ENV NODE_ENV=production
ARG NPM_BUILD="npm install --omit=dev"
EXPOSE 8080/tcp

LABEL maintainer="CSCB"
LABEL summary="CB"
LABEL description="CSCB CB"

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]
RUN $NPM_BUILD

COPY . .

ENTRYPOINT [ "node" ]
CMD ["src/index.js"]
