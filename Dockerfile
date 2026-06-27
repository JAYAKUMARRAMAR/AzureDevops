# FROM maven:3.8.2-jdk-8-slim AS build
# WORKDIR /home/app
# COPY . /home/app
# RUN mvn -f /home/app/pom.xml clean package

# Multi-stage Dockerfile for building and running the Spring Boot app (Java 21)
FROM maven:3.9.4-eclipse-temurin-21 AS build
WORKDIR /workspace
# Copy only necessary files first for better cache usage
COPY pom.xml ./
COPY src ./src
# Build the application (skip tests for faster builds; remove -DskipTests to run tests)
RUN mvn -B -DskipTests package


FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
EXPOSE 8080
COPY --from=build /workspace/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]