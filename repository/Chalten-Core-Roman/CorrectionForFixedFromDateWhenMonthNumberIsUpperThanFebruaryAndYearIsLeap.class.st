"
A CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeap is a class for corrections made when month number is upper than February and year is leap.

"
Class {
	#name : #CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeap,
	#superclass : #CorrectionForFixedFromDateBehavior,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Chalten-Core-Roman'
}

{ #category : #testing }
CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeap class >> canHandle: aChristianDate [

	^aChristianDate month > February and: [aChristianDate year isLeap]
]

{ #category : #initialization }
CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeap class >> initialize [

	self initializeUniqueInstance
]

{ #category : #initialization }
CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeap class >> initializeUniqueInstance [

	uniqueInstance := super new
]

{ #category : #'instance creation' }
CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeap class >> new [

	^uniqueInstance
]

{ #category : #evaluating }
CorrectionForFixedFromDateWhenMonthNumberIsUpperThanFebruaryAndYearIsLeap >> value [

	^1
]
