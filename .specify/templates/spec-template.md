# Feature Specification: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`

**Created**: [DATE]

**Status**: Draft

**Input**: User description: "$ARGUMENTS"

---

# Governance Context *(mandatory)*

This specification MUST comply with:

- `AGENTS.md`
- `.specify/memory/constitution.md`
- `architecture.md`

If any requirement conflicts with these governance documents, clarification is required before proceeding.

---

# Feature Objective *(mandatory)*

Describe the business objective of this feature.

Include:

- business purpose
- target consumers
- expected business outcome
- affected domains/modules

---

# User Scenarios & Testing *(mandatory)*

User stories MUST be independently testable and prioritized.

---

## User Story 1 - [Brief Title] (Priority: P1)

[Describe this business journey]

**Why this priority**: [Business justification]

**Independent Test**: [How this can be validated independently]

**Acceptance Scenarios**:

1. **Given** [state], **When** [action], **Then** [expected result]
2. **Given** [state], **When** [action], **Then** [expected result]

---

## User Story 2 - [Brief Title] (Priority: P2)

[Describe scenario]

**Why this priority**: [Reason]

**Independent Test**: [Validation approach]

**Acceptance Scenarios**:

1. **Given** [state], **When** [action], **Then** [expected result]

---

## User Story 3 - [Brief Title] (Priority: P3)

[Describe scenario]

**Why this priority**: [Reason]

**Independent Test**: [Validation approach]

**Acceptance Scenarios**:

1. **Given** [state], **When** [action], **Then** [expected result]

---

# Business Rules *(mandatory)*

Explicit business rules.

Examples:

- **BR-001**: System MUST reject duplicate reference identifiers for the same tenant.
- **BR-002**: System MUST validate ownership using `x-client-id`.
- **BR-003**: Status transitions MUST follow the defined lifecycle.

---

# Edge Cases *(mandatory)*

Explicit boundary and failure scenarios.

Examples:

- Missing mandatory headers
- Invalid JWT
- Invalid authorization scope
- Duplicate resource creation
- External provider timeout
- Callback retry scenario
- Kafka redelivery
- Invalid status transition
- Missing required integration data

---

# Functional Requirements *(mandatory)*

Explicit feature capabilities.

Format:

- **FR-001**: System MUST [...]
- **FR-002**: System MUST [...]
- **FR-003**: System MUST [...]

Requirements MUST be:

- explicit
- measurable
- implementation-independent
- testable

---

# API Contract Requirements *(mandatory if API exists)*

Define:

## Endpoint

Example:

```text
POST /api/v1/payments
```

## Headers

Mandatory when applicable:

- Authorization
- x-client-id
- x-transaction-id

## Request Contract

Define:

- payload fields
- validation rules
- mandatory fields
- optional fields
- constraints

## Success Response Contract

Define:

- HTTP status
- payload structure
- business semantics

## Error Contract

Errors MUST follow RFC 9457 principles.

Define:

- validation errors
- authorization failures
- business conflicts
- not found scenarios
- integration failures

---

# Security Requirements *(mandatory)*

Define:

- authentication model
- authorization requirements
- required scopes
- tenant validation rules
- trust boundaries
- identity assumptions

Examples:

- OAuth2 bearer token required
- `payment.write` scope required
- `x-client-id` ownership validation required

---

# Integration Requirements *(mandatory if integrations exist)*

Define:

- external systems
- authentication model
- timeout expectations
- retry expectations
- callback behavior
- request/response contracts
- error handling assumptions

Examples:

- external provider API authentication
- callback delivery contract
- retry policy

---

# Event Requirements *(mandatory if async messaging exists)*

Define:

- topic names
- producer behavior
- consumer behavior
- message key
- payload contract
- retry handling
- dead-letter strategy
- idempotency expectations

Examples:

- publish event using `referenceId` as key
- consumer MUST be idempotent

---

# Data Requirements *(mandatory if persistence exists)*

Define:

- entities
- persistence expectations
- uniqueness rules
- retention expectations
- lifecycle expectations
- consistency rules

---

# Key Entities *(mandatory if feature involves data)*

Example:

## Payment

Represents a payment request lifecycle.

Key attributes:

- id
- referenceId
- status
- amount
- clientId

## PaymentDebt

Represents debt associations linked to a payment.

---

# Non-Functional Requirements *(mandatory)*

Define:

## Security

Examples:

- token validation
- authorization enforcement

## Performance

Examples:

- synchronous timeout expectations
- throughput expectations

## Reliability

Examples:

- retry handling
- resilience expectations

## Observability

Examples:

- structured logs
- correlation IDs
- tracing

## Auditability

Examples:

- status transition tracking
- operational diagnostics

---

# Success Criteria *(mandatory)*

Measurable outcomes only.

Examples:

- **SC-001**: Payment creation succeeds for valid authorized requests.
- **SC-002**: Invalid authorization is rejected consistently.
- **SC-003**: Duplicate requests are rejected deterministically.

Avoid implementation-specific success metrics.

---

# Assumptions *(mandatory)*

Explicit assumptions.

Examples:

- Existing authentication infrastructure is available
- Required Kafka topics exist
- External provider contract remains stable

---

# Out of Scope *(mandatory)*

Explicitly define exclusions.

Examples:

- UI implementation
- batch processing
- legacy migration
- unrelated refactors
- infrastructure provisioning

---

# Clarifications Needed *(if applicable)*

Explicit unresolved questions.

Format:

- **CL-001**: [question]
- **CL-002**: [question]

No implementation should proceed with unresolved critical clarifications.