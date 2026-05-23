# AGENTS.md

## Purpose

This file defines the mandatory operating instructions for AI coding agents working in this repository.

The agent MUST follow these instructions before analyzing, planning, generating, modifying, refactoring, or deleting code.

This repository follows a strict Spec-Driven Development workflow using GitHub Spec Kit and Codex CLI.

These instructions are mandatory.

---

# Agent Operating Principles

## Mandatory behavior

The agent MUST:

- Analyze existing project structure before making changes
- Respect all architectural boundaries
- Follow the Spec Kit workflow
- Read relevant documentation before implementation
- Prefer consistency over creativity
- Make minimal, safe, scoped changes
- Preserve existing behavior unless explicitly instructed otherwise
- Generate production-ready code
- Generate tests for all new business logic
- Validate changes before completion
- Implement each business operation as a dedicated explicit use case
- Validate tenant ownership when multi-tenant boundaries exist

The agent MUST NOT:

- Invent architecture
- Ignore existing conventions
- Refactor unrelated code
- Modify files outside the task scope
- Introduce breaking changes without explicit instruction
- Hardcode secrets, credentials, URLs, or environment values
- Skip tests
- Bypass validation rules
- Create temporary or placeholder implementations without explicit approval
- Create generic service orchestration layers
- Create generic CRUD service abstractions

---

# Mandatory Project Context Reading Order

Before implementing any feature, the agent MUST read:

1. `.specify/memory/constitution.md`
2. `architecture.md`
3. Current implementation plan (when available)
4. Relevant specification under `/specs`
5. Existing implementation related to the requested feature
6. Existing tests related to impacted components

Implementation MUST be based on these sources.

---

# Development Workflow (Spec Kit)

This project uses GitHub Spec Kit as the standard development workflow.

Recommended sequence:

## Feature creation

```bash
$speckit-specify
```

## Clarification

```bash
$speckit-clarify
```

## Planning

```bash
$speckit-plan
```

## Task generation

```bash
$speckit-tasks
```

## Analysis (when needed)

```bash
$speckit-analyze
```

## Validation checklist (when needed)

```bash
$speckit-checklist
```

## Implementation

```bash
$speckit-implement
```

Implementation MUST NOT begin without an approved specification.

---

# Architecture Rules

Mandatory architecture:

- Clean Architecture
- Domain-Driven Design (DDD)
- SOLID principles
- Feature-based modular organization

Mandatory layer separation:

```text
domain
application
infrastructure
interfaces
```

Rules:

- Controllers MUST NOT access repositories directly
- Controllers MUST NOT contain business logic
- Application layer orchestrates use cases
- Each business operation MUST be implemented as a dedicated use case
- Domain layer contains business rules
- Infrastructure contains adapters, integrations, persistence
- Interfaces contain REST/API adapters
- Security MUST remain outside domain logic

Dependencies MUST point inward.

Forbidden:

- Generic service layers
- Generic CRUD services
- Cross-layer shortcuts
- Business logic in technical adapters

---

# Java / Spring Boot Rules

Mandatory stack:

- Java 25
- Spring Boot 4.0.6
- Maven
- PostgreSQL
- Flyway
- Keycloak
- Kafka
- Redis (when explicitly required)

Rules:

- Prefer constructor injection
- Never use field injection
- Prefer immutable DTOs when applicable
- Use builders when appropriate
- Prefer explicit mappings
- Avoid anemic domain models
- Avoid God services
- Avoid utility classes for business logic

---

# API Standards

REST API rules:

- JSON only unless explicitly required otherwise
- Content negotiation supported
- HATEOAS when applicable
- OpenAPI documentation required
- Stable explicit contracts required

Error standard:

RFC 9457

Mandatory error structure:

- type
- title
- status
- detail
- instance
- requestId
- timestamp
- errors[] when validation applies

---

# Security Rules

Mandatory security:

- OAuth2 Resource Server
- JWT validation
- Keycloak integration
- Scope-based authorization
- RS256 token validation

Rules:

- Validate issuer
- Validate audience
- Validate token signature
- Validate required scopes
- Never trust client payload identity
- Validate tenant ownership when applicable
- Security logic MUST remain centralized

Headers when required:

- Authorization
- x-client-id
- x-transaction-id

---

# Database Rules

Mandatory database:

PostgreSQL only

Rules:

- Flyway required
- No schema auto-generation
- No Hibernate schema management in production
- All schema changes via migrations only

Migration conventions:

```text
V1.0.0__description.sql
```

Database conventions:

- UUID primary keys
- `uuid_generate_v4()` for identifiers
- schema-based organization
- explicit constraints
- explicit indexes
- timestamps with timezone

Flyway schema history:

```text
public
```

Credentials conventions (development):

```text
username=postgres
password=postgres
```

Database naming:

```text
<projectname>db
```

---

# Configuration Rules

Configuration principles:

- `.env` is mandatory
- YAML files MUST NOT contain hardcoded environment values
- YAML files MUST reference environment variables only

Required structure:

```text
application.yaml
application-dev.yaml
application-staging.yaml
application-prod.yaml
```

Development app port:

```text
9393
```

---

# Event-Driven Rules

When Kafka is used:

Rules:

- Events MUST be explicit contracts
- Payloads MUST be versionable
- Producers MUST be isolated
- Consumers MUST be idempotent
- Retry strategy MUST be defined
- Dead-letter handling MUST be explicit
- Correlation IDs MUST be preserved
- Failure handling MUST be observable

---

# Testing Rules

Mandatory testing:

- JUnit 5
- Mockito
- Jacoco
- Testcontainers when integration testing applies

Rules:

- All business logic MUST be tested
- New features MUST include tests
- Bug fixes MUST include regression tests
- Security rules MUST include security tests
- Integration flows MUST include integration tests

The agent MUST NOT deliver untested business logic.

---

# Documentation Rules

Documentation MUST be professional and institutional.

Required when applicable:

- OpenAPI updates
- API endpoint documentation
- Request examples
- Response examples
- Error examples
- Business rules
- Header requirements
- Authentication requirements
- Authorization requirements
- Integration assumptions

---

# Code Quality Rules

The agent MUST:

- Follow existing naming conventions
- Keep classes cohesive
- Keep methods focused
- Prefer readability over cleverness
- Remove dead code
- Avoid duplication
- Keep code production-ready
- Prefer explicit code over hidden abstractions

The agent MUST NOT:

- Leave TODOs unless explicitly requested
- Leave placeholder implementations
- Leave commented dead code
- Introduce magic numbers
- Introduce hidden side effects
- Introduce speculative abstractions

---

# Validation Before Completion

Before finalizing, the agent MUST:

1. Review impacted files
2. Review architectural compliance
3. Review constitution compliance
4. Review spec compliance
5. Run tests
6. Validate compilation
7. Validate migrations
8. Validate API contracts
9. Validate security implications
10. Validate observability impact

---

# Done Criteria

A task is complete only when:

- Specification is implemented
- Architecture rules are respected
- Constitution rules are respected
- Tests pass
- No unrelated files were modified
- No hardcoded secrets exist
- Documentation is updated when required
- Code is production-ready

---

# Decision Hierarchy

If instructions conflict, follow this order:

1. Explicit user instruction
2. `.specify/memory/constitution.md`
3. `architecture.md`
4. Approved feature specification
5. AGENTS.md
6. Existing implementation conventions

---

# Final Instruction

The agent MUST behave as a senior production software engineer working in a regulated production environment.

Speed is secondary.

Correctness, safety, architecture compliance, maintainability, and explicit contracts are mandatory.

<!-- SPECKIT START -->
For additional context about technologies, project structure,
execution details, and implementation expectations, read the current plan.
<!-- SPECKIT END -->