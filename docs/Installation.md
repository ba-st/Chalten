# Installation

## Basic Installation

You can load **Chalten** evaluating:
```smalltalk
Metacello new
	baseline: 'Chalten';
	repository: 'github://ba-st/Chalten:v{version}/source';
	load.
```
>  Change `{version}` to some released version if you want a pinned one.

## Using as dependency

In order to include **Chalten** as part of your project, you should reference the package in your product baseline:

```smalltalk
setUpDependencies: spec

	spec
		baseline: 'Chalten'
			with: [ spec
				repository: 'github://ba-st/Chalten:v{version}/source';
				loads: #('{Calendars}')];
		import: 'Chalten'.
```
> Replace `{version}` with the version you want to depend on

> Replace `{Calendars}` as a space-separated list with at least one of: 
- `Chalten-Gregorian-Calendar` to load the [Gregorian calendar](https://en.wikipedia.org/wiki/Gregorian_calendar)
- `Chalten-Hebrew-Calendar` to load the [Hebrew calendar](https://en.wikipedia.org/wiki/Hebrew_calendar)
- `Chalten-Islamic-Calendar` to load the [Islamic calendar](https://en.wikipedia.org/wiki/Islamic_calendar)
- `Chalten-Julian-Calendar` to load the [Julian calendar](https://en.wikipedia.org/wiki/Julian_calendar)
- `Chalten-Roman-Calendar` to load the [Roman calendar](https://en.wikipedia.org/wiki/Roman_calendar)

```smalltalk
baseline: spec

	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec package: 'My-Package' with: [ spec requires: #('Chalten') ] ]
```
## Platform Compatibility

| Pharo version | Chalten version |
| ----------- | ------------- |
| Previous to 6.0 | Go to https://github.com/mtaborda/chalten |
| 6.0 | Use v6 |
| 6.1 or 7.0 | Use v7 |

