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
- Must not use generic service layers.
- Must not implement business logic in controllers.
- Must not access repositories from controllers.
- Must not access integrations from controllers.
- Must not add JPA annotations to domain classes.
- Must not hardcode secrets, URLs, credentials, ports, or infrastructure values.

## Security Requirements

- <Authentication requirement>
- <Authorization/scope requirement>
- <Tenant ownership validation through x-client-id, if applicable>
- <Correlation through x-transaction-id, if applicable>

## Error Handling

- Errors must follow RFC 9457.
- <Validation error behavior>
- <Unauthorized behavior>
- <Forbidden behavior>
- <Business rule violation behavior>
- <Integration failure behavior, if applicable>

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
