Extension { #name : 'Time' }

{ #category : '*Chalten-Core-GS64-Extensions' }
Time class >> microsecondClockValue [
  "Answer the number of microseconds since Pharo Epoch"

  ^ ( System _timeGmtFloat * 1000000 ) truncated + 2177452800000000
]
