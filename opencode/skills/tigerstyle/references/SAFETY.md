# TigerStyle — Safety Reference

> "The rules act like the seat-belt in your car: initially they are perhaps a little
> uncomfortable, but after a while their use becomes second-nature and not using them becomes
> unimaginable." — Gerard J. Holzmann

Based on [NASA's Power of Ten — Rules for Developing Safety Critical Code](https://spinroot.com/gerard/pdf/P10.pdf).

## Control Flow

- Use **only very simple, explicit control flow**.
- **Do not use recursion** — ensure all executions that should be bounded are bounded.
- Use **only a minimum of excellent abstractions**, and only if they make the best sense of the
  domain. Abstractions are never zero cost. Every abstraction risks being leaky.

## Limits on Everything

- All loops and all queues must have a **fixed upper bound**.
- This follows the "fail-fast" principle: violations are detected sooner rather than later.
- Where a loop cannot terminate (e.g. an event loop), this must be asserted.

## Explicitly-Sized Types

- Use `u32`, `u64`, etc. for everything.
- Avoid architecture-specific `usize`.

## Assertions

Assertions detect **programmer errors**. Unlike operating errors (which are expected and must be
handled), assertion failures are unexpected. The only correct way to handle corrupt code is to
crash. Assertions downgrade catastrophic correctness bugs into liveness bugs. Assertions are a
force multiplier for discovering bugs by fuzzing.

### Rules

- **Assert all function arguments and return values**, pre/postconditions and invariants.
- The assertion density must average a **minimum of two assertions per function**.
- **[Pair assertions](https://tigerbeetle.com/blog/2023-12-27-it-takes-two-to-contract):**
  For every property, find at least two different code paths to assert it. Example: assert
  validity before writing to disk AND after reading from disk.
- Use a blatantly true assertion instead of a comment where the condition is critical and
  surprising.
- **Split compound assertions:** prefer `assert(a); assert(b);` over `assert(a and b);`.
- Use single-line `if` to assert an implication: `if (a) assert(b)`.
- **Assert relationships of compile-time constants** as sanity checks and to enforce subtle
  invariants or type sizes.
- **Assert both positive space (what you expect) AND negative space (what you do not expect).**
  Bugs live at the boundary between valid and invalid.
- Assertions are a safety net, not a substitute for understanding. Build a mental model first,
  encode it as assertions, write code and comments to justify the model, and use VOPR as the
  final defense.

## Static Memory Allocation

- All memory must be **statically allocated at startup**.
- **No dynamic allocation (or free/realloc) after initialization.**
- This avoids unpredictable behavior, use-after-free, and as a second-order effect produces
  simpler, more performant designs.

## Scope Minimization

- Declare variables at the **smallest possible scope**.
- Minimize the number of variables in scope.

## Function Length

- Hard limit: **70 lines per function**.
- Rules of thumb for splitting:
  - Good shape is the inverse of an hourglass: few parameters, simple return, meaty logic.
  - Centralize control flow in the parent; move non-branchy logic to helpers.
  - Centralize state manipulation; keep leaf functions pure.

## Compiler Warnings

- Appreciate **all compiler warnings** at the strictest setting, from day one.

## External Events

- Don't react directly to external events. Run at your own pace.
- This improves safety (control flow stays under your control) and performance (batching).

## Compound Conditions

- Split compound conditions into simple conditions using nested `if/else`.
- Split `else if` chains into `else { if { } }` trees.
- Consider whether a single `if` also needs a matching `else`.

## Negations

State invariants positively:

```zig
// Preferred:
if (index < length) {
    // Invariant holds.
} else {
    // Invariant doesn't hold.
}

// Avoid:
if (index >= length) {
    // It's not true that the invariant holds.
}
```

## Error Handling

- **All errors must be handled.**
- 92% of catastrophic production failures result from incorrect handling of non-fatal errors
  explicitly signaled in software.

## Always Say Why

- Never forget to say why. Explain the rationale for every decision.
- This increases understanding, compliance, and shares evaluation criteria.

## Explicit Options

- Pass options explicitly at call sites instead of relying on defaults.
- Example: `@prefetch(a, .{ .cache = .data, .rw = .read, .locality = 3 });` over
  `@prefetch(a, .{});`.
