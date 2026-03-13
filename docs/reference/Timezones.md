# Timezones

A time zone is unambiguously defined by the set of time measurement rules determined
by the governing body for a given geographic area.

These rules describe, at a minimum, the base offset from UTC for the time zone,
often referred to as the Standard Time offset.

- Many locations adjust their Standard Time forward or backward by one hour, in
  order to accommodate seasonal changes in number of daylight hours, often referred
  to as Daylight Saving Time.
- Some locations adjust their time by a fraction of an hour.
- Standard Time is also known as Winter Time.
- Daylight Saving Time is also known as Advanced, Summer, or Legal Time
  in certain countries.

In this library timezones are modeled as instances of `TimeZoneRuleset`: They can
respond the offset against UTC at a given instant by sending `offsetToUniversalCoordinatedTimeAt:`
and provide facilities for converting relative points in time to absolute ones
using the timezone rules.

Time zone rulesets can be obtained from the IANA time zone database.

## `IANATimeZoneDatabase`

`IANATimeZoneDatabase` provides access to the IANA Time zone database.

The location of the database files can be configured sending `zoneInfoLocation:`.

- On Windows the users need to configure this location because there's no standard
  place where this database is located.
- On Unix if the `zoneInfoLocation` is not configured, lookup the value on the
  `TZDIR` environment variable, if the variable is not defined default to `/usr/share/zoneinfo/`.

To access the available time zones send `IANATimeZoneDatabase current timeZoneIdentifiers`
and to access a specific time zone ruleset send
 `IANATimeZoneDatabase current at: {timeZoneId}`.

To reload the database send `IANATimeZoneDatabase current reloadAllTimeZoneRulesets`

## Fixed offsets

The library also provides `FixedOffsetRuleset` that models a ruleset with a fixed
offset against UTC. It can be used in any of the methods that accept a timezone
for the use cases where a fixed offset is needed.
