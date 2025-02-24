# Use OpenJDK 23 base image
FROM openjdk:23-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the JAR file from the Maven build (adjust path based on project structure)
COPY ./target/midtermproject-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 for the application
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
