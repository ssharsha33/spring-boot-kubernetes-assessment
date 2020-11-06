FROM maven:3.6.3-openjdk-8-slim
RUN apt update -y && apt install -y git
RUN git clone https://github.com/ssharsha33/spring-boot-kubernetes-assessment.git
CMD ["sh","-c","cd spring-boot-kubernetes-assessment/spring-boot-prometheus && mvn clean install && java -jar target/spring-boot-prometheus-0.0.1-SNAPSHOT.jar"]
