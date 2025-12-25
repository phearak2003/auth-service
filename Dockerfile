# ---------- BUILD STAGE ----------
FROM maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /app

# copy parent pom & modules
# COPY pom.xml .
# COPY common ./common
# COPY services/auth-service ./services/auth-service

COPY . .

# build only this service + deps
RUN mvn -pl services/auth-service -am clean package -DskipTests


# ---------- RUNTIME STAGE ----------
FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/services/auth-service/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
