# 멀티 스테이지 빌드 - 빌드 단계
FROM gradle:8.5-jdk17 AS builder

WORKDIR /app

# 전체 프로젝트 복사
COPY . .

# gradle 명령어로 직접 빌드 (wrapper 불필요)
RUN gradle clean build -x test --no-daemon

# 실행 단계
FROM openjdk:17-jdk-slim

WORKDIR /app

# 빌드된 JAR 파일 복사
COPY --from=builder /app/build/libs/*.jar app.jar

# 포트 노출
EXPOSE 8080

# 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "app.jar"]