"
A calendar day of week. In the Hebrew calendar, a day amongst the sequence of week calendar
days, namely, Yom Rishon, Yom Sheni, Yom Shlishi, Yom Revii, Yom Hamishi, Yom Shishi and Yom Shabbat
"
Class {
	#name : 'HebrewDayOfWeek',
	#superclass : 'CalendarDayOfWeek',
	#classVars : [
		'WellKnownDays'
	],
	#category : 'Chalten-Hebrew-Calendar',
	#package : 'Chalten-Hebrew-Calendar'
}

{ #category : 'accessing' }
HebrewDayOfWeek class >> dayAt: positionInWeek [

  ^ WellKnownDays at: positionInWeek
]

{ #category : 'class initialization' }
HebrewDayOfWeek class >> initialize [

  <ignoreForCoverage>
  WellKnownDays := { self named: 'Yom Rishon' shortNamed: 'Rish' positionInWeeek: 1 .
                     self named: 'Yom Sheni' shortNamed: 'She' positionInWeeek: 2 .
                     self named: 'Yom Shlishi' shortNamed: 'Shli' positionInWeeek: 3 .
                     self named: 'Yom Revii' shortNamed: 'Rev' positionInWeeek: 4 .
                     self named: 'Yom Hamishi' shortNamed: 'Ham' positionInWeeek: 5 .
                     self named: 'Yom Shishi' shortNamed: 'Shi' positionInWeeek: 6 .
                     self named: 'Yom Shabbat' shortNamed: 'Shab' positionInWeeek: 7 }
]

{ #category : 'accessing' }
HebrewDayOfWeek class >> yomHamishi [

  ^ self dayAt: 5
]

{ #category : 'accessing' }
HebrewDayOfWeek class >> yomRevii [

  ^ self dayAt: 4
]

{ #category : 'accessing' }
HebrewDayOfWeek class >> yomRishon [

  ^ self dayAt: 1
]

{ #category : 'accessing' }
HebrewDayOfWeek class >> yomShabbat [

  ^ self dayAt: 7
]

{ #category : 'accessing' }
HebrewDayOfWeek class >> yomSheni [

  ^ self dayAt: 2
]

{ #category : 'accessing' }
HebrewDayOfWeek class >> yomShishi [

  ^ self dayAt: 6
]

{ #category : 'accessing' }
HebrewDayOfWeek class >> yomShlishi [

  ^ self dayAt: 3
]

{ #category : 'converting' }
HebrewDayOfWeek >> asHebrewDayOfWeek [

  ^ self
]

{ #category : 'converting' }
HebrewDayOfWeek >> asISODayOfWeek [

  ^ DayOfWeek dayAt: self previous positionInWeek
]
