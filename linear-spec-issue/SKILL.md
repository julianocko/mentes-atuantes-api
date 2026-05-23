---
name: linear-spec-issue
description: Creates enterprise-grade Linear feature issues ready for Spec-Driven Development and AI implementation.
---

# Purpose

This skill transforms business requests, product ideas, technical demands, integration requirements, or technical use cases into standardized Linear feature issues.

The generated issue must be implementation-ready for:

- Codex CLI
- GitHub Spec Kit
- Spec-Driven Development workflow
- enterprise backend architecture
- AI-assisted implementation

This skill acts as the official issue authoring standard before creating specs, plans, tasks, or implementation scripts.

---

# Context

The project follows an AI-assisted enterprise backend development model based on:

```text
Specification → Clarification → Planning → Tasks → Implementation
```

The generated Linear issue must respect the following standards:

- Spec-Driven Development
- Codex CLI
- GitHub Spec Kit
- Clean Architecture
- Domain-Driven Design
- SOLID
- dedicated use case per business operation
- explicit contracts
- RFC 9457 error responses
- Keycloak OAuth2 Resource Server
- JWT with RS256 validation
- scope-based authorization
- tenant validation through `x-client-id`
- correlation through `x-transaction-id`
- PostgreSQL + Flyway
- Kafka when asynchronous processing is required
- Redis when distributed cache is required
- enterprise documentation tone

---

# Mandatory Behavior

The AI MUST:

- convert ambiguous requests into structured engineering requirements
- identify missing business rules
- expose ambiguities as open questions
- avoid architectural invention
- avoid implementation assumptions that were not provided
- prefer explicit contracts
- produce implementation-oriented requirements
- use enterprise/institutional writing
- generate objectively testable acceptance criteria
- preserve architectural boundaries
- include security, observability, testing, and error-handling expectations

The AI MUST NOT:

- generate vague tickets
- generate purely conversational descriptions
- invent business rules without marking them as assumptions
- assume external API behavior without evidence
- skip dependencies
- omit non-functional expectations
- propose generic service layers
- propose controller business logic
- propose repository access from controllers
- propose infrastructure access from controllers

---

# Required Output

Return ONLY the final Linear issue in Markdown.

Do not include explanations before or after the issue.
Do not include implementation code.
Do not include Spec Kit files unless explicitly requested.

---

# Linear Issue Structure

Every Linear issue MUST follow this exact structure.

```markdown
# [FEATURE] <short action-oriented title>

## Business Context

<Describe the business motivation, operational need, and product context.>

## Objective

<Describe exactly what must be delivered.>

## Functional Scope

### Required Behaviors

- <Behavior 1>
- <Behavior 2>
- <Behavior 3>

### Inputs

- <Input/header/body/query/path parameter>

### Outputs

- <Expected success output>
- <Expected error output>

### Validations

- <Validation rule>

### Integrations

- <External/internal integration, if applicable>

### Asynchronous Processing

- <Kafka/callback/event behavior, if applicable>

## Business Rules

- <Business rule 1>
- <Business rule 2>

## Acceptance Criteria

- [ ] <Objective and testable criterion>
- [ ] <Objective and testable criterion>
- [ ] <Objective and testable criterion>

## Technical Constraints

- Must follow Clean Architecture.
- Must follow DDD boundaries.
- Must use one dedicated application use case per business operation.
- Controllers must call application use cases only.
- Domain must not depend on Spring, JPA, REST, messaging, or infrastructure.
- Repositories must be accessed only through ports/adapters.
- Error responses must follow RFC 9457.
- Configuration values must come from environment variables.
- Flyway must be used for database schema changes.

## Security Requirements

- <Authentication requirement>
- <Authorization/scope requirement>
- <Tenant ownership validation through x-client-id, if applicable>
- <Correlation through x-transaction-id, if applicable>

## Non-Functional Requirements

- Structured logging must be implemented.
- Relevant events and errors must be observable.
- Automated tests must cover business rules and error scenarios.
- Integration failures must be handled explicitly.
- Sensitive information must not be logged.

## Dependencies

- <Dependency 1>
- <Dependency 2>

## Open Questions

- <Question 1>
- <Question 2>
```

---

# Title Rules

Title format:

```text
[FEATURE] <verb/action + business object + purpose>
```

Good examples:

```text
[FEATURE] Create PIX dynamic QR code generation endpoint
[FEATURE] Integrate FastFlow authentication token provider
[FEATURE] Implement payment link cancellation workflow
[FEATURE] Process vehicle debts supplier callback
```

Avoid:

```text
Create endpoint
New API
Payment stuff
FastFlow integration
```

---

# Business Context Rules

The Business Context must explain:

- why the feature exists
- which business capability it supports
- who or what depends on it
- whether it is internal, external, operational, or customer-facing

It must not describe implementation details unless they are essential to the business capability.

---

# Objective Rules

The Objective must answer:

```text
What must be delivered when this issue is complete?
```

It must be direct and measurable.

---

# Functional Scope Rules

The Functional Scope must explicitly describe:

- supported flows
- inputs
- outputs
- validations
- integration points
- persistence requirements
- asynchronous behavior, when applicable
- callback behavior, when applicable
- idempotency expectations, when applicable

If the feature is internal and must not expose a REST endpoint, state this explicitly.

---

# Business Rules Rules

Business rules must be explicit and deterministic.

Examples:

```text
- A payment can only be canceled when its status is REQUESTED or PROCESSING.
- The payment must belong to the client identified by x-client-id.
- The Kafka message key must be the referenceId.
- If mock=true is required, requests without mock=true must be rejected.
```

If a rule is not confirmed, write it under Open Questions instead of inventing it.

---

# Acceptance Criteria Rules

Acceptance criteria must be:

- objective
- testable
- implementation-independent
- written as checklist items

Good example:

```text
- [ ] Given an existing payment in REQUESTED status, when a valid cancellation request is received, then the payment status is updated according to the approved cancellation flow.
```

Bad example:

```text
- [ ] The system works correctly.
```

---

# Technical Constraints Rules

Always include architecture constraints that prevent invalid AI implementation, especially:

- no generic service layer
- no controller business logic
- no repository in controllers
- no integration client in controllers
- no JPA annotations in domain
- no hardcoded secrets or URLs
- no YAML hardcoded values
- no speculative abstractions

---

# Security Requirements Rules

When the feature exposes APIs, define:

- Authorization header requirement
- required scopes
- `x-client-id`
- `x-transaction-id`
- ownership validation
- behavior for 401 and 403

If scopes are unknown, include an Open Question.

---

# Error Handling Rules

Errors must follow RFC 9457.

Include relevant errors such as:

- validation error
- unauthorized
- forbidden
- not found
- conflict
- business rule violation
- external integration failure

If exact error codes are not known, include an Open Question.

---

# Non-Functional Requirements Rules

Include only requirements relevant to the feature.

Consider:

- structured logging
- traceability
- auditability
- metrics
- retries
- timeout
- idempotency
- resilience
- security
- performance
- automated tests

---

# Dependencies Rules

Dependencies may include:

- Linear issues
- Spec Kit specs
- internal use cases
- external APIs
- Kafka topics
- database migrations
- Keycloak scopes
- environment variables
- infrastructure resources

If no dependency is known, write:

```text
- No external dependency identified from the provided context.
```

---

# Open Questions Rules

Open Questions are mandatory when information is incomplete.

Examples:

```text
- What OAuth2 scope must authorize this operation?
- What is the expected timeout for the supplier API?
- Should this operation publish a Kafka event?
- Should the endpoint be public or internal only?
```

Do not omit Open Questions when ambiguity exists.

---

# Final Review Checklist

Before returning the issue, verify:

- the title is action-oriented
- business context is clear
- objective is measurable
- scope is explicit
- business rules are deterministic
- acceptance criteria are testable
- architecture constraints are present
- security expectations are present
- error handling is covered
- dependencies are listed
- ambiguities are documented as open questions
