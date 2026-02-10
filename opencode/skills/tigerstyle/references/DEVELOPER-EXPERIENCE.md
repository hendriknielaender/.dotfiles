# TigerStyle — Developer Experience Reference

> "There are only two hard things in Computer Science: cache invalidation, naming things, and
> off-by-one errors." — Phil Karlton

## Naming Things

- **Get nouns and verbs just right.** Great names capture what a thing is or does and provide a
  crisp mental model. Take time to find the perfect name.
- Use `snake_case` for functions, variables, and file names.
- **Do not abbreviate** variable names (exception: primitive integers in sort/matrix functions).
- Use long-form flags in scripts: `--force`, not `-f`.
- Use proper capitalization for acronyms: `VSRState`, not `VsrState`.
- **Add units/qualifiers last**, sorted by descending significance:
  `latency_ms_max` not `max_latency_ms`. This groups related variables and aligns them.
- **Infuse names with meaning:** `gpa: Allocator` and `arena: Allocator` over
  `allocator: Allocator`.
- **Match character counts** for related names: `source`/`target` over `src`/`dest` so that
  `source_offset` and `target_offset` align in calculations.
- Prefix helper/callback names with the calling function: `read_sector()` →
  `read_sector_callback()`.
- Callbacks go last in parameter lists (mirrors control flow).
- **Order matters:** Important things near the top. `main` goes first.
  Struct order: fields → types → methods.
- Don't overload names with context-dependent meanings.
- Prefer nouns over adjectives for descriptors: `replica.pipeline` over `replica.preparing`.
- Use Zig's `options: struct` pattern when arguments can be mixed up. Two `u64` args → use
  options struct. If an argument can be `null`, name it so `null` is clear at the call site.

## Cache Invalidation

- Don't duplicate variables or alias them — prevents state getting out of sync.
- If a function argument shouldn't be copied and is > 16 bytes, pass as `*const`.
- Construct large structs **in-place** via out-pointer initialization:

```zig
// Preferred:
fn init(target: *LargeStruct) !void {
    target.* = .{
        // in-place initialization
    };
}

// Avoid:
fn init() !LargeStruct {
    return LargeStruct{
        // moving the initialized object
    };
}
```

- **Shrink scope** to minimize variables at play.
- **Calculate/check variables close to where they're used.** Don't introduce early or leave
  around late. Minimizes POCPOU (place-of-check to place-of-use) bugs.
- Use simpler return types to reduce dimensionality: `void` > `bool` > `u64` > `?u64` > `!u64`.
- Ensure functions run to completion without suspending (keeps precondition assertions valid).
- Guard against **buffer bleeds** (buffer underflow / padding not zeroed).
- Group resource allocation and deallocation with newlines: before the allocation and after the
  corresponding `defer`.

## Off-By-One Errors

- Distinguish `index` (0-based), `count` (1-based), and `size` (count × unit).
  - `index` → `count`: add one.
  - `count` → `size`: multiply by unit.
- Include units/qualifiers in variable names to make conversions explicit.
- Show division intent: use `@divExact()`, `@divFloor()`, or `div_ceil()`.

## Formatting

- Run `zig fmt`.
- **4 spaces** of indentation.
- Hard limit: **100 columns**, no exceptions. Nothing hidden by a horizontal scrollbar.
- Add braces to `if` unless the entire statement fits on a single line.
- To wrap long signatures/calls: add a trailing comma and let `zig fmt` handle it.

## Comments

- **Always say why.** Code alone is not documentation.
- **Always say how.** For tests, describe goal and methodology at the top.
- Comments are **sentences**: space after `//`, capital letter, full stop (or colon if
  introducing something). End-of-line comments can be phrases without punctuation.

## Commit Messages

- Write **descriptive commit messages** that inform and delight.
- PR descriptions are not stored in git and are invisible in `git blame` — they do not replace
  commit messages.

## Dependencies

- **Zero dependencies** apart from the Zig toolchain.
- Dependencies lead to supply chain attacks, safety/performance risk, and slow install times.

## Tooling

- Primary tool: **Zig**. Use it for scripts too (`scripts/*.zig` not `scripts/*.sh`).
- A small standardized toolbox beats an array of specialized instruments.

> "The right tool for the job is often the tool you are already using—adding new tools has a
> higher cost than many people appreciate" — John Carmack
