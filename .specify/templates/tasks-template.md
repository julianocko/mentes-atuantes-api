---
description: "Enterprise task list template for backend feature implementation"
---

# Tasks: [FEATURE NAME]

**Input**: Design documents from `/specs/[###-feature-name]/`

**Prerequisites**:

- plan.md (required)
- spec.md (required)
- research.md (if applicable)
- data-model.md (if applicable)
- contracts/ (if applicable)

**Tests**: Tests are MANDATORY.

**Organization**:

Tasks MUST be grouped by user story.

Each user story MUST remain independently testable.

---

# Governance Context *(mandatory)*

Tasks MUST comply with:

- `AGENTS.md`
- `.specify/memory/constitution.md`
- `architecture.md`

---

# Format

```text
[ID] [P?] [Story] Description
```

Where:

- `[P]` = parallelizable
- `[Story]` = US1 / US2 / US3
- exact file paths required

---

# Path Conventions

Mandatory backend structure:

```text
src/main/java/com/company/project/[feature]/

domain/
application/
infrastructure/
interfaces/
```

Tests:

```text
src/test/java/com/company/project/
```

---

# Phase 1: Foundation

Purpose:

Shared foundational setup.

Examples:

- [ ] T001 Create feature package structure
- [ ] T002 Create base configuration
- [ ] T003 Configure validation framework
- [ ] T004 Configure exception handling
- [ ] T005 Configure observability baseline

Checkpoint:

Foundation ready.

---

# Phase 2: Architecture Foundation

Purpose:

Blocking architecture work.

Mandatory examples:

- [ ] T006 Create domain aggregate structure
- [ ] T007 [P] Create value objects
- [ ] T008 Create repository abstractions
- [ ] T009 [P] Create domain exceptions
- [ ] T010 Create application DTO contracts
- [ ] T011 Create validators

Checkpoint:

Architecture ready.

---

# Phase 3: Infrastructure Foundation

Purpose:

Technical implementation setup.

Examples:

- [ ] T012 Create persistence adapters
- [ ] T013 [P] Create Flyway migrations
- [ ] T014 Configure security integration
- [ ] T015 Configure authentication/authorization
- [ ] T016 Configure integration clients
- [ ] T017 Configure Kafka infrastructure
- [ ] T018 Configure Redis adapters (if needed)

Checkpoint:

Infrastructure ready.

---

# Phase 4: User Story 1 - [Title] (Priority P1)

Goal:

[Business goal]

Independent Test:

[Independent validation]

---

## Tests (MANDATORY)

Write tests first.

Examples:

- [ ] T019 [P] [US1] Create unit tests for domain behavior
- [ ] T020 [P] [US1] Create integration tests for persistence
- [ ] T021 [P] [US1] Create contract tests for API
- [ ] T022 [P] [US1] Create security tests

---

## Domain

Examples:

- [ ] T023 [US1] Create aggregate
- [ ] T024 [P] [US1] Create value objects
- [ ] T025 [US1] Create domain rules
- [ ] T026 [US1] Create domain events

---

## Application

Examples:

- [ ] T027 [US1] Create CreateXUseCase
- [ ] T028 [US1] Create application DTOs
- [ ] T029 [US1] Create commands/queries

---

## Infrastructure

Examples:

- [ ] T030 [US1] Create repository adapter
- [ ] T031 [US1] Create external integration adapter
- [ ] T032 [US1] Create Kafka producer/consumer
- [ ] T033 [US1] Create cache adapter

---

## Interfaces

Examples:

- [ ] T034 [US1] Create REST controller
- [ ] T035 [US1] Create request DTO
- [ ] T036 [US1] Create response DTO
- [ ] T037 [US1] Create validators
- [ ] T038 [US1] Create RFC 9457 error handling

---

## Observability

Examples:

- [ ] T039 [US1] Add structured logging
- [ ] T040 [US1] Add correlation support

Checkpoint:

US1 independently operational.

---

# Phase 5: User Story 2 - [Title] (Priority P2)

Same structure as User Story 1.

Mandatory:

- tests first
- domain
- application
- infrastructure
- interfaces
- observability

Checkpoint:

US2 independently operational.

---

# Phase 6: User Story 3 - [Title] (Priority P3)

Same structure.

Checkpoint:

US3 independently operational.

---

# Phase 7: Cross-Cutting

Examples:

- [ ] Documentation updates
- [ ] OpenAPI updates
- [ ] performance review
- [ ] security hardening
- [ ] observability review
- [ ] cleanup
- [ ] regression validation

---

# Mandatory Rules

Tasks MUST:

- reference exact files
- be architecture compliant
- be independently executable
- preserve user story isolation
- preserve incremental delivery

Tasks MUST NOT:

- create generic service layers
- create vague tasks
- mix business logic into controllers
- skip tests
- skip migrations when persistence changes
- skip security when protected features exist

---

# Approved Patterns

Preferred:

```text
CreatePaymentUseCase
CancelPaymentUseCase
FindPaymentUseCase
```

Forbidden:

```text
PaymentService
GenericCrudService
```

---

# Execution Order

Mandatory:

1. Foundation
2. Architecture
3. Infrastructure
4. Tests
5. User Story implementation
6. Cross-cutting validation

---

# Parallelization Rules

Allowed only when:

- different files
- no dependency conflict
- no shared mutation risk

---

# Implementation Readiness Checklist

Before implementation:

- [ ] tasks explicit
- [ ] architecture respected
- [ ] tests included
- [ ] security included
- [ ] persistence included
- [ ] contracts included
- [ ] observability included