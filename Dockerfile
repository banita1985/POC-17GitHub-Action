FROM maven:3.8.6-openjdk-11 AS builder
WORKDIR /app

# Copy all files into the container
COPY . .

# Build the WAR file (skip tests to save time)
RUN mvn clean package -DskipTests

# === Runtime Stage ===
FROM openjdk:11-jre-slim
WORKDIR /app

# Copy the generated WAR file from builder
COPY --from=builder /app/target/*.war app.war

# Expose port 8080
EXPOSE 8080

# Run the WAR file using Java
CMD ["java", "-jar", "app.war"]
