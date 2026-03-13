"
A calendar month in a specific year.
Since the year is known it knows exactly its number of days, and can move forward and
backward in time by a month-quantity.
"
Class {
	#name : 'CalendaMonthOfYear',
	#superclass : 'CalendarMagnitude',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'testing' }
CalendaMonthOfYear class >> isAbstract [

  ^ self = CalendaMonthOfYear
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> dateAt: number [

  self subclassResponsibility
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> eighteenth [

  ^ self dateAt: 18
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> eighth [

  ^ self dateAt: 8
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> eleventh [

  ^ self dateAt: 11
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> fifteenth [

  ^ self dateAt: 15
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> fifth [

  ^ self dateAt: 5
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> first [

  ^ self dateAt: 1
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> fourteenth [

  ^ self dateAt: 14
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> fourth [

  ^ self dateAt: 4
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> last [

  ^ self dateAt: self numberOfDays numericalValue
]

{ #category : 'accessing' }
CalendaMonthOfYear >> month [

  ^ self subclassResponsibility
]

{ #category : 'querying' }
CalendaMonthOfYear >> next [

  ^ self next: 1 * self class month
]

{ #category : 'querying' }
CalendaMonthOfYear >> next: relativeTimeQuantity [

  ^ self subclassResponsibility
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> nineteenth [

  ^ self dateAt: 19
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> ninth [

  ^ self dateAt: 9
]

{ #category : 'accessing' }
CalendaMonthOfYear >> numberOfDays [

  ^ self subclassResponsibility
]

{ #category : 'querying' }
CalendaMonthOfYear >> previous [

  ^ self previous: 1 * self class month
]

{ #category : 'querying' }
CalendaMonthOfYear >> previous: relativeTimeQuantity [

  ^ self subclassResponsibility
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> second [

  ^ self dateAt: 2
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> seventeenth [

  ^ self dateAt: 17
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> seventh [

  ^ self dateAt: 7
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> sixteenth [

  ^ self dateAt: 16
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> sixth [

  ^ self dateAt: 6
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> tenth [

  ^ self dateAt: 10
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> third [

  ^ self dateAt: 3
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> thirteenth [

  ^ self dateAt: 13
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> thirtieth [

  ^ self numberOfDays > ( 29 * self class day )
      then: [ self dateAt: 30 ]
      otherwise: [ super thirtieth ]
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twelfth [

  ^ self dateAt: 12
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twentieth [

  ^ self dateAt: 20
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twentyEighth [

  ^ self dateAt: 28
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twentyFifth [

  ^ self dateAt: 25
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twentyFirst [

  ^ self dateAt: 21
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twentyFourth [

  ^ self dateAt: 24
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twentySecond [

  ^ self dateAt: 22
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twentySeventh [

  ^ self dateAt: 27
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twentySixth [

  ^ self dateAt: 26
]

{ #category : 'accessing - dates' }
CalendaMonthOfYear >> twentyThird [

  ^ self dateAt: 23
]

{ #category : 'accessing' }
CalendaMonthOfYear >> year [

  ^ self subclassResponsibility
]
