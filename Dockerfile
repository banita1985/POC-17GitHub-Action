# ===== Build Stage =====
FROM maven:3.8.6-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ===== Runtime Stage =====
FROM tomcat:9-jre11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/poc-17.jar /app/poc-17.jar

CMD ["java", "-jar", "/app/poc-17.jar"]


