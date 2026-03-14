Class {
	#name : 'CalendarMagnitude',
	#superclass : 'Magnitude',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core',
	#'gs_options' : [
		'instancesInvariant'
	]
}

{ #category : 'accessing - time units' }
CalendarMagnitude class >> day [

  ^ InternationalSystemOfUnits units >> #day
]

{ #category : 'testing' }
CalendarMagnitude class >> isAbstract [

  <ignoreForCoverage>
  ^ self = CalendarMagnitude
]

{ #category : 'accessing - time units' }
CalendarMagnitude class >> month [

  ^ TimeUnits units >> #month
]

{ #category : 'accessing - time units' }
CalendarMagnitude class >> year [

  ^ TimeUnits units >> #year
]
