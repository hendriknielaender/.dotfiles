# TigerStyle — Performance Reference

> "The lack of back-of-the-envelope performance sketches is the root of all evil."
> — Rivacindela Hudsoni

## Design-Time Performance

- Think about performance **from the outset, during design**.
- The huge 1000x wins come from the design phase — precisely when you can't measure or profile.
- Fixing a system after implementation yields smaller gains and is harder.
- Have mechanical sympathy. Like a carpenter, work with the grain.

## Back-of-the-Envelope Sketches

Perform sketches for the **four resources** and their **two characteristics**:

| Resource | Bandwidth | Latency |
|----------|-----------|---------|
| Network  | ?         | ?       |
| Disk     | ?         | ?       |
| Memory   | ?         | ?       |
| CPU      | ?         | ?       |

Sketches are cheap. Use them to land within 90% of the global maximum.

## Optimization Order

Optimize for the slowest resource first:

1. **Network** (slowest)
2. **Disk**
3. **Memory**
4. **CPU** (fastest)

Compensate for frequency: a memory cache miss happening many times may cost as much as a disk
fsync.

## Control Plane vs Data Plane

- Maintain a clear delineation between control plane and data plane.
- Use **batching** to enable high assertion safety without losing performance.

## Batching

- Amortize network, disk, memory, and CPU costs by **batching accesses**.
- Let the CPU be a sprinter: predictable, no zig-zagging, large enough work chunks.

## Be Explicit

- Minimize dependence on the compiler to do the right thing.
- **Extract hot loops** into standalone functions with primitive arguments (no `self`).
- This way the compiler doesn't need to prove it can cache struct fields in registers, and
  humans can spot redundant computations more easily.

Example:

```zig
// Preferred: standalone function with primitive args
fn compact_range(keys: [*]const u128, count: u32, target: [*]u128) void {
    // hot loop here
}

// Avoid: method on self in hot path
fn compactRange(self: *Compaction) void {
    // compiler must prove self.* fields are stable
}
```
