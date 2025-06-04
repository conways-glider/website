+++
title = "The Principles of Good Code"
date = 2025-05-30
draft = true

[taxonomies]
tags = ["coding"]
+++

# Writing Notes

- <https://en.wikipedia.org/wiki/SOLID>
- <https://rust-unofficial.github.io/patterns/additional_resources/design-principles.html#self-documentation>
- <https://en.wikipedia.org/wiki/Category:Programming_principles>

# The Principles of Good Code

> “Any fool can write code that a computer can understand. Good programmers write code that humans can understand.”
>
> - Martin Fowler

After more than a decade in software, I've seen engineers either rely on getting "better" through repetition or cling tightly to a handful of design ideals. But writing excellent software isn’t just about mastery - it's about mindset. The best code I’ve read, written, or reviewed has come from engineers who internalize key philosophies of design, clarity, and restraint.

What makes code *good*? What principles help us design codebases that are flexible, readable, and maintainable? Let’s take a step back and explore some of the philosophies that have stood the test of time.

## KISS

> "Keep it Simple, Stupid"

This is probably the most foundational principle in writing readable code. Most software can be described in simple terms and simple goals (e.g. move data from here to there, apply this rule, respond to that event), yet we often bury those simple goals beneath layers of cleverness, over-engineering, or premature generalization.

Simplicity isn't about doing less work, it’s about making the code do only what’s necessary and no more. A function with a clear purpose, no side effects, and minimal branching is almost always better than a sprawling one that tries to cover every edge case upfront.

It’s worth noting that “simple” doesn’t always mean “easy.” Sometimes the clearest design takes longer to arrive at. It requires stepping back, asking what the code is really doing, and resisting the impulse to abstract too early or solve problems you don’t yet have.

Many of the other principles in this post, from DRY to the Law of Demeter, are in service of this central ideal: reduce complexity, sharpen intent, and leave behind code that’s easy to read, easy to change, and hard to misuse.

## DRY

> "Don't repeat yourself"

Where KISS urges us to minimize complexity, DRY asks us to minimize redundancy. Repetition in code isn’t just untidy, it invites inconsistency. Fix a bug in one place, and you may forget to fix it in its twin. Copy a business rule across three functions, and they will almost certainly diverge with time. DRY aims to unify these redundancies under a single, authoritative source.

But DRY must be applied with care. Over-zealous abstraction, especially when premature, can violate KISS and obscure intent. The trick is in the balance: duplication is bad, but so is hiding clarity behind cleverness.

A good example of DRY in action is the use of generics. A generic function or type introduces some complexity in its definition, but pays for itself by collapsing multiple specialized implementations into one reusable, consistent unit.

> Bad DRY: forcing unrelated code into a common abstraction just because it “looks similar.”
>
> Good DRY: factoring out common behavior that shares real semantic meaning.

In practice, it helps to duplicate until the pattern emerges. Not every repetition is worth eliminating — but when duplication starts to echo with structure, DRY gives you the vocabulary to refactor responsibly.

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

### Open–Closed Principle (OCP)

### Liskov Substitution Principle (LSP)

### Interface Segregation Principle (ISP)

### Dependency Inversion Principle (DIP)

## Law of Demeter

## Design by Contract

## Encapsulation

## Command–Query Separation

## Principle of Least Astonishment

## Take advantage of your Types and Systems

### Iterators

## Wrapup
