"
A GregorianDayOfMonthTest is a test class for testing the behavior of CalendarDayOfMonth on the Gregorian Calendar
"
Class {
	#name : 'GregorianDayOfMonthTest',
	#superclass : 'ChaltenTest',
	#category : 'Chalten-Core-Tests',
	#package : 'Chalten-Core-Tests'
}

{ #category : 'tests' }
GregorianDayOfMonthTest >> testComparing [

  self
    assert: GregorianMonth april first equals: GregorianMonth april first;
    deny: GregorianMonth april first equals: GregorianMonth april second;
    deny: GregorianMonth april first equals: GregorianMonth march first
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testDateCreation [

  | date |
  date := GregorianMonth april first , 2025.
  self
    assert: date month equals: GregorianMonth april;
    assert: date dayNumber equals: 1;
    assert: date yearNumber equals: 2025
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreation [

  | dayOfMonth |
  dayOfMonth := CalendarDayOfMonth gregorianMonth: GregorianMonth april dayNumber: 1.
  self
    assert: dayOfMonth month equals: GregorianMonth april;
    assert: dayOfMonth dayNumber equals: 1
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcut [

  | dayOfMonth |
  dayOfMonth := GregorianMonth april first.
  self
    assert: dayOfMonth month equals: GregorianMonth april;
    assert: dayOfMonth dayNumber equals: 1
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForApril [

  self
    assert: ( april first , 2025 ) printString equals: 'April 1, 2025';
    assert: ( april second , 2025 ) printString equals: 'April 2, 2025';
    assert: ( april third , 2025 ) printString equals: 'April 3, 2025';
    assert: ( april fourth , 2025 ) printString equals: 'April 4, 2025';
    assert: ( april fifth , 2025 ) printString equals: 'April 5, 2025';
    assert: ( april sixth , 2025 ) printString equals: 'April 6, 2025';
    assert: ( april seventh , 2025 ) printString equals: 'April 7, 2025';
    assert: ( april eighth , 2025 ) printString equals: 'April 8, 2025';
    assert: ( april ninth , 2025 ) printString equals: 'April 9, 2025';
    assert: ( april tenth , 2025 ) printString equals: 'April 10, 2025';
    assert: ( april eleventh , 2025 ) printString equals: 'April 11, 2025';
    assert: ( april twelfth , 2025 ) printString equals: 'April 12, 2025';
    assert: ( april thirteenth , 2025 ) printString equals: 'April 13, 2025';
    assert: ( april fourteenth , 2025 ) printString equals: 'April 14, 2025';
    assert: ( april fifteenth , 2025 ) printString equals: 'April 15, 2025';
    assert: ( april sixteenth , 2025 ) printString equals: 'April 16, 2025';
    assert: ( april seventeenth , 2025 ) printString equals: 'April 17, 2025';
    assert: ( april eighteenth , 2025 ) printString equals: 'April 18, 2025';
    assert: ( april nineteenth , 2025 ) printString equals: 'April 19, 2025';
    assert: ( april twentieth , 2025 ) printString equals: 'April 20, 2025';
    assert: ( april twentyFirst , 2025 ) printString equals: 'April 21, 2025';
    assert: ( april twentySecond , 2025 ) printString equals: 'April 22, 2025';
    assert: ( april twentyThird , 2025 ) printString equals: 'April 23, 2025';
    assert: ( april twentyFourth , 2025 ) printString equals: 'April 24, 2025';
    assert: ( april twentyFifth , 2025 ) printString equals: 'April 25, 2025';
    assert: ( april twentySixth , 2025 ) printString equals: 'April 26, 2025';
    assert: ( april twentySeventh , 2025 ) printString equals: 'April 27, 2025';
    assert: ( april twentyEighth , 2025 ) printString equals: 'April 28, 2025';
    assert: ( april twentyNinth , 2025 ) printString equals: 'April 29, 2025';
    assert: ( april thirtieth , 2025 ) printString equals: 'April 30, 2025';
    should: [ april thirtyFirst ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForAugust [

  self
    assert: ( august first , 2025 ) printString equals: 'August 1, 2025';
    assert: ( august second , 2025 ) printString equals: 'August 2, 2025';
    assert: ( august third , 2025 ) printString equals: 'August 3, 2025';
    assert: ( august fourth , 2025 ) printString equals: 'August 4, 2025';
    assert: ( august fifth , 2025 ) printString equals: 'August 5, 2025';
    assert: ( august sixth , 2025 ) printString equals: 'August 6, 2025';
    assert: ( august seventh , 2025 ) printString equals: 'August 7, 2025';
    assert: ( august eighth , 2025 ) printString equals: 'August 8, 2025';
    assert: ( august ninth , 2025 ) printString equals: 'August 9, 2025';
    assert: ( august tenth , 2025 ) printString equals: 'August 10, 2025';
    assert: ( august eleventh , 2025 ) printString equals: 'August 11, 2025';
    assert: ( august twelfth , 2025 ) printString equals: 'August 12, 2025';
    assert: ( august thirteenth , 2025 ) printString equals: 'August 13, 2025';
    assert: ( august fourteenth , 2025 ) printString equals: 'August 14, 2025';
    assert: ( august fifteenth , 2025 ) printString equals: 'August 15, 2025';
    assert: ( august sixteenth , 2025 ) printString equals: 'August 16, 2025';
    assert: ( august seventeenth , 2025 ) printString equals: 'August 17, 2025';
    assert: ( august eighteenth , 2025 ) printString equals: 'August 18, 2025';
    assert: ( august nineteenth , 2025 ) printString equals: 'August 19, 2025';
    assert: ( august twentieth , 2025 ) printString equals: 'August 20, 2025';
    assert: ( august twentyFirst , 2025 ) printString equals: 'August 21, 2025';
    assert: ( august twentySecond , 2025 ) printString equals: 'August 22, 2025';
    assert: ( august twentyThird , 2025 ) printString equals: 'August 23, 2025';
    assert: ( august twentyFourth , 2025 ) printString equals: 'August 24, 2025';
    assert: ( august twentyFifth , 2025 ) printString equals: 'August 25, 2025';
    assert: ( august twentySixth , 2025 ) printString equals: 'August 26, 2025';
    assert: ( august twentySeventh , 2025 ) printString equals: 'August 27, 2025';
    assert: ( august twentyEighth , 2025 ) printString equals: 'August 28, 2025';
    assert: ( august twentyNinth , 2025 ) printString equals: 'August 29, 2025';
    assert: ( august thirtieth , 2025 ) printString equals: 'August 30, 2025';
    assert: ( august thirtyFirst , 2025 ) printString equals: 'August 31, 2025'
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForDecember [

  self
    assert: ( december first , 2025 ) printString equals: 'December 1, 2025';
    assert: ( december second , 2025 ) printString equals: 'December 2, 2025';
    assert: ( december third , 2025 ) printString equals: 'December 3, 2025';
    assert: ( december fourth , 2025 ) printString equals: 'December 4, 2025';
    assert: ( december fifth , 2025 ) printString equals: 'December 5, 2025';
    assert: ( december sixth , 2025 ) printString equals: 'December 6, 2025';
    assert: ( december seventh , 2025 ) printString equals: 'December 7, 2025';
    assert: ( december eighth , 2025 ) printString equals: 'December 8, 2025';
    assert: ( december ninth , 2025 ) printString equals: 'December 9, 2025';
    assert: ( december tenth , 2025 ) printString equals: 'December 10, 2025';
    assert: ( december eleventh , 2025 ) printString equals: 'December 11, 2025';
    assert: ( december twelfth , 2025 ) printString equals: 'December 12, 2025';
    assert: ( december thirteenth , 2025 ) printString equals: 'December 13, 2025';
    assert: ( december fourteenth , 2025 ) printString equals: 'December 14, 2025';
    assert: ( december fifteenth , 2025 ) printString equals: 'December 15, 2025';
    assert: ( december sixteenth , 2025 ) printString equals: 'December 16, 2025';
    assert: ( december seventeenth , 2025 ) printString equals: 'December 17, 2025';
    assert: ( december eighteenth , 2025 ) printString equals: 'December 18, 2025';
    assert: ( december nineteenth , 2025 ) printString equals: 'December 19, 2025';
    assert: ( december twentieth , 2025 ) printString equals: 'December 20, 2025';
    assert: ( december twentyFirst , 2025 ) printString equals: 'December 21, 2025';
    assert: ( december twentySecond , 2025 ) printString equals: 'December 22, 2025';
    assert: ( december twentyThird , 2025 ) printString equals: 'December 23, 2025';
    assert: ( december twentyFourth , 2025 ) printString equals: 'December 24, 2025';
    assert: ( december twentyFifth , 2025 ) printString equals: 'December 25, 2025';
    assert: ( december twentySixth , 2025 ) printString equals: 'December 26, 2025';
    assert: ( december twentySeventh , 2025 ) printString equals: 'December 27, 2025';
    assert: ( december twentyEighth , 2025 ) printString equals: 'December 28, 2025';
    assert: ( december twentyNinth , 2025 ) printString equals: 'December 29, 2025';
    assert: ( december thirtieth , 2025 ) printString equals: 'December 30, 2025';
    assert: ( december thirtyFirst , 2025 ) printString equals: 'December 31, 2025'
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForFebruary [

  self
    assert: ( february first , 2025 ) printString equals: 'February 1, 2025';
    assert: ( february second , 2025 ) printString equals: 'February 2, 2025';
    assert: ( february third , 2025 ) printString equals: 'February 3, 2025';
    assert: ( february fourth , 2025 ) printString equals: 'February 4, 2025';
    assert: ( february fifth , 2025 ) printString equals: 'February 5, 2025';
    assert: ( february sixth , 2025 ) printString equals: 'February 6, 2025';
    assert: ( february seventh , 2025 ) printString equals: 'February 7, 2025';
    assert: ( february eighth , 2025 ) printString equals: 'February 8, 2025';
    assert: ( february ninth , 2025 ) printString equals: 'February 9, 2025';
    assert: ( february tenth , 2025 ) printString equals: 'February 10, 2025';
    assert: ( february eleventh , 2025 ) printString equals: 'February 11, 2025';
    assert: ( february twelfth , 2025 ) printString equals: 'February 12, 2025';
    assert: ( february thirteenth , 2025 ) printString equals: 'February 13, 2025';
    assert: ( february fourteenth , 2025 ) printString equals: 'February 14, 2025';
    assert: ( february fifteenth , 2025 ) printString equals: 'February 15, 2025';
    assert: ( february sixteenth , 2025 ) printString equals: 'February 16, 2025';
    assert: ( february seventeenth , 2025 ) printString equals: 'February 17, 2025';
    assert: ( february eighteenth , 2025 ) printString equals: 'February 18, 2025';
    assert: ( february nineteenth , 2025 ) printString equals: 'February 19, 2025';
    assert: ( february twentieth , 2025 ) printString equals: 'February 20, 2025';
    assert: ( february twentyFirst , 2025 ) printString equals: 'February 21, 2025';
    assert: ( february twentySecond , 2025 ) printString equals: 'February 22, 2025';
    assert: ( february twentyThird , 2025 ) printString equals: 'February 23, 2025';
    assert: ( february twentyFourth , 2025 ) printString equals: 'February 24, 2025';
    assert: ( february twentyFifth , 2025 ) printString equals: 'February 25, 2025';
    assert: ( february twentySixth , 2025 ) printString equals: 'February 26, 2025';
    assert: ( february twentySeventh , 2025 ) printString equals: 'February 27, 2025';
    assert: ( february twentyEighth , 2025 ) printString equals: 'February 28, 2025';
    assert: ( february twentyNinth , 2000 ) printString equals: 'February 29, 2000';
    should: [ february twentyNinth , 2025 ]
    raise: InstanceCreationFailed
    withMessageText: '29 is an invalid day number in February, 2025'
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForJanuary [

  self
    assert: ( january first , 2025 ) printString equals: 'January 1, 2025';
    assert: ( january second , 2025 ) printString equals: 'January 2, 2025';
    assert: ( january third , 2025 ) printString equals: 'January 3, 2025';
    assert: ( january fourth , 2025 ) printString equals: 'January 4, 2025';
    assert: ( january fifth , 2025 ) printString equals: 'January 5, 2025';
    assert: ( january sixth , 2025 ) printString equals: 'January 6, 2025';
    assert: ( january seventh , 2025 ) printString equals: 'January 7, 2025';
    assert: ( january eighth , 2025 ) printString equals: 'January 8, 2025';
    assert: ( january ninth , 2025 ) printString equals: 'January 9, 2025';
    assert: ( january tenth , 2025 ) printString equals: 'January 10, 2025';
    assert: ( january eleventh , 2025 ) printString equals: 'January 11, 2025';
    assert: ( january twelfth , 2025 ) printString equals: 'January 12, 2025';
    assert: ( january thirteenth , 2025 ) printString equals: 'January 13, 2025';
    assert: ( january fourteenth , 2025 ) printString equals: 'January 14, 2025';
    assert: ( january fifteenth , 2025 ) printString equals: 'January 15, 2025';
    assert: ( january sixteenth , 2025 ) printString equals: 'January 16, 2025';
    assert: ( january seventeenth , 2025 ) printString equals: 'January 17, 2025';
    assert: ( january eighteenth , 2025 ) printString equals: 'January 18, 2025';
    assert: ( january nineteenth , 2025 ) printString equals: 'January 19, 2025';
    assert: ( january twentieth , 2025 ) printString equals: 'January 20, 2025';
    assert: ( january twentyFirst , 2025 ) printString equals: 'January 21, 2025';
    assert: ( january twentySecond , 2025 ) printString equals: 'January 22, 2025';
    assert: ( january twentyThird , 2025 ) printString equals: 'January 23, 2025';
    assert: ( january twentyFourth , 2025 ) printString equals: 'January 24, 2025';
    assert: ( january twentyFifth , 2025 ) printString equals: 'January 25, 2025';
    assert: ( january twentySixth , 2025 ) printString equals: 'January 26, 2025';
    assert: ( january twentySeventh , 2025 ) printString equals: 'January 27, 2025';
    assert: ( january twentyEighth , 2025 ) printString equals: 'January 28, 2025';
    assert: ( january twentyNinth , 2025 ) printString equals: 'January 29, 2025';
    assert: ( january thirtieth , 2025 ) printString equals: 'January 30, 2025';
    assert: ( january thirtyFirst , 2025 ) printString equals: 'January 31, 2025'
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForJuly [

  self
    assert: ( july first , 2025 ) printString equals: 'July 1, 2025';
    assert: ( july second , 2025 ) printString equals: 'July 2, 2025';
    assert: ( july third , 2025 ) printString equals: 'July 3, 2025';
    assert: ( july fourth , 2025 ) printString equals: 'July 4, 2025';
    assert: ( july fifth , 2025 ) printString equals: 'July 5, 2025';
    assert: ( july sixth , 2025 ) printString equals: 'July 6, 2025';
    assert: ( july seventh , 2025 ) printString equals: 'July 7, 2025';
    assert: ( july eighth , 2025 ) printString equals: 'July 8, 2025';
    assert: ( july ninth , 2025 ) printString equals: 'July 9, 2025';
    assert: ( july tenth , 2025 ) printString equals: 'July 10, 2025';
    assert: ( july eleventh , 2025 ) printString equals: 'July 11, 2025';
    assert: ( july twelfth , 2025 ) printString equals: 'July 12, 2025';
    assert: ( july thirteenth , 2025 ) printString equals: 'July 13, 2025';
    assert: ( july fourteenth , 2025 ) printString equals: 'July 14, 2025';
    assert: ( july fifteenth , 2025 ) printString equals: 'July 15, 2025';
    assert: ( july sixteenth , 2025 ) printString equals: 'July 16, 2025';
    assert: ( july seventeenth , 2025 ) printString equals: 'July 17, 2025';
    assert: ( july eighteenth , 2025 ) printString equals: 'July 18, 2025';
    assert: ( july nineteenth , 2025 ) printString equals: 'July 19, 2025';
    assert: ( july twentieth , 2025 ) printString equals: 'July 20, 2025';
    assert: ( july twentyFirst , 2025 ) printString equals: 'July 21, 2025';
    assert: ( july twentySecond , 2025 ) printString equals: 'July 22, 2025';
    assert: ( july twentyThird , 2025 ) printString equals: 'July 23, 2025';
    assert: ( july twentyFourth , 2025 ) printString equals: 'July 24, 2025';
    assert: ( july twentyFifth , 2025 ) printString equals: 'July 25, 2025';
    assert: ( july twentySixth , 2025 ) printString equals: 'July 26, 2025';
    assert: ( july twentySeventh , 2025 ) printString equals: 'July 27, 2025';
    assert: ( july twentyEighth , 2025 ) printString equals: 'July 28, 2025';
    assert: ( july twentyNinth , 2025 ) printString equals: 'July 29, 2025';
    assert: ( july thirtieth , 2025 ) printString equals: 'July 30, 2025';
    assert: ( july thirtyFirst , 2025 ) printString equals: 'July 31, 2025'
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForJune [

  self
    assert: ( june first , 2025 ) printString equals: 'June 1, 2025';
    assert: ( june second , 2025 ) printString equals: 'June 2, 2025';
    assert: ( june third , 2025 ) printString equals: 'June 3, 2025';
    assert: ( june fourth , 2025 ) printString equals: 'June 4, 2025';
    assert: ( june fifth , 2025 ) printString equals: 'June 5, 2025';
    assert: ( june sixth , 2025 ) printString equals: 'June 6, 2025';
    assert: ( june seventh , 2025 ) printString equals: 'June 7, 2025';
    assert: ( june eighth , 2025 ) printString equals: 'June 8, 2025';
    assert: ( june ninth , 2025 ) printString equals: 'June 9, 2025';
    assert: ( june tenth , 2025 ) printString equals: 'June 10, 2025';
    assert: ( june eleventh , 2025 ) printString equals: 'June 11, 2025';
    assert: ( june twelfth , 2025 ) printString equals: 'June 12, 2025';
    assert: ( june thirteenth , 2025 ) printString equals: 'June 13, 2025';
    assert: ( june fourteenth , 2025 ) printString equals: 'June 14, 2025';
    assert: ( june fifteenth , 2025 ) printString equals: 'June 15, 2025';
    assert: ( june sixteenth , 2025 ) printString equals: 'June 16, 2025';
    assert: ( june seventeenth , 2025 ) printString equals: 'June 17, 2025';
    assert: ( june eighteenth , 2025 ) printString equals: 'June 18, 2025';
    assert: ( june nineteenth , 2025 ) printString equals: 'June 19, 2025';
    assert: ( june twentieth , 2025 ) printString equals: 'June 20, 2025';
    assert: ( june twentyFirst , 2025 ) printString equals: 'June 21, 2025';
    assert: ( june twentySecond , 2025 ) printString equals: 'June 22, 2025';
    assert: ( june twentyThird , 2025 ) printString equals: 'June 23, 2025';
    assert: ( june twentyFourth , 2025 ) printString equals: 'June 24, 2025';
    assert: ( june twentyFifth , 2025 ) printString equals: 'June 25, 2025';
    assert: ( june twentySixth , 2025 ) printString equals: 'June 26, 2025';
    assert: ( june twentySeventh , 2025 ) printString equals: 'June 27, 2025';
    assert: ( june twentyEighth , 2025 ) printString equals: 'June 28, 2025';
    assert: ( june twentyNinth , 2025 ) printString equals: 'June 29, 2025';
    assert: ( june thirtieth , 2025 ) printString equals: 'June 30, 2025';
    should: [ june thirtyFirst ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForMarch [

  self
    assert: ( march first , 2025 ) printString equals: 'March 1, 2025';
    assert: ( march second , 2025 ) printString equals: 'March 2, 2025';
    assert: ( march third , 2025 ) printString equals: 'March 3, 2025';
    assert: ( march fourth , 2025 ) printString equals: 'March 4, 2025';
    assert: ( march fifth , 2025 ) printString equals: 'March 5, 2025';
    assert: ( march sixth , 2025 ) printString equals: 'March 6, 2025';
    assert: ( march seventh , 2025 ) printString equals: 'March 7, 2025';
    assert: ( march eighth , 2025 ) printString equals: 'March 8, 2025';
    assert: ( march ninth , 2025 ) printString equals: 'March 9, 2025';
    assert: ( march tenth , 2025 ) printString equals: 'March 10, 2025';
    assert: ( march eleventh , 2025 ) printString equals: 'March 11, 2025';
    assert: ( march twelfth , 2025 ) printString equals: 'March 12, 2025';
    assert: ( march thirteenth , 2025 ) printString equals: 'March 13, 2025';
    assert: ( march fourteenth , 2025 ) printString equals: 'March 14, 2025';
    assert: ( march fifteenth , 2025 ) printString equals: 'March 15, 2025';
    assert: ( march sixteenth , 2025 ) printString equals: 'March 16, 2025';
    assert: ( march seventeenth , 2025 ) printString equals: 'March 17, 2025';
    assert: ( march eighteenth , 2025 ) printString equals: 'March 18, 2025';
    assert: ( march nineteenth , 2025 ) printString equals: 'March 19, 2025';
    assert: ( march twentieth , 2025 ) printString equals: 'March 20, 2025';
    assert: ( march twentyFirst , 2025 ) printString equals: 'March 21, 2025';
    assert: ( march twentySecond , 2025 ) printString equals: 'March 22, 2025';
    assert: ( march twentyThird , 2025 ) printString equals: 'March 23, 2025';
    assert: ( march twentyFourth , 2025 ) printString equals: 'March 24, 2025';
    assert: ( march twentyFifth , 2025 ) printString equals: 'March 25, 2025';
    assert: ( march twentySixth , 2025 ) printString equals: 'March 26, 2025';
    assert: ( march twentySeventh , 2025 ) printString equals: 'March 27, 2025';
    assert: ( march twentyEighth , 2025 ) printString equals: 'March 28, 2025';
    assert: ( march twentyNinth , 2025 ) printString equals: 'March 29, 2025';
    assert: ( march thirtieth , 2025 ) printString equals: 'March 30, 2025';
    assert: ( march thirtyFirst , 2025 ) printString equals: 'March 31, 2025'
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForMay [

  self
    assert: ( may first , 2025 ) printString equals: 'May 1, 2025';
    assert: ( may second , 2025 ) printString equals: 'May 2, 2025';
    assert: ( may third , 2025 ) printString equals: 'May 3, 2025';
    assert: ( may fourth , 2025 ) printString equals: 'May 4, 2025';
    assert: ( may fifth , 2025 ) printString equals: 'May 5, 2025';
    assert: ( may sixth , 2025 ) printString equals: 'May 6, 2025';
    assert: ( may seventh , 2025 ) printString equals: 'May 7, 2025';
    assert: ( may eighth , 2025 ) printString equals: 'May 8, 2025';
    assert: ( may ninth , 2025 ) printString equals: 'May 9, 2025';
    assert: ( may tenth , 2025 ) printString equals: 'May 10, 2025';
    assert: ( may eleventh , 2025 ) printString equals: 'May 11, 2025';
    assert: ( may twelfth , 2025 ) printString equals: 'May 12, 2025';
    assert: ( may thirteenth , 2025 ) printString equals: 'May 13, 2025';
    assert: ( may fourteenth , 2025 ) printString equals: 'May 14, 2025';
    assert: ( may fifteenth , 2025 ) printString equals: 'May 15, 2025';
    assert: ( may sixteenth , 2025 ) printString equals: 'May 16, 2025';
    assert: ( may seventeenth , 2025 ) printString equals: 'May 17, 2025';
    assert: ( may eighteenth , 2025 ) printString equals: 'May 18, 2025';
    assert: ( may nineteenth , 2025 ) printString equals: 'May 19, 2025';
    assert: ( may twentieth , 2025 ) printString equals: 'May 20, 2025';
    assert: ( may twentyFirst , 2025 ) printString equals: 'May 21, 2025';
    assert: ( may twentySecond , 2025 ) printString equals: 'May 22, 2025';
    assert: ( may twentyThird , 2025 ) printString equals: 'May 23, 2025';
    assert: ( may twentyFourth , 2025 ) printString equals: 'May 24, 2025';
    assert: ( may twentyFifth , 2025 ) printString equals: 'May 25, 2025';
    assert: ( may twentySixth , 2025 ) printString equals: 'May 26, 2025';
    assert: ( may twentySeventh , 2025 ) printString equals: 'May 27, 2025';
    assert: ( may twentyEighth , 2025 ) printString equals: 'May 28, 2025';
    assert: ( may twentyNinth , 2025 ) printString equals: 'May 29, 2025';
    assert: ( may thirtieth , 2025 ) printString equals: 'May 30, 2025';
    assert: ( may thirtyFirst , 2025 ) printString equals: 'May 31, 2025'
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForNovember [

  self
    assert: ( november first , 2025 ) printString equals: 'November 1, 2025';
    assert: ( november second , 2025 ) printString equals: 'November 2, 2025';
    assert: ( november third , 2025 ) printString equals: 'November 3, 2025';
    assert: ( november fourth , 2025 ) printString equals: 'November 4, 2025';
    assert: ( november fifth , 2025 ) printString equals: 'November 5, 2025';
    assert: ( november sixth , 2025 ) printString equals: 'November 6, 2025';
    assert: ( november seventh , 2025 ) printString equals: 'November 7, 2025';
    assert: ( november eighth , 2025 ) printString equals: 'November 8, 2025';
    assert: ( november ninth , 2025 ) printString equals: 'November 9, 2025';
    assert: ( november tenth , 2025 ) printString equals: 'November 10, 2025';
    assert: ( november eleventh , 2025 ) printString equals: 'November 11, 2025';
    assert: ( november twelfth , 2025 ) printString equals: 'November 12, 2025';
    assert: ( november thirteenth , 2025 ) printString equals: 'November 13, 2025';
    assert: ( november fourteenth , 2025 ) printString equals: 'November 14, 2025';
    assert: ( november fifteenth , 2025 ) printString equals: 'November 15, 2025';
    assert: ( november sixteenth , 2025 ) printString equals: 'November 16, 2025';
    assert: ( november seventeenth , 2025 ) printString equals: 'November 17, 2025';
    assert: ( november eighteenth , 2025 ) printString equals: 'November 18, 2025';
    assert: ( november nineteenth , 2025 ) printString equals: 'November 19, 2025';
    assert: ( november twentieth , 2025 ) printString equals: 'November 20, 2025';
    assert: ( november twentyFirst , 2025 ) printString equals: 'November 21, 2025';
    assert: ( november twentySecond , 2025 ) printString equals: 'November 22, 2025';
    assert: ( november twentyThird , 2025 ) printString equals: 'November 23, 2025';
    assert: ( november twentyFourth , 2025 ) printString equals: 'November 24, 2025';
    assert: ( november twentyFifth , 2025 ) printString equals: 'November 25, 2025';
    assert: ( november twentySixth , 2025 ) printString equals: 'November 26, 2025';
    assert: ( november twentySeventh , 2025 ) printString equals: 'November 27, 2025';
    assert: ( november twentyEighth , 2025 ) printString equals: 'November 28, 2025';
    assert: ( november twentyNinth , 2025 ) printString equals: 'November 29, 2025';
    assert: ( november thirtieth , 2025 ) printString equals: 'November 30, 2025';
    should: [ november thirtyFirst ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForOctober [

  self
    assert: ( october first , 2025 ) printString equals: 'October 1, 2025';
    assert: ( october second , 2025 ) printString equals: 'October 2, 2025';
    assert: ( october third , 2025 ) printString equals: 'October 3, 2025';
    assert: ( october fourth , 2025 ) printString equals: 'October 4, 2025';
    assert: ( october fifth , 2025 ) printString equals: 'October 5, 2025';
    assert: ( october sixth , 2025 ) printString equals: 'October 6, 2025';
    assert: ( october seventh , 2025 ) printString equals: 'October 7, 2025';
    assert: ( october eighth , 2025 ) printString equals: 'October 8, 2025';
    assert: ( october ninth , 2025 ) printString equals: 'October 9, 2025';
    assert: ( october tenth , 2025 ) printString equals: 'October 10, 2025';
    assert: ( october eleventh , 2025 ) printString equals: 'October 11, 2025';
    assert: ( october twelfth , 2025 ) printString equals: 'October 12, 2025';
    assert: ( october thirteenth , 2025 ) printString equals: 'October 13, 2025';
    assert: ( october fourteenth , 2025 ) printString equals: 'October 14, 2025';
    assert: ( october fifteenth , 2025 ) printString equals: 'October 15, 2025';
    assert: ( october sixteenth , 2025 ) printString equals: 'October 16, 2025';
    assert: ( october seventeenth , 2025 ) printString equals: 'October 17, 2025';
    assert: ( october eighteenth , 2025 ) printString equals: 'October 18, 2025';
    assert: ( october nineteenth , 2025 ) printString equals: 'October 19, 2025';
    assert: ( october twentieth , 2025 ) printString equals: 'October 20, 2025';
    assert: ( october twentyFirst , 2025 ) printString equals: 'October 21, 2025';
    assert: ( october twentySecond , 2025 ) printString equals: 'October 22, 2025';
    assert: ( october twentyThird , 2025 ) printString equals: 'October 23, 2025';
    assert: ( october twentyFourth , 2025 ) printString equals: 'October 24, 2025';
    assert: ( october twentyFifth , 2025 ) printString equals: 'October 25, 2025';
    assert: ( october twentySixth , 2025 ) printString equals: 'October 26, 2025';
    assert: ( october twentySeventh , 2025 ) printString equals: 'October 27, 2025';
    assert: ( october twentyEighth , 2025 ) printString equals: 'October 28, 2025';
    assert: ( october twentyNinth , 2025 ) printString equals: 'October 29, 2025';
    assert: ( october thirtieth , 2025 ) printString equals: 'October 30, 2025';
    assert: ( october thirtyFirst , 2025 ) printString equals: 'October 31, 2025'
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testInstanceCreationShortcutForSeptember [

  self
    assert: ( september first , 2025 ) printString equals: 'September 1, 2025';
    assert: ( september second , 2025 ) printString equals: 'September 2, 2025';
    assert: ( september third , 2025 ) printString equals: 'September 3, 2025';
    assert: ( september fourth , 2025 ) printString equals: 'September 4, 2025';
    assert: ( september fifth , 2025 ) printString equals: 'September 5, 2025';
    assert: ( september sixth , 2025 ) printString equals: 'September 6, 2025';
    assert: ( september seventh , 2025 ) printString equals: 'September 7, 2025';
    assert: ( september eighth , 2025 ) printString equals: 'September 8, 2025';
    assert: ( september ninth , 2025 ) printString equals: 'September 9, 2025';
    assert: ( september tenth , 2025 ) printString equals: 'September 10, 2025';
    assert: ( september eleventh , 2025 ) printString equals: 'September 11, 2025';
    assert: ( september twelfth , 2025 ) printString equals: 'September 12, 2025';
    assert: ( september thirteenth , 2025 ) printString equals: 'September 13, 2025';
    assert: ( september fourteenth , 2025 ) printString equals: 'September 14, 2025';
    assert: ( september fifteenth , 2025 ) printString equals: 'September 15, 2025';
    assert: ( september sixteenth , 2025 ) printString equals: 'September 16, 2025';
    assert: ( september seventeenth , 2025 ) printString equals: 'September 17, 2025';
    assert: ( september eighteenth , 2025 ) printString equals: 'September 18, 2025';
    assert: ( september nineteenth , 2025 ) printString equals: 'September 19, 2025';
    assert: ( september twentieth , 2025 ) printString equals: 'September 20, 2025';
    assert: ( september twentyFirst , 2025 ) printString equals: 'September 21, 2025';
    assert: ( september twentySecond , 2025 ) printString equals: 'September 22, 2025';
    assert: ( september twentyThird , 2025 ) printString equals: 'September 23, 2025';
    assert: ( september twentyFourth , 2025 ) printString equals: 'September 24, 2025';
    assert: ( september twentyFifth , 2025 ) printString equals: 'September 25, 2025';
    assert: ( september twentySixth , 2025 ) printString equals: 'September 26, 2025';
    assert: ( september twentySeventh , 2025 ) printString equals: 'September 27, 2025';
    assert: ( september twentyEighth , 2025 ) printString equals: 'September 28, 2025';
    assert: ( september twentyNinth , 2025 ) printString equals: 'September 29, 2025';
    assert: ( september thirtieth , 2025 ) printString equals: 'September 30, 2025';
    should: [ september thirtyFirst ] raise: MessageNotUnderstood
]

{ #category : 'tests' }
GregorianDayOfMonthTest >> testPrintString [

  self assert: GregorianMonth april first printString equals: 'April 1'
]
