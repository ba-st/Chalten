"
A ChaltenEnvironment is an abstract class for defining behavior related to the environment.

"
Class {
	#name : 'ChaltenEnvironmentBehavior',
	#superclass : 'Object',
	#instVars : [
		'calendars'
	],
	#category : 'Chalten-Core-Time',
	#package : 'Chalten-Core',
	#tag : 'Time'
}

{ #category : 'initialization' }
ChaltenEnvironmentBehavior class >> initializeEnvironment [
	"Delete this abstract class and instead, keep the concrete ones and load them from different platform-specific packages? Undefined Environment would not exist anymore as well."

	^ self subclasses
		  detect: [ :each | each isForCurrentPlatform ]
		  ifNone: [ self undefinedEnvironment ]
]

{ #category : 'testing' }
ChaltenEnvironmentBehavior class >> isForCurrentPlatform [

	self subclassResponsibility
]

{ #category : 'instance creation' }
ChaltenEnvironmentBehavior class >> new [

	^ super new initialize
]

{ #category : 'accessing time' }
ChaltenEnvironmentBehavior >> calendarNamed: aCalendarName [

	^ self calendars at: aCalendarName ifAbsent: [
		  self error: ('Calendar "<1s>" is not defined.' expandMacrosWith:
				   aCalendarName asString) ]
]

{ #category : 'accessing time' }
ChaltenEnvironmentBehavior >> calendars [

	calendars ifNil: [calendars := Dictionary new].
	^calendars
]

{ #category : 'accessing time' }
ChaltenEnvironmentBehavior >> calendarsDo: aBlock [

	self calendars do: aBlock
]

{ #category : 'accessing time' }
ChaltenEnvironmentBehavior >> defineCalendarNamed: aCalendarName with: aCalendar [

	self calendars at: aCalendarName put: aCalendar 
]

{ #category : 'accessing time' }
ChaltenEnvironmentBehavior >> localTimeOffset [

	self subclassResponsibility
]

{ #category : 'accessing time' }
ChaltenEnvironmentBehavior >> microsecondsClock [

	self subclassResponsibility
]

{ #category : 'accessing time' }
ChaltenEnvironmentBehavior >> millisecondsClock [

	self subclassResponsibility
]

{ #category : 'accessing time' }
ChaltenEnvironmentBehavior >> secondsClock [

	self subclassResponsibility
]
