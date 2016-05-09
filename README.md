# noise

# setup

DB:
```
createuser --superuser postgres
mix ecto.create
```
# init app

```
mix deps.get
npm install && node node_modules/brunch/bin/brunch build
```

# start server
```
mix phoenix.server
```
