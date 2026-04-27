"
A DayOfWeekTest is a test class for testing the behavior of DayOfWeek
"
Class {
	#name : 'DayOfWeekTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'private' }
DayOfWeekTest >> daysOfWeek [

  ^ { DayOfWeek monday . DayOfWeek tuesday . DayOfWeek wednesday . DayOfWeek thursday .
      DayOfWeek friday . DayOfWeek saturday . DayOfWeek sunday }
]

{ #category : 'tests' }
DayOfWeekTest >> testConverting [

  self daysOfWeek do: [ :dayOfWeek | self assert: dayOfWeek asISODayOfWeek equals: dayOfWeek ]
]

{ #category : 'tests' }
DayOfWeekTest >> testInstanceCreation [

  self daysOfWeek doWithIndex: [ :dayOfWeek :index |
      self assert: dayOfWeek positionInWeek equals: index ]
]

{ #category : 'tests' }
DayOfWeekTest >> testNames [

  self
    assert: ( self daysOfWeek collect: #name )
    hasTheSameElementsInTheSameOrderThat:
    #( 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' 'Saturday' 'Sunday' )
]

{ #category : 'tests' }
DayOfWeekTest >> testNamesAreLocalized [

  self
    use: [ :translator |
        translator
          translationFor: 'Monday' in: 'es' is: 'Lunes';
          translationFor: 'Tuesday' in: 'es' is: 'Martes';
          translationFor: 'Wednesday' in: 'es' is: 'Miércoles';
          translationFor: 'Thursday' in: 'es' is: 'Jueves';
          translationFor: 'Friday' in: 'es' is: 'Viernes';
          translationFor: 'Saturday' in: 'es' is: 'Sábado';
          translationFor: 'Sunday' in: 'es' is: 'Domingo'
      ]
    asNaturalLanguageTranslatorDuring: [
        self use: 'es' asLocaleDuring: [
            self
              assert: ( self daysOfWeek collect: #name )
              hasTheSameElementsInTheSameOrderThat:
              #( 'Lunes' 'Martes' 'Miércoles' 'Jueves' 'Viernes' 'Sábado' 'Domingo' )
          ]
      ]
]

{ #category : 'tests' }
DayOfWeekTest >> testNext [

  self
    assert: DayOfWeek monday next equals: DayOfWeek tuesday;
    assert: DayOfWeek tuesday next equals: DayOfWeek wednesday;
    assert: DayOfWeek wednesday next equals: DayOfWeek thursday;
    assert: DayOfWeek thursday next equals: DayOfWeek friday;
    assert: DayOfWeek friday next equals: DayOfWeek saturday;
    assert: DayOfWeek saturday next equals: DayOfWeek sunday;
    assert: DayOfWeek sunday next equals: DayOfWeek monday
]

{ #category : 'tests' }
DayOfWeekTest >> testPrevious [

  self
    assert: DayOfWeek monday equals: DayOfWeek tuesday previous;
    assert: DayOfWeek tuesday equals: DayOfWeek wednesday previous;
    assert: DayOfWeek wednesday equals: DayOfWeek thursday previous;
    assert: DayOfWeek thursday equals: DayOfWeek friday previous;
    assert: DayOfWeek friday equals: DayOfWeek saturday previous;
    assert: DayOfWeek saturday equals: DayOfWeek sunday previous;
    assert: DayOfWeek sunday equals: DayOfWeek monday previous
]

{ #category : 'tests' }
DayOfWeekTest >> testPrintString [

  self assert: DayOfWeek sunday printString equals: 'Sunday'
]

{ #category : 'tests' }
DayOfWeekTest >> testShortNames [

  self
    assert: ( self daysOfWeek collect: #shortName )
    hasTheSameElementsInTheSameOrderThat: #( 'Mo' 'Tu' 'We' 'Th' 'Fr' 'Sa' 'Su' )
]

{ #category : 'tests' }
DayOfWeekTest >> testShortNamesAreLocalized [

  self
    use: [ :translator |
        translator
          translationFor: 'Mo' in: 'es' is: 'LU';
          translationFor: 'Tu' in: 'es' is: 'MA';
          translationFor: 'We' in: 'es' is: 'MI';
          translationFor: 'Th' in: 'es' is: 'JU';
          translationFor: 'Fr' in: 'es' is: 'VI';
          translationFor: 'Sa' in: 'es' is: 'SA';
          translationFor: 'Su' in: 'es' is: 'DO'
      ]
    asNaturalLanguageTranslatorDuring: [
        self use: 'es' asLocaleDuring: [
            self
              assert: ( self daysOfWeek collect: #shortName )
              hasTheSameElementsInTheSameOrderThat: #( 'LU' 'MA' 'MI' 'JU' 'VI' 'SA' 'DO' )
          ]
      ]
]
