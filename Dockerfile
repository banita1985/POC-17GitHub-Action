# Use official Tomcat image as base
FROM tomcat:9.0

# Remove default apps from webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the webapps folder
COPY target/sample-webapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
