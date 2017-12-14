
# Build
```docker build -t oshifted_api .```

# Run

```
docker run -d \
  -p 8080:8080 \
  -p 9876:9876 \
  --env RAILS_ENV=development \
  --env SECRET_KEY_BASE=39442fb448c0059e9a7ef1bc39c8b9b8411cac2cb2a5a28ec6cfd071508335ee1dd88520b323ee06fa19c07c23510503ea203bfe8ce165200e7f72030bad8c6d \
  --env WEB_CONCURRENCY=0 \
  --name oshifted_api \
  oshifted_api
```


# Test

http://localhost:8080/echo?message=Hello!

# Debug
```docker exec -it oshifted_api bash -c "bundle exec byebug --remote localhost:9876"```

http://localhost:8080/debug
