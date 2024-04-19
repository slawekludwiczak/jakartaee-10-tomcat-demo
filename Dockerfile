FROM maven:3.9.6-eclipse-temurin-17 AS build
LABEL maintainer="https://github.com/slawekludwiczak"
ENV HOME=/usr/app
ADD . $HOME
WORKDIR $HOME
RUN --mount=type=cache,target=/root/.m2 mvn clean package
RUN mvn clean package

FROM tomcat:10.1.20-jdk17-temurin-jammy
ARG WAR_FILE=/usr/app/target/*.war
COPY --from=build $WAR_FILE /usr/local/tomcat/webapps/ROOT.war