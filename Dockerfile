# -------- Stage 1: Build --------
FROM maven:3.8.6-openjdk-11 AS builder  


# Set working directory
WORKDIR /app

# Copy all files to container
COPY . .

# Build the project
RUN mvn clean package -DskipTests

# -------- Stage 2: Run --------
FROM openjdk:11-jre-slim

# Set working directory
WORKDIR /app

# Copy the jar from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Start the app
ENTRYPOINT ["java", "-jar", "app.jar"]
