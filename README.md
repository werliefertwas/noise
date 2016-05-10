# noise

## demo
https://secure-spire-62884.herokuapp.com/

## setup

### DB:
```
createuser --superuser postgres
mix ecto.create
```

### init app
```
mix deps.get
npm install && node node_modules/brunch/bin/brunch build
```

### migration
```
mix ecto.migrate
```

### seeds
```
mix run priv/repo/seeds.exs
```

## start server
```
mix phoenix.server
```
