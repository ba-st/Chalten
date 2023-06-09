Extension { #name : #Number }

{ #category : #'*Chalten-Core-Time' }
Number >> dayMeasure [

	^self daysMeasure 
]

{ #category : #'*Chalten-Core-Time' }
Number >> daysMeasure [

	^TimeUnits day with: self
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
Number >> secondMeasure [

	^self secondsMeasure
]

{ #category : #'*Chalten-Core-Time' }
Number >> secondsMeasure [

	^TimeUnits second with: self
]
