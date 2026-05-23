# Architecture Guide

Version: 1.1.0  
Status: Active

This document defines the mandatory technical architecture standards for this repository.

All implementation decisions MUST comply with this architecture.

If implementation choices conflict with this document, this architecture prevails unless superseded by an approved feature specification.

---

# 1. Architecture Governance

This repository is governed by the following documents:

1. `.specify/memory/constitution.md`
2. `architecture.md`
3. `AGENTS.md`
4. Approved feature specifications
5. Approved implementation plans

AI agents and developers MUST use these documents together.

Architecture decisions MUST remain consistent across all governance artifacts.

---

# 2. Project Overview

This repository follows an enterprise-grade backend architecture optimized for:

- maintainability
- scalability
- testability
- security
- explicit contracts
- distributed integrations
- event-driven communication
- observability
- long-term evolvability

The architecture is designed for:

- AI-assisted implementation
- Spec-Driven Development
- enterprise API development
- asynchronous integrations
- multi-tenant systems

---

# 3. Technology Stack

## Core Platform

Mandatory:

- Java 25
- Spring Boot 4.0.6
- Maven

---

## Persistence

Mandatory:

- PostgreSQL 17+
- Flyway

---

## Security

Mandatory:

- Keycloak
- OAuth2 Resource Server
- JWT authentication
- RS256 signature validation
- Scope-based authorization

---

## Messaging

When asynchronous communication exists:

- Apache Kafka

---

## Caching

When explicitly required:

- Redis

---

## Infrastructure

Supported:

- Docker
- Docker Compose
- Kubernetes
- Kong API Gateway

---

# 4. Architectural Style

Mandatory architecture:

- Clean Architecture
- Domain-Driven Design (DDD)
- SOLID
- Explicit contract-driven integrations
- Feature-oriented modular design

Core rule:

Dependencies MUST point inward.

Allowed dependency direction:

```text
interfaces -> application -> domain
infrastructure -> application -> domain
domain -> no framework dependencies
```

Forbidden:

```text
domain -> infrastructure
domain -> interfaces
controllers -> repositories
controllers -> integrations
interfaces -> infrastructure shortcuts
```

---

# 5. Module Organization

Project organization MUST be feature-first.

Example:

```text
src/main/java/com/company/project/

client/
payment/
pix/
report/
```

Each feature MUST contain:

```text
[feature]/
  domain/
  application/
  infrastructure/
  interfaces/
```

Never organize by technical layers only.

Forbidden:

```text
controllers/
services/
repositories/
entities/
dtos/
```

at repository root.

---

# 6. Layer Responsibilities

# Domain Layer

Purpose:

Core business model and business rules.

Allowed:

- entities
- aggregates
- value objects
- repository abstractions
- domain services
- domain events
- business invariants
- domain exceptions

Rules:

- domain MUST remain framework-independent
- domain MUST encapsulate business rules
- domain MUST expose explicit business behavior

Forbidden:

- Spring annotations
- JPA annotations
- REST concerns
- persistence logic
- infrastructure logic
- framework dependencies
- security implementation logic

Preferred:

```java
payment.markAsProcessing();
```

Forbidden:

```java
payment.setStatus(PROCESSING);
```

---

# Application Layer

Purpose:

Use case orchestration.

Allowed:

- use cases
- commands
- queries
- DTO contracts
- orchestration logic
- transaction boundaries

Rules:

- one business operation = one dedicated use case
- application layer orchestrates, never owns business rules
- dependencies MUST remain explicit

Preferred:

```text
CreatePaymentUseCase
CancelPaymentUseCase
FindPaymentByReferenceIdUseCase
ListPaymentsUseCase
```

Forbidden:

```text
PaymentService
ClientService
GenericCrudService
```

---

# Infrastructure Layer

Purpose:

Technical implementations.

Allowed:

- JPA repository adapters
- external API clients
- Kafka producers
- Kafka consumers
- Redis adapters
- persistence mappings
- framework configuration

Forbidden:

- business decision logic
- controller logic
- business orchestration

---

# Interfaces Layer

Purpose:

External adapters.

Allowed:

- REST controllers
- request DTOs
- response DTOs
- validators
- exception handlers
- OpenAPI documentation

Rules:

Controllers MUST call application use cases only.

Forbidden:

- business rules
- repository access
- integration access
- orchestration logic

---

# 7. Package Structure Standards

Recommended feature structure:

```text
[feature]/

domain/
  entity/
  valueobject/
  repository/
  service/
  event/
  exception/

application/
  usecase/
  dto/
  command/
  query/

infrastructure/
  persistence/
  integration/
  messaging/
  cache/
  config/

interfaces/
  rest/
  dto/
  validator/
  exception/
```

---

# 8. API Architecture

Mandatory:

- RESTful design
- versioned endpoints
- JSON payloads
- explicit contracts
- RFC 9457 error contracts
- OpenAPI documentation

Base pattern:

```text
/api/v1/
```

Example:

```text
/api/v1/payments
/api/v1/pix/qrcode/dynamic
/api/v1/clients
```

---

## Headers

When applicable:

Mandatory:

- Authorization
- x-client-id
- x-transaction-id

Rules:

- x-client-id enforces tenant ownership
- x-transaction-id provides correlation tracing

---

## Responses

Success responses MUST be:

- explicit
- stable
- documented
- predictable

Errors MUST:

- follow RFC 9457
- remain contract-stable
- be explicitly documented

Mandatory structure:

```json
{
  "type": "...",
  "title": "...",
  "status": 422,
  "detail": "...",
  "instance": "...",
  "requestId": "...",
  "timestamp": "...",
  "errors": []
}
```

---

# 9. Security Architecture

Mandatory:

- OAuth2 Resource Server
- Keycloak
- JWT authentication
- RS256 validation
- scope-based authorization

Rules:

- authentication before business execution
- authorization before protected actions
- explicit scope validation
- issuer validation
- audience validation
- signature validation
- tenant ownership validation when applicable

Preferred:

method-level authorization.

Example:

```java
@PreAuthorize("hasAuthority('SCOPE_payment.write')")
```

Never trust:

- client payload identity
- client authorization assumptions

---

# 10. Persistence Architecture

Mandatory:

- PostgreSQL
- Flyway

Rules:

Schema evolution MUST occur through migrations only.

Forbidden:

```yaml
spring.jpa.hibernate.ddl-auto=create
spring.jpa.hibernate.ddl-auto=update
spring.jpa.hibernate.ddl-auto=create-drop
```

---

## Naming

Database:

```text
<projectname>db
```

Development credentials:

```text
postgres / postgres
```

---

## Schema Strategy

Preferred:

feature/domain schema segregation.

Example:

```text
client.clients
payment.payments
payment.payment_debts
report.reports
```

---

## Identifiers

Mandatory:

UUID

Preferred:

```sql
uuid_generate_v4()
```

---

## Migration Naming

Mandatory:

```text
V1.0.0__description.sql
```

Flyway history schema:

```text
public
```

---

## Advanced Types

Allowed when explicitly justified:

- JSONB
- triggers
- custom indexes

---

# 11. Messaging Architecture

When asynchronous messaging exists:

Mandatory:

- explicit contracts
- versionable payloads
- idempotent consumers
- resilient retries
- explicit failure handling

Rules:

- producers MUST remain isolated
- consumers MUST remain isolated
- correlation IDs MUST be preserved
- retry strategies MUST be explicit
- dead-letter strategies MUST be explicit when retries exist

Preferred message keys:

```text
referenceId
```

Pattern:

```text
Producer -> Topic -> Consumer
```

---

# 12. Configuration Architecture

Mandatory:

environment-driven configuration.

Rules:

- `.env` required
- YAML MUST reference environment variables only
- secrets MUST NOT be hardcoded
- URLs MUST NOT be hardcoded
- configuration MUST remain deterministic

Allowed:

```yaml
server:
  port: ${SERVER_PORT}
```

Forbidden:

```yaml
server:
  port: 9393
```

Profiles:

```text
application.yaml
application-dev.yaml
application-staging.yaml
application-prod.yaml
```

Development standard:

```text
SERVER_PORT=9393
```

---

# 13. Mapping Standards

Preferred:

explicit mapping.

Allowed:

- manual mapping
- dedicated mapper classes

Examples:

```text
PaymentMapper
ClientMapper
PixMapper
```

Avoid:

reflection-heavy implicit mapping unless justified.

---

# 14. Testing Architecture

Mandatory:

- JUnit 5
- Mockito
- Jacoco

Optional when justified:

- Testcontainers
- contract tests
- integration tests

Rules:

Every business use case MUST be testable.

Mandatory test coverage:

- business rules
- integration behavior
- security rules
- tenant boundaries
- regression scenarios

---

# 15. Observability

Mandatory:

- structured logging
- correlation tracing
- exception visibility
- asynchronous traceability
- operational diagnostics

Correlation:

```text
x-transaction-id
```

MUST be preserved whenever applicable.

Forbidden:

- silent failures
- swallowed exceptions
- ambiguous logging

---

# 16. Documentation Standards

Documentation is mandatory for externally visible behavior.

Must document:

- endpoints
- request contracts
- response contracts
- headers
- authentication
- authorization
- business rules
- integration assumptions
- event contracts
- error contracts

Tone:

professional / enterprise.

---

# 17. Approved Implementation Patterns

Preferred:

- dedicated use case per business operation
- repository abstraction in domain
- repository implementation in infrastructure
- DTO separation by layer boundary
- explicit validators
- explicit exception handlers
- adapter-based integrations
- explicit domain behavior

---

# 18. Anti-Patterns

Forbidden:

- generic service layers
- generic CRUD services
- controller business logic
- repository access from controllers
- infrastructure logic in domain
- hardcoded configuration
- hidden framework coupling
- speculative abstractions
- fake reusable abstractions

---

# 19. AI Implementation Rules

AI-generated code MUST:

- respect governance documents
- preserve architecture boundaries
- generate production-ready implementations
- generate explicit code
- generate tests
- avoid speculative abstractions
- avoid hidden magic

AI MUST prefer consistency over invention.

---

# Final Rule

When uncertain:

Prefer explicit, maintainable, secure, architecture-compliant implementation over clever abstraction.