"
A calendar day of week. In the Islamic calendar, a day amongst the sequence of week calendar
days, namely, Yawn al-Ahad, Yawn al-Ithnayn, Yawn ath-Thulatha, Yawn al-Arba'a, Yawn al-Khamees, 
Yawn al-Jumu'ah and 'Yawn as-Sabt.
"
Class {
	#name : 'IslamicDayOfWeek',
	#superclass : 'CalendarDayOfWeek',
	#classVars : [
		'WellKnownDays'
	],
	#category : 'Chalten-Islamic-Calendar',
	#package : 'Chalten-Islamic-Calendar'
}

{ #category : 'accessing' }
IslamicDayOfWeek class >> dayAt: positionInWeek [

  ^ WellKnownDays at: positionInWeek
]

{ #category : 'class initialization' }
IslamicDayOfWeek class >> initialize [

  <ignoreForCoverage>
  WellKnownDays := { self named: 'Yawn al-Ahad' shortNamed: 'Ahd' positionInWeeek: 1 .
                     self named: 'Yawn al-Ithnayn' shortNamed: 'Ith' positionInWeeek: 2 .
                     self named: 'Yawn ath-Thulatha' shortNamed: 'Thu' positionInWeeek: 3 .
                     self named: 'Yawn al-Arba''a''' shortNamed: 'Arb' positionInWeeek: 4 .
                     self named: 'Yawn al-Khamees' shortNamed: 'Kha' positionInWeeek: 5 .
                     self named: 'Yawn al-Jumu''ah' shortNamed: 'Jum' positionInWeeek: 6 .
                     self named: 'Yawn as-Sabt' shortNamed: 'Sab' positionInWeeek: 7 }
]

{ #category : 'accessing' }
IslamicDayOfWeek class >> yawnAlAhad [

  ^ self dayAt: 1
]

{ #category : 'accessing' }
IslamicDayOfWeek class >> yawnAlArbaa [

  ^ self dayAt: 4
]

{ #category : 'accessing' }
IslamicDayOfWeek class >> yawnAlIthnayn [

  ^ self dayAt: 2
]

{ #category : 'accessing' }
IslamicDayOfWeek class >> yawnAlJumuha [

  ^ self dayAt: 6
]

{ #category : 'accessing' }
IslamicDayOfWeek class >> yawnAlKhamees [

  ^ self dayAt: 5
]

{ #category : 'accessing' }
IslamicDayOfWeek class >> yawnAsSabt [

  ^ self dayAt: 7
]

{ #category : 'accessing' }
IslamicDayOfWeek class >> yawnAthThulatha [

  ^ self dayAt: 3
]

{ #category : 'converting' }
IslamicDayOfWeek >> asISODayOfWeek [

  ^ DayOfWeek dayAt: self previous positionInWeek
]

{ #category : 'converting' }
IslamicDayOfWeek >> asIslamicDayOfWeek [

  ^ self
]
