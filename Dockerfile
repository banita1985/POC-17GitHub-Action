# === Builder Stage ===
FROM maven:3.8.6-openjdk-11 AS builder
WORKDIR /app

# Copy all files into the container
COPY . .

# Build the WAR file (skip tests to save time)
RUN mvn clean package -DskipTests

# === Runtime Stage ===
FROM tomcat:9-jdk11
WORKDIR /usr/local/tomcat/webapps/

# Remove default webapps (optional but clean)
RUN rm -rf ROOT*

# Copy the WAR from builder and rename as ROOT.war so it's auto-deployed
COPY --from=builder /app/target/*.war ROOT.war

# Expose Tomcat's default port
EXPOSE 8080

# Tomcat's CMD already starts the server, no need to override
