Class {
	#name : #OrdinalDayMonthRuleTest,
	#superclass : #TestCase,
	#category : #'Chalten-Core-Tests-Filter'
}

{ #category : #test }
OrdinalDayMonthRuleTest >> testDifferentMonth [
	| rule months |
	rule := OrdinalDayMonthRule ordinal: 3 day: GregorianCalendar monday month: GregorianCalendar august.
	months := 2003 asGregorianYear months reject: [ :monthOfYear | monthOfYear month = GregorianCalendar august ].
	months do: [ :monthOfYear | self deny: (rule includes: (monthOfYear ordinal: 3 day: GregorianCalendar monday)) ]
]

{ #category : #test }
OrdinalDayMonthRuleTest >> testIncludesDayMovesToTheThirdMonday [
	"The 17 of August move to the third Monday of the month. 
	
	Tuesday 17 of August of Year 2004 is not including and it moves to the third Monday of the month.
	Monday 16 of August of Year 2004 is including."

	| rule |

	rule :=
		OrdinalDayMonthRule
			ordinal: 3
			day: GregorianCalendar monday
			month: GregorianCalendar august.
	self assert: (rule includes: August sixteenth, 2004).
	self deny: (rule includes: August seventeenth, 2004)
]

{ #category : #test }
OrdinalDayMonthRuleTest >> testIncludesDayWhenDayIsSaturday [
	"The 17 of August move to the third Monday of the month. 
	
	Domingo 18 of August of Year 2002 is not including.
	Monday 19 of August of Year 2002 is including because it was moved from Saturday 17 of August of Year 2002."

	| rule |

	rule :=
		OrdinalDayMonthRule
			ordinal: 3
			day: GregorianCalendar monday
			month: GregorianCalendar august.
	self deny: (rule includes: August eighteenth, 2002).
	self assert: (rule includes: August nineteenth, 2002)
]

{ #category : #test }
OrdinalDayMonthRuleTest >> testOrdinal [
	"The 17 of August move to the third Monday of the month. 
	
	Tuesday 17 of August of Year 2004 is not including and it moves to the third Monday of the month.
	Monday 16 of August of Year 2004 is including."

	| rule |

	rule :=
		OrdinalDayMonthRule
			ordinal: 3
			day: GregorianCalendar monday
			month: GregorianCalendar august.
	self assert: rule ordinal = 3
]

{ #category : #test }
OrdinalDayMonthRuleTest >> testPrintOn [

	| rule |
	rule := OrdinalDayMonthRule
		ordinal: 1
		day: GregorianCalendar monday
		month: GregorianCalendar august.
	self assert: rule printString = '1st Monday of August'.
	rule := OrdinalDayMonthRule
		ordinal: 2
		day: GregorianCalendar monday
		month: GregorianCalendar august.
	self assert: rule printString = '2nd Monday of August'.
	rule := OrdinalDayMonthRule
		ordinal: 3
		day: GregorianCalendar monday
		month: GregorianCalendar august.
	self assert: rule printString = '3rd Monday of August'.
	rule := OrdinalDayMonthRule
		ordinal: 4
		day: GregorianCalendar monday
		month: GregorianCalendar august.
	self assert: rule printString = '4th Monday of August'.
	
	"The next two assertions has no sense, its just to test the print format."
	rule := OrdinalDayMonthRule
		ordinal: 12
		day: GregorianCalendar monday
		month: GregorianCalendar august.
	self assert: rule printString = '12th Monday of August'.
	rule := OrdinalDayMonthRule
		ordinal: 24
		day: GregorianCalendar monday
		month: GregorianCalendar august.
	self assert: rule printString = '24th Monday of August'
]
