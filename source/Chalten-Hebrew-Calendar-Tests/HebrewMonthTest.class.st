Class {
	#name : 'HebrewMonthTest',
	#superclass : 'HebrewCalendarTest',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'tests' }
HebrewMonthTest >> testAdar [

  self
    assert: HebrewMonth adar positionInCommonYear equals: 6;
    assert: HebrewMonth adar name equals: 'Adar';
    assert: HebrewMonth adar shortName equals: 'Ad';
    assert: HebrewMonth adar numberOfDaysInDeficientYear equals: 29 * day;
    assert: HebrewMonth adar numberOfDaysInRegularYear equals: 29 * day;
    assert: HebrewMonth adar numberOfDaysInCompleteYear equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testAdarI [

  self
    assert: HebrewMonth adarI positionInLeapYear equals: 6;
    assert: HebrewMonth adarI name equals: 'Adar I';
    assert: HebrewMonth adarI shortName equals: 'Ad I';
    assert: HebrewMonth adarI numberOfDaysInDeficientYear equals: 30 * day;
    assert: HebrewMonth adarI numberOfDaysInRegularYear equals: 30 * day;
    assert: HebrewMonth adarI numberOfDaysInCompleteYear equals: 30 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testAdarII [

  self
    assert: HebrewMonth adarII positionInLeapYear equals: 7;
    assert: HebrewMonth adarII name equals: 'Adar II';
    assert: HebrewMonth adarII shortName equals: 'Ad II';
    assert: HebrewMonth adarII numberOfDaysInDeficientYear equals: 29 * day;
    assert: HebrewMonth adarII numberOfDaysInRegularYear equals: 29 * day;
    assert: HebrewMonth adarII numberOfDaysInCompleteYear equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testAv [

  self
    assert: HebrewMonth av positionInCommonYear equals: 11;
    assert: HebrewMonth av positionInLeapYear equals: 12;
    assert: HebrewMonth av name equals: 'Av';
    assert: HebrewMonth av shortName equals: 'Av';
    assert: HebrewMonth av numberOfDaysInDeficientYear equals: 30 * day;
    assert: HebrewMonth av numberOfDaysInRegularYear equals: 30 * day;
    assert: HebrewMonth av numberOfDaysInCompleteYear equals: 30 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testCheshvan [

  self
    assert: HebrewMonth cheshvan positionInCommonYear equals: 2;
    assert: HebrewMonth cheshvan positionInLeapYear equals: 2;
    assert: HebrewMonth cheshvan name equals: 'Cheshvan';
    assert: HebrewMonth cheshvan shortName equals: 'Chesh';
    assert: HebrewMonth cheshvan numberOfDaysInDeficientYear equals: 29 * day;
    assert: HebrewMonth cheshvan numberOfDaysInRegularYear equals: 29 * day;
    assert: HebrewMonth cheshvan numberOfDaysInCompleteYear equals: 30 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testComparing [

  self
    assert: HebrewMonth shevat equals: HebrewMonth shevat;
    assert: HebrewMonth shevat equals: ( HebrewMonth monthOnCommonYearAt: 5 );
    deny: HebrewMonth shevat equals: HebrewMonth adar;
    deny: HebrewMonth shevat equals: HebrewMonth adarI
]

{ #category : 'tests' }
HebrewMonthTest >> testElul [

  self
    assert: HebrewMonth elul positionInCommonYear equals: 12;
    assert: HebrewMonth elul positionInLeapYear equals: 13;
    assert: HebrewMonth elul name equals: 'Elul';
    assert: HebrewMonth elul shortName equals: 'Elu';
    assert: HebrewMonth elul numberOfDaysInDeficientYear equals: 29 * day;
    assert: HebrewMonth elul numberOfDaysInRegularYear equals: 29 * day;
    assert: HebrewMonth elul numberOfDaysInCompleteYear equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testInstanceCreation [

  HebrewMonth allOnCommonYear doWithIndex: [ :eachMonth :index |
      self assert: eachMonth positionInCommonYear equals: index ].
  HebrewMonth allOnCommonYear
    with:
    { tishrei . cheshvan . kislev . tevet . shevat . adar . nisan . iyar . sivan . tammuz . av . elul }
    do: [ :eachMonth :sameMonth | self assert: eachMonth equals: sameMonth ].

  HebrewMonth allOnLeapYear doWithIndex: [ :eachMonth :index |
      self assert: eachMonth positionInLeapYear equals: index ].
  HebrewMonth allOnLeapYear
    with:
      { tishrei . cheshvan . kislev . tevet . shevat . adarI . adarII . nisan . iyar . sivan . tammuz .
        av . elul }
    do: [ :eachMonth :sameMonth | self assert: eachMonth equals: sameMonth ]
]

{ #category : 'tests' }
HebrewMonthTest >> testIsGregorian [

  self deny: HebrewMonth sivan isGregorian
]

{ #category : 'tests' }
HebrewMonthTest >> testIyar [

  self
    assert: HebrewMonth iyar positionInCommonYear equals: 8;
    assert: HebrewMonth iyar positionInLeapYear equals: 9;
    assert: HebrewMonth iyar name equals: 'Iyar';
    assert: HebrewMonth iyar shortName equals: 'Iya';
    assert: HebrewMonth iyar numberOfDaysInDeficientYear equals: 29 * day;
    assert: HebrewMonth iyar numberOfDaysInRegularYear equals: 29 * day;
    assert: HebrewMonth iyar numberOfDaysInCompleteYear equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testKislev [

  self
    assert: HebrewMonth kislev positionInCommonYear equals: 3;
    assert: HebrewMonth kislev positionInLeapYear equals: 3;
    assert: HebrewMonth kislev name equals: 'Kislev';
    assert: HebrewMonth kislev shortName equals: 'Kis';
    assert: HebrewMonth kislev numberOfDaysInDeficientYear equals: 29 * day;
    assert: HebrewMonth kislev numberOfDaysInRegularYear equals: 30 * day;
    assert: HebrewMonth kislev numberOfDaysInCompleteYear equals: 30 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testNamesAreLocalized [

  self
    use: [ :translator |
        translator
          translationFor: 'Tishrei' in: 'es' is: 'Tishréi';
          translationFor: 'Cheshvan' in: 'es' is: 'Jeshván';
          translationFor: 'Kislev' in: 'es' is: 'Kislev';
          translationFor: 'Tevet' in: 'es' is: 'Tevet';
          translationFor: 'Shevat' in: 'es' is: 'Shevat';
          translationFor: 'Adar' in: 'es' is: 'Adar';
          translationFor: 'Adar I' in: 'es' is: 'Adar I';
          translationFor: 'Adar II' in: 'es' is: 'Adar II';
          translationFor: 'Nisan' in: 'es' is: 'Nisán';
          translationFor: 'Iyar' in: 'es' is: 'Iyar';
          translationFor: 'Sivan' in: 'es' is: 'Siván';
          translationFor: 'Tammuz' in: 'es' is: 'Tamuz';
          translationFor: 'Av' in: 'es' is: 'Av';
          translationFor: 'Elul' in: 'es' is: 'Elul'
      ]
    asNaturalLanguageTranslatorDuring: [
        self use: 'es' asLocaleDuring: [
            self
              assert: ( HebrewMonth allOnCommonYear collect: #name )
              hasTheSameElementsInTheSameOrderThat:
              #( 'Tishréi' 'Jeshván' 'Kislev' 'Tevet' 'Shevat' 'Adar' 'Nisán' 'Iyar' 'Siván' 'Tamuz'
                 'Av' 'Elul' ).
            self
              assert: ( HebrewMonth allOnLeapYear collect: #name )
              hasTheSameElementsInTheSameOrderThat:
                #( 'Tishréi' 'Jeshván' 'Kislev' 'Tevet' 'Shevat' 'Adar I' 'Adar II' 'Nisán' 'Iyar'
                   'Siván' 'Tamuz' 'Av' 'Elul' )
          ]
      ]
]

{ #category : 'tests' }
HebrewMonthTest >> testNisan [

  self
    assert: HebrewMonth nisan positionInCommonYear equals: 7;
    assert: HebrewMonth nisan positionInLeapYear equals: 8;
    assert: HebrewMonth nisan name equals: 'Nisan';
    assert: HebrewMonth nisan shortName equals: 'Nis';
    assert: HebrewMonth nisan numberOfDaysInDeficientYear equals: 30 * day;
    assert: HebrewMonth nisan numberOfDaysInRegularYear equals: 30 * day;
    assert: HebrewMonth nisan numberOfDaysInCompleteYear equals: 30 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testPrintString [

  self
    assert: ( HebrewMonth allOnCommonYear collect: #printString )
    hasTheSameElementsInTheSameOrderThat:
    #( 'Tishrei' 'Cheshvan' 'Kislev' 'Tevet' 'Shevat' 'Adar' 'Nisan' 'Iyar' 'Sivan' 'Tammuz'
       'Av' 'Elul' )
]

{ #category : 'tests' }
HebrewMonthTest >> testShevat [

  self
    assert: HebrewMonth shevat positionInCommonYear equals: 5;
    assert: HebrewMonth shevat positionInLeapYear equals: 5;
    assert: HebrewMonth shevat name equals: 'Shevat';
    assert: HebrewMonth shevat shortName equals: 'Shev';
    assert: HebrewMonth shevat numberOfDaysInDeficientYear equals: 30 * day;
    assert: HebrewMonth shevat numberOfDaysInRegularYear equals: 30 * day;
    assert: HebrewMonth shevat numberOfDaysInCompleteYear equals: 30 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testSivan [

  self
    assert: HebrewMonth sivan positionInCommonYear equals: 9;
    assert: HebrewMonth sivan positionInLeapYear equals: 10;
    assert: HebrewMonth sivan name equals: 'Sivan';
    assert: HebrewMonth sivan shortName equals: 'Siv';
    assert: HebrewMonth sivan numberOfDaysInDeficientYear equals: 30 * day;
    assert: HebrewMonth sivan numberOfDaysInRegularYear equals: 30 * day;
    assert: HebrewMonth sivan numberOfDaysInCompleteYear equals: 30 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testTammuz [

  self
    assert: HebrewMonth tammuz positionInCommonYear equals: 10;
    assert: HebrewMonth tammuz positionInLeapYear equals: 11;
    assert: HebrewMonth tammuz name equals: 'Tammuz';
    assert: HebrewMonth tammuz shortName equals: 'Tam';
    assert: HebrewMonth tammuz numberOfDaysInDeficientYear equals: 29 * day;
    assert: HebrewMonth tammuz numberOfDaysInRegularYear equals: 29 * day;
    assert: HebrewMonth tammuz numberOfDaysInCompleteYear equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testTevet [

  self
    assert: HebrewMonth tevet positionInCommonYear equals: 4;
    assert: HebrewMonth tevet positionInLeapYear equals: 4;
    assert: HebrewMonth tevet name equals: 'Tevet';
    assert: HebrewMonth tevet shortName equals: 'Tev';
    assert: HebrewMonth tevet numberOfDaysInDeficientYear equals: 29 * day;
    assert: HebrewMonth tevet numberOfDaysInRegularYear equals: 29 * day;
    assert: HebrewMonth tevet numberOfDaysInCompleteYear equals: 29 * day
]

{ #category : 'tests' }
HebrewMonthTest >> testTishrei [

  self
    assert: HebrewMonth tishrei positionInCommonYear equals: 1;
    assert: HebrewMonth tishrei positionInLeapYear equals: 1;
    assert: HebrewMonth tishrei name equals: 'Tishrei';
    assert: HebrewMonth tishrei shortName equals: 'Tish';
    assert: HebrewMonth tishrei numberOfDaysInDeficientYear equals: 30 * day;
    assert: HebrewMonth tishrei numberOfDaysInRegularYear equals: 30 * day;
    assert: HebrewMonth tishrei numberOfDaysInCompleteYear equals: 30 * day
]
