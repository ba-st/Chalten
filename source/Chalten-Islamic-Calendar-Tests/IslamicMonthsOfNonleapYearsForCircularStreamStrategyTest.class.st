Class {
	#name : #IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest,
	#superclass : #TestCase,
	#category : #'Chalten-Islamic-Calendar-Tests'
}

{ #category : #'test querying' }
IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest >> testDistanceFromTo [
	| strategy |
	strategy := MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar.
	self assert: (strategy distanceFrom: Muharram to: RabiI) = 2 islamicMonths.
	self assert: (strategy distanceFrom: RabiII to: Ramadan) = 5 islamicMonths.
	self assert: (strategy distanceFrom: DhuAlQada to: Safar) = 3 islamicMonths.
	self assert: (strategy distanceFrom: Shaban to: JumadaI) = 9 islamicMonths.
	self assert: (strategy distanceFrom: Shawwal to: DhuAlHijja) = 2 islamicMonths
]

{ #category : #'test enumerating' }
IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest >> testNextFrom [
	| strategy |
	strategy := MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar.
	self assert: (strategy next: 2 islamicMonths from: Muharram) = RabiI.
	self assert: (strategy next: 5 islamicMonths from: RabiII) = Ramadan.
	self assert: (strategy next: 3 islamicMonths from: DhuAlQada) = Safar.
	self assert: (strategy next: 9 islamicMonths from: Shaban) = JumadaI.
	self assert: (strategy next: 2 islamicMonths from: Shawwal) = DhuAlHijja
]
