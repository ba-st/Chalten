Class {
	#name : #HebrewMonthsOfYearsStreamTest,
	#superclass : #TestCase,
	#category : #'Chalten-Hebrew-Calendar-Tests'
}

{ #category : #accessing }
HebrewMonthsOfYearsStreamTest class >> classUnderTest [

	^MonthsOfYearsStream
]

{ #category : #'test querying' }
HebrewMonthsOfYearsStreamTest >> testDistanceFromTo [

	| stream |
	stream := MonthsOfYearsStream startingOn: Tishri, 5774.
	self assert: (stream distanceFrom: Tishri, 5774 to: Kislev, 5774) = 2 monthsMeasure.
	self assert: (stream distanceFrom: Adar, 5773 to: Kislev, 5774) = 0 monthsMeasure
]

{ #category : #'test enumerating' }
HebrewMonthsOfYearsStreamTest >> testNext [
	| stream |
	stream := MonthsOfYearsStream startingOn: Tishri, 5774.
	self assert: stream next = (Marheshvan, 5774).
	self assert: (stream next: 12 monthsMeasure) = (Tishri, 5775).
	self assert: (stream next: 25 monthsMeasure) = (Tishri, 5777).
	self assert: (stream next: -25 monthsMeasure) = (Tishri, 5775).
	self assert: (stream next: -12 monthsMeasure) = (Marheshvan, 5774).
	self assert: (stream next: -1 monthMeasure) = (Tishri, 5774)
]

{ #category : #'test enumerating' }
HebrewMonthsOfYearsStreamTest >> testNextInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: Tishri, 5774.
	self assert: (stream nextInNumberOfYears: 3 yearsMeasure) = (Tishri, 5777).
	self assert: (stream nextInNumberOfYears: -3 yearsMeasure) = (Tishri, 5774)
]

{ #category : #'test enumerating' }
HebrewMonthsOfYearsStreamTest >> testNextMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: Tishri, 5774.
	self assert: (stream nextMonth: Kislev in: 3 yearsMeasure) = (Kislev, 5777).
	self assert: (stream nextMonth: Kislev in: -3 yearsMeasure) = (Kislev, 5774)
]

{ #category : #'test enumerating' }
HebrewMonthsOfYearsStreamTest >> testPrevious [
	| stream |
	stream := MonthsOfYearsStream startingOn: Tishri, 5775.
	self assert: stream previous = (Elul, 5774).
	self assert: (stream previous: 12 monthsMeasure) = (Tishri, 5774).
	self assert: (stream previous: 25 monthsMeasure) = (Elul, 5771).
	self assert: (stream previous: -25 monthsMeasure) = (Tishri, 5774).
	self assert: (stream previous: -12 monthsMeasure) = (Elul, 5774).
	self assert: (stream previous: -1 monthMeasure) = (Tishri, 5775)
]

{ #category : #'test enumerating' }
HebrewMonthsOfYearsStreamTest >> testPreviousInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: Tishri, 5774.
	self assert: (stream previousInNumberOfYears: 3 yearsMeasure) = (Tishri, 5771).
	self assert: (stream previousInNumberOfYears: -3 yearsMeasure) = (Tishri, 5774)
]

{ #category : #'test enumerating' }
HebrewMonthsOfYearsStreamTest >> testPreviousMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: Tishri, 5774.
	self assert: (stream previousMonth: Kislev in: 3 yearsMeasure) = (Kislev, 5771).
	self assert: (stream previousMonth: Kislev in: -3 yearsMeasure) = (Kislev, 5774)
]
