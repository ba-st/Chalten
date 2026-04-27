Class {
	#name : 'IslamicCalendarTest',
	#superclass : 'ChaltenTest',
	#instVars : [
		'islamicYear',
		'islamicMonth',
		'muharram',
		'safar',
		'rajab',
		'shaban',
		'ramadan',
		'shawwal',
		'duAlQiDah',
		'duAlHijjah',
		'rabiAlAwwal',
		'rabiAlThani',
		'jumadaAlAwwal',
		'jumadaAlThani'
	],
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'testing' }
IslamicCalendarTest class >> isAbstract [

  <ignoreForCoverage>
  ^ self = IslamicCalendarTest
]

{ #category : 'running' }
IslamicCalendarTest >> setUp [

  super setUp.
  islamicYear := IslamicCalendar year.
  islamicMonth := IslamicCalendar month.
  muharram := IslamicMonth muharram.
  safar := IslamicMonth safar.
  rabiAlAwwal := IslamicMonth rabiAlAwwal.
  rabiAlThani := IslamicMonth rabiAlThani.
  jumadaAlAwwal := IslamicMonth jumadaAlAwwal.
  jumadaAlThani := IslamicMonth jumadaAlThani.
  rajab := IslamicMonth rajab.
  shaban := IslamicMonth shaban.
  ramadan := IslamicMonth ramadan.
  shawwal := IslamicMonth shawwal.
  duAlQiDah := IslamicMonth duAlQiDah.
  duAlHijjah := IslamicMonth duAlHijjah
]
