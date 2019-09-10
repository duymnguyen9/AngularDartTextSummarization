# TextSummarization Template

A web app that uses [AngularDart](https://webdev.dartlang.org/angular) and
[AngularDart Components](https://webdev.dartlang.org/components).

A front end for simple text summarization using Angular Dart. 

### Deployment with Docker

Building the image.

```
docker build -t "text-summarization-app:dockerfile" .
```

Running the container from the previous image.

```
docker run -it -p 8082:8082 text-summarization-app:dockerfile
```

