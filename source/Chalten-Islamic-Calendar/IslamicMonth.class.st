"
A calendar month. In the Islamic calendar, a month amongst the sequence of islamic calendar
months, namely, Muharram, Safar, Rabi' al-Awwal, Rabi' al-Thani, Jumada al-Awwal,
Jumada al-Thani, Rajab, Sha'ban,  Ramadan, Shawwal, Dhu al-Qi'dah and Dhu al-Hijjah.
In the islamic calendar, a month is a fixed-order unit within the year. It encapsulates the logic for
day counts in both common and leap years in collaboration with the year abstraction and supports
cyclic arithmetic: islamic months can be advanced a number of months or years without further
context given the circularity of this calendar.
In this calendar the Dhu al-Hijjah month has 29 or 30 days depending if the year is leap or not.
"
Class {
	#name : 'IslamicMonth',
	#superclass : 'CalendarMonth',
	#instVars : [
		'numberOfDaysInCommonYear',
		'numberOfDaysInLeapYear',
		'positionInYear'
	],
	#classVars : [
		'AllMonths'
	],
	#category : 'Chalten-Islamic-Calendar',
	#package : 'Chalten-Islamic-Calendar'
}

{ #category : 'accessing' }
IslamicMonth class >> all [

  ^ AllMonths
]

{ #category : 'accessing' }
IslamicMonth class >> duAlHijjah [

  ^ self monthAt: 12
]

{ #category : 'accessing' }
IslamicMonth class >> duAlQiDah [

  ^ self monthAt: 11
]

{ #category : 'class initialization' }
IslamicMonth class >> initialize [

  <ignoreForCoverage>
  | muharram safar rabiI rabiII jumadaI jumadaII rajab shaban ramadan shawwal duAlQiDah duALHijjah |
  muharram := self
                named: 'Muharram'
                shortNamed: 'Muh.'
                positionInYear: 1
                numberOfDaysInYear: 30.
  safar := self
             named: 'Safar'
             shortNamed: 'Saf.'
             positionInYear: 2
             numberOfDaysInYear: 29.
  rabiI := self
             named: 'Rabi'' al-Awwal'
             shortNamed: 'Rab. I'
             positionInYear: 3
             numberOfDaysInYear: 30.
  rabiII := self
              named: 'Rabi'' al-Thani'
              shortNamed: 'Rab. II'
              positionInYear: 4
              numberOfDaysInYear: 29.
  jumadaI := self
               named: 'Jumada al-Awwal'
               shortNamed: 'Jum. I'
               positionInYear: 5
               numberOfDaysInYear: 30.
  jumadaII := self
                named: 'Jumada al-Thani'
                shortNamed: 'Jum. II'
                positionInYear: 6
                numberOfDaysInYear: 29.
  rajab := self
             named: 'Rajab'
             shortNamed: 'Raj.'
             positionInYear: 7
             numberOfDaysInYear: 30.
  shaban := self
              named: 'Sha''ban'
              shortNamed: 'Sha.'
              positionInYear: 8
              numberOfDaysInYear: 29.
  ramadan := self
               named: 'Ramadan'
               shortNamed: 'Ram.'
               positionInYear: 9
               numberOfDaysInYear: 30.
  shawwal := self
               named: 'Shawwal'
               shortNamed: 'Shaw.'
               positionInYear: 10
               numberOfDaysInYear: 29.
  duALHijjah := self
                  named: 'Dhu al-Qi''dah'
                  shortNamed: 'Dhu''l-Q.'
                  positionInYear: 11
                  numberOfDaysInYear: 30.
  duAlQiDah := self
                 named: 'Dhu al-Hijjah'
                 shortNamed: 'Dhu''l-H.'
                 positionInYear: 12
                 numberOfDaysInLeapYear: 30
                 andInCommonYear: 29.
  AllMonths := { muharram . safar . rabiI . rabiII . jumadaI . jumadaII . rajab . shaban . ramadan .
                 shawwal . duALHijjah . duAlQiDah }
]

{ #category : 'accessing' }
IslamicMonth class >> jumadaI [

  ^ self monthAt: 5
]

{ #category : 'accessing' }
IslamicMonth class >> jumadaII [

  ^ self monthAt: 6
]

{ #category : 'accessing' }
IslamicMonth class >> monthAt: index [

  ^ AllMonths at: index
]

{ #category : 'accessing' }
IslamicMonth class >> muharram [

  ^ self monthAt: 1
]

{ #category : 'private - instance creation' }
IslamicMonth class >> named: aName shortNamed: aShortName positionInYear: index numberOfDaysInLeapYear: leapNumber andInCommonYear: commonNumber [

  <ignoreForCoverage>
  ^ self new
      initializeNamed: aName
      shortNamed: aShortName
      positionInYear: index
      numberOfDaysInLeapYear: leapNumber * self day
      andInCommonYear: commonNumber * self day
]

{ #category : 'private - instance creation' }
IslamicMonth class >> named: aName shortNamed: aShortName positionInYear: index numberOfDaysInYear: number [

  <ignoreForCoverage>
  ^ self
      named: aName
      shortNamed: aShortName
      positionInYear: index
      numberOfDaysInLeapYear: number
      andInCommonYear: number
]

{ #category : 'accessing' }
IslamicMonth class >> rabiI [

  ^ self monthAt: 3
]

{ #category : 'accessing' }
IslamicMonth class >> rabiII [

  ^ self monthAt: 4
]

{ #category : 'accessing' }
IslamicMonth class >> rajab [

  ^ self monthAt: 7
]

{ #category : 'accessing' }
IslamicMonth class >> ramadan [

  ^ self monthAt: 9
]

{ #category : 'accessing' }
IslamicMonth class >> safar [

  ^ self monthAt: 2
]

{ #category : 'accessing' }
IslamicMonth class >> shaban [

  ^ self monthAt: 8
]

{ #category : 'accessing' }
IslamicMonth class >> shawwal [

  ^ self monthAt: 10
]

{ #category : 'instance creation' }
IslamicMonth >> , yearNumber [

  ^ yearNumber asIslamicYear monthAt: positionInYear
]

{ #category : 'private' }
IslamicMonth >> dayOfMonthAt: dayNumber [

  ^ CalendarDayOfMonth islamicMonth: self dayNumber: dayNumber
]

{ #category : 'initialization' }
IslamicMonth >> initializeNamed: aName shortNamed: aShortName positionInYear: index numberOfDaysInLeapYear: daysInLeapYear andInCommonYear: daysInCommonYear [

  <ignoreForCoverage>
  name := aName.
  shortName := aShortName.
  positionInYear := index.
  numberOfDaysInLeapYear := daysInLeapYear.
  numberOfDaysInCommonYear := daysInCommonYear
]

{ #category : 'testing' }
IslamicMonth >> isGregorian [

  ^ false
]

{ #category : 'querying' }
IslamicMonth >> next: relativeTimeQuantity [

  | numberOfMonths nextMonthIndex |
  relativeTimeQuantity isZero then: [ ^ self ].
  relativeTimeQuantity negative then: [ ^ self previous: relativeTimeQuantity abs ].
  numberOfMonths := ( relativeTimeQuantity convertTo: IslamicCalendar month ) numericalValue.
  nextMonthIndex := ( positionInYear + numberOfMonths - 1 rem: 12 ) + 1.
  ^ self class monthAt: nextMonthIndex
]

{ #category : 'accessing' }
IslamicMonth >> numberOfDaysInCommonYear [

  ^ numberOfDaysInCommonYear
]

{ #category : 'accessing' }
IslamicMonth >> numberOfDaysInLeapYear [

  ^ numberOfDaysInLeapYear
]

{ #category : 'accessing' }
IslamicMonth >> positionInYear [

  ^ positionInYear
]

{ #category : 'querying' }
IslamicMonth >> previous: relativeTimeQuantity [

  | numberOfMonths nextMonthIndex |
  relativeTimeQuantity isZero then: [ ^ self ].
  relativeTimeQuantity negative then: [ ^ self next: relativeTimeQuantity abs ].
  numberOfMonths := ( relativeTimeQuantity convertTo: IslamicCalendar month ) numericalValue.
  nextMonthIndex := ( ( positionInYear - numberOfMonths - 1 rem: 12 ) + 12 rem: 12 ) + 1.
  ^ self class monthAt: nextMonthIndex
]

{ #category : 'accessing - days' }
IslamicMonth >> thirtieth [

  ^ self
      whenNumberOfDaysInLeapYearGreaterThan: 29
      do: [ self dayOfMonthAt: 30 ]
      otherwise: [ super thirtieth ]
]

{ #category : 'private' }
IslamicMonth >> whenNumberOfDaysInLeapYearGreaterThan: number do: aBlock otherwise: failBlock [

  ^ numberOfDaysInLeapYear > ( number * self class day ) then: aBlock otherwise: failBlock
]
