# =========================================================
# AgroOrbit - Dockerfile DevOps + Cloud
# Aplicação Java Spring Boot com build multi-stage
# =========================================================

# Etapa 1: build do projeto com Maven
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /build

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests

# Etapa 2: imagem final de execução
FROM eclipse-temurin:17-jre

# Usuário não privilegiado - evita penalidade por executar como root
RUN groupadd -r agroorbit && useradd -r -g agroorbit -u 1001 agroorbituser

WORKDIR /app

COPY --from=build /build/target/*.jar app.jar

ENV SPRING_PROFILES_ACTIVE=docker
ENV SERVER_PORT=8080

EXPOSE 8080

USER agroorbituser

ENTRYPOINT ["java", "-jar", "app.jar"]
