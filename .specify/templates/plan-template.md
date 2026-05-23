# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]`  
**Date**: [DATE]  
**Spec**: [link]

**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

---

# Governance Context *(mandatory)*

This implementation plan MUST comply with:

- `AGENTS.md`
- `.specify/memory/constitution.md`
- `architecture.md`

If conflicts exist, implementation planning MUST stop until resolved.

---

# Summary

Summarize:

- business objective
- architectural approach
- affected modules
- integrations
- persistence impact
- API impact
- event impact

---

# Technical Context *(mandatory)*

## Runtime Platform

**Language/Version**:

```text
Java 25
```

**Framework**:

```text
Spring Boot 3.x
```

**Build Tool**:

```text
Maven
```

---

## Persistence

Mandatory when applicable:

```text
PostgreSQL 17+
Flyway
```

Document:

- affected schemas
- migration needs
- data consistency implications

---

## Security

Mandatory when applicable:

```text
Keycloak
OAuth2 Resource Server
JWT RS256
Scope-based authorization
```

Document:

- required scopes
- tenant validation
- header requirements

---

## Messaging

When applicable:

```text
Kafka
```

Document:

- producer changes
- consumer changes
- topics
- retry behavior
- DLT strategy
- idempotency expectations

---

## Caching

When applicable:

```text
Redis
```

---

## Testing

Mandatory:

```text
JUnit 5
Mockito
Jacoco
```

Optional:

```text
Testcontainers
Contract Tests
Integration Tests
```

---

# Constitution Check *(mandatory gate)*

Implementation planning MUST validate:

## Architecture

- [ ] Clean Architecture preserved
- [ ] DDD boundaries respected
- [ ] Dependencies point inward
- [ ] No controller business logic
- [ ] No repository access from controllers
- [ ] One use case per operation

---

## Security

- [ ] Authentication defined
- [ ] Authorization defined
- [ ] Scope validation defined
- [ ] Tenant validation defined
- [ ] Trust boundaries explicit

---

## Contracts

- [ ] API contracts explicit
- [ ] Integration contracts explicit
- [ ] Event contracts explicit
- [ ] Error contracts defined

---

## Persistence

- [ ] Migration strategy defined
- [ ] Schema impact defined
- [ ] Integrity constraints explicit

---

## Testing

- [ ] Unit test strategy defined
- [ ] Integration test strategy defined
- [ ] Regression strategy defined

---

## Observability

- [ ] Logging defined
- [ ] Correlation defined
- [ ] Failure visibility defined

---

# Project Structure *(mandatory)*

## Feature Documentation

```text
specs/[###-feature]/
├── spec.md
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── contracts/
└── tasks.md
```

---

## Source Code Layout

Mandatory architecture:

```text
src/main/java/com/company/project/

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

## Tests

```text
src/test/java/com/company/project/

unit/
integration/
contract/
```

---

# Architectural Design *(mandatory)*

Describe:

- impacted modules
- new modules
- new use cases
- dependency boundaries

Mandatory pattern:

One use case per business operation.

Example:

```text
CreatePaymentUseCase
CancelPaymentUseCase
FindPaymentUseCase
ListPaymentsUseCase
```

Forbidden:

```text
PaymentService
GenericCrudService
```

---

# API Design *(mandatory if API exists)*

Define:

- endpoints
- methods
- headers
- authentication
- authorization
- request contracts
- response contracts
- RFC 9457 errors

---

# Persistence Design *(mandatory if data exists)*

Define:

- entities
- schemas
- migrations
- indexes
- constraints
- lifecycle rules

---

# Integration Design *(mandatory if integrations exist)*

Define:

- external APIs
- auth model
- retries
- timeout
- callback behavior
- contract assumptions

---

# Event Design *(mandatory if async exists)*

Define:

- topics
- producer responsibilities
- consumer responsibilities
- payload contract
- key strategy
- retry strategy
- dead-letter strategy

---

# Testing Strategy *(mandatory)*

Define:

## Unit Tests

Business logic coverage.

## Integration Tests

Persistence/integration verification.

## Contract Tests

External contract validation.

## Regression Tests

Bug prevention.

---

# Observability Strategy *(mandatory)*

Define:

- structured logging
- correlation IDs
- async traceability
- operational visibility
- failure diagnostics

---

# Complexity Tracking

Fill ONLY if architectural exceptions are required.

| Exception | Justification | Alternative Rejected |
|---------|---------------|---------------------|

---

# Implementation Readiness

Implementation can proceed ONLY if:

- Constitution checks pass
- Architecture is compliant
- Contracts are explicit
- Testing strategy exists
- Security model is defined