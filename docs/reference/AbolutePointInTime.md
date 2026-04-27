# Absolute Points in Time

This implementation defines a continuous and universal timeline, where each
instant on that timeline is comparable to any other, and we can establish a total
ordering between any pair of moments. In that context, we define an `Instant` as
a specific moment on that continuous timeline. It is a particular point within
the flow of time, representing a junction or position with no duration (a concrete
point on that line).

To represent these absolute points in time, we need a reference, and most often
the Unix epoch is used for this purpose (although it could be any other instant,
theoretically). In this implementation our fixed point, then, will be January 1st,
1970 at 00:00:00 UTC, and any other moment in time will be modeled as a number
of microseconds forward or backward from that instant.

Instants can be created by sending one of the following messages:

- `Instant now` returns the current moment in time
- `Instant epoch` returns the epoch moment (`1970-01-01T00:00:00.000000Z`)
- `Instant fromUnixTime: numberOfSecondsSinceEpoch` returns the moment for the
  [Unix time](https://en.wikipedia.org/wiki/Unix_time)
- `Instant fromJulianDayNumber: jdn` returns the moment for the corresponding
  [Julian day number](https://en.wikipedia.org/wiki/Julian_day)
- `Instant microsecondsSinceEpoch: microsecondsSinceEpoch`
- `Instant secondsSinceEpoch: secondsSinceEpoch`
- `Instant daysSinceEpoch: daysSinceEpoch`
- Sending `asInstant` to a `TimeOffsetAwareGregorianDateTime` instance

Instants are magnitudes and as such can be compared in a total order.

Instants can also shift forward or backward in time by sending `next:` or `previous:`
messages with a time quantity. This time quantities needs to be commensurable with
seconds: any second-derived units, days and weeks will work, but not years or
year-derived units. For example:

```smalltalk
Instant now next: 1 * (SI >> #day)
```

will return exactly one day after the current moment.

Instants can be converted to the Gregorian Calendar by sending `asGregorianDateTimeInCoordinatedUniversalTime`
to obtain a Gregorian date time in UTC or `asGregorianDateTimeIn:` to obtain one
in a specific timezone or offset.

## `TimeOffsetAwareGregorianDateTime`

While Instants are ideal for high-precision timestamping and internal logging,
most user-facing applications eventually require data formatted for the Gregorian
Calendar (the global standard for civil timekeeping).

To bridge this gap, the library provides `TimeOffsetAwareGregorianDateTime`. These
objects remain absolute points in time; they encapsulate a specific global instant
while simultaneously retaining the fixed offset or timezone ruleset used during
their construction.

Preserving this contextual metadata is critical, as it ensures the date-time can
be seamlessly mapped back to a universal Instant or translated into relative local
time without ambiguity.

`TimeOffsetAwareGregorianDateTime` instances can be created by sending one of the
following messages:

- `asGregorianDateTimeInCoordinatedUniversalTime` to an `Instant`
- `asGregorianDateTimeIn: aTimeOffsetRuleset` to an `Instant`
- `inCoordinatedUniversalTime` to another `TimeOffsetAwareGregorianDateTime` instance
- `in: aTimeOffsetRuleset` to another `TimeOffsetAwareGregorianDateTime` instance
- `inCoordinatedUniversalTime` to a `GregorianDateTime` instance
- `in: aTimeOffsetRuleset` to a `GregorianDateTime` instance

`TimeOffsetAwareGregorianDateTime` instances can be converted to:

- `Instant` by sending `asInstant`
- `GregorianDateTime` by sending `asRelativePointInTime`

taking into account that converting to a relative point in time will lose context,
and it's not necessarily a reversible operation.

If your application deals with date time data from several parts of the world,
it's recommended to save them as `TimeOffsetAwareGregorianDateTime` instances.
