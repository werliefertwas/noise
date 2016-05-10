FROM elixir

RUN rm -rf /app && mkdir /app
ADD . /app/
WORKDIR /app/

RUN apt-get update && apt-get install -y curl postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && apt-get install -y nodejs

RUN yes | mix deps.get --only prod
RUN npm install && node node_modules/brunch/bin/brunch build

ENV MIX_ENV=prod

EXPOSE 80
CMD ["sh", "/app/docker/run.sh"]
