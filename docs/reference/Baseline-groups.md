# Baseline Groups & GS 64 Components

## Pharo Baseline Groups

Chalten includes the following groups in its Baseline that can be used as
loading targets:

- `Core` will load all the packages needed in a deployed application supporting
  the absolute timeline and the Gregorian calendar.
- `Hebrew` will load additionally to Core the support for the Hebrew calendar.
- `Islamic` will load additionally to Core the support for the Islamic calendar.
- `Deployment` will load all the packages needed in a deployed application including
  all the supported calendars.
- `Tests` will load the test cases
- `Tools` will load tooling extensions
- `Dependent-SUnit-Extensions` will load extensions to SUnit
- `CI` is the group loaded in the continuous integration setup, in this
  particular case it is the same as `Tests`
- `Development` will load all the needed packages to develop and contribute to
   the project

## GS64 Components

Chalten includes the following components in its Rowan configuration that can be
used as loading targets:

- `Deployment` will load all the packages needed in a deployed application supporting
  the absolute timeline and the Gregorian calendar.
- `Tests` will load the test cases
- `Dependent-SUnit-Extensions` will load extensions to SUnit
