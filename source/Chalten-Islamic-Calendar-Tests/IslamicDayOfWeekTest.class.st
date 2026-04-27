Class {
	#name : 'IslamicDayOfWeekTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'private' }
IslamicDayOfWeekTest >> daysOfWeek [

  ^ { IslamicDayOfWeek yawnAlAhad . IslamicDayOfWeek yawnAlIthnayn . IslamicDayOfWeek
        yawnAthThulatha . IslamicDayOfWeek yawnAlArbaa . IslamicDayOfWeek yawnAlKhamees .
      IslamicDayOfWeek yawnAlJumuha . IslamicDayOfWeek yawnAsSabt }
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testAsISODayOfWeek [

  self daysOfWeek
    with: { DayOfWeek sunday . DayOfWeek monday . DayOfWeek tuesday . DayOfWeek wednesday .
        DayOfWeek thursday . DayOfWeek friday . DayOfWeek saturday }
    do: [ :dayOfWeek :isoDayOfWeek | self assert: dayOfWeek asISODayOfWeek equals: isoDayOfWeek ]
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testAsIslamicDayOfWeek [

  self daysOfWeek
    with: { DayOfWeek sunday . DayOfWeek monday . DayOfWeek tuesday . DayOfWeek wednesday .
        DayOfWeek thursday . DayOfWeek friday . DayOfWeek saturday }
    do: [ :dayOfWeek :isoDayOfWeek |
        self
          assert: dayOfWeek equals: isoDayOfWeek asIslamicDayOfWeek;
          assert: dayOfWeek asIslamicDayOfWeek equals: dayOfWeek
      ]
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testInstanceCreation [

  self daysOfWeek doWithIndex: [ :dayOfWeek :index |
      self assert: dayOfWeek positionInWeek equals: index ]
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testNames [

  self
    assert: ( self daysOfWeek collect: #name )
    hasTheSameElementsInTheSameOrderThat:
      #( 'Yawn al-Ahad' 'Yawn al-Ithnayn' 'Yawn ath-Thulatha' 'Yawn al-Arba''a'''
         'Yawn al-Khamees' 'Yawn al-Jumu''ah' 'Yawn as-Sabt' )
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testNamesAreLocalized [

  self
    use: [ :translator |
        translator
          translationFor: 'Yawn al-Ahad' in: 'es' is: 'al-ahad';
          translationFor: 'Yawn al-Ithnayn' in: 'es' is: 'al-ithnáyn';
          translationFor: 'Yawn ath-Thulatha' in: 'es' is: 'al-tlat';
          translationFor: 'Yawn al-Arba''a' in: 'es' is: 'al-arba''a';
          translationFor: 'Yawn al-Khamees' in: 'es' is: 'al-jmís';
          translationFor: 'Yawn al-Jumu''ah' in: 'es' is: 'al-yumua''a';
          translationFor: 'Yawn as-Sabt' in: 'es' is: 'al-sabt'
      ]
    asNaturalLanguageTranslatorDuring: [
        self use: 'es' asLocaleDuring: [
            self
              assert: ( self daysOfWeek collect: #name )
              hasTheSameElementsInTheSameOrderThat:
              #( 'al-ahad' 'al-ithnáyn' 'al-tlat' 'Yawn al-Arba''a''' 'al-jmís' 'al-yumua''a'
                 'al-sabt' )
          ]
      ]
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testNext [

  self
    assert: IslamicDayOfWeek yawnAlAhad next equals: IslamicDayOfWeek yawnAlIthnayn;
    assert: IslamicDayOfWeek yawnAlIthnayn next equals: IslamicDayOfWeek yawnAthThulatha;
    assert: IslamicDayOfWeek yawnAthThulatha next equals: IslamicDayOfWeek yawnAlArbaa;
    assert: IslamicDayOfWeek yawnAlArbaa next equals: IslamicDayOfWeek yawnAlKhamees;
    assert: IslamicDayOfWeek yawnAlKhamees next equals: IslamicDayOfWeek yawnAlJumuha;
    assert: IslamicDayOfWeek yawnAlJumuha next equals: IslamicDayOfWeek yawnAsSabt;
    assert: IslamicDayOfWeek yawnAsSabt next equals: IslamicDayOfWeek yawnAlAhad
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testPrevious [

  self
    assert: IslamicDayOfWeek yawnAlAhad equals: IslamicDayOfWeek yawnAlIthnayn previous;
    assert: IslamicDayOfWeek yawnAlIthnayn equals: IslamicDayOfWeek yawnAthThulatha previous;
    assert: IslamicDayOfWeek yawnAthThulatha equals: IslamicDayOfWeek yawnAlArbaa previous;
    assert: IslamicDayOfWeek yawnAlArbaa equals: IslamicDayOfWeek yawnAlKhamees previous;
    assert: IslamicDayOfWeek yawnAlKhamees equals: IslamicDayOfWeek yawnAlJumuha previous;
    assert: IslamicDayOfWeek yawnAlJumuha equals: IslamicDayOfWeek yawnAsSabt previous;
    assert: IslamicDayOfWeek yawnAsSabt equals: IslamicDayOfWeek yawnAlAhad previous
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testPrintString [

  self assert: IslamicDayOfWeek yawnAsSabt printString equals: 'Yawn as-Sabt'
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testShortNames [

  self
    assert: ( self daysOfWeek collect: #shortName )
    hasTheSameElementsInTheSameOrderThat: #( 'Ahd' 'Ith' 'Thu' 'Arb' 'Kha' 'Jum' 'Sab' )
]

{ #category : 'tests' }
IslamicDayOfWeekTest >> testShortNamesAreLocalized [

  self
    use: [ :translator |
        translator
          translationFor: 'Ahd' in: 'es' is: 'aha';
          translationFor: 'Ith' in: 'es' is: 'ith';
          translationFor: 'Thu' in: 'es' is: 'tla';
          translationFor: 'Arb' in: 'es' is: 'arb';
          translationFor: 'Kha' in: 'es' is: 'jmi';
          translationFor: 'Jum' in: 'es' is: 'yum';
          translationFor: 'Sab' in: 'es' is: 'sab'
      ]
    asNaturalLanguageTranslatorDuring: [
        self use: 'es' asLocaleDuring: [
            self
              assert: ( self daysOfWeek collect: #shortName )
              hasTheSameElementsInTheSameOrderThat: #( 'aha' 'ith' 'tla' 'arb' 'jmi' 'yum' 'sab' )
          ]
      ]
]
