# 클라이언트 관리 애플리케이션
JWT 인증, 주문 처리, 결제 연동, 실시간 재고 관리를 포함한 종합적인 Spring Boot 애플리케이션.

## 주요 기능

### 핵심 기능
- 회원 관리: 회원가입, 인증, 탈퇴/재활성화
- 상품 카탈로그: 실시간 재고 추적이 포함된 재고 관리
- 주문 처리: 결제 연동이 포함된 주문 전체 라이프사이클
- 결제 게이트웨이: 현실적인 실패 시나리오가 포함된 모의 결제 서비스
- 보안: JWT 기반 인증과 역할 기반 접근 제어
- API 문서화: 인터랙티브 Swagger/OpenAPI 문서 제공

### 주요 기술
- Idempotency: 주요 작업의 중복 요청 방지
- 분산 락: 재고 관리 시 동시 접근 보호
- 서킷 브레이커: 자동 장애 조치를 통한 결제 게이트웨이 복원력 확보
- 재시도 메커니즘: 일시적 오류에 대한 지수 백오프
- Rate Limiting: API 남용 방지


## 구조
```
src/main/resources/
├── application.yml              # Base configuration
├── application-dev.yml          # Development settings
├── application-test.yml         # Test environment
├── application-staging.yml      # Staging environment
├── application-prod.yml         # Production settings
├── messages/
│   ├── messages_en.properties   # English messages
│   └── messages_ko.properties   # Korean messages
└── db/
    ├── migration/
    │   ├── V1__Create_tables.sql
    │   ├── V2__Add_indexes.sql
    │   └── V3__Insert_sample_data.sql
    └── testdata/
        └── sample_data.sql
```

### 3. Build and Run

```bash
# Build the application
./gradlew clean build

# Run with development profile
./gradlew bootRun --args='--spring.profiles.active=dev'

# Or run the JAR directly
java -jar build/libs/client-management-app-1.0.0.jar --spring.profiles.active=dev
```

### 4. Verify Installation

```bash
# Check application health
curl http://localhost:8080/api/health

# Access Swagger UI
open http://localhost:8080/swagger-ui.html

# Access H2 Console (dev profile only)
open http://localhost:8080/h2-console
```

## 📚 API 문서

### Interactive Documentation
- **Swagger UI**: http://localhost:8080/swagger-ui.html
- **OpenAPI JSON**: http://localhost:8080/v3/api-docs
