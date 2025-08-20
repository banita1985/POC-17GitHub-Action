# ===== Build Stage =====
FROM maven:3.8.6-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ===== Runtime Stage =====
FROM openjdk:17
COPY --from=builder target/*.jar /app/poc-17.jar

CMD ["java", "-jar", "/app/poc-17.jar"]


