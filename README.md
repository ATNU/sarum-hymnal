*To build cantaloupe*

```
./services/cantaloupe/runBuild.sh
```

*Run dev stack*

```
docker-compose -f docker-compose-dev.yml up -d
```

*Bash into webapp container*
```
docker-compose -f docker-compose-dev.yml exec client bash
```

The source code is at `usr/local/app`
