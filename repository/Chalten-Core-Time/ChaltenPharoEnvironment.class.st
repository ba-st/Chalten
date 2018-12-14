"
A ChaltenPharoEnvironment is a class for defining behavior related to the pharo environment.

"
Class {
	#name : #ChaltenPharoEnvironment,
	#superclass : #ChaltenEnvironmentBehavior,
	#category : #'Chalten-Core-Time'
}

{ #category : #testing }
ChaltenPharoEnvironment class >> isForCurrentPlatform [

	^(Smalltalk at: #SystemVersion) current type = 'Pharo'
]

{ #category : #'accessing time' }
ChaltenPharoEnvironment >> localTimeOffset [

	^self primOffset // 60
]

{ #category : #'accessing time' }
ChaltenPharoEnvironment >> microsecondsClock [

	^self primUTCMicrosecondsClock
]

{ #category : #'accessing time' }
ChaltenPharoEnvironment >> millisecondsClock [

	^self primUTCMillisecondsClock
]

{ #category : #'primitives - private' }
ChaltenPharoEnvironment >> primOffset [
	"The offset from UTC in minutes, with positive offsets being towards the east.
	(San Francisco is in UTC -07*60 and Paris is in UTC +02*60 (daylight savings is not in effect)."
	<primitive:'primitiveTimezoneOffset' module: 'LocalePlugin'>
	^ 0
]

{ #category : #'primitives - private' }
ChaltenPharoEnvironment >> primUTCMicrosecondsClock [
	"Answer the number of micro-seconds ellapsed since Squeak epoch.
	That is since 00:00 on the morning of January 1, 1901 UTC.
	At least a 60-bit unsigned integer is used internally which is enough for dates up to year 38435.
	Essential. See Object documentation whatIsAPrimitive. "

	<primitive: 240>
	self primitiveFailed
]

{ #category : #'primitives - private' }
ChaltenPharoEnvironment >> primUTCMillisecondsClock [
	"Answer the number of whole milliseconds ellapsed since Squeak epoch.
	That is since 00:00 on the morning of January 1, 1901 UTC"

	^self primUTCMicrosecondsClock // 1e3
]

{ #category : #'primitives - private' }
ChaltenPharoEnvironment >> primUTCSecondsClock [
	"Answer the number of whole seconds ellapsed since Squeak epoch.
	That is since 00:00 on the morning of January 1, 1901 UTC"

	^self primUTCMicrosecondsClock // 1e6
]

{ #category : #'accessing time' }
ChaltenPharoEnvironment >> secondsClock [

	^self primUTCSecondsClock
]
