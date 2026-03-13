"
A HebrewDayOfWeekTest is a test class for testing the behavior of HebrewDayOfWeek
"
Class {
	#name : 'HebrewDayOfWeekTest',
	#superclass : 'TestCase',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'private' }
HebrewDayOfWeekTest >> daysOfWeek [

  ^ { HebrewDayOfWeek yomRishon . HebrewDayOfWeek yomSheni . HebrewDayOfWeek yomShlishi .
      HebrewDayOfWeek yomRevii . HebrewDayOfWeek yomHamishi . HebrewDayOfWeek yomShishi .
      HebrewDayOfWeek yomShabbat }
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testAsHebrewDayOfWeek [

  self daysOfWeek
    with: { DayOfWeek sunday . DayOfWeek monday . DayOfWeek tuesday . DayOfWeek wednesday .
        DayOfWeek thursday . DayOfWeek friday . DayOfWeek saturday }
    do: [ :dayOfWeek :isoDayOfWeek | self assert: dayOfWeek equals: isoDayOfWeek asHebrewDayOfWeek ]
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testAsISODayOfWeek [

  self daysOfWeek
    with: { DayOfWeek sunday . DayOfWeek monday . DayOfWeek tuesday . DayOfWeek wednesday .
        DayOfWeek thursday . DayOfWeek friday . DayOfWeek saturday }
    do: [ :dayOfWeek :isoDayOfWeek | self assert: dayOfWeek asISODayOfWeek equals: isoDayOfWeek ]
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testInstanceCreation [

  self daysOfWeek doWithIndex: [ :dayOfWeek :index |
      self assert: dayOfWeek positionInWeek equals: index ]
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testNames [

  self
    assert: ( self daysOfWeek collect: #name )
    hasTheSameElementsInTheSameOrderThat:
    #( 'Yom Rishon' 'Yom Sheni' 'Yom Shlishi' 'Yom Revii' 'Yom Hamishi' 'Yom Shishi' 'Yom Shabbat' )
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testNamesAreLocalized [

  self
    use: [ :translator |
        translator
          translationFor: 'Yom Rishon' in: 'es' is: 'Yom Rishón';
          translationFor: 'Yom Sheni' in: 'es' is: 'Yom Shení';
          translationFor: 'Yom Shlishi' in: 'es' is: 'Yom Shelishi';
          translationFor: 'Yom Revii' in: 'es' is: 'Yom Revií';
          translationFor: 'Yom Hamishi' in: 'es' is: 'Yom Jamishi';
          translationFor: 'Yom Shishi' in: 'es' is: 'Yom Shishí';
          translationFor: 'Yom Shabbat' in: 'es' is: 'Shabat'
      ]
    asNaturalLanguageTranslatorDuring: [
        self use: 'es' asLocaleDuring: [
            self
              assert: ( self daysOfWeek collect: #name )
              hasTheSameElementsInTheSameOrderThat:
              #( 'Yom Rishón' 'Yom Shení' 'Yom Shelishi' 'Yom Revií' 'Yom Jamishi' 'Yom Shishí'
                 'Shabat' )
          ]
      ]
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testNext [

  self
    assert: HebrewDayOfWeek yomRishon next equals: HebrewDayOfWeek yomSheni;
    assert: HebrewDayOfWeek yomSheni next equals: HebrewDayOfWeek yomShlishi;
    assert: HebrewDayOfWeek yomShlishi next equals: HebrewDayOfWeek yomRevii;
    assert: HebrewDayOfWeek yomRevii next equals: HebrewDayOfWeek yomHamishi;
    assert: HebrewDayOfWeek yomHamishi next equals: HebrewDayOfWeek yomShishi;
    assert: HebrewDayOfWeek yomShishi next equals: HebrewDayOfWeek yomShabbat;
    assert: HebrewDayOfWeek yomShabbat next equals: HebrewDayOfWeek yomRishon
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testPrevious [

  self
    assert: HebrewDayOfWeek yomRishon equals: HebrewDayOfWeek yomSheni previous;
    assert: HebrewDayOfWeek yomSheni equals: HebrewDayOfWeek yomShlishi previous;
    assert: HebrewDayOfWeek yomShlishi equals: HebrewDayOfWeek yomRevii previous;
    assert: HebrewDayOfWeek yomRevii equals: HebrewDayOfWeek yomHamishi previous;
    assert: HebrewDayOfWeek yomHamishi equals: HebrewDayOfWeek yomShishi previous;
    assert: HebrewDayOfWeek yomShishi equals: HebrewDayOfWeek yomShabbat previous;
    assert: HebrewDayOfWeek yomShabbat equals: HebrewDayOfWeek yomRishon previous
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testPrintString [

  self assert: HebrewDayOfWeek yomShabbat printString equals: 'Yom Shabbat'
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testShortNames [

  self
    assert: ( self daysOfWeek collect: #shortName )
    hasTheSameElementsInTheSameOrderThat: #( 'Rish' 'She' 'Shli' 'Rev' 'Ham' 'Shi' 'Shab' )
]

{ #category : 'tests' }
HebrewDayOfWeekTest >> testShortNamesAreLocalized [

  self
    use: [ :translator |
        translator
          translationFor: 'Rish' in: 'he' is: 'א׳';
          translationFor: 'She' in: 'he' is: 'ב׳';
          translationFor: 'Shli' in: 'he' is: 'ג׳';
          translationFor: 'Rev' in: 'he' is: 'ד׳';
          translationFor: 'Ham' in: 'he' is: 'ה׳';
          translationFor: 'Shi' in: 'he' is: 'ו׳';
          translationFor: 'Shab' in: 'he' is: 'ש׳'
      ]
    asNaturalLanguageTranslatorDuring: [
        self use: 'he' asLocaleDuring: [
            self
              assert: ( self daysOfWeek collect: #shortName )
              hasTheSameElementsInTheSameOrderThat: #( 'א׳' 'ב׳' 'ג׳' 'ד׳' 'ה׳' 'ו׳' 'ש׳' )
          ]
      ]
]
