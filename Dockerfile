ARG base=node:lts-bookworm
FROM ${base}
ARG base=node:lts-bookworm

WORKDIR  /opt/mongo-express
RUN git clone https://github.com/mongo-express/mongo-express.git . ; \
    yarn install; \
    yarn build;

RUN yarn workspaces focus --production

ENV ME_CONFIG_MONGODB_URL=mongodb://mongo:27017
ENV ME_CONFIG_MONGODB_ENABLE_ADMIN=true
ENV VCAP_APP_HOST=0.0.0.0

# refer readme on github page.
ENV ME_CONFIG_SITE_COOKIESECRET=cookiesecret
ENV ME_CONFIG_SITE_SESSIONSECRET=sessionsecret

EXPOSE 8081
CMD yarn start
