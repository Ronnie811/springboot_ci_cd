# Base image: Official Gradle image with JDK 17
FROM gradle:8.5.0-jdk17 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy build configuration files first to leverage Docker cache
COPY build.gradle settings.gradle gradle.properties* /app/
COPY gradle /app/gradle

# Download dependencies without running the full build
RUN gradle dependencies --no-daemon

# Copy the full source code
COPY . /app

# Build the project and generate the JAR file
RUN gradle build --no-daemon

# Optional: List generated files for debugging
RUN ls -l /app/build/libs

