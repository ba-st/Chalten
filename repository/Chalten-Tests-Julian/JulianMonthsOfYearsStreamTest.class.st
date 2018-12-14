Class {
	#name : #JulianMonthsOfYearsStreamTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Julian'
}

{ #category : #accessing }
JulianMonthsOfYearsStreamTest class >> classUnderTest [

	^MonthsOfYearsStream
]

{ #category : #'test querying' }
JulianMonthsOfYearsStreamTest >> testDistanceFromTo [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary, 2014.
	self assert: (stream distanceFrom: JulianFebruary, 2014 to: JulianSeptember, 2014) = 8 monthsMeasure.
	self assert: (stream distanceFrom: JulianDecember, 2013 to: JulianSeptember, 2014) = 0 monthsMeasure
]

{ #category : #'test enumerating' }
JulianMonthsOfYearsStreamTest >> testNext [
	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary, 2014.
	self assert: stream next = (JulianFebruary, 2014).
	self assert: (stream next: 12 monthsMeasure) = (JulianFebruary, 2015).
	self assert: (stream next: 25 monthsMeasure) = (JulianMarch, 2017).
	self assert: (stream next: -25 monthsMeasure) = (JulianFebruary, 2015).
	self assert: (stream next: -12 monthsMeasure) = (JulianFebruary, 2014).
	self assert: (stream next: -1 monthMeasure) = (JulianJanuary, 2014)
]

{ #category : #'test enumerating' }
JulianMonthsOfYearsStreamTest >> testNextInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary, 2014.
	self assert: (stream nextInNumberOfYears: 3 yearsMeasure) = (JulianJanuary, 2017).
	self assert: (stream nextInNumberOfYears: -3 yearsMeasure) = (JulianJanuary, 2014)
]

{ #category : #'test enumerating' }
JulianMonthsOfYearsStreamTest >> testNextMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary, 2014.
	self assert: (stream nextMonth: May in: 3 yearsMeasure) = (JulianMay, 2017).
	self assert: (stream nextMonth: May in: -3 yearsMeasure) = (JulianMay, 2014)
]

{ #category : #'test enumerating' }
JulianMonthsOfYearsStreamTest >> testPrevious [
	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary, 2014.
	self assert: stream previous = (JulianDecember, 2013).
	self assert: (stream previous: 12 monthsMeasure) = (JulianDecember, 2012).
	self assert: (stream previous: 25 monthsMeasure) = (JulianNovember, 2010).
	self assert: (stream previous: -25 monthsMeasure) = (JulianDecember, 2012).
	self assert: (stream previous: -12 monthsMeasure) = (JulianDecember, 2013).
	self assert: (stream previous: -1 monthMeasure) = (JulianJanuary, 2014)
]

{ #category : #'test enumerating' }
JulianMonthsOfYearsStreamTest >> testPreviousInNumberOfYears [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary, 2014.
	self assert: (stream previousInNumberOfYears: 3 yearsMeasure) = (JulianJanuary, 2011).
	self assert: (stream previousInNumberOfYears: -3 yearsMeasure) = (JulianJanuary, 2014)
]

{ #category : #'test enumerating' }
JulianMonthsOfYearsStreamTest >> testPreviousMonthIn [

	| stream |
	stream := MonthsOfYearsStream startingOn: JulianJanuary, 2014.
	self assert: (stream previousMonth: May in: 3 yearsMeasure) = (JulianMay, 2011).
	self assert: (stream previousMonth: May in: -3 yearsMeasure) = (JulianMay, 2014)
]
