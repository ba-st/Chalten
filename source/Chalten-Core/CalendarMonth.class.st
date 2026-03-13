"
I'm an abstract representation of a calendar month.

"
Class {
	#name : 'CalendarMonth',
	#superclass : 'Object',
	#instVars : [
		'name',
		'shortName'
	],
	#category : 'Chalten-Core',
	#package : 'Chalten-Core',
	#'gs_options' : [
		'instancesInvariant'
	]
}

{ #category : 'accessing' }
CalendarMonth class >> day [

  ^ InternationalSystemOfUnits units >> #day
]

{ #category : 'instance creation' }
CalendarMonth >> , yearNumber [

  ^ self subclassResponsibility
]

{ #category : 'private' }
CalendarMonth >> dayOfMonthAt: dayNumber [

  ^ self subclassResponsibility
]

{ #category : 'accessing - days' }
CalendarMonth >> eighteenth [

  ^ self dayOfMonthAt: 18
]

{ #category : 'accessing - days' }
CalendarMonth >> eighth [

  ^ self dayOfMonthAt: 8
]

{ #category : 'accessing - days' }
CalendarMonth >> eleventh [

  ^ self dayOfMonthAt: 11
]

{ #category : 'accessing - days' }
CalendarMonth >> fifteenth [

  ^ self dayOfMonthAt: 15
]

{ #category : 'accessing - days' }
CalendarMonth >> fifth [

  ^ self dayOfMonthAt: 5
]

{ #category : 'accessing - days' }
CalendarMonth >> first [

  ^ self dayOfMonthAt: 1
]

{ #category : 'accessing - days' }
CalendarMonth >> fourteenth [

  ^ self dayOfMonthAt: 14
]

{ #category : 'accessing - days' }
CalendarMonth >> fourth [

  ^ self dayOfMonthAt: 4
]

{ #category : 'testing' }
CalendarMonth >> isGregorian [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarMonth >> name [

  ^ name localized
]

{ #category : 'accessing - days' }
CalendarMonth >> nineteenth [

  ^ self dayOfMonthAt: 19
]

{ #category : 'accessing - days' }
CalendarMonth >> ninth [

  ^ self dayOfMonthAt: 9
]

{ #category : 'printing' }
CalendarMonth >> printOn: stream [

	stream nextPutAll: name
]

{ #category : 'accessing - days' }
CalendarMonth >> second [

  ^ self dayOfMonthAt: 2
]

{ #category : 'accessing - days' }
CalendarMonth >> seventeenth [

  ^ self dayOfMonthAt: 17
]

{ #category : 'accessing - days' }
CalendarMonth >> seventh [

  ^ self dayOfMonthAt: 7
]

{ #category : 'accessing' }
CalendarMonth >> shortName [

  ^ shortName localized
]

{ #category : 'accessing - days' }
CalendarMonth >> sixteenth [

  ^ self dayOfMonthAt: 16
]

{ #category : 'accessing - days' }
CalendarMonth >> sixth [

  ^ self dayOfMonthAt: 6
]

{ #category : 'accessing - days' }
CalendarMonth >> tenth [

  ^ self dayOfMonthAt: 10
]

{ #category : 'accessing - days' }
CalendarMonth >> third [

  ^ self dayOfMonthAt: 3
]

{ #category : 'accessing - days' }
CalendarMonth >> thirteenth [

  ^ self dayOfMonthAt: 13
]

{ #category : 'accessing - days' }
CalendarMonth >> twelfth [

  ^ self dayOfMonthAt: 12
]

{ #category : 'accessing - days' }
CalendarMonth >> twentieth [

  ^ self dayOfMonthAt: 20
]

{ #category : 'accessing - days' }
CalendarMonth >> twentyEighth [

  ^ self dayOfMonthAt: 28
]

{ #category : 'accessing - days' }
CalendarMonth >> twentyFifth [

  ^ self dayOfMonthAt: 25
]

{ #category : 'accessing - days' }
CalendarMonth >> twentyFirst [

  ^ self dayOfMonthAt: 21
]

{ #category : 'accessing - days' }
CalendarMonth >> twentyFourth [

  ^ self dayOfMonthAt: 24
]

{ #category : 'accessing - days' }
CalendarMonth >> twentyNinth [

  ^ self dayOfMonthAt: 29
]

{ #category : 'accessing - days' }
CalendarMonth >> twentySecond [

  ^ self dayOfMonthAt: 22
]

{ #category : 'accessing - days' }
CalendarMonth >> twentySeventh [

  ^ self dayOfMonthAt: 27
]

{ #category : 'accessing - days' }
CalendarMonth >> twentySixth [

  ^ self dayOfMonthAt: 26
]

{ #category : 'accessing - days' }
CalendarMonth >> twentyThird [

  ^ self dayOfMonthAt: 23
]
