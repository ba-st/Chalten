# How to add date localization data

Chalten lays out dates and times following the conventions of the current
locale: the order of their parts, the separators between them, the 12 or 24
hour clock and the AM and PM marks. They come from the
[Unicode CLDR](https://cldr.unicode.org/translation/date-time) and are loaded
from JSON files into Buoy's `LocaleConventions`, in the `#chronology` category.
Chalten ships `locales/chronology.json`, with the global defaults, English,
Spanish and all their regional variants, and loads it when Chalten itself is
loaded.

The month and weekday names are not part of these conventions: they are
Chalten's own translations, in the `locales` folder of each language. Neither
are the UTC offsets, which Chalten shows the same way in every locale.

This guide adds the conventions for other languages, or changes the ones
Chalten ships, from an application.

## The file format

Each top-level key is a language range, and each value holds the properties
that range sets. A property is resolved for a language tag from the most
specific matching range down to `*`, one property at a time:

```json
{
  "*": {
    "shortDateFormat": "y-MM-dd",
    "mediumDateFormat": "y MMM d",
    "shortTimeFormat": "HH:mm",
    "amMark": "AM",
    "pmMark": "PM"
  },
  "es": {
    "shortDateFormat": "d/M/yy",
    "mediumDateFormat": "d MMM y",
    "shortTimeFormat": "H:mm",
    "amMark": "a. m.",
    "pmMark": "p. m."
  },
  "es-AR": {
    "shortTimeFormat": "h:mm a"
  }
}
```

With this file, `es-AR` takes its short time format from `es-AR`, its short
date format from `es`, and the formats it doesn't define anywhere else from
`*`.

The properties are:

- `shortDateFormat`, `mediumDateFormat`, `longDateFormat`, `fullDateFormat`:
  the pattern for dates in each style, from CLDR's `dateFormats`.
- `shortTimeFormat`, `mediumTimeFormat`, `longTimeFormat`, `fullTimeFormat`:
  the pattern for times in each style, from `timeFormats`.
- `shortDateTimeFormat`, `mediumDateTimeFormat`, `longDateTimeFormat`,
  `fullDateTimeFormat`: how a date and a time are combined in each style, from
  `dateTimeFormats`.
- `shortYearMonthFormat`, `mediumYearMonthFormat`, `longYearMonthFormat`: the
  pattern for a month of a year, from the `yM`, `yMMM` and `yMMMM` skeletons of
  `availableFormats`.
- `shortMonthDayFormat`, `mediumMonthDayFormat`, `longMonthDayFormat`: the
  pattern for a day of a month, from the `Md`, `MMMd` and `MMMMd` skeletons.
- `amMark`, `pmMark`: the marks of the hours before and after noon, from the
  abbreviated `dayPeriods`.

The long and full time formats are the medium one plus the UTC offset. Times
that have no offset, like a `TimeOfDay`, use the medium format in their place.

Write characters outside ASCII as `\u` escapes, like ` ` for the narrow
no-break space CLDR puts before AM and PM: they are often invisible, and
escapes keep them visible in reviews and diffs.

### Patterns

The formats are [CLDR date patterns][patterns]. Text between single quotes is
literal, two single quotes stand for one, and the combining formats use `{1}`
for the date and `{0}` for the time, like `{1}, {0}`. Chalten supports these
fields:

| Field | What it shows | Example (`en`) |
| --- | --- | --- |
| `y`, `yy` | The year, in full or its last two digits | `2026`, `26` |
| `M`, `L`, `MM`, `LL` | The month number, doubled to pad it | `3`, `03` |
| `MMM`, `MMMM` | The month's short name and name | `Mar`, `March` |
| `d`, `dd` | The day of the month | `5`, `05` |
| `E`, `EE`, `EEE`, `ccc` | The weekday's short name | `Th` |
| `EEEE`, `cccc` | The weekday's name | `Thursday` |
| `h`, `hh` | The hour on a 12 hour clock | `2`, `02` |
| `H`, `HH` | The hour on a 24 hour clock | `14` |
| `a` | The AM or PM mark | `PM` |
| `m`, `mm`, `s`, `ss` | Minutes and seconds | `30`, `05` |
| `z`, `zz`, `zzz`, `O` | The short UTC offset | `UTC-3`, `UTC+5:30` |
| `zzzz`, `OOOO` | The long UTC offset | `UTC-03:00` |

Any other ASCII letter is a field Chalten doesn't support, and loading a file
with it fails before anything in the file is loaded.

[patterns]: https://unicode.org/reports/tr35/tr35-dates.html#Date_Format_Patterns

## Generate the conventions from CLDR

Save this script as `cldr-date-conventions.sh`. It needs `bash`, `curl` and
`jq`, and prints the conventions for the languages it is given, and for all
their regional variants, as of CLDR 48.2.3. It stops if a locale's long or full
time format isn't its medium one plus a zone field, as times without an offset
rely on that:

```bash
#!/usr/bin/env bash
# Prints, in Buoy's locale data format, the date and time conventions CLDR
# defines for the given languages and all their regional variants.
#
# Usage: cldr-date-conventions.sh <language>...
# Example: cldr-date-conventions.sh en es > locales/chronology.json
set -euo pipefail

readonly CLDR_VERSION=48.2.3
readonly CLDR_URL="https://raw.githubusercontent.com/unicode-org/cldr-json/\
${CLDR_VERSION}/cldr-json"

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <language>..." >&2
  exit 64
fi

download() {
  curl --fail --silent --show-error --location --retry 5 --retry-all-errors \
    "${CLDR_URL}/$1"
}

# The properties Chalten uses, read from a locale's CLDR ca-gregorian.json.
# Stops if the long or full time pattern is not the medium one plus a zone
# field, as times without an offset use the medium pattern in their place.
conventions_of() {
  download "cldr-dates-full/main/$1/ca-gregorian.json" |
    jq --compact-output --arg id "$1" '
      def without_zone: sub("\\s*\\(?[zOvV]+\\)?\\s*"; "");

      .main[$id].dates.calendars.gregorian as $calendar
      | $calendar.dateFormats as $dates
      | $calendar.timeFormats as $times
      | $calendar.dateTimeFormats as $dateTimes
      | $dateTimes.availableFormats as $skeletons
      | $calendar.dayPeriods.format.abbreviated as $dayPeriods
      | if ($times.long | without_zone) != $times.medium
          or ($times.full | without_zone) != $times.medium
        then
          error("\($id): the long and full time patterns are not"
            + " the medium one plus a zone")
        else
          {
            id: $id,
            conventions: {
              shortDateFormat: $dates.short,
              mediumDateFormat: $dates.medium,
              longDateFormat: $dates.long,
              fullDateFormat: $dates.full,
              shortTimeFormat: $times.short,
              mediumTimeFormat: $times.medium,
              longTimeFormat: $times.long,
              fullTimeFormat: $times.full,
              shortDateTimeFormat: $dateTimes.short,
              mediumDateTimeFormat: $dateTimes.medium,
              longDateTimeFormat: $dateTimes.long,
              fullDateTimeFormat: $dateTimes.full,
              shortYearMonthFormat: $skeletons.yM,
              mediumYearMonthFormat: $skeletons.yMMM,
              longYearMonthFormat: $skeletons.yMMMM,
              shortMonthDayFormat: $skeletons.Md,
              mediumMonthDayFormat: $skeletons.MMMd,
              longMonthDayFormat: $skeletons.MMMMd,
              amMark: $dayPeriods.am,
              pmMark: $dayPeriods.pm
            }
          }
        end'
}

# The CLDR locales of the given languages, the languages themselves included
locales=$(
  download "cldr-core/availableLocales.json" |
    jq --raw-output --args '
      .availableLocales.full[]
      | select(. as $locale | $ARGS.positional
          | any(. as $language
              | $locale == $language
                or ($locale | startswith($language + "-"))))
    ' "$@"
)

# "*" comes from CLDR's root locale, und. Each language keeps what differs
# from "*", and each regional variant what differs from its language.
{
  conventions_of und
  for locale in ${locales}; do
    conventions_of "${locale}"
  done
} | jq --slurp --raw-output '
  def without($base): with_entries(select(.value != $base[.key]));
  def hex4:
    [(. / 4096 | floor) % 16, (. / 256 | floor) % 16, (. / 16 | floor) % 16,
      . % 16]
    | map("0123456789ABCDEF"[.:. + 1]) | join("");
  def ascii:
    explode
    | map(
        if . < 128 then [.] | implode
        elif . < 65536 then "\\u" + hex4
        else (. - 65536) as $c
          | "\\u" + (55296 + ($c / 1024 | floor) | hex4)
            + "\\u" + (56320 + $c % 1024 | hex4)
        end)
    | join("");
  def entry:
    (.value | to_entries | map("\(.key | tojson): \(.value | tojson)"))
      as $properties
    | "  \(.key | tojson): {\($properties | join(", "))}";

  (map({(.id): .conventions}) | add) as $all
  | [{key: "*", value: $all.und}]
    + [ .[]
        | select(.id != "und")
        | .id as $id
        | ($id | split("-") | first) as $language
        | {
            key: $id,
            value: (.conventions
              | if $id == $language then without($all.und)
                else without($all[$language]) end)
          }
        | select(.value != {} or .key == $language) ]
  | "{\n" + (map(entry) | join(",\n")) + "\n}"
  | ascii
'
```

Run it with the languages to add:

```bash
bash cldr-date-conventions.sh fr de > locales/chronology.json
```

The output always starts with `*`, CLDR's defaults. Each language keeps only
what differs from `*`, and each regional variant only what differs from its
language; variants that differ in nothing are left out. A language entry is
always written, even if empty, to record that the language is supported.

Variants are compared with their language, not with the parent CLDR gives them,
because a language range only matches the tags it is a prefix of: CLDR makes
`es-AR` inherit from `es-419`, but the `es-419` range never matches `es-AR`.

## Adjust the conventions by hand

Edit the generated file to change what CLDR says. For example, to show
four-digit years in the short dates of the United States:

```json
{
  "en-US": {
    "shortDateFormat": "M/d/y"
  }
}
```

A file does not need `*`, nor every property of a range: it only needs what it
adds or changes. That makes a short file of overrides, loaded after Chalten's,
the simplest way to change a few conventions.

## Load the conventions

Load the file into the current locale conventions:

```smalltalk
LocaleConventions current loadJSONChronologyConventionsFrom:
  'locales/chronology.json' asFileReference
```

`loadJSONChronologyConventionsFromString:` does the same with JSON held in a
string. Both parse every format first, and reject the file if one uses a field
Chalten doesn't support. Load the date conventions with them rather than with
Buoy's general `loadJSONConventionsOf:from:`, which doesn't check the formats.

Each load merges the file's properties over the ones already loaded, so a
later load overrides an earlier one property by property. Chalten loads its own
file when Chalten is loaded, so an application loading its file afterwards
overrides Chalten's conventions where both define a property.

A good place to load it is a post-load action of the application's baseline,
as Chalten does: the conventions then become part of the image, and deployed
images do not need the file. In Pharo,
`BaselineOf >> withSourceDirectoryReferenceDo:` finds the directory the code was
loaded from:

```smalltalk
baseline: spec

  <baseline>
  spec for: #pharo do: [
    spec postLoadDoIt: #loadLocaleData.
    "..."
  ]
```

```smalltalk
loadLocaleData

  self withSourceDirectoryReferenceDo: [ :sourceDirectory |
    ( self classNamed: #LocaleConventions ) current loadJSONChronologyConventionsFrom:
      sourceDirectory parent / 'locales' / 'chronology.json' ]
```

In GemStone/S 64, do the same in a Rowan post-load script, finding the file
from the project's repository root:

```smalltalk
| root |
root := ( Rowan projectNamed: 'MyProject' ) repositoryRoot.
LocaleConventions current loadJSONChronologyConventionsFrom:
  root / 'locales' / 'chronology.json'
```

## Update to a newer CLDR release

Change `CLDR_VERSION` in the script to a
[cldr-json release](https://github.com/unicode-org/cldr-json/releases) and
generate the file again. Review the differences before committing them.
