"
I'm a formatter of the ISO 8601 extended format.
I work by delegating to each calendar magnitude the printing per-se
"
Class {
	#name : 'ISO8601Formatter',
	#superclass : 'Formatter',
	#category : 'Chalten-Core',
	#package : 'Chalten-Core'
}

{ #category : 'formatting' }
ISO8601Formatter >> format: calendarMagnitude on: stream [

  calendarMagnitude printAsISO8601On: stream
]
