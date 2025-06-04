+++
title = "The Principles of Good Code"
date = 2025-06-03

[taxonomies]
tags = ["coding"]
+++

# The Principles of Good Code

> "Any fool can write code that a computer can understand. Good programmers write code that humans can understand."
>
> - Martin Fowler

After more than a decade in software, I've seen engineers either rely on getting "better" through repetition or cling tightly to a handful of design ideals. But writing excellent software isn’t just about mastery - it's about mindset. The best code I’ve read, written, or reviewed has come from engineers who internalize key philosophies of design, clarity, and restraint.

What makes code *good*? What principles help us design codebases that are flexible, readable, and maintainable? Let’s take a step back and explore some of the philosophies that have stood the test of time.

## KISS

> "Keep it Simple, Stupid"

This is probably the most foundational principle in writing readable code. Most software can be described in simple terms and simple goals (e.g. move data from here to there, apply this rule, respond to that event), yet we often bury those simple goals beneath layers of cleverness, over-engineering, or premature generalization.

Simplicity isn't about doing less work, it’s about making the code do only what’s necessary and no more. A function with a clear purpose, no side effects, and minimal branching is almost always better than a sprawling one that tries to cover every edge case upfront.

It’s worth noting that "simple" doesn’t always mean "easy." Sometimes the clearest design takes longer to arrive at. It requires stepping back, asking what the code is really doing, and resisting the impulse to abstract too early or solve problems you don’t yet have.

Many of the other principles in this post, from DRY to the Law of Demeter, are in service of this central ideal: reduce complexity, sharpen intent, and leave behind code that’s easy to read, easy to change, and hard to misuse.

## DRY

> "Don't repeat yourself"

Where KISS urges us to minimize complexity, DRY asks us to minimize redundancy. Repetition in code isn’t just untidy, it invites inconsistency. Fix a bug in one place, and you may forget to fix it in its twin. Copy a business rule across three functions, and they will almost certainly diverge with time. DRY aims to unify these redundancies under a single, authoritative source.

But DRY must be applied with care. Over-zealous abstraction, especially when premature, can violate KISS and obscure intent. The trick is in the balance: duplication is bad, but so is hiding clarity behind cleverness.

A good example of DRY in action is the use of generics. A generic function or type introduces some complexity in its definition, but pays for itself by collapsing multiple specialized implementations into one reusable, consistent unit.

- Bad DRY: forcing unrelated code into a common abstraction just because it "looks similar."
- Good DRY: factoring out common behavior that shares real semantic meaning.

In practice, it helps to duplicate until the pattern emerges. Not every repetition is worth eliminating but when duplication starts to echo with structure, DRY gives you the vocabulary to refactor responsibly.

## Compose(Compose(Compose))

One of the most powerful tools in a programmer's toolkit is composition. Small, focused units of logic when composed well can solve complex problems without ever becoming complex themselves.

Composition is the antidote to monolithic functions. It allows us to break a task into meaningful pieces, wire them together clearly, and test each piece in isolation. When done right, composed code reads like a sequence of thoughts, not an ocean of control flow.

This philosophy is perhaps most visible in functional programming, where pure functions are chained or piped together to produce elegant transformations. But the idea isn't limited to functional styles. Every good `.map().filter().reduce()` pipeline is a love letter to composability. In object-oriented design, composition over inheritance is a guiding principle for flexibility. In UI development, we compose interfaces from components. In systems architecture, we compose services.

> Composition says: Make small things. Then make bigger things out of them.

Good composition promotes reuse, testability, and clarity. Poor composition, too fragmented, too deeply nested, or overly abstract, can have the opposite effect. As always, it's a matter of taste and restraint.

But when you get it right? Code becomes easier to follow, extend, and reason about. A well-composed program is like a sentence with perfect grammar: even if it's unfamiliar, you understand how it fits together.

## SOLID

SOLID is a collection of several coding principles collected by Robert C. Martin first mentioned in his paper [*Design Principles and Design Patterns*](https://web.archive.org/web/20150906155800/http://www.objectmentor.com/resources/articles/Principles_and_Patterns.pdf).

SOLID is an acronym standing for:

- Single Responsibility Principle
- Open-Closed Principle
- Liskov Substitution Principle
- Interface Segregation Principle
- Dependency Inversion Principle

### Single Responsibility Principle (SRP)

> "A class should have only one reason to change."
>
> - Robert C. Martin

This isn’t just about keeping things small, it’s about cohesion. A class that sends emails and formats reports has two reasons to change: email requirements and report formatting. Those are unrelated concerns, and changes in one can introduce bugs in the other.

SRP helps isolate change. When each module has one purpose, it's easier to test, easier to understand, and easier to modify without fear of side effects.

A good rule of thumb: if you can't summarize what a class does in a single sentence without the word "and", it's probably doing too much.

### Open–Closed Principle (OCP)

> "Software entities should be open for extension, but closed for modification."
>
> - Robert C. Martin

Code should be able to grow new behavior without rewriting existing parts. This principle nudges us toward extensible patterns like interfaces, strategy objects, or plugin architectures rather than brittle conditionals or switch statements.

But OCP is a tradeoff. Extensibility adds complexity, and not every feature needs to be abstracted. It’s most useful when your code needs to accommodate variability (e.g. different user types, formats, behaviors) and you want to support those cases without forking your core logic.

You know you're following OCP when you're adding new files, not rewriting old ones.

### Liskov Substitution Principle (LSP)

> "If S is a subtype of T, then objects of type T may be replaced with objects of type S without altering the correctness of the program."

This one sounds academic, but it’s a sanity check for inheritance. Subtypes shouldn’t surprise you, they should behave like the parent type expects.

If Bird has a method `fly()`, and Penguin inherits from Bird, we’re in trouble. A penguin is a bird, but it violates the contract of Bird by not being able to fly.

LSP reminds us that type hierarchy is not behavioral hierarchy. In practice, it encourages you to:

- Use composition over inheritance
- Design with interfaces or traits
- Think about behavioral compatibility, not just structural reuse

### Interface Segregation Principle (ISP)

> "Clients should not be forced to depend on methods they do not use."

Fat interfaces are a sign of misplaced abstraction. If one class needs only `start()` and `stop()`, and another uses only `reset()` and `status()`, they shouldn't be forced to implement or depend on the same bloated interface.

This principle is about granularity and focus. Interfaces should be tailored to the role each client plays. This makes your system easier to evolve: small interfaces can be composed, extended, or replaced independently.

In TypeScript or Rust, think in terms of fine-grained traits. In Java, it's like breaking a GodInterface into smaller purpose-built ones.

### Dependency Inversion Principle (DIP)

> "Depend on abstractions, not concretions."

High-level modules shouldn’t be tightly coupled to low-level details. Instead, both should depend on shared abstractions. This allows for more flexible wiring, better testability, and cleaner separation of concerns.

DIP often manifests as:

- Passing in interfaces instead of concrete classes
- Using dependency injection (manually or via a framework)
- Separating what a thing does from how it's done

The goal is decoupling: you can change how something works without rewriting the logic that uses it. That’s critical in any system that’s meant to evolve.

## Design by Contract

Design by Contract (DbC) comes from the world of formal methods, but the core idea is intuitive: every function, module, or object enters into an agreement with its caller. Each side has responsibilities, a contract that governs how they interact.

The contract consists of three parts:

- Preconditions: What must be true before this function can be called?
- Postconditions: What will be true after the function finishes?
- Invariants: What must always be true for this object or system?

It’s not just about correctness, it’s about clarity. DbC makes the expectations between parts of a system explicit, which is invaluable for debugging, testing, and collaboration. It’s the difference between "this works if you use it right" and "here’s what you can count on."

In practice, Design by Contract shows up in many places:

- Type systems (especially with non-nullability, lifetimes, and generics)
- Function signatures that encode constraints
- Assertions and guards inside functions
- Rust’s `Result<T, E>` or TypeScript’s discriminated unions: both signal clearly what a function might return and how to handle it.

You don’t need a formal DbC tool to adopt the mindset. Even a well-placed comment or assertion can reinforce a contract. And by thinking contractually, you make your code more predictable and your bugs easier to diagnose.

> When every function is an agreement, debugging becomes reading the transcript.

## Encapsulation

Encapsulation is often summarized as "hiding internal details," but that’s a shallow description. The deeper purpose of encapsulation is to create boundaries that give us control over how a system evolves without breaking everything around it.

When we encapsulate state or behavior, we're not being secretive, we're being protective. Protective of invariants. Protective of contracts. Protective of other developers (including our future selves) who depend on our code not changing out from under them.

A well-encapsulated module has a clear public interface and keeps its implementation details private. This means:

- Data can only be modified through controlled accessors.
- State changes happen in predictable, limited ways.
- External code doesn't make assumptions about internals that might later change.

Encapsulation is the reason you can use a library without knowing how it's built, and the reason that library can improve without breaking your code.

It also enables refactoring. When the insides are hidden, you can change the engine without touching the controls. That’s not just a quality-of-life benefit: it's a survival strategy in long-lived codebases.

> Encapsulation isn’t about hiding for the sake of hiding: it’s about shielding intent from implementation.

Done right, encapsulation reduces risk, lowers cognitive load, and turns complex systems into stable, modular parts.

## Command–Query Separation

Command–Query Separation is a simple rule:
Functions should either do something, or answer something, but not both.

- A command changes state: it performs an action.
- A query returns data: it tells you something.

The moment a function tries to do both, it becomes unpredictable. Did it change anything? Can I safely call it twice? Will it give me the same result next time?

CQS is about making intentions clear. When you see a method named `getUser()` you should feel confident it won’t also delete a session, send an email, or modify a timestamp. And when you see a method named `processOrder()`, you should expect it to do something, not return a value to be passed around like it's pure.

This separation pays off in several ways:

- It improves readability: behavior and intent are aligned.
- It simplifies testing: you test commands and queries differently.
- It enables optimization: you can cache queries or retry commands intelligently.

Many modern patterns build on this idea:

- CQRS (Command Query Responsibility Segregation) takes it further, splitting systems into two separate models: one for reading, one for writing.
- Pure functions in functional programming are queries by design: no side effects, just input/output.
- REST API design mirrors this too: GET is safe and idempotent (query), POST/PUT/DELETE are commands.
- CQS teaches us not just how to write functions, but how to design trustable systems.

When readers know what a method is for, they can use it and reason about it with far greater confidence.

## Principle of Least Astonishment

Software should behave in a way that minimizes surprise, not just for users, but for other developers.

The Principle of Least Astonishment (POLA) is a deceptively simple idea:
Code should do what a reasonable person would expect it to do.

If a method is called deleteUser, it shouldn’t deactivate them.
If an object is immutable, modifying it shouldn’t silently fail.
If a loop runs ten times in every other context, but eleven here, you'd better have a very good reason.

POLA isn't about dumbing things down, it's about making things intuitive. That means:

- Naming things clearly and honestly.
- Following idioms of the language or framework you're using.
- Avoiding clever tricks that make the code "work" but confuse the reader.

Surprise is expensive. When code behaves unexpectedly, it erodes trust. Developers start hedging: adding extra logging, double-checking side effects, avoiding reuse. All because something once didn’t behave the way it looked.

> Code that astonishes is code that gets rewritten.

Designing for least astonishment is an act of empathy. You’re making a bet that the next person who touches your code, whether it's a teammate, a future maintainer, or yourself six months from now, deserves clarity, not cleverness.

And when in doubt? Do the less surprising thing.

## Take advantage of your Types and Systems

Your language, runtime, and tooling aren’t just implementation details, they’re design collaborators. One of the most overlooked coding philosophies is this: lean into the systems around you. Let them help you write better code.

Types, in particular, are a form of executable documentation. A good type tells you:

- What this function expects.
- What it guarantees.
- What can never happen.

In strongly typed languages, you can encode invariants directly into the system:

- Use enums or union types instead of strings and flags.
- Use Option, Result, or similar types instead of nulls and exceptions.
- Use newtypes or tagged types to differentiate semantically distinct values (e.g. UserId vs ProductId, even if both are strings).

But this idea extends beyond the type system:

- Use linters to enforce style and safety.
- Use the module system to control visibility and reduce coupling.
- Use build tooling and CI pipelines to catch issues early.
- Use test frameworks, schema validators, static analysis, whatever helps encode assumptions and expectations into the system.
- The more your codebase can prevent bugs instead of finding them, the safer and faster your development becomes.

You don’t have to be a type maximalist to benefit. Even dynamic languages have tools: type hints, contracts, runtime guards. What matters is that you shift the burden from convention to structure, from "we remember to do this" to "the system won’t let us forget."

Taking advantage of your types and systems isn’t about trusting tools more than people, it’s about designing code so that people don’t have to remember every rule, every time.

### Iterators

Iterators are a prime example of what it means to embrace your language’s strengths. Whether you're using Rust's `Iterator`, JavaScript’s array methods, Python’s generators, or functional chains in Kotlin or Swift, the core idea is the same: iterate without exposing internals.

They provide:

- Encapsulation: You don’t need to manage indexing or loop boundaries.
- Composability: You can map, filter, take, fold, and more in a predictable and expressive pipeline.
- Safety: No off-by-one errors. No forgotten break conditions. No mutation leaking across loop bodies.

With iterators, you're describing what you want, not how to do it. And when your iterator chain is built on strong types, the compiler will guide you, catching errors where they happen and helping prevent misuse.

> A good iterator pipeline is readable, testable, and often faster than manual loops, especially when lazily evaluated.

Using iterators is a small act of trust: you’re letting the system manage control flow, allocation, and sometimes even parallelism. But it’s also an act of clarity: a loop becomes a transformation, not just a mechanism.

## Wrapup

Code is more than logic. It’s conversation. Between you and your teammates, your tools, your future self. Between what a system does and what it promises to do.

These principles, KISS, DRY, SOLID, composition, encapsulation, and the rest, aren’t rules to memorize. They’re philosophies to grow into. They remind us that good software isn't just clever or performant, it’s understandable. Evolvable. Kind to the people who work with it.

The best codebases aren’t those with the fewest bugs or the most elegant abstractions. They’re the ones that invite trust. Where you can read a function and know what it’s doing. Where a bug feels like a surprise, not the default. Where a new teammate can onboard without fear.

So take the time. Name things clearly. Lean on your types. Split things apart. Compose them well. Think in contracts. Write the kind of code that helps the next person succeed, even if that person is just you, months from now, at 3 a.m.

Because in the end, great software isn’t built on brilliance. It’s built on care.
