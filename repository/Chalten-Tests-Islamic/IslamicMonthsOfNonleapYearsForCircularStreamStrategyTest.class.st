Class {
	#name : #IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Islamic'
}

{ #category : #'test querying' }
IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest >> testDistanceFromTo [
	| strategy |
	strategy := MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar.
	self assert: (strategy distanceFrom: Muharram to: RabiI) = 2 monthsMeasure.
	self assert: (strategy distanceFrom: RabiII to: Ramadan) = 5 monthsMeasure.
	self assert: (strategy distanceFrom: DhuAlQada to: Safar) = 3 monthsMeasure.
	self assert: (strategy distanceFrom: Shaban to: JumadaI) = 9 monthsMeasure.
	self assert: (strategy distanceFrom: Shawwal to: DhuAlHijja) = 2 monthsMeasure
]

{ #category : #'test enumerating' }
IslamicMonthsOfNonleapYearsForCircularStreamStrategyTest >> testNextFrom [
	| strategy |
	strategy := MonthsOfNonleapYearsForCircularStreamStrategy of: IslamicCalendar.
	self assert: (strategy next: 2 monthsMeasure from: Muharram) = RabiI.
	self assert: (strategy next: 5 monthsMeasure from: RabiII) = Ramadan.
	self assert: (strategy next: 3 monthsMeasure from: DhuAlQada) = Safar.
	self assert: (strategy next: 9 monthsMeasure from: Shaban) = JumadaI.
	self assert: (strategy next: 2 monthsMeasure from: Shawwal) = DhuAlHijja
]
