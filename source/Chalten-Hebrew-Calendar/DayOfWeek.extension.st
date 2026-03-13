Extension { #name : 'DayOfWeek' }

{ #category : '*Chalten-Hebrew-Calendar' }
DayOfWeek >> asHebrewDayOfWeek [

  ^ HebrewDayOfWeek dayAt: self next positionInWeek
]
