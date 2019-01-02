#Installation

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
				loads: #('Chalten-Core {Calendars}')];
		import: 'Chalten'.
```
> Replace `{version}` with the version you want to depend on

> Replace `{Calendars}` with at least one of: 
- `Chalten-Core-Gregorian` to load the Gregorian calendar 
- `Chalten-Core-Hebrew` to load the Hebrew calendar 
- `Chalten-Core-Islamic` to load the Islamic calendar 
- `Chalten-Core-Julian` to load the Julian calendar 
- `Chalten-Core-Roman` to load the Roman calendar 

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

