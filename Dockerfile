FROM node:18

ARG DATABASE_URL=postgresql://ensmail:ensmail@db:5432/ensmail
ARG ENV=dev
ENV DATABASE_URL ${DATABASE_URL}
ENV ENV ${ENV}

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
COPY db/ ./db/
RUN yarn install --frozen-lockfile

COPY . .
RUN if [ "$ENV" = "production" ]; then \
  yarn build; \
else \
  echo "Skip building for dev"; \
fi

EXPOSE 3000

CMD yarn blitz prisma migrate deploy && \
    bash ./start.sh

