FROM amazoncorretto:11-alpine-jdk // imagen de Java de la que partimos
MAINTAINER RAG // dueño de la imagen
COPY target/RAG-0.0.1-SNAPSHOT.jar rag-app.jar // copia el empaquetado a GitHub
ENTRYPOINT ["java","-jar","/rag-app.jar"]  // primera instrucción que se va a ejecutar
