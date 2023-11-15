Class {
	#name : 'IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest',
	#superclass : 'TestCase',
	#instVars : [
		'islamicCalendar'
	],
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'running' }
IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest >> setUp [

	islamicCalendar := ChaltenEnvironment calendarNamed: #IslamicCalendar
]

{ #category : 'test querying' }
IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest >> testDistanceFromTo [

	| strategy |
	strategy := MonthsOfNonleapYearsForCircularStreamStrategy of:
		            islamicCalendar.
	self
		assert: (strategy distanceFrom: Muharram to: RabiI)
		equals: 2 monthsMeasure.
	self
		assert: (strategy distanceFrom: RabiII to: Ramadan)
		equals: 5 monthsMeasure.
	self
		assert: (strategy distanceFrom: DhuAlQada to: Safar)
		equals: 3 monthsMeasure.
	self
		assert: (strategy distanceFrom: Shaban to: JumadaI)
		equals: 9 monthsMeasure.
	self
		assert: (strategy distanceFrom: Shawwal to: DhuAlHijja)
		equals: 2 monthsMeasure
]

{ #category : 'test enumerating' }
IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest >> testNextFrom [

	| strategy |
	strategy := MonthsOfNonleapYearsForCircularStreamStrategy of:
		            islamicCalendar.
	self
		assert: (strategy next: 2 monthsMeasure from: Muharram)
		equals: RabiI.
	self
		assert: (strategy next: 5 monthsMeasure from: RabiII)
		equals: Ramadan.
	self
		assert: (strategy next: 3 monthsMeasure from: DhuAlQada)
		equals: Safar.
	self
		assert: (strategy next: 9 monthsMeasure from: Shaban)
		equals: JumadaI.
	self
		assert: (strategy next: 2 monthsMeasure from: Shawwal)
		equals: DhuAlHijja
]
