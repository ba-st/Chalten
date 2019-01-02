Extension { #name : #Number }

{ #category : #'*Chalten-Core-Time' }
Number >> centuriesMeasure [

	^TimeUnits century with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> centuryMeasure [

	^self centuriesMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> dayMeasure [

	^self daysMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> daysMeasure [

	^TimeUnits day with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> decadeMeasure [

	^self decadesMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> decadesMeasure [

	^TimeUnits decade with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> hourMeasure [

	^self hoursMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> hoursMeasure [

	^TimeUnits hour with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> millenniumMeasure [

	^self millenniumsMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> millenniumsMeasure [

	^TimeUnits millennium with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> millisecondMeasure [

	^self millisecondsMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> millisecondsMeasure [

	^TimeUnits millisecond with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> minuteMeasure [

	^self minutesMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> minutesMeasure [

	^TimeUnits minute with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> monthMeasure [

	^self monthsMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> monthsMeasure [

	^TimeUnits month with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> secondMeasure [

	^self secondsMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> secondsMeasure [

	^TimeUnits second with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> weekMeasure [

	^self weeksMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> weeksMeasure [

	^TimeUnits week with: self
]

{ #category : #'*Chalten-Core-Time' }
Number >> yearMeasure [

	^self yearsMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> yearsMeasure [

	^TimeUnits year with: self
]
