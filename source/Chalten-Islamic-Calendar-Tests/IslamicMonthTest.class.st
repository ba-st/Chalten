"
An IslamicMonthTest is a test class for testing the behavior of IslamicMonth
"
Class {
	#name : 'IslamicMonthTest',
	#superclass : 'IslamicCalendarTest',
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'tests' }
IslamicMonthTest >> testComparing [

  self
    assert: ramadan equals: ramadan;
    assert: ramadan equals: ( IslamicMonth monthAt: 9 );
    deny: ramadan equals: safar;
    deny: muharram equals: january
]

{ #category : 'tests' }
IslamicMonthTest >> testDuAlHijjah [

  self
    assert: duAlHijjah positionInYear equals: 12;
    assert: duAlHijjah name equals: 'Dhu al-Hijjah';
    assert: duAlHijjah shortName equals: 'Dhu''l-H.';
    assert: duAlHijjah numberOfDaysInLeapYear equals: 30 * day;
    assert: duAlHijjah numberOfDaysInCommonYear equals: 29 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testDuAlQiDah [

  self
    assert: duAlQiDah positionInYear equals: 11;
    assert: duAlQiDah name equals: 'Dhu al-Qi''dah';
    assert: duAlQiDah shortName equals: 'Dhu''l-Q.';
    assert: duAlQiDah numberOfDaysInLeapYear equals: 30 * day;
    assert: duAlQiDah numberOfDaysInCommonYear equals: 30 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testInstanceCreation [

  IslamicMonth all doWithIndex: [ :eachMonth :index |
      self assert: eachMonth positionInYear equals: index ].
  IslamicMonth all
    with: { IslamicMonth muharram . IslamicMonth safar . IslamicMonth rabiAlAwwal . IslamicMonth rabiAlThani .
        IslamicMonth jumadaAlAwwal . IslamicMonth jumadaAlThani . IslamicMonth rajab . IslamicMonth shaban .
        IslamicMonth ramadan . IslamicMonth shawwal . IslamicMonth duAlQiDah .
        IslamicMonth duAlHijjah }
    do: [ :eachMonth :sameMonth | self assert: eachMonth equals: sameMonth ]
]

{ #category : 'tests' }
IslamicMonthTest >> testJumadaAlAwwal [

  self
    assert: jumadaAlAwwal positionInYear equals: 5;
    assert: jumadaAlAwwal name equals: 'Jumada al-Awwal';
    assert: jumadaAlAwwal shortName equals: 'Jum. I';
    assert: jumadaAlAwwal numberOfDaysInLeapYear equals: 30 * day;
    assert: jumadaAlAwwal numberOfDaysInCommonYear equals: 30 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testJumadaAlThani [

  self
    assert: jumadaAlThani positionInYear equals: 6;
    assert: jumadaAlThani name equals: 'Jumada al-Thani';
    assert: jumadaAlThani shortName equals: 'Jum. II';
    assert: jumadaAlThani numberOfDaysInLeapYear equals: 29 * day;
    assert: jumadaAlThani numberOfDaysInCommonYear equals: 29 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testMuharram [

  self
    assert: muharram positionInYear equals: 1;
    assert: muharram name equals: 'Muharram';
    assert: muharram shortName equals: 'Muh.';
    assert: muharram numberOfDaysInLeapYear equals: 30 * day;
    assert: muharram numberOfDaysInCommonYear equals: 30 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testNamesAreLocalized [

  self
    use: [ :translator |
        translator
          translationFor: 'Muharram' in: 'es' is: 'Muharram';
          translationFor: 'Safar' in: 'es' is: 'Safar';
          translationFor: 'Rabi'' al-Awwal' in: 'es' is: 'Rabi'' al-Awwal';
          translationFor: 'Rabi'' al-Thani' in: 'es' is: 'Rabi'' al-Thani';
          translationFor: 'Jumada al-Awwal' in: 'es' is: 'Yumada al-Awwal';
          translationFor: 'Jumada al-Thani' in: 'es' is: 'Yumada al-Thani';
          translationFor: 'Rajab' in: 'es' is: 'Rayab';
          translationFor: 'Sha''ban' in: 'es' is: 'Sha''ban';
          translationFor: 'Ramadan' in: 'es' is: 'Ramadán';
          translationFor: 'Shawwal' in: 'es' is: 'Shawwal';
          translationFor: 'Dhu al-Qi''dah' in: 'es' is: 'Dhu ul-Qádah';
          translationFor: 'Dhu al-Hijjah' in: 'es' is: 'Dhu ul-Híyyah'
      ]
    asNaturalLanguageTranslatorDuring: [
        self use: 'es' asLocaleDuring: [
            self
              assert: ( IslamicMonth all collect: #name )
              hasTheSameElementsInTheSameOrderThat:
                #( 'Muharram' 'Safar' 'Rabi'' al-Awwal' 'Rabi'' al-Thani' 'Yumada al-Awwal'
                   'Yumada al-Thani' 'Rayab' 'Sha''ban' 'Ramadán' 'Shawwal' 'Dhu ul-Qádah'
                   'Dhu ul-Híyyah' )
          ]
      ]
]

{ #category : 'tests' }
IslamicMonthTest >> testNext [

  self
    assert: ( muharram next: 1 * islamicYear ) equals: muharram;
    assert: ( muharram next: 1 * islamicMonth ) equals: safar;
    assert: ( muharram next: 2 * islamicMonth ) equals: rabiAlAwwal;
    assert: ( muharram next: 3 * islamicMonth ) equals: rabiAlThani;
    assert: ( muharram next: 4 * islamicMonth ) equals: jumadaAlAwwal;
    assert: ( muharram next: 5 * islamicMonth ) equals: jumadaAlThani;
    assert: ( muharram next: 6 * islamicMonth ) equals: rajab;
    assert: ( muharram next: 7 * islamicMonth ) equals: shaban;
    assert: ( muharram next: 8 * islamicMonth ) equals: ramadan;
    assert: ( muharram next: 9 * islamicMonth ) equals: shawwal;
    assert: ( muharram next: 10 * islamicMonth ) equals: duAlQiDah;
    assert: ( muharram next: 11 * islamicMonth ) equals: duAlHijjah;
    assert: ( muharram next: 12 * islamicMonth ) equals: muharram.

  self should: [ muharram next: 1 * year ] raise: ArithmeticError
]

{ #category : 'tests' }
IslamicMonthTest >> testPrevious [

  self
    assert: ( muharram previous: 1 * islamicYear ) equals: muharram;
    assert: ( muharram previous: 1 * islamicMonth ) equals: duAlHijjah;
    assert: ( muharram previous: 2 * islamicMonth ) equals: duAlQiDah;
    assert: ( muharram previous: 3 * islamicMonth ) equals: shawwal;
    assert: ( muharram previous: 4 * islamicMonth ) equals: ramadan;
    assert: ( muharram previous: 5 * islamicMonth ) equals: shaban;
    assert: ( muharram previous: 6 * islamicMonth ) equals: rajab;
    assert: ( muharram previous: 7 * islamicMonth ) equals: jumadaAlThani;
    assert: ( muharram previous: 8 * islamicMonth ) equals: jumadaAlAwwal;
    assert: ( muharram previous: 9 * islamicMonth ) equals: rabiAlThani;
    assert: ( muharram previous: 10 * islamicMonth ) equals: rabiAlAwwal;
    assert: ( muharram previous: 11 * islamicMonth ) equals: safar;
    assert: ( muharram previous: 12 * islamicMonth ) equals: muharram.


  self should: [ muharram previous: 1 * year ] raise: ArithmeticError
]

{ #category : 'tests' }
IslamicMonthTest >> testPrintString [

  self
    assert: ( IslamicMonth all collect: #printString )
    hasTheSameElementsInTheSameOrderThat:
      #( 'Muharram' 'Safar' 'Rabi'' al-Awwal' 'Rabi'' al-Thani' 'Jumada al-Awwal' 'Jumada al-Thani'
         'Rajab' 'Sha''ban' 'Ramadan' 'Shawwal' 'Dhu al-Qi''dah' 'Dhu al-Hijjah' )
]

{ #category : 'tests' }
IslamicMonthTest >> testRabiAlAwwal [

  self
    assert: rabiAlAwwal positionInYear equals: 3;
    assert: rabiAlAwwal name equals: 'Rabi'' al-Awwal';
    assert: rabiAlAwwal shortName equals: 'Rab. I';
    assert: rabiAlAwwal numberOfDaysInLeapYear equals: 30 * day;
    assert: rabiAlAwwal numberOfDaysInCommonYear equals: 30 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testRabiAlThani [

  self
    assert: rabiAlThani positionInYear equals: 4;
    assert: rabiAlThani name equals: 'Rabi'' al-Thani';
    assert: rabiAlThani shortName equals: 'Rab. II';
    assert: rabiAlThani numberOfDaysInLeapYear equals: 29 * day;
    assert: rabiAlThani numberOfDaysInCommonYear equals: 29 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testRajab [

  self
    assert: rajab positionInYear equals: 7;
    assert: rajab name equals: 'Rajab';
    assert: rajab shortName equals: 'Raj.';
    assert: rajab numberOfDaysInLeapYear equals: 30 * day;
    assert: rajab numberOfDaysInCommonYear equals: 30 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testRamadan [

  self
    assert: ramadan positionInYear equals: 9;
    assert: ramadan name equals: 'Ramadan';
    assert: ramadan shortName equals: 'Ram.';
    assert: ramadan numberOfDaysInLeapYear equals: 30 * day;
    assert: ramadan numberOfDaysInCommonYear equals: 30 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testSafar [

  self
    assert: safar positionInYear equals: 2;
    assert: safar name equals: 'Safar';
    assert: safar shortName equals: 'Saf.';
    assert: safar numberOfDaysInLeapYear equals: 29 * day;
    assert: safar numberOfDaysInCommonYear equals: 29 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testShaban [

  self
    assert: shaban positionInYear equals: 8;
    assert: shaban name equals: 'Sha''ban';
    assert: shaban shortName equals: 'Sha.';
    assert: shaban numberOfDaysInLeapYear equals: 29 * day;
    assert: shaban numberOfDaysInCommonYear equals: 29 * day
]

{ #category : 'tests' }
IslamicMonthTest >> testShawwal [

  self
    assert: shawwal positionInYear equals: 10;
    assert: shawwal name equals: 'Shawwal';
    assert: shawwal shortName equals: 'Shaw.';
    assert: shawwal numberOfDaysInLeapYear equals: 29 * day;
    assert: shawwal numberOfDaysInCommonYear equals: 29 * day
]
