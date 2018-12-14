Extension { #name : #MonthOfYear }

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> dhuAlHijjaOf: aYear [

	^self year: aYear month: IslamicCalendar dhuAlHijja
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> dhuAlQadaOf: aYear [

	^self year: aYear month: IslamicCalendar dhuAlQada
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> jumadaIIOf: aYear [

	^self year: aYear month: IslamicCalendar jumadaII
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> jumadaIOf: aYear [

	^self year: aYear month: IslamicCalendar jumadaI
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> muharramOf: aYear [

	^self year: aYear month: IslamicCalendar muharram
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> rabiIIOf: aYear [

	^self year: aYear month: IslamicCalendar rabiII
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> rabiIOf: aYear [

	^self year: aYear month: IslamicCalendar rabiI
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> rajabOf: aYear [

	^self year: aYear month: IslamicCalendar rajab
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> ramadanOf: aYear [

	^self year: aYear month: IslamicCalendar ramadan
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> safarOf: aYear [

	^self year: aYear month: IslamicCalendar safar
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> shabanOf: aYear [

	^self year: aYear month: IslamicCalendar shaban
]

{ #category : #'*Chalten-Core-Islamic' }
MonthOfYear class >> shawwalOf: aYear [

	^self year: aYear month: IslamicCalendar shawwal
]
