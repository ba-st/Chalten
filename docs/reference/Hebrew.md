# Hebrew Calendar

The Hebrew calendar, also called the Jewish calendar, is a lunisolar calendar
used today for Jewish religious observance and as an official calendar of Israel.
It determines the dates of Jewish holidays and other rituals. In Israel, it is used
for religious purposes, provides a time frame for agriculture, and is an official
calendar for civil holidays alongside the Gregorian calendar.

Like other lunisolar calendars, the Hebrew calendar consists of months of 29 or
30 days which begin and end at approximately the time of the new moon. As 12 such
months comprise a total of just 354 days, an extra lunar month is added every 2
or 3 years so that the long-term average year length closely approximates the
actual length of the solar year.

Month length now follows a fixed schedule which is adjusted based on the molad
interval (a mathematical approximation of the mean time between new moons) and
several other rules, while leap months are now added in 7 out of every 19 years
according to the Metonic cycle.

## `HebrewYear`

A year in the Hebrew Calendar.
The Hebrew calendar is a lunisolar calendar.  This means the system performs a
constant mathematical dance to keep its months synchronized with the Moon while
keeping its years synchronized with the Sun and the agricultural seasons.

Unlike the Gregorian calendar, which has only two year lengths (365 or 366 days),
the Hebrew calendar has six possible year lengths.
A standard lunar year of 12 months is about 354 days - roughly 11 days shorter
than a solar year. To prevent Passover (which must
be in the Spring) from drifting into the Winter, the calendar adds an extra Adar
month 7 times every 19 years:

- Common Year: 12 months (353, 354, or 355 days).
- Leap Year: 13 months (383, 384, or 385 days).

To ensure that certain holidays do not fall on inconvenient days of the week
(e.g., Rosh Hashanah cannot be a Sunday, Wednesday,
or Friday), the months of Cheshvan and Kislev can change their length.
This results in three "characters" for both common and leap years:

- Deficient (Chaserah): Both Cheshvan and Kislev have 29 days.
- Regular (Kesidrah): Cheshvan has 29 days; Kislev has 30 days.
- Complete (Shlemah): Both Cheshvan and Kislev have 30 days.

Hebrew years can be created by sending one of the following messages:

- `HebrewYear number: integer`
- `integer asHebrewYear`

Hebrew years are magnitudes and as such can be compared with other
years in the same calendar system.

A `HebrewYear` is capable of responding the number of days, number of months, and
if it's a leap, regular, deficient or complete year :

```smalltalk
5786 asHebrewYear numberOfDays. "354 d"
5786 asHebrewYear numberOfMonths. "12 hmo"
5786 asHebrewYear isLeapYear. "false"
5786 asHebrewYear isDeficientYear. "false"
5786 asHebrewYear isRegularYear. "true"
5786 asHebrewYear isCompleteYear. "false"
```

We can also get a specific month of the year by sending `tishrei`, `cheshvan`,
`kislev`, `tevet`, `shevat`, `adar` (on common years), `adarI` and `adarII` (on
leap years), `nisan`, `iyar`, `sivan`, `tammuz`, `av`
or `elul` to a year:

```smalltalk
5786 asHebrewYear nisan " Nisan, 5786 AM"
```

The first and last dates of the year are also easily accessible:

```smalltalk
5786 asHebrewYear firstDate "Tishrei 1, 5786 AM"
5786 asHebrewYear lastDate " Elul 29, 5786 AM"
```

And we can move forward and backwards by sending `next`, `next:`, `previous` or
`previous:`

```smalltalk
5786 asHebrewYear next: 2 * HebrewCalendar year "5788 AM"
```

## `HebrewMonth`

A calendar month. In the Hebrew calendar, a month amongst the sequence of Hebrew
calendar months. The Hebrew calendar has the particularity that during leap years
the Adar month is replaced with two months.
So, in common years the months are:
Tishrei, Cheshvan, Kislev, Tevet, Shevat, Adar, Nisan, Iyar, Sivan, Tammuz, Av,
and Elul and in leap years are:
Tishrei, Cheshvan, Kislev, Tevet, Shevat, Adar I, Adar II, Nisan, Iyar, Sivan,
Tammuz, Av and Elul.

This logic introduces some particularities in the calendrical calculations, because
not every Hebrew year has the same number of months, and some months don't have
the same position on all years. As a side
effect of this behavior, a quantity of Hebrew months is not convertible to a
quantity of Hebrew years.

In the Hebrew calendar, a month without further context cannot be advanced a
number of months.

In addition, the Hebrew years are divided in deficient, regular or complete:

- On deficient years the months of Cheshvan and Kislev have a 29-day duration.
- On regular years the month of Cheshvan has a 29-day duration and the month of
  Kislev a 30-day duration.
- On complete years the months of Cheshvan and Kislev have a 30-day duration.

We can access all the months by sending

```smalltalk
HebrewMonth allOnCommonYear
  "Tishrei Cheshvan Kislev Tevet Shevat Adar
   Nisan Iyar Sivan Tammuz Av Elul"
HebrewMonth allOnLeapYear
  "Tishrei Cheshvan Kislev Tevet Shevat Adar I
   Adar II Nisan Iyar Sivan Tammuz Av Elul"
```

or a specific one by sending the proper month name:

```smalltalk
HebrewMonth tishrei. "Tishrei"
HebrewMonth cheshvan. "Cheshvan"
HebrewMonth kislev. "Kislev"
HebrewMonth tevet. "Tevet"
HebrewMonth shevat. "Shevat"
HebrewMonth adar. "Adar"
HebrewMonth adarI. "Adar I"
HebrewMonth adarII. "Adar II"
HebrewMonth nisan. "Nisan"
HebrewMonth iyar. "Iyar"
HebrewMonth sivan. "Sivan"
HebrewMonth tammuz. "Tammuz"
HebrewMonth av. "Av"
HebrewMonth elul "Elul"
```

Given a Hebrew month we can also obtain the month of a specific year (`HebrewMonthOfYear`):

```smalltalk
HebrewMonth nisan, 5786 "Nisan, 5786 AM"
```

Hebrew month names are localized so if a proper translation is provided we will
get the proper name:

```smalltalk
HebrewMonth nisan name "נִיסָן"
```

We can also obtain a day of month (`CalendarDayOfMonth`):

```smalltalk
HebrewMonth nisan eleventh "Nisan 11"
```

## `HebrewMonthOfYear`

A month on a specific year in the Hebrew calendar. Hebrew months of year can
be created by sending the `,` message to a month or sending the month name to a
year:

```smalltalk
HebrewMonth nisan, 5786 "Nisan, 5786 AM"
5786 asHebrewYear nisan "Nisan, 5786 AM"
```

Hebrew months of year are magnitudes and as such can be compared with other
months of year in the same calendar system.

A `HebrewMonthOfYear` is capable of responding the number of days:

```smalltalk
(HebrewMonth kislev , 5786) numberOfDays. "30 d"
(HebrewMonth kislev , 5784) numberOfDays. "29 d"
```

And we can move forward and backwards by sending `next`, `next:`, `previous` or
`previous:`

```smalltalk
(HebrewMonth kislev , 5786) next: 15 * HebrewCalendar month "Adar I, 5787 AM"
```

The dates within the month are also easily accessible:

```smalltalk
(HebrewMonth kislev , 5786) first. "Kislev 1, 5786 AM"
(HebrewMonth kislev , 5786) tenth. "Kislev 10, 5786 AM"
(HebrewMonth kislev , 5786) last. "Kislev 30, 5786 AM"
(HebrewMonth kislev , 5784) last "Kislev 29, 5784 AM"
```

## `HebrewDate`

A particular calendar day represented by its calendar year, its calendar month
and its day of month in the Hebrew calendar.

Since Hebrew dates start at sunset (in this implementation 18:00hs on the Gregorian
calendar) there's no direct overlap with a Gregorian date (parts of the day are
in one Gregorian date and other parts of the day into the next one). So, there's
no way to directly convert a Hebrew date to a Gregorian date.

Hebrew dates can be created by asking the Hebrew month of year for a specific
day number or by giving a calendar day of month a year number.

```smalltalk
(HebrewMonth kislev , 5786) first.  "Kislev 1, 5786 AM"
HebrewMonth kislev first, 5786 "Kislev 1, 5786 AM"
```

Hebrew dates are magnitudes and as such can be compared with other dates
in the same calendar system.

For each date we can access its components, like the `year`, `yearNumber`,
`monthOfYear`, `monthNumber` and `dayNumber`:

```smalltalk
(HebrewMonth kislev first, 5786) dayNumber. "1"
(HebrewMonth kislev first, 5786) monthOfYear. "Kislev, 5786 AM"
(HebrewMonth kislev first, 5786) monthNumber. "3"
(HebrewMonth kislev first, 5786) year. "5786 AM"
(HebrewMonth kislev first, 5786) yearNumber. "5786"
(HebrewMonth kislev first, 5786) dayOfWeek. "Yom Shishi"
```

We can also get specific date times in the day (`HebrewDateTime`) by sending
one of:

- `atStartOfDay`
- `atMidnight`
- `atNoon`
- `at: timeOfDay`

```smalltalk
(HebrewMonth kislev first, 5786) atStartOfDay. "Kislev 1, 5786 AM at 00:00:00.000000"
(HebrewMonth kislev first, 5786) atMidnight. "Kislev 1, 5786 AM at 06:00:00.000000"
(HebrewMonth kislev first, 5786) atNoon. "Kislev 1, 5786 AM at 18:00:00.000000"
```

And we can move forward and backwards by sending `next`, `next:`, `previous`, `previous:`,
`+` or `-`

```smalltalk
(HebrewMonth kislev , 5786) last next. "Tevet 1, 5786 AM"
(HebrewMonth kislev first, 5786) previous: 30 * (SI >> #day) "Tishrei 30, 5786 AM"
(HebrewMonth kislev first, 5786) + (15 * (SI >> #day)) "Kislev 16, 5786 AM"
(HebrewMonth kislev first, 5786) - (15 * (SI >> #day)) "Cheshvan 15, 5786 AM"
```

To get the number of days between two dates use `-` with two dates:

```smalltalk
(HebrewMonth kislev first, 5786) - (HebrewMonth kislev first, 5785) "354 d"
```

## `HebrewDateTime`

An absolute Hebrew date and time without external context. It tracks the Hebrew
year, month, and day, as well as the time of day relative to the traditional sunset
start of the day. This naive representation provides a stable foundation for converting
Hebrew date times into the Gregorian system.

To create a `HebrewDateTime` send one of the following messages to a `HebrewDate`
instance:

- `atStartOfDay`
- `atMidnight`
- `atNoon`
- `at: timeOfDay`

Hebrew date time instances can be converted to a Gregorian date time by sending
`asGregorianDateTime`.

```smalltalk
|datetime|
datetime := (HebrewMonth kislev first, 5786) atNoon.
datetime asGregorianDateTime "November 22, 2025 at 12:00:00.000000"
```

Hebrew date time instances can be converted to an absolute point in time by
providing the missing systemic context.

```smalltalk
| buenosAires datetime|
datetime := (HebrewMonth kislev first, 5786) atNoon.
datetime inCoordinatedUniversalTime.  "2025-11-22T12:00:00.000000Z"
buenosAires := IANATimeZoneDatabase current at: 'America/Argentina/Buenos_Aires'.
datetime in: buenosAires  "2025-11-22T12:00:00.000000-03:00"
```

## `CalendarDayOfMonth`

An ordinal number of a calendar day within a calendar month. This class is
calendar-independent. If you create its instances by using a `HebrewMonth` it
will effectively be a `HebrewDayOfMonth`. `CalendarDayOfMonth` instances can
be converted to a date in the corresponding calendar by sending the message `,`
with a valid year number.

```smalltalk
HebrewMonth kislev first, 5786 "Kislev 1, 5786 AM"
```

## `HebrewDayOfWeek`

A calendar day of week. In the Hebrew calendar, a day amongst the sequence of week
calendar days, namely, Yom Rishon, Yom Sheni, Yom Shlishi, Yom Revii, Yom Hamishi,
Yom Shishi and Yom Shabbat. To access a specific day of week send any of the following
messages:

```smalltalk
HebrewDayOfWeek yomRishon. "Yom Rishon"
HebrewDayOfWeek yomSheni. "Yom Sheni"
HebrewDayOfWeek yomShlishi. "Yom Shlishi"
HebrewDayOfWeek yomRevii. "Yom Revii"
HebrewDayOfWeek yomHamishi. "Yom Hamishi"
HebrewDayOfWeek yomShishi. "Yom Shishi"
HebrewDayOfWeek yomShabbat "Yom Shabbat"
```

`HebrewDayOfWeek` names are localized, so if you have the proper translations loaded
you will get the name in the right language.

```smalltalk
HebrewDayOfWeek yomShabbat name "יום שבת"
```

## Time Units

The Hebrew calendar add two
more relative time units that are calendar-dependent.
While commonly used in the human context, their conversion to absolute units depends
on the specific moment the unit refers to.

This implementation defines the following relative time units:

- Hebrew months (`hmo`)
- Hebrew years (`hyr`)

In this calendar the month and year units are not convertible, because some years
have 13 months and other 12 months depending on the specific year.
