FROM hexpm/elixir:1.14.5-erlang-25.3.2.12-alpine-3.18.6 AS build

RUN apk add --no-cache build-base git nodejs npm

WORKDIR /app

ENV MIX_ENV=prod

RUN mix local.hex --force && mix local.rebar --force

COPY mix.exs mix.lock ./
RUN mix deps.get --only prod
RUN mix deps.compile

COPY assets/package*.json assets/
RUN cd assets && npm ci

COPY config config
COPY priv priv
COPY lib lib
COPY assets assets

RUN mix assets.deploy
RUN mix compile
RUN mix release

FROM alpine:3.18.6

RUN apk add --no-cache libstdc++ openssl ncurses-libs

WORKDIR /app

COPY --from=build /app/_build/prod/rel/cv_app ./

CMD ["bin/cv_app", "start"]
