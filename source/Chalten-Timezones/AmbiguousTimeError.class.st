"
Exception thrown to indicate that the specified local date/time occurs twice in a particular time zone due to daylight saving time changes.
"
Class {
	#name : 'AmbiguousTimeError',
	#superclass : 'Error',
	#instVars : [
		'earlierDateTime',
		'laterDateTime'
	],
	#category : 'Chalten-Timezones',
	#package : 'Chalten-Timezones'
}

{ #category : 'signalling' }
AmbiguousTimeError class >> signalFor: earlierGregorianDateTime and: laterGregorianDateTime withMessageText: aString [

  ^ self new
      earlierDateTime: earlierGregorianDateTime laterDateTime: laterGregorianDateTime;
      messageText: aString;
      signal
]

{ #category : 'accessing' }
AmbiguousTimeError >> earlierDateTime [

  ^ earlierDateTime
]

{ #category : 'initialization' }
AmbiguousTimeError >> earlierDateTime: anEarlierDateTime laterDateTime: aLaterDateTime [

  earlierDateTime := anEarlierDateTime.
  laterDateTime := aLaterDateTime
]

{ #category : 'accessing' }
AmbiguousTimeError >> laterDateTime [

  ^ laterDateTime
]
