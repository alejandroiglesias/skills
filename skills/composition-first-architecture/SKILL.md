---
name: composition-first-architecture
description: Design and implement software by composing mature existing pieces first, minimizing custom infrastructure, and concentrating proprietary code on the actual differentiating or missing capability.
---

# Composition-First Architecture

## Purpose

Use this skill whenever planning, designing, reviewing, refactoring, or implementing software architecture.

The default architectural bias is:

> **Composition First, Custom Last.**

> **Wire, don't build. Build only the missing piece.**

The objective is not to minimize code mechanically. The objective is to minimize **total system complexity, architectural surface area, cognitive load, and undifferentiated engineering** while preserving the required capability.

Custom code carries the burden of proof.

---

## Core decision order

Always evaluate solutions in this order:

1. **Reuse** — use a mature existing library, framework, service, protocol, platform primitive, or project capability.
2. **Compose** — combine existing pieces before introducing a new subsystem.
3. **Adapt** — bridge mismatches with a thin adapter or glue layer.
4. **Build** — implement a custom component only when the previous options cannot satisfy a real requirement.

Conceptually:

```text
REUSE
  ↓
COMPOSE
  ↓
ADAPT
  ↓
BUILD
```

Before proposing a custom subsystem, answer:

```text
Does a mature solution already exist?
        │
       yes → use it
        │
        no
        ▼
Can existing pieces be composed to solve it?
        │
       yes → compose them
        │
        no
        ▼
Would a thin adapter bridge the gap?
        │
       yes → write the adapter
        │
        no
        ▼
Build the missing capability
```

---

## Primary rule

**Every custom component must justify why an existing solution cannot be reused, composed, or adapted.**

Do not create a custom subsystem merely because it is easy to generate code for it.

AI makes implementation cheap. It does not make architecture, maintenance, debugging, comprehension, migration, and long-term ownership free.

---

## Architectural goal

Prefer architectures shaped like this:

```text
┌───────────────────────────────────────┐
│ Mature existing ecosystem             │
│                                       │
│ libraries • frameworks • services     │
│ protocols • infrastructure            │
└────────────────┬──────────────────────┘
                 │
            thin adapters
                 │
┌────────────────▼──────────────────────┐
│ THE NEW THING                         │
│                                       │
│ differentiating logic / missing piece │
└───────────────────────────────────────┘
```

Keep the proprietary layer thin unless the product's actual differentiator requires otherwise.

Concentrate engineering effort on the part of the system that creates unique value.

---

## Differentiated vs. undifferentiated engineering

Classify proposed work before implementing it.

Typical **undifferentiated engineering**:

- provider wrappers
- generic HTTP servers
- auth plumbing
- queues
- logging
- tracing
- generic persistence layers
- configuration frameworks
- retry infrastructure
- generic evaluation harnesses
- plugin systems
- registries
- factories
- deployment plumbing
- protocol implementations already available elsewhere

Typical **differentiated engineering**:

- product-specific algorithms
- novel workflows
- unique interaction models
- proprietary domain logic
- research hypotheses
- new coordination mechanisms
- capabilities users cannot already obtain from existing components
- the one missing piece that makes the composition valuable

Guiding rule:

> **Minimize undifferentiated engineering. Maximize engineering on the differentiator.**

---

## Architecture planning procedure

When asked to design architecture:

### 1. Identify the actual product/research thesis

State in one or two sentences:

- What capability is genuinely new?
- What hypothesis are we testing?
- What part would still matter if all infrastructure disappeared?

Do this before selecting technologies.

### 2. Decompose required capabilities

List the capabilities the system needs without assuming they require custom subsystems.

Example:

```text
Need:
- workflow execution
- model abstraction
- persistence
- evaluation
- API compatibility
- unique ranking algorithm
```

### 3. Inventory existing solutions

For each capability, inspect:

- capabilities already present in the codebase
- mature libraries
- frameworks
- managed services
- open protocols
- platform primitives

Prefer existing project dependencies when they already solve the problem adequately.

Do not recommend a new dependency without checking whether the codebase already contains an equivalent capability.

### 4. Produce a reuse matrix

For every capability classify it as:

```text
REUSE
COMPOSE
ADAPT
BUILD
```

For each `BUILD`, explicitly document:

- the requirement it satisfies
- existing options considered
- why those options are insufficient
- why a thin adapter is insufficient
- expected maintenance/cognitive cost
- why the component belongs in the project's differentiating layer

If this justification is weak, change `BUILD` to another category.

### 5. Design the smallest vertical slice

Prefer the architecture that can validate the core thesis with the fewest moving parts.

Ask:

> What is the smallest end-to-end system that proves or disproves the important assumption?

Do not implement infrastructure needed only by hypothetical future scale.

### 6. Add complexity only from evidence

Introduce custom infrastructure later only when one of these is observed:

- measured performance bottleneck
- real missing capability
- unacceptable operational risk
- dependency limitation
- unacceptable cost
- required control/security boundary
- recurring integration friction that a custom abstraction clearly removes

Never justify complexity solely with:

- "for scalability"
- "for flexibility"
- "for future providers"
- "in case we need..."
- "enterprise-ready"
- "best practice"

without a concrete current requirement.

---

## Implementation rules

While coding:

- Prefer direct use of a stable library API over wrapping it immediately.
- Do not create interfaces with one implementation unless there is a concrete boundary reason.
- Do not add factories without real runtime variability.
- Do not introduce registries when a plain object/map/function is sufficient.
- Do not create plugin architectures for hypothetical extensions.
- Avoid passthrough service layers.
- Avoid duplicated representations of the same concept.
- Prefer a thin translation adapter at external boundaries.
- Keep control flow visible.
- Keep the number of architectural layers low.
- Use the codebase's existing conventions before inventing new ones.
- Delete superseded abstractions rather than preserving both paths.
- Prefer boring, established infrastructure for non-differentiating concerns.
- Optimize for legibility, not apparent sophistication.

---

## Dependency nuance

Composition-first does **not** mean "add a dependency for everything."

A dependency is justified only when it lowers **total system complexity**.

Compare:

```text
custom implementation cost
vs.
dependency integration + conceptual overhead + lock-in + operational cost
```

A tiny local function can be simpler than importing a huge framework.

The real objective is:

> **Minimum total complexity for the required capability.**

---

## Architectural legibility checks

Before finalizing an architecture, verify:

- Can the main system be explained on one screen or one page?
- Can a developer trace the main data/control flow without jumping through many layers?
- Does every major component correspond to a real requirement?
- Is custom infrastructure tied directly to the product thesis?
- Could any layer be removed while preserving behavior?
- Is there duplicated responsibility?
- Are abstractions hiding rather than clarifying behavior?
- Would an existing mature component eliminate significant custom code?
- Is the codebase likely to remain understandable after several AI-generated iterations?

If the architecture needs a long explanation just to understand its plumbing, simplify it.

---

## Red flags

Stop and reconsider when you see:

- multiple custom infrastructure layers before the first useful vertical slice
- custom provider abstractions despite mature provider SDKs/gateways
- custom orchestration runtimes when an existing workflow engine fits
- custom eval frameworks before testing available eval platforms
- interfaces and factories built for hypothetical future variants
- multiple wrappers around third-party APIs
- services that merely forward calls
- duplicate caches or persistence layers
- internal protocols invented instead of using established ones
- abstractions added faster than requirements appear
- many files/modules created without proportional user-facing capability
- architecture that is difficult to draw simply
- phrases like "we may eventually need" appearing repeatedly in justification

---

## Required architecture review

Before implementing a non-trivial plan, output a short section named:

### Composition Review

Include:

1. **Differentiating piece** — what we actually need to invent.
2. **Reused pieces** — existing components used directly.
3. **Thin adapters** — glue code required at boundaries.
4. **Custom components** — each with explicit justification.
5. **Rejected complexity** — notable subsystems intentionally not built.
6. **Smallest vertical slice** — minimum version that validates the thesis.

Keep this concise.

---

## Refactoring mode

When reviewing an existing overengineered system, work backwards:

```text
CUSTOM
  ↓
Can it become an ADAPTER?
  ↓
Can it become COMPOSITION?
  ↓
Can it become direct REUSE?
```

Look especially for:

- one-implementation interfaces
- unnecessary adapters
- pass-through classes/services
- duplicated domain models
- redundant configuration
- custom wrappers around already-stable APIs
- custom frameworks used in only one place
- premature plugin systems
- indirection that provides no policy or transformation
- custom infrastructure whose original reason no longer exists

Prefer deleting architectural concepts over merely shortening their code.

---

## Working philosophy for coding agents

Do not mistake code production for progress.

The best solution is often the one where most capabilities come from mature components and the custom code clearly exposes the project's novel idea.

When uncertain, choose the architecture that is:

1. easier to explain
2. easier to delete
3. easier to replace
4. easier to inspect
5. smaller in conceptual surface
6. closer to the actual product hypothesis

A future requirement can earn additional architecture later.

---

## Final principle

> **Reuse until a measured limitation earns a custom implementation.**

> **Composition First, Custom Last.**

> **Wire, don't build. Build only the missing piece.**
