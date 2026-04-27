Class {
	#name : 'HebrewCalendarTest',
	#superclass : 'ChaltenTest',
	#instVars : [
		'hebrewYear',
		'hebrewMonth',
		'tishrei',
		'cheshvan',
		'kislev',
		'tevet',
		'shevat',
		'adar',
		'adarI',
		'adarII',
		'nisan',
		'iyar',
		'sivan',
		'tammuz',
		'av',
		'elul'
	],
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'testing' }
HebrewCalendarTest class >> isAbstract [

  <ignoreForCoverage>
  ^ self = HebrewCalendarTest
]

{ #category : 'running' }
HebrewCalendarTest >> setUp [

  super setUp.
  hebrewYear := HebrewCalendar year.
  hebrewMonth := HebrewCalendar month.
  tishrei := HebrewMonth tishrei.
  cheshvan := HebrewMonth cheshvan.
  kislev := HebrewMonth kislev.
  tevet := HebrewMonth tevet.
  shevat := HebrewMonth shevat.
  adar := HebrewMonth adar.
  adarI := HebrewMonth adarI.
  adarII := HebrewMonth adarII.
  nisan := HebrewMonth nisan.
  iyar := HebrewMonth iyar.
  sivan := HebrewMonth sivan.
  tammuz := HebrewMonth tammuz.
  av := HebrewMonth av.
  elul := HebrewMonth elul
]
