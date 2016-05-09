# Event API

## create event
```
curl -H "Content-Type: application/json" -X POST -d '{"event": {"label":"label 2","value":"1.22"}}' http://localhost:4000/api/events
```

response:
```
{"event":{"value":1.22,"timestamp":null,"label":"label 2","id":17}}
```

## show event
```
curl -H "Content-Type: application/json" http://localhost:4000/api/events/17
```

response:

```
{"event":{"value":1.22,"timestamp":null,"label":"label 2","id":17}}
```