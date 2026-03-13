Extension { #name : 'DayOfWeek' }

{ #category : '*Chalten-Islamic-Calendar' }
DayOfWeek >> asIslamicDayOfWeek [

  ^ IslamicDayOfWeek dayAt: self next positionInWeek
]
