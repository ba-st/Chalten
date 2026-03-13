"
A particular calendar day represented by its calendar year, its calendar month and its day of month

"
Class {
	#name : 'CalendarDate',
	#superclass : 'CalendarMagnitude',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'private - asserting' }
CalendarDate class >> assert: aDayNumber isValidIn: aCalendarMonthOfYear [

  AssertionChecker
    enforce: [ aDayNumber between: 1 and: aCalendarMonthOfYear numberOfDays numericalValue ]
    because: [
      '{1} is an invalid day number in {2}' localizedWithAll: { aDayNumber . aCalendarMonthOfYear } ]
    raising: InstanceCreationFailed
]

{ #category : 'testing' }
CalendarDate class >> isAbstract [

  ^ self = CalendarDate
]

{ #category : 'querying' }
CalendarDate >> + anObject [

  ^ anObject additionWithCalendarDate: self
]

{ #category : 'querying' }
CalendarDate >> - anObject [

  ^ anObject subtractionFromCalendarDate: self
]

{ #category : 'accessing' }
CalendarDate >> at: timeOfDay [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarDate >> atMidnight [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarDate >> atNoon [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarDate >> atStartOfDay [

  ^ self at: TimeOfDay startOfDay
]

{ #category : 'accessing' }
CalendarDate >> dayNumber [

  ^ self subclassResponsibility
]

{ #category : 'querying' }
CalendarDate >> dayOfWeek [

  ^ self subclassResponsibility
]

{ #category : 'testing' }
CalendarDate >> isComparableTo: aQuantity [

  ^ aQuantity unit isCommensurableWith: self class day
]

{ #category : 'accessing' }
CalendarDate >> month [

  ^ self monthOfYear month
]

{ #category : 'accessing' }
CalendarDate >> monthNumber [

  ^ self subclassResponsibility
]

{ #category : 'accessing' }
CalendarDate >> monthOfYear [

  ^ self subclassResponsibility
]

{ #category : 'querying' }
CalendarDate >> next [

  | nextDayNumber |
  nextDayNumber := self dayNumber + 1.
  ^ nextDayNumber > self monthOfYear numberOfDays numericalValue
      ifTrue: [ self monthOfYear next first ]
      ifFalse: [ self monthOfYear dateAt: nextDayNumber ]
]

{ #category : 'querying' }
CalendarDate >> next: timeQuantity [

  | daysUntilEndOfYear |
  timeQuantity isZero then: [ ^ self ].
  timeQuantity negative then: [ ^ self previous: timeQuantity abs ].
  daysUntilEndOfYear := self year lastDate - self.
  ^ timeQuantity <= daysUntilEndOfYear
      then: [ "We're moving in the same calendar year"
          | daysUntilEndOfMonth |
          daysUntilEndOfMonth := self monthOfYear last - self.
          timeQuantity <= daysUntilEndOfMonth
            then: [ "We're moving in the same month"
                self monthOfYear dateAt:
                  self dayNumber + ( timeQuantity convertTo: self class day ) numericalValue ]
            otherwise: [
                | remainingDays |
                remainingDays := timeQuantity - daysUntilEndOfMonth.
                self monthOfYear next first next: remainingDays - self oneDay
              ]
        ]
      otherwise: [
          | remainingDays |
          remainingDays := timeQuantity - daysUntilEndOfYear.
          self year next firstDate next: remainingDays - self oneDay
        ]
]

{ #category : 'private - querying' }
CalendarDate >> oneDay [

  ^ 1 * self class day
]

{ #category : 'querying' }
CalendarDate >> previous [

  | previousDayNumber |
  previousDayNumber := self dayNumber - 1.
  ^ previousDayNumber isZero
      then: [ self monthOfYear previous last ]
      otherwise: [ self monthOfYear dateAt: previousDayNumber ]
]

{ #category : 'querying' }
CalendarDate >> previous: timeQuantity [

  | daysFromStartOfYear |
  timeQuantity isZero then: [ ^ self ].
  timeQuantity negative then: [ ^ self next: timeQuantity abs ].
  daysFromStartOfYear := self - self year firstDate.
  ^ timeQuantity < daysFromStartOfYear
      then: [
          | daysFromStartOfMonth |
          "We're moving in the same calendar year"
          daysFromStartOfMonth := self dayNumber * self class day.
          timeQuantity < daysFromStartOfMonth
            then: [ "We're moving in the same month"
                self monthOfYear dateAt:
                  self dayNumber - ( timeQuantity convertTo: self class day ) numericalValue ]
            otherwise: [
                | remainingDays |
                remainingDays := timeQuantity - daysFromStartOfMonth.
                self monthOfYear previous last previous: remainingDays
              ]
        ]
      otherwise: [
          | remainingDays |
          remainingDays := timeQuantity - daysFromStartOfYear - ( 1 * self class day ).
          self year previous lastDate previous: remainingDays
        ]
]

{ #category : 'private - querying' }
CalendarDate >> subtractionFromCalendarDate: endDate [
  "Returns the time in days between two dates"

  | startDate currentYear currentCount |
  startDate := self.
  endDate = startDate then: [ ^ 0 * endDate class day ].
  AssertionChecker
    enforce: [ endDate > startDate ]
    because:
   ['Cannot subtract two dates when the second one is greater than the first one.' localized]
    raising: ArithmeticError.
  "Are we in the same month of year?"
  endDate monthOfYear = startDate monthOfYear then: [
      ^ endDate dayNumber - startDate dayNumber * endDate class day ].
  "Are we in the same year, but different month?"
  endDate year = startDate year then: [
      | intermediateDayCount currentMonthOfYear |
      intermediateDayCount := endDate oneDay.
      currentMonthOfYear := startDate monthOfYear next.
      [ currentMonthOfYear < endDate monthOfYear ] whileTrue: [
          intermediateDayCount := intermediateDayCount + currentMonthOfYear numberOfDays.
          currentMonthOfYear := currentMonthOfYear next
        ].
      ^ startDate monthOfYear last - startDate + intermediateDayCount
        + ( endDate - endDate monthOfYear first )
    ].
  "We are in different years"
  currentYear := startDate year next.
  currentCount := endDate oneDay.
  [ currentYear < endDate year ] whileTrue: [
      currentCount := currentCount + currentYear numberOfDays.
      currentYear := currentYear next
    ].
  ^ startDate year lastDate - startDate + currentCount + ( endDate - endDate year firstDate )
]

{ #category : 'interval creation' }
CalendarDate >> to: aGregorianDate [

  ^ self to: aGregorianDate by: self oneDay
]

{ #category : 'interval creation' }
CalendarDate >> to: aGregorianDate by: step [

  ^ DiscreteInterval from: self to: aGregorianDate by: step
]

{ #category : 'accessing' }
CalendarDate >> year [

  ^ self monthOfYear year
]

{ #category : 'accessing' }
CalendarDate >> yearNumber [

  ^ self year number
]
