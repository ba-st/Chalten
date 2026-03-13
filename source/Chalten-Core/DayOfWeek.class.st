"
A calendar day of week. In the ISO calendar, a day amongst the sequence of week calendar
days, namely, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday or Sunday.
In the ISO Calendar definition, a week begins on Monday and ends on Sunday.
"
Class {
	#name : 'DayOfWeek',
	#superclass : 'CalendarDayOfWeek',
	#classVars : [
		'WellKnownDays'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'private' }
DayOfWeek class >> dayAt: positionInWeek [

  ^ WellKnownDays at: positionInWeek
]

{ #category : 'accessing' }
DayOfWeek class >> friday [

  ^ self dayAt: 5
]

{ #category : 'class initialization' }
DayOfWeek class >> initialize [

  <ignoreForCoverage>
  WellKnownDays := { self named: 'Monday' shortNamed: 'Mo' positionInWeeek: 1 .
                     self named: 'Tuesday' shortNamed: 'Tu' positionInWeeek: 2 .
                     self named: 'Wednesday' shortNamed: 'We' positionInWeeek: 3 .
                    	self named: 'Thursday' shortNamed: 'Th' positionInWeeek: 4 .
                     self named: 'Friday' shortNamed: 'Fr' positionInWeeek: 5 .
                     self named: 'Saturday' shortNamed: 'Sa' positionInWeeek: 6 .
                    	self named: 'Sunday' shortNamed: 'Su' positionInWeeek: 7 }.
  WellKnownDays
    with: #(Monday Tuesday Wednesday Thursday Friday Saturday Sunday )
    do: [ :day :symbol | LanguagePlatform current globalNamed: symbol ifAbsentPut: [ day ] ]
]

{ #category : 'accessing' }
DayOfWeek class >> monday [

  ^ self dayAt: 1
]

{ #category : 'accessing' }
DayOfWeek class >> saturday [

  ^ self dayAt: 6
]

{ #category : 'accessing' }
DayOfWeek class >> sunday [

  ^ self dayAt: 7
]

{ #category : 'accessing' }
DayOfWeek class >> thursday [

  ^ self dayAt: 4
]

{ #category : 'accessing' }
DayOfWeek class >> tuesday [

  ^ self dayAt: 2
]

{ #category : 'accessing' }
DayOfWeek class >> wednesday [

  ^ self dayAt: 3
]

{ #category : 'converting' }
DayOfWeek >> asISODayOfWeek [

  ^ self
]
