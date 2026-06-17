"
A GregorianMonthTest is a test class for testing the behavior of GregorianMonth
"
Class {
	#name : 'GregorianMonthTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'tests' }
GregorianMonthTest >> testApril [

  self
    assert: GregorianMonth april positionInYear equals: 4;
    assert: GregorianMonth april name equals: 'April';
    assert: GregorianMonth april shortName equals: 'Apr';
    assert: GregorianMonth april numberOfDaysInLeapYear equals: 30 * day;
    assert: GregorianMonth april numberOfDaysInCommonYear equals: 30 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testAugust [

  self
    assert: GregorianMonth august positionInYear equals: 8;
    assert: GregorianMonth august name equals: 'August';
    assert: GregorianMonth august shortName equals: 'Aug';
    assert: GregorianMonth august numberOfDaysInLeapYear equals: 31 * day;
    assert: GregorianMonth august numberOfDaysInCommonYear equals: 31 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testComparing [

  self
    assert: GregorianMonth may equals: GregorianMonth may;
    assert: GregorianMonth may equals: ( GregorianMonth monthAt: 5 );
    deny: GregorianMonth may equals: GregorianMonth june
]

{ #category : 'tests' }
GregorianMonthTest >> testDecember [

  self
    assert: GregorianMonth december positionInYear equals: 12;
    assert: GregorianMonth december name equals: 'December';
    assert: GregorianMonth december shortName equals: 'Dec';
    assert: GregorianMonth december numberOfDaysInLeapYear equals: 31 * day;
    assert: GregorianMonth december numberOfDaysInCommonYear equals: 31 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testFebruary [

  self
    assert: GregorianMonth february positionInYear equals: 2;
    assert: GregorianMonth february name equals: 'February';
    assert: GregorianMonth february shortName equals: 'Feb';
    assert: GregorianMonth february numberOfDaysInLeapYear equals: 29 * day;
    assert: GregorianMonth february numberOfDaysInCommonYear equals: 28 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testISO8601Printing [

  self
    assert: ( GregorianMonth all collect: [ :each | self printAsISO8601String: each ] )
    hasTheSameElementsInTheSameOrderThat:
    #( '01' '02' '03' '04' '05' '06' '07' '08' '09' '10' '11' '12' )
]

{ #category : 'tests' }
GregorianMonthTest >> testInstanceCreation [

  GregorianMonth all doWithIndex: [ :eachMonth :index |
      self assert: eachMonth positionInYear equals: index ].
  GregorianMonth all
    with:
      { january . february . march . april . may . june . july . august . september . october .
        november . december }
    do: [ :eachMonth :sameMonth | self assert: eachMonth equals: sameMonth ]
]

{ #category : 'tests' }
GregorianMonthTest >> testJanuary [

  self
    assert: GregorianMonth january positionInYear equals: 1;
    assert: GregorianMonth january name equals: 'January';
    assert: GregorianMonth january shortName equals: 'Jan';
    assert: GregorianMonth january numberOfDaysInLeapYear equals: 31 * day;
    assert: GregorianMonth january numberOfDaysInCommonYear equals: 31 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testJuly [

  self
    assert: GregorianMonth july positionInYear equals: 7;
    assert: GregorianMonth july name equals: 'July';
    assert: GregorianMonth july shortName equals: 'Jul';
    assert: GregorianMonth july numberOfDaysInLeapYear equals: 31 * day;
    assert: GregorianMonth july numberOfDaysInCommonYear equals: 31 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testJune [

  self
    assert: GregorianMonth june positionInYear equals: 6;
    assert: GregorianMonth june name equals: 'June';
    assert: GregorianMonth june shortName equals: 'Jun';
    assert: GregorianMonth june numberOfDaysInLeapYear equals: 30 * day;
    assert: GregorianMonth june numberOfDaysInCommonYear equals: 30 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testMarch [

  self
    assert: GregorianMonth march positionInYear equals: 3;
    assert: GregorianMonth march name equals: 'March';
    assert: GregorianMonth march shortName equals: 'Mar';
    assert: GregorianMonth march numberOfDaysInLeapYear equals: 31 * day;
    assert: GregorianMonth march numberOfDaysInCommonYear equals: 31 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testMay [

  self
    assert: GregorianMonth may positionInYear equals: 5;
    assert: GregorianMonth may name equals: 'May';
    assert: GregorianMonth may shortName equals: 'May';
    assert: GregorianMonth may numberOfDaysInLeapYear equals: 31 * day;
    assert: GregorianMonth may numberOfDaysInCommonYear equals: 31 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testNamesAreLocalized [

  self
    use: [ :translator |
        translator
          translationFor: 'January' in: 'es' is: 'Enero';
          translationFor: 'February' in: 'es' is: 'Febrero';
          translationFor: 'March' in: 'es' is: 'Marzo';
          translationFor: 'April' in: 'es' is: 'Abril';
          translationFor: 'May' in: 'es' is: 'Mayo';
          translationFor: 'June' in: 'es' is: 'Junio';
          translationFor: 'July' in: 'es' is: 'Julio';
          translationFor: 'August' in: 'es' is: 'Agosto';
          translationFor: 'September' in: 'es' is: 'Septiembre';
          translationFor: 'October' in: 'es' is: 'Octubre';
          translationFor: 'November' in: 'es' is: 'Noviembre';
          translationFor: 'December' in: 'es' is: 'Diciembre'
      ]
    asNaturalLanguageTranslatorDuring: [
        self use: 'es' asLocaleDuring: [
            self
              assert: ( GregorianMonth all collect: #name )
              hasTheSameElementsInTheSameOrderThat:
                #( 'Enero' 'Febrero' 'Marzo' 'Abril' 'Mayo' 'Junio' 'Julio' 'Agosto' 'Septiembre'
                   'Octubre' 'Noviembre' 'Diciembre' )
          ]
      ]
]

{ #category : 'tests' }
GregorianMonthTest >> testNext [

  self
    assert: ( january next: 1 * year ) equals: january;
    assert: ( january next: 1 * month ) equals: february;
    assert: ( january next: 2 * month ) equals: march;
    assert: ( january next: 3 * month ) equals: april;
    assert: ( january next: 4 * month ) equals: may;
    assert: ( january next: 5 * month ) equals: june;
    assert: ( january next: 6 * month ) equals: july;
    assert: ( january next: 7 * month ) equals: august;
    assert: ( january next: 8 * month ) equals: september;
    assert: ( january next: 9 * month ) equals: october;
    assert: ( january next: 10 * month ) equals: november;
    assert: ( january next: 11 * month ) equals: december;
    assert: ( january next: 12 * month ) equals: january
]

{ #category : 'tests' }
GregorianMonthTest >> testNovember [

  self
    assert: GregorianMonth november positionInYear equals: 11;
    assert: GregorianMonth november name equals: 'November';
    assert: GregorianMonth november shortName equals: 'Nov';
    assert: GregorianMonth november numberOfDaysInLeapYear equals: 30 * day;
    assert: GregorianMonth november numberOfDaysInCommonYear equals: 30 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testOctober [

  self
    assert: GregorianMonth october positionInYear equals: 10;
    assert: GregorianMonth october name equals: 'October';
    assert: GregorianMonth october shortName equals: 'Oct';
    assert: GregorianMonth october numberOfDaysInLeapYear equals: 31 * day;
    assert: GregorianMonth october numberOfDaysInCommonYear equals: 31 * day
]

{ #category : 'tests' }
GregorianMonthTest >> testPrevious [

  self
    assert: ( january previous: 1 * year ) equals: january;
    assert: ( january previous: 1 * month ) equals: december;
    assert: ( january previous: 2 * month ) equals: november;
    assert: ( january previous: 3 * month ) equals: october;
    assert: ( january previous: 4 * month ) equals: september;
    assert: ( january previous: 5 * month ) equals: august;
    assert: ( january previous: 6 * month ) equals: july;
    assert: ( january previous: 7 * month ) equals: june;
    assert: ( january previous: 8 * month ) equals: may;
    assert: ( january previous: 9 * month ) equals: april;
    assert: ( january previous: 10 * month ) equals: march;
    assert: ( january previous: 11 * month ) equals: february;
    assert: ( january previous: 12 * month ) equals: january
]

{ #category : 'tests' }
GregorianMonthTest >> testPrintString [

  self
    assert: ( GregorianMonth all collect: #printString )
    hasTheSameElementsInTheSameOrderThat:
      #( 'January' 'February' 'March' 'April' 'May' 'June' 'July' 'August' 'September' 'October'
         'November' 'December' )
]

{ #category : 'tests' }
GregorianMonthTest >> testSeptember [

  self
    assert: GregorianMonth september positionInYear equals: 9;
    assert: GregorianMonth september name equals: 'September';
    assert: GregorianMonth september shortName equals: 'Sep';
    assert: GregorianMonth september numberOfDaysInLeapYear equals: 30 * day;
    assert: GregorianMonth september numberOfDaysInCommonYear equals: 30 * day
]
