"
An InclusionRule is used to determinate when certain date is included or not in some TimelineFilter.

"
Class {
	#name : 'InclusionRule',
	#superclass : 'Object',
	#category : 'Chalten-Core-Filter',
	#package : 'Chalten-Core',
	#tag : 'Filter'
}

{ #category : 'querying' }
InclusionRule >> includes: anObject [

	self subclassResponsibility
]
