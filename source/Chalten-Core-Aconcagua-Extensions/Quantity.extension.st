Extension { #name : 'Quantity' }

{ #category : '*Chalten-Core-Aconcagua-Extensions' }
Quantity >> additionWithCalendarDate: aCalendarDate [

  ^ aCalendarDate next: self
]

{ #category : '*Chalten-Core-Aconcagua-Extensions' }
Quantity >> subtractionFromCalendarDate: aCalendarDate [

  ^ aCalendarDate previous: self
]

{ #category : '*Chalten-Core-Aconcagua-Extensions' }
Quantity >> subtractionFromCalendarYear: aCalendarYear [

  ^ aCalendarYear previous: self
]
