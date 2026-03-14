"
I'm an abstract representation of a calendar year.
In general a calendar year is a structured system for organizing days into
a recurring cycle based on the Earth's orbit around the Sun or the Moon's phases.
"
Class {
	#name : 'CalendarYear',
	#superclass : 'CalendarMagnitude',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'private - asserting' }
CalendarYear class >> assertIsValid: anInteger [

  AssertionChecker
    enforce: [ anInteger isInteger ]
    because: [
        '{1} is an invalid number for a year in the {2} calendar' localizedWithAll:
          { anInteger . self calendarName }
      ]
    raising: InstanceCreationFailed
]

{ #category : 'private - accessing' }
CalendarYear class >> calendarName [

  ^ self subclassResponsibility
]

{ #category : 'testing' }
CalendarYear class >> isAbstract [

  <ignoreForCoverage>
  ^ self = CalendarYear
]

{ #category : 'testing' }
CalendarYear >> < aCalendarYear [

  self assertIsCommensurableWith: aCalendarYear.
  ^ self number < aCalendarYear number
]

{ #category : 'private' }
CalendarYear >> assertIsCommensurableWith: aCalendarYear [

  AssertionChecker
    enforce: [ aCalendarYear isA: self class ]
    because: [ 'Years in different time scales are incommensurable' localized ]
    raising: ArithmeticError
]

{ #category : 'accessing' }
CalendarYear >> firstDate [

  ^ self subclassResponsibility
]

{ #category : 'testing' }
CalendarYear >> isLeapYear [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarYear >> lastDate [

  ^ self subclassResponsibility
]

{ #category : 'querying' }
CalendarYear >> next [

  ^ self class number: self number + 1
]

{ #category : 'querying' }
CalendarYear >> next: relativeTimeQuantity [

  ^ self class number:
      self number + ( relativeTimeQuantity convertTo: self class year ) numericalValue
]

{ #category : 'accessing' }
CalendarYear >> number [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarYear >> numberOfDays [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarYear >> numberOfMonths [

  ^ self subclassResponsibility
]

{ #category : 'querying' }
CalendarYear >> previous [

  ^ self class number: self number - 1
]

{ #category : 'querying' }
CalendarYear >> previous: relativeTimeQuantity [

  ^ self next: relativeTimeQuantity negated
]
