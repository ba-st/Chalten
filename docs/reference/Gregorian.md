# Gregorian calendar

The Gregorian calendar is the world's most widely used civil calendar, introduced
by Pope Gregory XIII in 1582 to correct the Julian calendar's inaccurate leap year
system. It is a 365-day solar calendar with 12
months of 28–31 days each that adds a leap day every four years,
except for centennial years not divisible by 400, ensuring alignment with the
Earth's orbit.

This library provides abstractions modelling the Proleptic Gregorian Calendar.
The Proleptic Gregorian Calendar is a mathematical extension of the modern Gregorian
calendar backward in time to dates before it was officially introduced in 1582.

In essence, it treats the Gregorian rules (leap years every 4 years, except for
centuries not divisible by 400) as if they had always existed, even during eras
when the world was actually using the Julian calendar or other systems.

## `GregorianYear`

A year in the Gregorian Calendar. On common years, the Gregorian year has 365 days;
and in leap years 366 days. This extra day is added to the month of February.

Gregorian years can be created by sending one of the following messages:

- `GregorianYear number: integer`
- `integer asGregorianYear`

A Gregorian Year is composed of twelve months starting on January and ending in
December. Gregorian years are magnitudes and as such can be compared with other
years in the same calendar system.

A `GregorianYear` is capable of responding the number of days, number of months
and if it's a leap year or not:

```smalltalk
2026 asGregorianYear numberOfDays "365 d"
2026 asGregorianYear numberOfMonths "12 mo"
2026 asGregorianYear isLeapYear "false"
```

We can also get a specific month of the year by sending `january`, `february`,
`march`, `april`, `may`, `june`, `july`, `august`, `september`, `october`, `november`
or `december` to a year:

```smalltalk
2026 asGregorianYear june "June, 2026"
```

The first and last dates of the year are also easily accessible:

```smalltalk
2026 asGregorianYear firstDate "January 1, 2026"
2026 asGregorianYear lastDate "December 31, 2026"
```

And we can move forward and backwards by sending `next`, `next:`, `previous` or
`previous:`

```smalltalk
| decade |
decade := TimeUnits units >> #decade.
2026 asGregorianYear next: 2 * decade "2046"
```

## `GregorianMonth`

A calendar month. In the ISO calendar, a month amongst the sequence of Gregorian
calendar months, namely, January, February, March, April, May, June, July, August,
September, October, November and December.
In the ISO standard, a month is a fixed-order unit within the year.

It encapsulates the logic for day counts in both common and leap years in
collaboration with the year abstraction and supports cyclic arithmetic: Gregorian
months can be advanced a number of months or years without further context given
the circularity of this calendar.

We can access all the months by sending

```smalltalk
GregorianMonth all 
  "January February March April May June
   July August September October November December"
```

or a specific one by sending the proper month name:

```smalltalk
GregorianMonth january. "January"
GregorianMonth february. "February"
GregorianMonth march. "March"
GregorianMonth april. "April"
GregorianMonth may. "May"
GregorianMonth june. "June"
GregorianMonth july. "July"
GregorianMonth august. "August"
GregorianMonth september. "September"
GregorianMonth october. "October"
GregorianMonth november. "November"
GregorianMonth december. "December"
```

For scripting purposes, the months can also be accessed directly in the global
namespace by its name.

Gregorian months can be moved backwards or forward by sending `next:` or `previous:`.

```smalltalk
| month |
month := TimeUnits units >> #month.
April next: 15 * month "July"
```

Given a Gregorian month we can also obtain the month of a specific year (`GregorianMonthOfYear`):

```smalltalk
April , 2026. "April , 2026"
June , 2026. "June , 2026"
```

Gregorian month names are localized so if a proper translation is provided we will
get the proper name:

```smalltalk
April name "Abril"
```

We can also obtain a day of month (`CalendarDayOfMonth`):

```smalltalk
April second. "April 2"
June eleventh "June 11"
```

## `GregorianMonthOfYear`

A month on a specific year in the Gregorian calendar. Gregorian months of year can
be created by sending the `,` message to a month or sending the month name to a
year:

```smalltalk
February , 2026. "February , 2026"
2026 asGregorianYear february "February , 2026"
```

Gregorian months of year are magnitudes and as such can be compared with other
months of year in the same calendar system.

A `GregorianMonthOfYear` is capable of responding the number of days:

```smalltalk
(February , 2026) numberOfDays. "28 d"
(February , 2020) numberOfDays. "29 d"
```

And we can move forward and backwards by sending `next`, `next:`, `previous` or
`previous:`

```smalltalk
| century |
century := TimeUnits units >> #century.
(February , 2026) next: 2 * century "February, 2226"
```

The dates within the month are also easily accessible:

```smalltalk
(February , 2026) first. "February 1, 2026"
(February , 2026) tenth. "February 10, 2026"
(February , 2026) last. "February 28, 2026"
(February , 2020) last "February 29, 2020"
```

## `GregorianDate`

A particular calendar day represented by its calendar year, its calendar month
and its day of month in the Gregorian calendar.
A date is a 24-hour period and in the Gregorian calendar days spans from midnight
to midnight.

Gregorian dates can be created by asking the Gregorian month of year for a specific
day number or by giving a calendar day of month a year number.

```smalltalk
April first, 2026. "April 1, 2026"
(February , 2026) fifteenth. "February 15, 2026"
```

Gregorian dates are magnitudes and as such can be compared with other dates
in the same calendar system.

For each date we can access its components, like the `year`, `yearNumber`,
`monthOfYear`, `monthNumber` and `dayNumber`:

```smalltalk
(April first, 2026) dayNumber. "1"
(April first, 2026) monthOfYear. "April, 2026"
(April first, 2026) monthNumber. "4"
(April first, 2026) year. "2026"
(April first, 2026) yearNumber. "2026"
(April first, 2026) dayOfWeek. "Wednesday"
```

We can also get specific date times in the day (`GregorianDateTime`) by sending
one of:

- `atStartOfDay`
- `atMidnight`
- `atNoon`
- `at: timeOfDay`

```smalltalk
(April first, 2026) atStartOfDay. "April 1, 2026 at 00:00:00.000000"
(April first, 2026) atMidnight. "April 1, 2026 at 00:00:00.000000"
(April first, 2026) atNoon. "April 1, 2026 at 12:00:00.000000"
(April first, 2026) at: (TimeOfDay hours: 4). "April 1, 2026 at 04:00:00.000000"
```

And we can move forward and backwards by sending `next`, `next:`, `previous`, `previous:`,
`+` or `-`

```smalltalk
(February , 2026) last next. "March 1, 2026"
(April first, 2026) previous: 30 * (SI >> #day) "March 2, 2026."
(April first, 2026) + (15 * (SI >> #day)) "April 16, 2026"
(April first, 2026) - (15 * (SI >> #day)) "March 17, 2026"
```

To get the number of days between two dates use `-` with two dates:

```smalltalk
(April first, 2026) - (April first, 2025) "365 d"
```

## `GregorianDateTime`

Represents a "naive" Gregorian date and time, independent of any specific timezone
or geographical offset. This class captures a calendar-based instant (year, month,
day, hour, minute, second) without anchoring it to a location on Earth. As such,
it does not represent a single, unique moment in universal history unless paired
with external context (such as a UTC offset or a location-specific 'Sunset' rule).

It is primarily used for:

- Naive arithmetic where relative time differences matter more than absolute
  global positioning.
- Situations where the timezone/offset is managed externally or provided by the
  broader system context.
- Inter-calendar algorithmic bridges that operate on a standardized, context-free
timeline.

For precise, globally unique points in time that require explicit offset
management, use `TimeOffsetAwareGregorianDateTime` or `Instant`. Be careful when
using this abstraction, because two `GregorianDateTime` instances whose system
context is different shouldn't be mixed or compared together.

To create a `GregorianDateTime` send one of the following messages to a `GregorianDate`
instance:

- `atStartOfDay`
- `atMidnight`
- `atNoon`
- `at: timeOfDay`

Gregorian date time instances can be converted to an absolute point in time by
providing the missing systemic context.

```smalltalk
| buenosAires |
(April first, 2024 ) atNoon inCoordinatedUniversalTime. "2024-04-01T12:00:00.000000Z"
buenosAires := IANATimeZoneDatabase current at: 'America/Argentina/Buenos_Aires'.
(April first, 2024 ) atNoon in: buenosAires "2024-04-01T12:00:00.000000-03:00"
```

Trying to provide the necessary context can sometimes produce weird situations.
For certain locations during Daylight Saving Time (DST) transitions, the clock
essentially creates two mathematical glitches: a gap in the spring and an overlap
in the autumn. The library handles these situations by raising two exceptions the
user can handle:

- `SkippedTimeError` indicates that the local time doesn't exist in the timezone
  due to daylight saving time changes.
- `AmbiguousTimeError` indicates that the local time cannot be automatically converted
  to an absolute point in time because it's ambiguous in the timezone.
  This exception provides `earlierDateTime` and `laterDateTime` messages returning
  the two possible absolute points in time.

Instances of `GregorianDateTime` can be converted to UTC or a different timezone
by sending the messages `inCoordinatedUniversalTime` or `in: timezone`.

Gregorian date-times are magnitudes and as such can be compared with other date-times
in the same calendar system.

## `CalendarDayOfMonth`

An ordinal number of a calendar day within a calendar month. This class is
calendar-independent. If you create its instances by using a `GregorianMonth` it
will effectively be a `GregorianDayOfMonth`. `CalendarDayOfMonth` instances can
be converted to a date in the corresponding calendar by sending the message `,`
with a valid year number.

```smalltalk
February third , 2020 "February third, 2020"
```

## `TimeOfDay`

A `TimeOfDay` represents a specific point in a 24-hour cycle, typically measured
from midnight to midnight (as in the Gregorian calendar).

In some calendar systems, the start of day is at sunset instead of midnight.

Representations of local time of day as defined above make no provisions to prevent
ambiguities in expressions that result from discontinuities in the local timescale
(e.g. daylight-saving time).

A time of day can be created by sending any of the following messages:

- `startOfDay`
- `halfOfDay`
- `hours:`
- `hours:minutes:`
- `hours:minutes:seconds:`
- `hours:minutes:seconds:microseconds:`

A time of day needs to be in the interval `[0 hs,24 hs)` to be valid.

```smalltalk
TimeOfDay hours: 13 minutes: 54 seconds: 4 "13:54:04.000000"
```

## `DayOfWeek`

A calendar day of week. In the ISO calendar, a day amongst the sequence of week
calendar days, namely, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday or
Sunday.
In the ISO Calendar definition, a week begins on Monday and ends on Sunday. To
access a specific day of week send any of the following messages:

```smalltalk
DayOfWeek monday. "Monday"
DayOfWeek tuesday. "Tuesday"
DayOfWeek wednesday. "Wednesday"
DayOfWeek thursday. "Thursday"
DayOfWeek friday. "Friday"
DayOfWeek saturday. "Saturday"
DayOfWeek sunday. "Sunday"
```

`DayOfWeek` names are localized, so if you have the proper translations loaded
you will get the name in the right language.

```smalltalk
DayOfWeek monday name "Lunes"
```

## `TimeUnits`

Chalten extends the time units declared in the Internation System of Units to
include relative time units.

Absolute time units include the following, based on the second (using definitions
from the ISO proleptic Gregorian calendar):

- minutes (60 seconds)
- hours (60 minutes)
- days (24 hours)
- weeks (7 days)

Relative time units are calendar-dependent. While commonly used in the human context,
their conversion to absolute units depends on the specific moment the unit refers
to. Relative time units are not automatically converted to absolute time units;
external context is required for such conversions. Refer to the concept of "day
count convention" for various methods of converting relative time units to
absolute ones.

This implementation defines the following relative time units (using definitions
from the ISO proleptic Gregorian calendar):

- months : based on the Moon's orbital period around the Earth
- years (12 months)
- lustrums (5 years)
- decades (10 years)
- jubilees (50 years)
- centuries (100 years)
- millenniums (1,000 years)
