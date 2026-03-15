# Chalten documentation

Chalten is an alternative date and time (chronology) library for Smalltalk.

One of the benefits of Chalten over the standard base library is the representation
of different concepts with different types. In the human context, we often refer
to dates and moments in time without much additional context.
For example, we might say that we bought something on May third, 2025 at 3:00 pm.
However, that date implicitly carries some context - specifically, the place where
the purchase was made. If the purchase was made in Argentina, that moment in time
is not the same as it if were made in France.
That's why, in a computational system, it's important to differentiate and add
precision to such cases.

This implementation provides abstractions for two different kinds of date and times:
relative and absolute.

For absolute date and time, it defines a continuous and universal timeline, where
each instant on that timeline is comparable to any other, and we can establish a
total ordering between any pair of moments. In that
context, we define an `Instant` as a specific moment on that continuous timeline.
It is a particular point within the flow of time, representing a junction or
position with no duration (a concrete point on that line).

For relative or local times, the library provides support for the Gregorian, Hebrew
and Islamic tabular calendars. Local dates and times can be converted to absolute
points in time by providing some context (like a timezone).

To learn more about the project, [install it](how-to/how-to-load-in-pharo.md) and
expand your understanding over specific topics:

- **Absolute Time**: Details on the abstractions for the universal timeline.
  See the [related documentation.](reference/AbolutePointInTime.md)
- **Gregorian Calendar**: See the
[related documentation.](reference/Gregorian.md)
- **Hebrew Calendar**: See the
[related documentation.](reference/Hebrew.md)
- **Islamic Calendar**:
  See the [related documentation.](reference/Islamic.md)
- **Timezones**: See the [related documentation.](reference/Timezones.md)

---

To use the project as a dependency of your project, take a look at:

- [Pharo: How to use Chalten as a dependency](how-to/how-to-use-as-dependency-in-pharo.md)
- [Baseline groups & components reference](reference/Baseline-groups.md)
