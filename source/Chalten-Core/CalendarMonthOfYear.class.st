"
A calendar month in a specific year.
Since the year is known it knows exactly its number of days, and can move forward and
backward in time by a month-quantity.
"
Class {
	#name : 'CalendarMonthOfYear',
	#superclass : 'CalendarMagnitude',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'testing' }
CalendarMonthOfYear class >> isAbstract [

  <ignoreForCoverage>
  ^ self = CalendarMonthOfYear
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> dateAt: number [

  self subclassResponsibility
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> eighteenth [

  ^ self dateAt: 18
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> eighth [

  ^ self dateAt: 8
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> eleventh [

  ^ self dateAt: 11
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> fifteenth [

  ^ self dateAt: 15
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> fifth [

  ^ self dateAt: 5
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> first [

  ^ self dateAt: 1
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> fourteenth [

  ^ self dateAt: 14
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> fourth [

  ^ self dateAt: 4
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> last [

  ^ self dateAt: self numberOfDays numericalValue
]

{ #category : 'accessing' }
CalendarMonthOfYear >> month [

  ^ self subclassResponsibility
]

{ #category : 'querying' }
CalendarMonthOfYear >> next [

  ^ self next: 1 * self class month
]

{ #category : 'querying' }
CalendarMonthOfYear >> next: relativeTimeQuantity [

  ^ self subclassResponsibility
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> nineteenth [

  ^ self dateAt: 19
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> ninth [

  ^ self dateAt: 9
]

{ #category : 'accessing' }
CalendarMonthOfYear >> numberOfDays [

  ^ self subclassResponsibility
]

{ #category : 'querying' }
CalendarMonthOfYear >> previous [

  ^ self previous: 1 * self class month
]

{ #category : 'querying' }
CalendarMonthOfYear >> previous: relativeTimeQuantity [

  ^ self subclassResponsibility
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> second [

  ^ self dateAt: 2
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> seventeenth [

  ^ self dateAt: 17
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> seventh [

  ^ self dateAt: 7
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> sixteenth [

  ^ self dateAt: 16
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> sixth [

  ^ self dateAt: 6
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> tenth [

  ^ self dateAt: 10
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> third [

  ^ self dateAt: 3
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> thirteenth [

  ^ self dateAt: 13
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> thirtieth [

  ^ self numberOfDays > ( 29 * self class day )
      then: [ self dateAt: 30 ]
      otherwise: [ super thirtieth ]
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twelfth [

  ^ self dateAt: 12
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twentieth [

  ^ self dateAt: 20
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twentyEighth [

  ^ self dateAt: 28
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twentyFifth [

  ^ self dateAt: 25
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twentyFirst [

  ^ self dateAt: 21
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twentyFourth [

  ^ self dateAt: 24
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twentySecond [

  ^ self dateAt: 22
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twentySeventh [

  ^ self dateAt: 27
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twentySixth [

  ^ self dateAt: 26
]

{ #category : 'accessing - dates' }
CalendarMonthOfYear >> twentyThird [

  ^ self dateAt: 23
]

{ #category : 'accessing' }
CalendarMonthOfYear >> year [

  ^ self subclassResponsibility
]
