Class {
	#name : 'IslamicCalendarTest',
	#superclass : 'ChaltenTest',
	#instVars : [
		'islamicYear',
		'islamicMonth',
		'muharram',
		'safar',
		'rabiI',
		'rabiII',
		'jumadaI',
		'jumadaII',
		'rajab',
		'shaban',
		'ramadan',
		'shawwal',
		'duAlQiDah',
		'duAlHijjah'
	],
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'testing' }
IslamicCalendarTest class >> isAbstract [

  ^ self = IslamicCalendarTest
]

{ #category : 'running' }
IslamicCalendarTest >> setUp [

  super setUp.
  islamicYear := IslamicCalendar year.
  islamicMonth := IslamicCalendar month.
  muharram := IslamicMonth muharram.
  safar := IslamicMonth safar.
  rabiI := IslamicMonth rabiI.
  rabiII := IslamicMonth rabiII.
  jumadaI := IslamicMonth jumadaI.
  jumadaII := IslamicMonth jumadaII.
  rajab := IslamicMonth rajab.
  shaban := IslamicMonth shaban.
  ramadan := IslamicMonth ramadan.
  shawwal := IslamicMonth shawwal.
  duAlQiDah := IslamicMonth duAlQiDah.
  duAlHijjah := IslamicMonth duAlHijjah
]
