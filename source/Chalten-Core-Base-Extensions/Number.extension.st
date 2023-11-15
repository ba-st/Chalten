Extension { #name : 'Number' }

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> asGregorianYear [

	^ ChaltenYear
		  number: self
		  calendar: (ChaltenEnvironment calendarNamed: #GregorianCalendar)
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> asHebrewYear [

	^ ChaltenYear
		  number: self
		  calendar: (ChaltenEnvironment calendarNamed: #HebrewCalendar)
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> asIslamicYear [

	^ ChaltenYear
		  number: self
		  calendar: (ChaltenEnvironment calendarNamed: #IslamicCalendar)
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> asJulianYear [

	^ ChaltenYear
		  number: self
		  calendar: (ChaltenEnvironment calendarNamed: #JulianCalendar)
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> centuriesMeasure [

	^TimeUnits century with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> centuryMeasure [

	^self centuriesMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> dayMeasure [

	^self daysMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> daysMeasure [

	^TimeUnits day with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> decadeMeasure [

	^self decadesMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> decadesMeasure [

	^TimeUnits decade with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> hourMeasure [

	^self hoursMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> hoursMeasure [

	^TimeUnits hour with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> millenniumMeasure [

	^self millenniumsMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> millenniumsMeasure [

	^TimeUnits millennium with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> millisecondMeasure [

	^self millisecondsMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> millisecondsMeasure [

	^TimeUnits millisecond with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> minuteMeasure [

	^self minutesMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> minutesMeasure [

	^TimeUnits minute with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> monthMeasure [

	^self monthsMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> monthsMeasure [

	^TimeUnits month with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> secondMeasure [

	^self secondsMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> secondsMeasure [

	^TimeUnits second with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> weekMeasure [

	^self weeksMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> weeksMeasure [

	^TimeUnits week with: self
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> yearMeasure [

	^self yearsMeasure
]

{ #category : '*Chalten-Core-Base-Extensions' }
Number >> yearsMeasure [

	^TimeUnits year with: self
]
