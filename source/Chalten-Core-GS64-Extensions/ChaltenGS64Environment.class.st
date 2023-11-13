Class {
	#name : 'ChaltenGS64Environment',
	#superclass : 'ChaltenEnvironmentBehavior',
	#category : 'Chalten-Core-GS64-Extensions-',
	#package : 'Chalten-Core-GS64-Extensions',
	#tag : ''
}

{ #category : 'testing' }
ChaltenGS64Environment class >> isForCurrentPlatform [

	^ LanguagePlatform current class name = #GemStone64Platform
]

{ #category : 'accessing time' }
ChaltenGS64Environment >> localTimeOffset [

	^TimeZone current secondsFromGmt / 3600
]

{ #category : 'accessing time' }
ChaltenGS64Environment >> microsecondsClock [

	^ System _timeGmtMicroSeconds
]

{ #category : 'accessing time' }
ChaltenGS64Environment >> millisecondsClock [

	^ System _timeMs
]

{ #category : 'accessing time' }
ChaltenGS64Environment >> secondsClock [

	^ DateAndTime secondsSince2001
]
