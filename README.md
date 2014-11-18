(Docker) Container that runs Graphite 
=====================================

Use together with pseiffert/graphite-data ([github](https://github.com/seiffert/graphite-data-docker)/[hub](https://registry.hub.docker.com/u/pseiffert/graphite-data/)) and pseiffert/carbon ([github](https://github.com/seiffert/carbon-docker)/[hub](https://registry.hub.docker.com/u/pseiffert/carbon/))

1) Run the data volume container:

        docker run --name=graphite-data pseiffert/graphite-data

2) Run carbon

        docker run -d --name=carbon --volumes-from=graphite-data -p 2003:2003 pseiffert/carbon

3) Run graphite

        docker run -d --name=graphite --volumes-from=graphite-data -p 8080:80 pseiffert/graphite

4) Access `http://localhost:8080` in your web browser and login as admin (password: test)
5) Send metrics to carbon/graphite:

        echo "test.foo 42 $(date +%s)" | nc 127.0.0.1 2003
