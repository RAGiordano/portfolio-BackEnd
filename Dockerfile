FROM amazoncorretto:11-alpine-jdk
MAINTAINER RAG
COPY target/RAG-0.0.1-SNAPSHOT.jar rag-app.jar
ENTRYPOINT ["java","-jar","/rag-app.jar"]
