FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY . /app
RUN ./mvnw clean package -DskipTests || ./mvnw.cmd clean package -DskipTests
CMD ["java", "-jar", "target/health-1.0.0.jar"]
