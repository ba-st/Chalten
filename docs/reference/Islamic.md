# Islamic Calendar

The Hijri calendar, also known in English as the Islamic calendar, is a lunar
calendar consisting of 12 lunar months in a year of 354 or 355 days. It is used
to determine the dates of Islamic holidays and rituals, such as the annual fasting
and the annual season for the great pilgrimage.

Traditionally, the Islamic day begins at sunset and ends at the next sunset. Each
Islamic day thus begins at nightfall and ends at the end of daylight. Each month
of the Islamic calendar commences on the birth of the new lunar cycle.

This implementation uses a rule-based variation of the lunar Hijri calendar. It
has the same numbering of years and months, but the months are determined by
arithmetical rules rather than by observation or astronomical calculations. Each
year has 12 months and 354 or 355 days. The odd numbered months have 30 days and
the even numbered months have 29 days, except in a leap year when the 12th and
final month Dhu al-Hijjah has 30 days.

## `IslamicYear`

A year in the Islamic Calendar.
The Islamic (Hijri) Calendar year is a purely lunar system. Unlike the Gregorian
or Hebrew calendars, it makes no attempt to synchronize with the sun or the
agricultural seasons. As a result, the Islamic
year is approximately 11 days shorter than a solar year, causing Islamic months
to "cycle" through the Gregorian seasons every 32 to 33 years.

An Islamic year consists of 12 lunar months. Each month begins with the first
sighting of the new crescent moon (Hilal).  A lunar month is roughly 29.53 days.
Months must be whole days, so they alternate between 29 and 30 days. Because
12 × 29.53 ≈ 354.367, and a standard Islamic year is 354 days, "leap years" are
required to account for the extra 0.367 days. In a leap year, a single day is
added to the last month of the year (Dhu al-Hijjah), increasing it from 29 to 30
days.

The Tabular Islamic Calendar is used in this implementation to provide a predictable
mathematical structure.
This implementation doesn't allow Islamic years before year 1.

Islamic years can be created by sending one of the following messages:

- `IslamicYear number: integer`
- `integer asIslamicYear`

Islamic years are magnitudes and as such can be compared with other
years in the same calendar system.

An `IslamicYear` is capable of responding the number of days, number of months,
and if it's a leap year :

```smalltalk
1442 asIslamicYear numberOfDays. "355 d"
1442 asIslamicYear numberOfMonths. "12 imo"
1442 asIslamicYear isLeapYear. "true"
```

We can also get a specific month of the year by sending `muharram`, `safar`,
`rabiI`, `rabiII`, `jumadaI`, `jumadaII`, `rajab`, `shaban`, `ramadan`, `shawwal`,
`duALHijjah` or `duAlQiDah` to a year:

```smalltalk
1442 asIslamicYear ramadan "Ramadan, 1442 AH"
```

The first and last dates of the year are also easily accessible:

```smalltalk
1442 asIslamicYear firstDate. "Muharram 1, 1442 AH"
1442 asIslamicYear lastDate "Dhu al-Hijjah 30, 1442 AH"
```

And we can move forward and backwards by sending `next`, `next:`, `previous` or
`previous:`

```smalltalk
1442 asIslamicYear next: 2 * IslamicCalendar year "1444 AH"
1442 asIslamicYear next: 36 * IslamicCalendar month "1445 AH"
```

## `IslamicMonth`

A calendar month. In the Islamic calendar, a month amongst the sequence of Islamic
calendar months, namely: Muharram, Safar, Rabi' al-Awwal, Rabi' al-Thani, Jumada
al-Awwal, Jumada al-Thani, Rajab, Sha'ban, Ramadan, Shawwal, Dhu al-Qi'dah and
Dhu al-Hijjah.

In the Islamic calendar, a month is a fixed-order unit within the year. It
encapsulates the logic for day counts in both common and leap years in collaboration
with the year abstraction and supports cyclic arithmetic: Islamic months can be
advanced a number of months or years without further
context given the circularity of this calendar.

In this calendar the Dhu al-Hijjah month has 29 or 30 days, depending on the year
(if it is leap or not).

We can access all the months by sending

```smalltalk
IslamicMonth all
  "Muharram Safar Rabi' al-Awwal Rabi' al-Thani Jumada al-Awwal Jumada al-Thani
  Rajab Sha'ban Ramadan Shawwal Dhu al-Qi'dah Dhu al-Hijjah"
```

or a specific one by sending the proper month name:

```smalltalk
IslamicMonth muharram. "Muharram"
IslamicMonth safar. "Safar"
IslamicMonth rabiI. "Rabi' al-Awwal"
IslamicMonth rabiII. "Rabi' al-Thani"
IslamicMonth jumadaI. "Jumada al-Awwal"
IslamicMonth jumadaII. "Jumada al-Thani"
IslamicMonth rajab. "Rajab"
IslamicMonth shaban. "Sha'ban"
IslamicMonth ramadan. "Ramadan"
IslamicMonth shawwal. "Shawwal"
IslamicMonth duAlQiDah. "Dhu al-Qi'dah"
IslamicMonth duAlHijjah. "Dhu al-Hijjah"
```

Given an Islamic month we can also obtain the month of a specific year (`IslamicMonthOfYear`):

```smalltalk
IslamicMonth shawwal, 1442 "Shawwal, 1442 AH"
```

Islamic month names are localized so if a proper translation is provided we will
get the proper name:

```smalltalk
IslamicMonth shawwal name "شَوَّال"
```

We can also obtain a day of month (`CalendarDayOfMonth`):

```smalltalk
IslamicMonth shawwal eleventh "Shawwal 11"
```

## `IslamicMonthOfYear`

A month on a specific year in the Islamic calendar. Islamic months of year can
be created by sending the `,` message to a month or sending the month name to a
year:

```smalltalk
IslamicMonth shawwal, 1442 "Shawwal, 1442 AH"
1442 asIslamicYear shawwal "Shawwal, 1442 AH"
```

Islamic months of year are magnitudes and as such can be compared with other
months of year in the same calendar system.

An `IslamicMonthOfYear` is capable of responding the number of days:

```smalltalk
(IslamicMonth shawwal , 1442) numberOfDays. "29 d"
```

And we can move forward and backwards by sending `next`, `next:`, `previous` or
`previous:`

```smalltalk
(IslamicMonth shawwal , 1442) next: 15 * IslamicCalendar month "Muharram, 1444 AH"
(IslamicMonth shawwal , 1442) next: 2 * IslamicCalendar year "Shawwal, 1444 AH"
```

The dates within the month are also easily accessible:

```smalltalk
(IslamicMonth shawwal , 1442) first. "Shawwal 1, 1442 AH"
(IslamicMonth shawwal , 1442) tenth. "Shawwal 10, 1442 AH"
(IslamicMonth shawwal , 1442) last. "Shawwal 29, 1442 AH"
```

## `IslamicDate`

A particular calendar day represented by its calendar year, its calendar month
and its day of month in the Islamic calendar.

Since Islamic dates start at sunset (in this implementation 18:00hs on the Gregorian
calendar) there's no direct overlap with a Gregorian date (parts of the day are
in one Gregorian date and other parts of the day into the next one). So, there's
no way to directly convert an Islamic date to a Gregorian date.

Islamic dates can be created by asking the Islamic month of year for a specific
day number or by giving a calendar day of month a year number.

```smalltalk
(IslamicMonth safar , 1442) first. "Safar 1, 1442 AH"
IslamicMonth safar first, 1442 "Safar 1, 1442 AH"
```

Islamic dates are magnitudes and as such can be compared with other dates
in the same calendar system.

For each date we can access its components, like the `year`, `yearNumber`,
`monthOfYear`, `monthNumber` and `dayNumber`:

```smalltalk
(IslamicMonth safar first, 1442) dayNumber. "1"
(IslamicMonth safar first, 1442) monthOfYear. "Safar, 1442 AH"
(IslamicMonth safar first, 1442) monthNumber.  "2"
(IslamicMonth safar first, 1442) year.  "1442 AH"
(IslamicMonth safar first, 1442) yearNumber.  "1442"
(IslamicMonth safar first, 1442) dayOfWeek.  "Yawn as-Sabt"
```

We can also get specific date times in the day (`IslamicDateTime`) by sending
one of:

- `atStartOfDay`
- `atMidnight`
- `atNoon`
- `at: timeOfDay`

```smalltalk

(IslamicMonth safar first , 1442) atStartOfDay. "Safar 1, 1442 AH at 00:00:00.000000"
(IslamicMonth safar first , 1442) atMidnight. "Safar 1, 1442 AH at 06:00:00.000000"
(IslamicMonth safar first , 1442) atNoon. "Safar 1, 1442 AH at 18:00:00.000000"
```

And we can move forward and backwards by sending `next`, `next:`, `previous`, `previous:`,
`+` or `-`

```smalltalk

(IslamicMonth safar, 1442) last next. "Rabi' al-Awwal 1, 1442 AH"
(IslamicMonth safar first, 1442) previous: 30 * (SI >> #day) "Muharram 1, 1442 AH"
(IslamicMonth safar first, 1442) + (15 * (SI >> #day)) "Safar 16, 1442 AH"
(IslamicMonth safar first , 1442) - (15 * (SI >> #day)) "Muharram 16, 1442 AH"
```

To get the number of days between two dates use `-` with two dates:

```smalltalk
(IslamicMonth safar first , 1442) - (IslamicMonth safar first, 1441) "354 d"
```

## `IslamicDateTime`

An absolute Islamic date and time without external context. It tracks the Islamic
year, month, and day, as well as the time of day relative to the traditional sunset
start of the day. This naive representation provides a stable foundation for converting
Islamic date times into the Gregorian system.

To create a `IslamicDateTime` send one of the following messages to a `IslamicDate`
instance:

- `atStartOfDay`
- `atMidnight`
- `atNoon`
- `at: timeOfDay`

Islamic date time instances can be converted to a Gregorian date time by sending
`asGregorianDateTime`.

```smalltalk
|datetime|
datetime := (IslamicMonth safar first, 1442) atNoon.
datetime asGregorianDateTime "September 20, 2020 at 12:00:00.000000"
```

Islamic date time instances can be converted to an absolute point in time by
providing the missing systemic context.

```smalltalk
| buenosAires datetime|
datetime := (IslamicMonth safar first, 1447) atNoon.
datetime inCoordinatedUniversalTime. "2025-07-28T12:00:00.000000Z "
buenosAires := IANATimeZoneDatabase current at: 'America/Argentina/Buenos_Aires'.
datetime in: buenosAires "2025-07-28T12:00:00.000000-03:00"
```

## `CalendarDayOfMonth`

An ordinal number of a calendar day within a calendar month. This class is
calendar-independent. If you create its instances by using an `IslamicMonth` it
will effectively be an `IslamicDayOfMonth`. `CalendarDayOfMonth` instances can
be converted to a date in the corresponding calendar by sending the message `,`
with a valid year number.

```smalltalk
IslamicMonth safar first, 1447 "Safar 1, 1447 AH"
```

## `IslamicDayOfWeek`

A calendar day of week. In the Islamic calendar, a day amongst the sequence of week
calendar days, namely: Yawn al-Ahad, Yawn al-Ithnayn, Yawn ath-Thulatha,
Yawn al-Arba'a', Yawn al-Khamees, Yawn al-Jumu'ah and Yawn as-Sabt. To access a
specific day of week send any of the following
messages:

```smalltalk
IslamicDayOfWeek yawnAlAhad. "Yawn al-Ahad"
IslamicDayOfWeek yawnAlIthnayn. "Yawn al-Ithnayn"
IslamicDayOfWeek  yawnAthThulatha. "Yawn ath-Thulatha"
IslamicDayOfWeek  yawnAlArbaa. "Yawn al-Arba'a'"
IslamicDayOfWeek  yawnAlKhamees. "Yawn al-Khamees"
IslamicDayOfWeek  yawnAlJumuha. "Yawn al-Jumu'ah"
IslamicDayOfWeek  yawnAsSabt "Yawn as-Sabt"
```

`IslamicDayOfWeek` names are localized, so if you have the proper translations loaded
you will get the name in the right language.

```smalltalk
IslamicDayOfWeek yawnAsSabt name "ٱلسَّبْت"
```

## Time Units

The Islamic calendar adds two
more relative time units that are calendar-dependent.
While commonly used in the human context, their conversion to absolute units depends
on the specific moment the unit refers to.

This implementation defines the following relative time units:

- Islamic months (`imo`)
- Islamic years (`iyr`) (12 Islamic months)
