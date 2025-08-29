# Stage 1 - Build the WAR
FROM maven:3.8.6-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2 - Deploy to Tomcat
FROM tomcat:9.0-jdk17
WORKDIR /usr/local/tomcat/webapps

# Remove default ROOT app (optional, if you want your app at "/")
RUN rm -rf ROOT

# Copy the WAR file from build stage
COPY --from=builder /app/target/*.war ./ROOT.war

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
