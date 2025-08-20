# Stage 1 - Build
FROM maven:3.8.6-openjdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2 - Run
FROM openjdk:17
WORKDIR /app
COPY --from=builder /app/target/*.jar /app/poc-17.jar
CMD ["java", "-jar", "/app/poc-17.jar"]
