# Localization

Chalten lays out dates and times following the conventions of a locale: the
order of their parts, the separators between them, the 12 or 24 hour clock and
the AM and PM marks. The conventions come from the
[Unicode CLDR](https://cldr.unicode.org/translation/date-time), version 48.2.3,
the same source [Buoy](https://github.com/ba-st/Buoy) uses to localize numbers.

Chalten ships the conventions of English, Spanish and all their regional
variants, like `en-GB` or `es-AR`. Month and weekday names are Chalten's own
translations, in English and Spanish.

## Localizing dates and times

Dates, times and their parts answer `localized`, laid out in the current locale
(`CurrentLocale`, `en` unless changed) with the medium style:

```smalltalk
(March fifth, 2026) localized. "'Mar 5, 2026'"
CurrentLocale use: 'es-AR' during: [ (March fifth, 2026) localized ].
"'5 Mar 2026'"
```

`localizedWith:` chooses another style in its configuration block:

```smalltalk
(March fifth, 2026) localizedWith: [ :options | options full ].
"'Thursday, March 5, 2026'"
```

## Styles

There are four styles, the ones CLDR defines, from the most compact to the most
complete: `short`, `medium` (the default), `long` and `full`. The same style is
used for every part of an object: a date and time in the long style has a long
date and a long time.

These are the four styles in English and Spanish for March 5, 2026, the
examples of this page.

### Dates

```smalltalk
| date |
date := March fifth, 2026.
date localizedWith: [ :options | options short ].
"'3/5/26' in English, '5/3/26' in Spanish"
date localizedWith: [ :options | options medium ].
"'Mar 5, 2026', '5 Mar 2026'"
date localizedWith: [ :options | options long ].
"'March 5, 2026', '5 de Marzo de 2026'"
date localizedWith: [ :options | options full ].
"'Thursday, March 5, 2026', 'Jueves, 5 de Marzo de 2026'"
```

### Parts of dates

A month of a year and a day of a month use CLDR's patterns for them. They have
no full style, so the full one looks like the long one:

```smalltalk
(March, 2026) localizedWith: [ :options | options short ].
"'3/2026' in English and in Spanish"
(March, 2026) localizedWith: [ :options | options medium ].
"'Mar 2026', 'Mar 2026'"
(March, 2026) localizedWith: [ :options | options long ].
"'March 2026', 'Marzo de 2026'"

March fifth localizedWith: [ :options | options short ].
"'3/5' in English, '5/3' in Spanish"
March fifth localizedWith: [ :options | options medium ].
"'Mar 5', '5 Mar'"
March fifth localizedWith: [ :options | options long ].
"'March 5', '5 de Marzo'"
```

A year is its number in every style, without grouping its digits (`2026`). A
month and a day of the week are their short name in the short and medium
styles, and their name in the long and full ones:

```smalltalk
March localized. "'Mar' in English and in Spanish"
March localizedWith: [ :options | options long ]. "'March', 'Marzo'"
(March fifth, 2026) dayOfWeek localized. "'Th', 'Ju'"
```

### Times

A time of day has no offset, so it has no zone to show: in the long and full
styles it is laid out as in the medium one. Seconds are shown without their
fraction.

```smalltalk
| time |
time := TimeOfDay hours: 14 minutes: 30 seconds: 45.
time localizedWith: [ :options | options short ].
"'2:30 PM' in English, '14:30' in Spanish"
time localizedWith: [ :options | options medium ].
"'2:30:45 PM', '14:30:45'"
```

The 12 or 24 hour clock depends on the region: `es-AR` uses the 12 hour one
(`2:30 p. m.`), and `en-GB` the 24 hour one (`14:30`). CLDR puts a narrow
no-break space (U+202F) before AM and PM, and between the parts of the Spanish
marks; the examples show it as a space.

### Dates and times

A date and time combines a date and a time as the locale says, in the same
style:

```smalltalk
| dateTime |
dateTime := (March fifth, 2026)
  at: (TimeOfDay hours: 14 minutes: 30 seconds: 45).
dateTime localizedWith: [ :options | options short ].
"'3/5/26, 2:30 PM' in English, '5/3/26, 14:30' in Spanish"
dateTime localizedWith: [ :options | options full ].
"'Thursday, March 5, 2026, 2:30:45 PM'"
"'Jueves, 5 de Marzo de 2026, 14:30:45'"
```

### Offsets and instants

A date and time aware of its offset shows the offset in the long and full
styles, measured from UTC:

```smalltalk
| buenosAires |
buenosAires := dateTime in: (FixedOffsetRuleset for: -3 * (SI >> #hour)).
buenosAires localizedWith: [ :options | options medium ].
"'Mar 5, 2026, 2:30:45 PM'"
buenosAires localizedWith: [ :options | options long ].
"'March 5, 2026, 2:30:45 PM UTC-3'"
buenosAires localizedWith: [ :options | options full ].
"'Thursday, March 5, 2026, 2:30:45 PM UTC-03:00'"
"'Jueves, 5 de Marzo de 2026, 14:30:45 (UTC-03:00)' in Spanish"
```

The long style drops the leading zero of the hours and zero minutes
(`UTC-3`, `UTC+5:30`), and the full style keeps them (`UTC-03:00`,
`UTC+05:30`). A zero offset is `UTC` in both. Offsets are shown the same way in
every locale.

Chalten doesn't show time zone names, like `ART` or
`Argentina Standard Time`: a date and time shows the offset it has, whatever
the time zone it came from.

An instant is defined on UTC, so it is shown as a date and time in UTC:

```smalltalk
buenosAires asInstant localizedWith: [ :options | options long ].
"'March 5, 2026, 5:30:45 PM UTC'"
```

## Month and weekday names

Month and weekday names are Chalten's own translations, capitalized as proper
names, even where CLDR writes them in lowercase: Chalten writes
`5 de Marzo de 2026`, where CLDR writes `5 de marzo de 2026`. Short weekday
names keep Chalten's two letters (`Th`, `Ju`). Only the layout comes from CLDR.

## Formatting for a given language

`localized` and `localizedWith:` use the current locale. To format in another
language, or to format many objects in the same way, create a
`LocalizedChronologyFormatter` and send it `format:`:

```smalltalk
| formatter |
formatter := LocalizedChronologyFormatter
  for: 'es-AR'
  configuredBy: [ :options | options long ].
formatter format: buenosAires.
"'5 de Marzo de 2026, 2:30:45 p. m. UTC-3'"
```

The formatter uses its own language, for the layout and for the names,
whatever the current locale is. `LocalizedChronologyFormatter for:` creates
one with the medium style.

## Languages

A language tag is resolved from its most specific range down to CLDR's
defaults: `es-AR` takes what Argentina changes, like its 12 hour clock, and the
rest from Spanish.

A language without conventions, like French, gets CLDR's neutral layout and,
without translations, the English names: `2026 Mar 5 14:30:45`.
[How to add date localization data](../how-to/how-to-add-date-localization-data.md)
explains how to add the conventions of other languages, or change the shipped
ones.

## Not supported

- The Hebrew and Islamic calendars: their months and days of the week are
  localized to their names, but their dates don't answer `localized`, and
  their days of month refuse it, as CLDR's Gregorian layouts don't apply to
  them.
- Time zone names, as explained above.
- Relative times (`in 3 days`, `yesterday`), date ranges
  (`Mar 5 – 7, 2026`) and durations with several units (`1 hour, 30 minutes`).
  A single duration is already localized as a quantity:
  `(3 * (SI >> #hour)) localized` is `3 h`.
- Parsing localized dates and times.
