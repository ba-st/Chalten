Class {
	#name : #GregorianMonthsOfYearsStreamTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Gregorian'
}

{ #category : #accessing }
GregorianMonthsOfYearsStreamTest class >> classUnderTest [

	^MonthsOfYearsStream
]

{ #category : #'test querying' }
GregorianMonthsOfYearsStreamTest >> testDistanceFromTo [

	| stream |
	stream := MonthsOfYearsStream startingOn: January, 2014.
	self assert: (stream distanceFrom: February, 2014 to: September, 2014) = 8 monthsMeasure.
	self assert: (stream distanceFrom: December, 2013 to: September, 2014) = 0 monthsMeasure
]

{ #category : #'test enumerating' }
GregorianMonthsOfYearsStreamTest >> testNext [
	| stream |
	stream := MonthsOfYearsStream startingOn: January, 2014.
	self assert: stream next = (February, 2014).
	self assert: (stream next: 12 monthsMeasure) = (February, 2015).
	self assert: (stream next: 25 monthsMeasure) = (March, 2017).
	self assert: (stream next: -25 monthsMeasure) = (February, 2015).
	self assert: (stream next: -12 monthsMeasure) = (February, 2014).
	self assert: (stream next: -1 monthMeasure) = (January, 2014)
]

{ #category : #'test enumerating' }
GregorianMonthsOfYearsStreamTest >> testNextInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: January, 2014.
	self assert: (stream nextInNumberOfYears: 3 yearsMeasure) = (January, 2017).
	self assert: (stream nextInNumberOfYears: -3 yearsMeasure) = (January, 2014)
]

{ #category : #'test enumerating' }
GregorianMonthsOfYearsStreamTest >> testNextMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: January, 2014.
	self assert: (stream nextMonth: May in: 3 yearsMeasure) = (May, 2017).
	self assert: (stream nextMonth: May in: -3 yearsMeasure) = (May, 2014)
]

{ #category : #'test enumerating' }
GregorianMonthsOfYearsStreamTest >> testPrevious [
	| stream |
	stream := MonthsOfYearsStream startingOn: January, 2014.
	self assert: stream previous = (December, 2013).
	self assert: (stream previous: 12 monthsMeasure) = (December, 2012).
	self assert: (stream previous: 25 monthsMeasure) = (November, 2010).
	self assert: (stream previous: -25 monthsMeasure) = (December, 2012).
	self assert: (stream previous: -12 monthsMeasure) = (December, 2013).
	self assert: (stream previous: -1 monthMeasure) = (January, 2014)
]

{ #category : #'test enumerating' }
GregorianMonthsOfYearsStreamTest >> testPreviousInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: January, 2014.
	self assert: (stream previousInNumberOfYears: 3 yearsMeasure) = (January, 2011).
	self assert: (stream previousInNumberOfYears: -3 yearsMeasure) = (January, 2014)
]

{ #category : #'test enumerating' }
GregorianMonthsOfYearsStreamTest >> testPreviousMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: January, 2014.
	self assert: (stream previousMonth: May in: 3 yearsMeasure) = (May, 2011).
	self assert: (stream previousMonth: May in: -3 yearsMeasure) = (May, 2014)
]
