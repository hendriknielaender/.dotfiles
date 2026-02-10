---
name: tigerstyle
description: >
  Enforces TigerBeetle's coding style and design philosophy when writing or reviewing code.
  Use when the user asks to write code in TigerStyle, review code against TigerStyle guidelines,
  or requests high-safety, high-performance systems-level code following TigerBeetle conventions.
  Covers safety (assertions, static allocation, control flow), performance (batching, resource
  sketches, mechanical sympathy), and developer experience (naming, comments, formatting).
license: Apache-2.0
metadata:
  author: tigerbeetle
  version: "1.0"
  source: "https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md"
---

# TigerStyle Coding Skill

Apply TigerBeetle's coding style: a discipline where **safety, performance, and developer
experience** — in that order — drive every decision.

## Core Principles

1. **Simplicity is the hardest revision.** Find the "super idea" that solves safety, performance,
   and DX simultaneously. Spend mental energy upfront in design — an hour of design is worth
   weeks in production.

2. **Zero technical debt.** Do it right the first time. Never let potential memcpy latency spikes
   or exponential-complexity algorithms slip through. What we ship is solid.

3. **Design goals in priority order:** Safety → Performance → Developer Experience. All three
   matter; good style advances all three.

## Quick Reference: The Rules

### Safety (see [references/SAFETY.md](references/SAFETY.md) for full details)

- Use only very simple, explicit control flow. No recursion.
- Put a limit on everything — all loops, all queues must have a fixed upper bound.
- Use explicitly-sized types (`u32`), not architecture-specific (`usize`).
- Assert all function arguments, return values, pre/postconditions, and invariants.
  - Minimum two assertions per function.
  - Pair assertions: enforce properties from at least two different code paths.
  - Split compound assertions: `assert(a); assert(b);` over `assert(a and b);`.
  - Assert both positive and negative space.
- All memory must be statically allocated at startup. No dynamic allocation after init.
- Declare variables at the smallest possible scope.
- Hard limit of **70 lines per function**.
- Handle all errors. Handle all compiler warnings at strictest setting.
- Split compound conditions into simple nested `if/else` branches.
- State invariants positively.
- Don't react directly to external events — run at your own pace, batch instead.

### Performance (see [references/PERFORMANCE.md](references/PERFORMANCE.md) for full details)

- Think about performance from the outset, during design — the 1000x wins live here.
- Do back-of-the-envelope sketches for network, disk, memory, CPU (bandwidth + latency).
- Optimize for the slowest resource first (network → disk → memory → CPU), weighted by frequency.
- Separate control plane from data plane. Batch accesses.
- Be explicit. Don't depend on the compiler to do the right thing.
- Extract hot loops into standalone functions with primitive arguments (no `self`).

### Developer Experience (see [references/DEVELOPER-EXPERIENCE.md](references/DEVELOPER-EXPERIENCE.md) for full details)

- **Naming:** Get nouns and verbs just right. Use `snake_case`. No abbreviations.
  Put units/qualifiers last, sorted by descending significance (`latency_ms_max`).
- **Comments:** Always say *why*. Comments are sentences — capital letter, full stop.
- **Formatting:** `zig fmt`. 4-space indent. Hard limit 100 columns. Braces on `if` unless
  single-line.
- **Commit messages:** Descriptive, informative, delightful. PR descriptions don't replace them.
- **Dependencies:** Zero dependencies policy (apart from Zig toolchain).
- **Tooling:** Use Zig for scripts (`scripts/*.zig` not `scripts/*.sh`).
- Pass options explicitly at call sites — never rely on library defaults.
- Order matters: important things near the top. `main` goes first. Fields → types → methods.

## When Reviewing Code

Check the following in order:

1. **Safety:** Are all assertions present? Are limits on loops/queues? Is memory static? Are
   errors handled? Is control flow simple and explicit?
2. **Performance:** Is the design sketch sound? Are accesses batched? Are hot paths clean?
3. **DX:** Are names precise? Are comments explaining *why*? Is formatting correct? Are
   functions ≤ 70 lines?

## When Writing Code

1. Design first — sketch resource usage on the back of an envelope.
2. Write assertions before writing logic.
3. Keep functions short (≤ 70 lines), scopes narrow, control flow flat.
4. Name everything with care. Add units. Align related names by character count.
5. Comment the *why*, not just the *what*.
6. Run `zig fmt`. Respect the 100-column hard limit.
