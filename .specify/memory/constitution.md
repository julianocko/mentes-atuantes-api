# Constitution

Version: 1.1.0  
Status: Active

This constitution defines the non-negotiable engineering principles for this repository.

All specifications, implementation plans, tasks, code generation, refactoring, reviews, and documentation MUST comply with these principles.

If any generated solution conflicts with this constitution, the constitution prevails.

---

# Article I — Architectural Integrity

## Principle

The system architecture MUST preserve separation of concerns, maintainability, scalability, and long-term evolvability.

## Rules

- Business rules MUST live in the domain layer.
- Domain logic MUST remain independent from frameworks.
- Infrastructure concerns MUST remain isolated.
- API/interface concerns MUST remain isolated.
- Application layer MUST orchestrate use cases, not contain business rules.
- Dependencies MUST point inward.
- Architectural shortcuts are prohibited.
- Each business operation MUST be implemented as an explicit dedicated use case.

## Mandatory Architectural Model

The repository MUST follow:

- Clean Architecture
- Domain-Driven Design (DDD)
- SOLID principles
- Feature-oriented modular design

## Prohibited

The following are prohibited:

- Business logic in controllers
- Business logic in repositories
- Domain depending on infrastructure
- Domain depending on frameworks
- Cross-layer leakage
- God services
- Anemic domain modeling
- Generic service orchestration layers
- Generic CRUD service abstractions

---

# Article II — Specification-Driven Development

## Principle

Implementation MUST be driven by explicit specifications.

Code generation without specification is prohibited.

## Rules

Every feature MUST follow:

1. Specification
2. Clarification
3. Planning
4. Task decomposition
5. Validation
6. Implementation

## Requirements

- No implementation before approved specification
- No speculative implementation
- No undocumented behavior
- No hidden business assumptions

---

# Article III — Security by Default

## Principle

Security is mandatory, not optional.

Every system component MUST assume hostile environments unless explicitly isolated.

## Rules

- Authentication MUST be enforced where required
- Authorization MUST be explicit
- Least privilege MUST be applied
- Trust boundaries MUST be respected
- Identity MUST be validated, never assumed
- Tenant boundaries MUST be explicitly validated when multi-tenant behavior exists

## Mandatory Security Practices

- OAuth2 Resource Server patterns
- JWT validation
- Signature validation
- Scope-based authorization
- Input validation
- Output sanitization
- Secure secrets handling

## Prohibited

- Hardcoded credentials
- Hardcoded secrets
- Security bypasses
- Implicit trust of client input
- Authorization in presentation logic
- Security enforcement through client assumptions

---

# Article IV — Explicit Contracts

## Principle

All system interactions MUST be explicit, stable, and contract-driven.

## Rules

- APIs MUST expose explicit contracts
- Integration payloads MUST be versionable
- Event payloads MUST be explicit
- Schema assumptions MUST be documented
- Backward compatibility MUST be considered
- Error contracts MUST be stable and explicitly documented

## API Standards

- RESTful design
- Consistent resource naming
- Predictable semantics
- Explicit validation responses
- Structured error responses

## Error Standards

Errors MUST follow RFC 9457 principles.

---

# Article V — Data Integrity

## Principle

Data integrity is mandatory.

Persistence MUST be explicit, controlled, and auditable.

## Rules

- Schema changes MUST occur through migrations only
- Data constraints MUST be explicit
- Referential integrity MUST be enforced
- Identifiers MUST be stable
- Persistence behavior MUST be deterministic
- Automatic schema mutation is prohibited in controlled environments

## Prohibited

- Runtime schema mutation
- Implicit schema generation in production
- Hidden persistence side effects
- Weak integrity assumptions

---

# Article VI — Configuration Discipline

## Principle

Configuration MUST be externalized and environment-driven.

## Rules

- Runtime configuration MUST be environment-controlled
- Secrets MUST NOT be stored in source code
- Environment parity MUST be preserved where possible
- Configuration MUST be deterministic

## Prohibited

- Hardcoded credentials
- Hardcoded endpoints
- Hardcoded environment-sensitive values
- Hidden configuration dependencies

---

# Article VII — Testability and Verification

## Principle

All software MUST be verifiable.

Untestable code is unacceptable.

## Rules

- Business logic MUST be testable
- New business behavior MUST include tests
- Defect fixes MUST include regression protection
- Integration behavior MUST be verifiable
- Security behavior MUST be verifiable

## Quality Gates

Implementation is incomplete if:

- Code does not compile
- Tests fail
- Behavior is unverifiable

---

# Article VIII — Event-Driven Reliability

## Principle

Asynchronous systems MUST be reliable, traceable, and resilient.

## Rules

When asynchronous communication exists:

- Contracts MUST be explicit
- Consumers MUST tolerate retries
- Processing MUST be idempotent
- Failure handling MUST be explicit
- Correlation MUST be preserved
- Retry behavior MUST be intentional

## Prohibited

- Fire-and-forget assumptions
- Non-idempotent consumers
- Silent failure handling
- Hidden retry loops

---

# Article IX — Observability

## Principle

System behavior MUST be observable.

Production diagnosis MUST NOT depend on guesswork.

## Rules

Systems MUST provide:

- Meaningful logging
- Traceability
- Correlation identifiers
- Error visibility
- Operational diagnostics

Correlation identifiers MUST be preserved across synchronous and asynchronous flows.

## Prohibited

- Silent failures
- Ambiguous errors
- Missing traceability
- Opaque asynchronous processing

---

# Article X — Documentation as Engineering Artifact

## Principle

Documentation is part of the product.

## Rules

Documentation MUST be maintained when relevant changes occur.

Required documentation includes:

- API contracts
- Authentication requirements
- Authorization requirements
- Business rules
- Integration contracts
- Error behavior
- Operational assumptions

## Prohibited

- Stale documentation
- Undocumented externally visible behavior
- Hidden contract assumptions

---

# Article XI — Code Quality and Maintainability

## Principle

Code MUST remain understandable, maintainable, and production-ready.

## Rules

Code MUST be:

- Cohesive
- Explicit
- Readable
- Predictable
- Maintainable
- Production-grade

## Prohibited

- Dead code
- Placeholder implementations
- Fake TODOs
- Hidden side effects
- Magic values
- Unclear abstractions
- Cleverness over clarity

---

# Article XII — Minimal Safe Change

## Principle

Changes MUST be minimal, intentional, and scoped.

## Rules

Agents and developers MUST:

- Change only what is necessary
- Preserve existing validated behavior
- Avoid unrelated refactors unless explicitly requested
- Minimize blast radius

## Prohibited

- Opportunistic refactors
- Broad speculative rewrites
- Unbounded code churn

---

# Article XIII — Decision Hierarchy

If instructions conflict, the following precedence applies:

1. Explicit user instruction
2. Constitution
3. Approved specification
4. Architecture documentation
5. Agent operational instructions
6. Existing implementation conventions

---

# Enforcement

Any implementation violating this constitution is considered non-compliant and incomplete.

Compliance is mandatory.