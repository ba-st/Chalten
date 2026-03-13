Class {
	#name : 'HebrewDayOfMonthTest',
	#superclass : 'HebrewCalendarTest',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'tests' }
HebrewDayOfMonthTest >> testComparing [

  self
    assert: tishrei first equals: tishrei first;
    deny: tishrei first equals: tishrei second;
    deny: cheshvan first equals: tishrei first
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testDateCreation [

  | date |
  date := tishrei nineteenth , 1447.
  self
    assert: date month equals: tishrei;
    assert: date dayNumber equals: 19;
    assert: date yearNumber equals: 1447
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreation [

  | dayOfMonth |
  dayOfMonth := CalendarDayOfMonth hebrewMonth: tishrei dayNumber: 1.
  self
    assert: dayOfMonth month equals: tishrei;
    assert: dayOfMonth dayNumber equals: 1
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcut [

  | dayOfMonth |
  dayOfMonth := cheshvan first.
  self
    assert: dayOfMonth month equals: cheshvan;
    assert: dayOfMonth dayNumber equals: 1
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForAdar [

  self
    assert: ( adar first , 5794 ) printString equals: 'Adar 1, 5794 AM';
    assert: ( adar second , 5794 ) printString equals: 'Adar 2, 5794 AM';
    assert: ( adar third , 5794 ) printString equals: 'Adar 3, 5794 AM';
    assert: ( adar fourth , 5794 ) printString equals: 'Adar 4, 5794 AM';
    assert: ( adar fifth , 5794 ) printString equals: 'Adar 5, 5794 AM';
    assert: ( adar sixth , 5794 ) printString equals: 'Adar 6, 5794 AM';
    assert: ( adar seventh , 5794 ) printString equals: 'Adar 7, 5794 AM';
    assert: ( adar eighth , 5794 ) printString equals: 'Adar 8, 5794 AM';
    assert: ( adar ninth , 5794 ) printString equals: 'Adar 9, 5794 AM';
    assert: ( adar tenth , 5794 ) printString equals: 'Adar 10, 5794 AM';
    assert: ( adar eleventh , 5794 ) printString equals: 'Adar 11, 5794 AM';
    assert: ( adar twelfth , 5794 ) printString equals: 'Adar 12, 5794 AM';
    assert: ( adar thirteenth , 5794 ) printString equals: 'Adar 13, 5794 AM';
    assert: ( adar fourteenth , 5794 ) printString equals: 'Adar 14, 5794 AM';
    assert: ( adar fifteenth , 5794 ) printString equals: 'Adar 15, 5794 AM';
    assert: ( adar sixteenth , 5794 ) printString equals: 'Adar 16, 5794 AM';
    assert: ( adar seventeenth , 5794 ) printString equals: 'Adar 17, 5794 AM';
    assert: ( adar eighteenth , 5794 ) printString equals: 'Adar 18, 5794 AM';
    assert: ( adar nineteenth , 5794 ) printString equals: 'Adar 19, 5794 AM';
    assert: ( adar twentieth , 5794 ) printString equals: 'Adar 20, 5794 AM';
    assert: ( adar twentyFirst , 5794 ) printString equals: 'Adar 21, 5794 AM';
    assert: ( adar twentySecond , 5794 ) printString equals: 'Adar 22, 5794 AM';
    assert: ( adar twentyThird , 5794 ) printString equals: 'Adar 23, 5794 AM';
    assert: ( adar twentyFourth , 5794 ) printString equals: 'Adar 24, 5794 AM';
    assert: ( adar twentyFifth , 5794 ) printString equals: 'Adar 25, 5794 AM';
    assert: ( adar twentySixth , 5794 ) printString equals: 'Adar 26, 5794 AM';
    assert: ( adar twentySeventh , 5794 ) printString equals: 'Adar 27, 5794 AM';
    assert: ( adar twentyEighth , 5794 ) printString equals: 'Adar 28, 5794 AM';
    assert: ( adar twentyNinth , 5794 ) printString equals: 'Adar 29, 5794 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForAdarI [

  self
    assert: ( adarI first , 5793 ) printString equals: 'Adar I 1, 5793 AM';
    assert: ( adarI second , 5793 ) printString equals: 'Adar I 2, 5793 AM';
    assert: ( adarI third , 5793 ) printString equals: 'Adar I 3, 5793 AM';
    assert: ( adarI fourth , 5793 ) printString equals: 'Adar I 4, 5793 AM';
    assert: ( adarI fifth , 5793 ) printString equals: 'Adar I 5, 5793 AM';
    assert: ( adarI sixth , 5793 ) printString equals: 'Adar I 6, 5793 AM';
    assert: ( adarI seventh , 5793 ) printString equals: 'Adar I 7, 5793 AM';
    assert: ( adarI eighth , 5793 ) printString equals: 'Adar I 8, 5793 AM';
    assert: ( adarI ninth , 5793 ) printString equals: 'Adar I 9, 5793 AM';
    assert: ( adarI tenth , 5793 ) printString equals: 'Adar I 10, 5793 AM';
    assert: ( adarI eleventh , 5793 ) printString equals: 'Adar I 11, 5793 AM';
    assert: ( adarI twelfth , 5793 ) printString equals: 'Adar I 12, 5793 AM';
    assert: ( adarI thirteenth , 5793 ) printString equals: 'Adar I 13, 5793 AM';
    assert: ( adarI fourteenth , 5793 ) printString equals: 'Adar I 14, 5793 AM';
    assert: ( adarI fifteenth , 5793 ) printString equals: 'Adar I 15, 5793 AM';
    assert: ( adarI sixteenth , 5793 ) printString equals: 'Adar I 16, 5793 AM';
    assert: ( adarI seventeenth , 5793 ) printString equals: 'Adar I 17, 5793 AM';
    assert: ( adarI eighteenth , 5793 ) printString equals: 'Adar I 18, 5793 AM';
    assert: ( adarI nineteenth , 5793 ) printString equals: 'Adar I 19, 5793 AM';
    assert: ( adarI twentieth , 5793 ) printString equals: 'Adar I 20, 5793 AM';
    assert: ( adarI twentyFirst , 5793 ) printString equals: 'Adar I 21, 5793 AM';
    assert: ( adarI twentySecond , 5793 ) printString equals: 'Adar I 22, 5793 AM';
    assert: ( adarI twentyThird , 5793 ) printString equals: 'Adar I 23, 5793 AM';
    assert: ( adarI twentyFourth , 5793 ) printString equals: 'Adar I 24, 5793 AM';
    assert: ( adarI twentyFifth , 5793 ) printString equals: 'Adar I 25, 5793 AM';
    assert: ( adarI twentySixth , 5793 ) printString equals: 'Adar I 26, 5793 AM';
    assert: ( adarI twentySeventh , 5793 ) printString equals: 'Adar I 27, 5793 AM';
    assert: ( adarI twentyEighth , 5793 ) printString equals: 'Adar I 28, 5793 AM';
    assert: ( adarI twentyNinth , 5793 ) printString equals: 'Adar I 29, 5793 AM';
    assert: ( adarI thirtieth , 5793 ) printString equals: 'Adar I 30, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForAdarII [

  self
    assert: ( adarII first , 5793 ) printString equals: 'Adar II 1, 5793 AM';
    assert: ( adarII second , 5793 ) printString equals: 'Adar II 2, 5793 AM';
    assert: ( adarII third , 5793 ) printString equals: 'Adar II 3, 5793 AM';
    assert: ( adarII fourth , 5793 ) printString equals: 'Adar II 4, 5793 AM';
    assert: ( adarII fifth , 5793 ) printString equals: 'Adar II 5, 5793 AM';
    assert: ( adarII sixth , 5793 ) printString equals: 'Adar II 6, 5793 AM';
    assert: ( adarII seventh , 5793 ) printString equals: 'Adar II 7, 5793 AM';
    assert: ( adarII eighth , 5793 ) printString equals: 'Adar II 8, 5793 AM';
    assert: ( adarII ninth , 5793 ) printString equals: 'Adar II 9, 5793 AM';
    assert: ( adarII tenth , 5793 ) printString equals: 'Adar II 10, 5793 AM';
    assert: ( adarII eleventh , 5793 ) printString equals: 'Adar II 11, 5793 AM';
    assert: ( adarII twelfth , 5793 ) printString equals: 'Adar II 12, 5793 AM';
    assert: ( adarII thirteenth , 5793 ) printString equals: 'Adar II 13, 5793 AM';
    assert: ( adarII fourteenth , 5793 ) printString equals: 'Adar II 14, 5793 AM';
    assert: ( adarII fifteenth , 5793 ) printString equals: 'Adar II 15, 5793 AM';
    assert: ( adarII sixteenth , 5793 ) printString equals: 'Adar II 16, 5793 AM';
    assert: ( adarII seventeenth , 5793 ) printString equals: 'Adar II 17, 5793 AM';
    assert: ( adarII eighteenth , 5793 ) printString equals: 'Adar II 18, 5793 AM';
    assert: ( adarII nineteenth , 5793 ) printString equals: 'Adar II 19, 5793 AM';
    assert: ( adarII twentieth , 5793 ) printString equals: 'Adar II 20, 5793 AM';
    assert: ( adarII twentyFirst , 5793 ) printString equals: 'Adar II 21, 5793 AM';
    assert: ( adarII twentySecond , 5793 ) printString equals: 'Adar II 22, 5793 AM';
    assert: ( adarII twentyThird , 5793 ) printString equals: 'Adar II 23, 5793 AM';
    assert: ( adarII twentyFourth , 5793 ) printString equals: 'Adar II 24, 5793 AM';
    assert: ( adarII twentyFifth , 5793 ) printString equals: 'Adar II 25, 5793 AM';
    assert: ( adarII twentySixth , 5793 ) printString equals: 'Adar II 26, 5793 AM';
    assert: ( adarII twentySeventh , 5793 ) printString equals: 'Adar II 27, 5793 AM';
    assert: ( adarII twentyEighth , 5793 ) printString equals: 'Adar II 28, 5793 AM';
    assert: ( adarII twentyNinth , 5793 ) printString equals: 'Adar II 29, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForAv [

  self
    assert: ( av first , 5793 ) printString equals: 'Av 1, 5793 AM';
    assert: ( av second , 5793 ) printString equals: 'Av 2, 5793 AM';
    assert: ( av third , 5793 ) printString equals: 'Av 3, 5793 AM';
    assert: ( av fourth , 5793 ) printString equals: 'Av 4, 5793 AM';
    assert: ( av fifth , 5793 ) printString equals: 'Av 5, 5793 AM';
    assert: ( av sixth , 5793 ) printString equals: 'Av 6, 5793 AM';
    assert: ( av seventh , 5793 ) printString equals: 'Av 7, 5793 AM';
    assert: ( av eighth , 5793 ) printString equals: 'Av 8, 5793 AM';
    assert: ( av ninth , 5793 ) printString equals: 'Av 9, 5793 AM';
    assert: ( av tenth , 5793 ) printString equals: 'Av 10, 5793 AM';
    assert: ( av eleventh , 5793 ) printString equals: 'Av 11, 5793 AM';
    assert: ( av twelfth , 5793 ) printString equals: 'Av 12, 5793 AM';
    assert: ( av thirteenth , 5793 ) printString equals: 'Av 13, 5793 AM';
    assert: ( av fourteenth , 5793 ) printString equals: 'Av 14, 5793 AM';
    assert: ( av fifteenth , 5793 ) printString equals: 'Av 15, 5793 AM';
    assert: ( av sixteenth , 5793 ) printString equals: 'Av 16, 5793 AM';
    assert: ( av seventeenth , 5793 ) printString equals: 'Av 17, 5793 AM';
    assert: ( av eighteenth , 5793 ) printString equals: 'Av 18, 5793 AM';
    assert: ( av nineteenth , 5793 ) printString equals: 'Av 19, 5793 AM';
    assert: ( av twentieth , 5793 ) printString equals: 'Av 20, 5793 AM';
    assert: ( av twentyFirst , 5793 ) printString equals: 'Av 21, 5793 AM';
    assert: ( av twentySecond , 5793 ) printString equals: 'Av 22, 5793 AM';
    assert: ( av twentyThird , 5793 ) printString equals: 'Av 23, 5793 AM';
    assert: ( av twentyFourth , 5793 ) printString equals: 'Av 24, 5793 AM';
    assert: ( av twentyFifth , 5793 ) printString equals: 'Av 25, 5793 AM';
    assert: ( av twentySixth , 5793 ) printString equals: 'Av 26, 5793 AM';
    assert: ( av twentySeventh , 5793 ) printString equals: 'Av 27, 5793 AM';
    assert: ( av twentyEighth , 5793 ) printString equals: 'Av 28, 5793 AM';
    assert: ( av twentyNinth , 5793 ) printString equals: 'Av 29, 5793 AM';
    assert: ( av thirtieth , 5793 ) printString equals: 'Av 30, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForCheshvan [

  self
    assert: ( cheshvan first , 5793 ) printString equals: 'Cheshvan 1, 5793 AM';
    assert: ( cheshvan second , 5793 ) printString equals: 'Cheshvan 2, 5793 AM';
    assert: ( cheshvan third , 5793 ) printString equals: 'Cheshvan 3, 5793 AM';
    assert: ( cheshvan fourth , 5793 ) printString equals: 'Cheshvan 4, 5793 AM';
    assert: ( cheshvan fifth , 5793 ) printString equals: 'Cheshvan 5, 5793 AM';
    assert: ( cheshvan sixth , 5793 ) printString equals: 'Cheshvan 6, 5793 AM';
    assert: ( cheshvan seventh , 5793 ) printString equals: 'Cheshvan 7, 5793 AM';
    assert: ( cheshvan eighth , 5793 ) printString equals: 'Cheshvan 8, 5793 AM';
    assert: ( cheshvan ninth , 5793 ) printString equals: 'Cheshvan 9, 5793 AM';
    assert: ( cheshvan tenth , 5793 ) printString equals: 'Cheshvan 10, 5793 AM';
    assert: ( cheshvan eleventh , 5793 ) printString equals: 'Cheshvan 11, 5793 AM';
    assert: ( cheshvan twelfth , 5793 ) printString equals: 'Cheshvan 12, 5793 AM';
    assert: ( cheshvan thirteenth , 5793 ) printString equals: 'Cheshvan 13, 5793 AM';
    assert: ( cheshvan fourteenth , 5793 ) printString equals: 'Cheshvan 14, 5793 AM';
    assert: ( cheshvan fifteenth , 5793 ) printString equals: 'Cheshvan 15, 5793 AM';
    assert: ( cheshvan sixteenth , 5793 ) printString equals: 'Cheshvan 16, 5793 AM';
    assert: ( cheshvan seventeenth , 5793 ) printString equals: 'Cheshvan 17, 5793 AM';
    assert: ( cheshvan eighteenth , 5793 ) printString equals: 'Cheshvan 18, 5793 AM';
    assert: ( cheshvan nineteenth , 5793 ) printString equals: 'Cheshvan 19, 5793 AM';
    assert: ( cheshvan twentieth , 5793 ) printString equals: 'Cheshvan 20, 5793 AM';
    assert: ( cheshvan twentyFirst , 5793 ) printString equals: 'Cheshvan 21, 5793 AM';
    assert: ( cheshvan twentySecond , 5793 ) printString equals: 'Cheshvan 22, 5793 AM';
    assert: ( cheshvan twentyThird , 5793 ) printString equals: 'Cheshvan 23, 5793 AM';
    assert: ( cheshvan twentyFourth , 5793 ) printString equals: 'Cheshvan 24, 5793 AM';
    assert: ( cheshvan twentyFifth , 5793 ) printString equals: 'Cheshvan 25, 5793 AM';
    assert: ( cheshvan twentySixth , 5793 ) printString equals: 'Cheshvan 26, 5793 AM';
    assert: ( cheshvan twentySeventh , 5793 ) printString equals: 'Cheshvan 27, 5793 AM';
    assert: ( cheshvan twentyEighth , 5793 ) printString equals: 'Cheshvan 28, 5793 AM';
    assert: ( cheshvan twentyNinth , 5793 ) printString equals: 'Cheshvan 29, 5793 AM';
    should: [ cheshvan thirtieth , 5793 ]
    raise: InstanceCreationFailed
    withMessageText: '30 is an invalid day number in Cheshvan, 5793 AM';
    assert: ( cheshvan thirtieth , 5759 ) printString equals: 'Cheshvan 30, 5759 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForElul [

  self
    assert: ( elul first , 5793 ) printString equals: 'Elul 1, 5793 AM';
    assert: ( elul second , 5793 ) printString equals: 'Elul 2, 5793 AM';
    assert: ( elul third , 5793 ) printString equals: 'Elul 3, 5793 AM';
    assert: ( elul fourth , 5793 ) printString equals: 'Elul 4, 5793 AM';
    assert: ( elul fifth , 5793 ) printString equals: 'Elul 5, 5793 AM';
    assert: ( elul sixth , 5793 ) printString equals: 'Elul 6, 5793 AM';
    assert: ( elul seventh , 5793 ) printString equals: 'Elul 7, 5793 AM';
    assert: ( elul eighth , 5793 ) printString equals: 'Elul 8, 5793 AM';
    assert: ( elul ninth , 5793 ) printString equals: 'Elul 9, 5793 AM';
    assert: ( elul tenth , 5793 ) printString equals: 'Elul 10, 5793 AM';
    assert: ( elul eleventh , 5793 ) printString equals: 'Elul 11, 5793 AM';
    assert: ( elul twelfth , 5793 ) printString equals: 'Elul 12, 5793 AM';
    assert: ( elul thirteenth , 5793 ) printString equals: 'Elul 13, 5793 AM';
    assert: ( elul fourteenth , 5793 ) printString equals: 'Elul 14, 5793 AM';
    assert: ( elul fifteenth , 5793 ) printString equals: 'Elul 15, 5793 AM';
    assert: ( elul sixteenth , 5793 ) printString equals: 'Elul 16, 5793 AM';
    assert: ( elul seventeenth , 5793 ) printString equals: 'Elul 17, 5793 AM';
    assert: ( elul eighteenth , 5793 ) printString equals: 'Elul 18, 5793 AM';
    assert: ( elul nineteenth , 5793 ) printString equals: 'Elul 19, 5793 AM';
    assert: ( elul twentieth , 5793 ) printString equals: 'Elul 20, 5793 AM';
    assert: ( elul twentyFirst , 5793 ) printString equals: 'Elul 21, 5793 AM';
    assert: ( elul twentySecond , 5793 ) printString equals: 'Elul 22, 5793 AM';
    assert: ( elul twentyThird , 5793 ) printString equals: 'Elul 23, 5793 AM';
    assert: ( elul twentyFourth , 5793 ) printString equals: 'Elul 24, 5793 AM';
    assert: ( elul twentyFifth , 5793 ) printString equals: 'Elul 25, 5793 AM';
    assert: ( elul twentySixth , 5793 ) printString equals: 'Elul 26, 5793 AM';
    assert: ( elul twentySeventh , 5793 ) printString equals: 'Elul 27, 5793 AM';
    assert: ( elul twentyEighth , 5793 ) printString equals: 'Elul 28, 5793 AM';
    assert: ( elul twentyNinth , 5793 ) printString equals: 'Elul 29, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForIyar [

  self
    assert: ( iyar first , 5793 ) printString equals: 'Iyar 1, 5793 AM';
    assert: ( iyar second , 5793 ) printString equals: 'Iyar 2, 5793 AM';
    assert: ( iyar third , 5793 ) printString equals: 'Iyar 3, 5793 AM';
    assert: ( iyar fourth , 5793 ) printString equals: 'Iyar 4, 5793 AM';
    assert: ( iyar fifth , 5793 ) printString equals: 'Iyar 5, 5793 AM';
    assert: ( iyar sixth , 5793 ) printString equals: 'Iyar 6, 5793 AM';
    assert: ( iyar seventh , 5793 ) printString equals: 'Iyar 7, 5793 AM';
    assert: ( iyar eighth , 5793 ) printString equals: 'Iyar 8, 5793 AM';
    assert: ( iyar ninth , 5793 ) printString equals: 'Iyar 9, 5793 AM';
    assert: ( iyar tenth , 5793 ) printString equals: 'Iyar 10, 5793 AM';
    assert: ( iyar eleventh , 5793 ) printString equals: 'Iyar 11, 5793 AM';
    assert: ( iyar twelfth , 5793 ) printString equals: 'Iyar 12, 5793 AM';
    assert: ( iyar thirteenth , 5793 ) printString equals: 'Iyar 13, 5793 AM';
    assert: ( iyar fourteenth , 5793 ) printString equals: 'Iyar 14, 5793 AM';
    assert: ( iyar fifteenth , 5793 ) printString equals: 'Iyar 15, 5793 AM';
    assert: ( iyar sixteenth , 5793 ) printString equals: 'Iyar 16, 5793 AM';
    assert: ( iyar seventeenth , 5793 ) printString equals: 'Iyar 17, 5793 AM';
    assert: ( iyar eighteenth , 5793 ) printString equals: 'Iyar 18, 5793 AM';
    assert: ( iyar nineteenth , 5793 ) printString equals: 'Iyar 19, 5793 AM';
    assert: ( iyar twentieth , 5793 ) printString equals: 'Iyar 20, 5793 AM';
    assert: ( iyar twentyFirst , 5793 ) printString equals: 'Iyar 21, 5793 AM';
    assert: ( iyar twentySecond , 5793 ) printString equals: 'Iyar 22, 5793 AM';
    assert: ( iyar twentyThird , 5793 ) printString equals: 'Iyar 23, 5793 AM';
    assert: ( iyar twentyFourth , 5793 ) printString equals: 'Iyar 24, 5793 AM';
    assert: ( iyar twentyFifth , 5793 ) printString equals: 'Iyar 25, 5793 AM';
    assert: ( iyar twentySixth , 5793 ) printString equals: 'Iyar 26, 5793 AM';
    assert: ( iyar twentySeventh , 5793 ) printString equals: 'Iyar 27, 5793 AM';
    assert: ( iyar twentyEighth , 5793 ) printString equals: 'Iyar 28, 5793 AM';
    assert: ( iyar twentyNinth , 5793 ) printString equals: 'Iyar 29, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForKislev [

  self
    assert: ( kislev first , 5793 ) printString equals: 'Kislev 1, 5793 AM';
    assert: ( kislev second , 5793 ) printString equals: 'Kislev 2, 5793 AM';
    assert: ( kislev third , 5793 ) printString equals: 'Kislev 3, 5793 AM';
    assert: ( kislev fourth , 5793 ) printString equals: 'Kislev 4, 5793 AM';
    assert: ( kislev fifth , 5793 ) printString equals: 'Kislev 5, 5793 AM';
    assert: ( kislev sixth , 5793 ) printString equals: 'Kislev 6, 5793 AM';
    assert: ( kislev seventh , 5793 ) printString equals: 'Kislev 7, 5793 AM';
    assert: ( kislev eighth , 5793 ) printString equals: 'Kislev 8, 5793 AM';
    assert: ( kislev ninth , 5793 ) printString equals: 'Kislev 9, 5793 AM';
    assert: ( kislev tenth , 5793 ) printString equals: 'Kislev 10, 5793 AM';
    assert: ( kislev eleventh , 5793 ) printString equals: 'Kislev 11, 5793 AM';
    assert: ( kislev twelfth , 5793 ) printString equals: 'Kislev 12, 5793 AM';
    assert: ( kislev thirteenth , 5793 ) printString equals: 'Kislev 13, 5793 AM';
    assert: ( kislev fourteenth , 5793 ) printString equals: 'Kislev 14, 5793 AM';
    assert: ( kislev fifteenth , 5793 ) printString equals: 'Kislev 15, 5793 AM';
    assert: ( kislev sixteenth , 5793 ) printString equals: 'Kislev 16, 5793 AM';
    assert: ( kislev seventeenth , 5793 ) printString equals: 'Kislev 17, 5793 AM';
    assert: ( kislev eighteenth , 5793 ) printString equals: 'Kislev 18, 5793 AM';
    assert: ( kislev nineteenth , 5793 ) printString equals: 'Kislev 19, 5793 AM';
    assert: ( kislev twentieth , 5793 ) printString equals: 'Kislev 20, 5793 AM';
    assert: ( kislev twentyFirst , 5793 ) printString equals: 'Kislev 21, 5793 AM';
    assert: ( kislev twentySecond , 5793 ) printString equals: 'Kislev 22, 5793 AM';
    assert: ( kislev twentyThird , 5793 ) printString equals: 'Kislev 23, 5793 AM';
    assert: ( kislev twentyFourth , 5793 ) printString equals: 'Kislev 24, 5793 AM';
    assert: ( kislev twentyFifth , 5793 ) printString equals: 'Kislev 25, 5793 AM';
    assert: ( kislev twentySixth , 5793 ) printString equals: 'Kislev 26, 5793 AM';
    assert: ( kislev twentySeventh , 5793 ) printString equals: 'Kislev 27, 5793 AM';
    assert: ( kislev twentyEighth , 5793 ) printString equals: 'Kislev 28, 5793 AM';
    assert: ( kislev twentyNinth , 5793 ) printString equals: 'Kislev 29, 5793 AM';
    should: [ kislev thirtieth , 5793 ]
    raise: InstanceCreationFailed
    withMessageText: '30 is an invalid day number in Kislev, 5793 AM';
    assert: ( kislev thirtieth , 5759 ) printString equals: 'Kislev 30, 5759 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForNisan [

  self
    assert: ( nisan first , 5793 ) printString equals: 'Nisan 1, 5793 AM';
    assert: ( nisan second , 5793 ) printString equals: 'Nisan 2, 5793 AM';
    assert: ( nisan third , 5793 ) printString equals: 'Nisan 3, 5793 AM';
    assert: ( nisan fourth , 5793 ) printString equals: 'Nisan 4, 5793 AM';
    assert: ( nisan fifth , 5793 ) printString equals: 'Nisan 5, 5793 AM';
    assert: ( nisan sixth , 5793 ) printString equals: 'Nisan 6, 5793 AM';
    assert: ( nisan seventh , 5793 ) printString equals: 'Nisan 7, 5793 AM';
    assert: ( nisan eighth , 5793 ) printString equals: 'Nisan 8, 5793 AM';
    assert: ( nisan ninth , 5793 ) printString equals: 'Nisan 9, 5793 AM';
    assert: ( nisan tenth , 5793 ) printString equals: 'Nisan 10, 5793 AM';
    assert: ( nisan eleventh , 5793 ) printString equals: 'Nisan 11, 5793 AM';
    assert: ( nisan twelfth , 5793 ) printString equals: 'Nisan 12, 5793 AM';
    assert: ( nisan thirteenth , 5793 ) printString equals: 'Nisan 13, 5793 AM';
    assert: ( nisan fourteenth , 5793 ) printString equals: 'Nisan 14, 5793 AM';
    assert: ( nisan fifteenth , 5793 ) printString equals: 'Nisan 15, 5793 AM';
    assert: ( nisan sixteenth , 5793 ) printString equals: 'Nisan 16, 5793 AM';
    assert: ( nisan seventeenth , 5793 ) printString equals: 'Nisan 17, 5793 AM';
    assert: ( nisan eighteenth , 5793 ) printString equals: 'Nisan 18, 5793 AM';
    assert: ( nisan nineteenth , 5793 ) printString equals: 'Nisan 19, 5793 AM';
    assert: ( nisan twentieth , 5793 ) printString equals: 'Nisan 20, 5793 AM';
    assert: ( nisan twentyFirst , 5793 ) printString equals: 'Nisan 21, 5793 AM';
    assert: ( nisan twentySecond , 5793 ) printString equals: 'Nisan 22, 5793 AM';
    assert: ( nisan twentyThird , 5793 ) printString equals: 'Nisan 23, 5793 AM';
    assert: ( nisan twentyFourth , 5793 ) printString equals: 'Nisan 24, 5793 AM';
    assert: ( nisan twentyFifth , 5793 ) printString equals: 'Nisan 25, 5793 AM';
    assert: ( nisan twentySixth , 5793 ) printString equals: 'Nisan 26, 5793 AM';
    assert: ( nisan twentySeventh , 5793 ) printString equals: 'Nisan 27, 5793 AM';
    assert: ( nisan twentyEighth , 5793 ) printString equals: 'Nisan 28, 5793 AM';
    assert: ( nisan twentyNinth , 5793 ) printString equals: 'Nisan 29, 5793 AM';
    assert: ( nisan thirtieth , 5793 ) printString equals: 'Nisan 30, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForShevat [

  self
    assert: ( shevat first , 5793 ) printString equals: 'Shevat 1, 5793 AM';
    assert: ( shevat second , 5793 ) printString equals: 'Shevat 2, 5793 AM';
    assert: ( shevat third , 5793 ) printString equals: 'Shevat 3, 5793 AM';
    assert: ( shevat fourth , 5793 ) printString equals: 'Shevat 4, 5793 AM';
    assert: ( shevat fifth , 5793 ) printString equals: 'Shevat 5, 5793 AM';
    assert: ( shevat sixth , 5793 ) printString equals: 'Shevat 6, 5793 AM';
    assert: ( shevat seventh , 5793 ) printString equals: 'Shevat 7, 5793 AM';
    assert: ( shevat eighth , 5793 ) printString equals: 'Shevat 8, 5793 AM';
    assert: ( shevat ninth , 5793 ) printString equals: 'Shevat 9, 5793 AM';
    assert: ( shevat tenth , 5793 ) printString equals: 'Shevat 10, 5793 AM';
    assert: ( shevat eleventh , 5793 ) printString equals: 'Shevat 11, 5793 AM';
    assert: ( shevat twelfth , 5793 ) printString equals: 'Shevat 12, 5793 AM';
    assert: ( shevat thirteenth , 5793 ) printString equals: 'Shevat 13, 5793 AM';
    assert: ( shevat fourteenth , 5793 ) printString equals: 'Shevat 14, 5793 AM';
    assert: ( shevat fifteenth , 5793 ) printString equals: 'Shevat 15, 5793 AM';
    assert: ( shevat sixteenth , 5793 ) printString equals: 'Shevat 16, 5793 AM';
    assert: ( shevat seventeenth , 5793 ) printString equals: 'Shevat 17, 5793 AM';
    assert: ( shevat eighteenth , 5793 ) printString equals: 'Shevat 18, 5793 AM';
    assert: ( shevat nineteenth , 5793 ) printString equals: 'Shevat 19, 5793 AM';
    assert: ( shevat twentieth , 5793 ) printString equals: 'Shevat 20, 5793 AM';
    assert: ( shevat twentyFirst , 5793 ) printString equals: 'Shevat 21, 5793 AM';
    assert: ( shevat twentySecond , 5793 ) printString equals: 'Shevat 22, 5793 AM';
    assert: ( shevat twentyThird , 5793 ) printString equals: 'Shevat 23, 5793 AM';
    assert: ( shevat twentyFourth , 5793 ) printString equals: 'Shevat 24, 5793 AM';
    assert: ( shevat twentyFifth , 5793 ) printString equals: 'Shevat 25, 5793 AM';
    assert: ( shevat twentySixth , 5793 ) printString equals: 'Shevat 26, 5793 AM';
    assert: ( shevat twentySeventh , 5793 ) printString equals: 'Shevat 27, 5793 AM';
    assert: ( shevat twentyEighth , 5793 ) printString equals: 'Shevat 28, 5793 AM';
    assert: ( shevat twentyNinth , 5793 ) printString equals: 'Shevat 29, 5793 AM';
    assert: ( shevat thirtieth , 5793 ) printString equals: 'Shevat 30, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForSivan [

  self
    assert: ( sivan first , 5793 ) printString equals: 'Sivan 1, 5793 AM';
    assert: ( sivan second , 5793 ) printString equals: 'Sivan 2, 5793 AM';
    assert: ( sivan third , 5793 ) printString equals: 'Sivan 3, 5793 AM';
    assert: ( sivan fourth , 5793 ) printString equals: 'Sivan 4, 5793 AM';
    assert: ( sivan fifth , 5793 ) printString equals: 'Sivan 5, 5793 AM';
    assert: ( sivan sixth , 5793 ) printString equals: 'Sivan 6, 5793 AM';
    assert: ( sivan seventh , 5793 ) printString equals: 'Sivan 7, 5793 AM';
    assert: ( sivan eighth , 5793 ) printString equals: 'Sivan 8, 5793 AM';
    assert: ( sivan ninth , 5793 ) printString equals: 'Sivan 9, 5793 AM';
    assert: ( sivan tenth , 5793 ) printString equals: 'Sivan 10, 5793 AM';
    assert: ( sivan eleventh , 5793 ) printString equals: 'Sivan 11, 5793 AM';
    assert: ( sivan twelfth , 5793 ) printString equals: 'Sivan 12, 5793 AM';
    assert: ( sivan thirteenth , 5793 ) printString equals: 'Sivan 13, 5793 AM';
    assert: ( sivan fourteenth , 5793 ) printString equals: 'Sivan 14, 5793 AM';
    assert: ( sivan fifteenth , 5793 ) printString equals: 'Sivan 15, 5793 AM';
    assert: ( sivan sixteenth , 5793 ) printString equals: 'Sivan 16, 5793 AM';
    assert: ( sivan seventeenth , 5793 ) printString equals: 'Sivan 17, 5793 AM';
    assert: ( sivan eighteenth , 5793 ) printString equals: 'Sivan 18, 5793 AM';
    assert: ( sivan nineteenth , 5793 ) printString equals: 'Sivan 19, 5793 AM';
    assert: ( sivan twentieth , 5793 ) printString equals: 'Sivan 20, 5793 AM';
    assert: ( sivan twentyFirst , 5793 ) printString equals: 'Sivan 21, 5793 AM';
    assert: ( sivan twentySecond , 5793 ) printString equals: 'Sivan 22, 5793 AM';
    assert: ( sivan twentyThird , 5793 ) printString equals: 'Sivan 23, 5793 AM';
    assert: ( sivan twentyFourth , 5793 ) printString equals: 'Sivan 24, 5793 AM';
    assert: ( sivan twentyFifth , 5793 ) printString equals: 'Sivan 25, 5793 AM';
    assert: ( sivan twentySixth , 5793 ) printString equals: 'Sivan 26, 5793 AM';
    assert: ( sivan twentySeventh , 5793 ) printString equals: 'Sivan 27, 5793 AM';
    assert: ( sivan twentyEighth , 5793 ) printString equals: 'Sivan 28, 5793 AM';
    assert: ( sivan twentyNinth , 5793 ) printString equals: 'Sivan 29, 5793 AM';
    assert: ( sivan thirtieth , 5793 ) printString equals: 'Sivan 30, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForTammuz [

  self
    assert: ( tammuz first , 5793 ) printString equals: 'Tammuz 1, 5793 AM';
    assert: ( tammuz second , 5793 ) printString equals: 'Tammuz 2, 5793 AM';
    assert: ( tammuz third , 5793 ) printString equals: 'Tammuz 3, 5793 AM';
    assert: ( tammuz fourth , 5793 ) printString equals: 'Tammuz 4, 5793 AM';
    assert: ( tammuz fifth , 5793 ) printString equals: 'Tammuz 5, 5793 AM';
    assert: ( tammuz sixth , 5793 ) printString equals: 'Tammuz 6, 5793 AM';
    assert: ( tammuz seventh , 5793 ) printString equals: 'Tammuz 7, 5793 AM';
    assert: ( tammuz eighth , 5793 ) printString equals: 'Tammuz 8, 5793 AM';
    assert: ( tammuz ninth , 5793 ) printString equals: 'Tammuz 9, 5793 AM';
    assert: ( tammuz tenth , 5793 ) printString equals: 'Tammuz 10, 5793 AM';
    assert: ( tammuz eleventh , 5793 ) printString equals: 'Tammuz 11, 5793 AM';
    assert: ( tammuz twelfth , 5793 ) printString equals: 'Tammuz 12, 5793 AM';
    assert: ( tammuz thirteenth , 5793 ) printString equals: 'Tammuz 13, 5793 AM';
    assert: ( tammuz fourteenth , 5793 ) printString equals: 'Tammuz 14, 5793 AM';
    assert: ( tammuz fifteenth , 5793 ) printString equals: 'Tammuz 15, 5793 AM';
    assert: ( tammuz sixteenth , 5793 ) printString equals: 'Tammuz 16, 5793 AM';
    assert: ( tammuz seventeenth , 5793 ) printString equals: 'Tammuz 17, 5793 AM';
    assert: ( tammuz eighteenth , 5793 ) printString equals: 'Tammuz 18, 5793 AM';
    assert: ( tammuz nineteenth , 5793 ) printString equals: 'Tammuz 19, 5793 AM';
    assert: ( tammuz twentieth , 5793 ) printString equals: 'Tammuz 20, 5793 AM';
    assert: ( tammuz twentyFirst , 5793 ) printString equals: 'Tammuz 21, 5793 AM';
    assert: ( tammuz twentySecond , 5793 ) printString equals: 'Tammuz 22, 5793 AM';
    assert: ( tammuz twentyThird , 5793 ) printString equals: 'Tammuz 23, 5793 AM';
    assert: ( tammuz twentyFourth , 5793 ) printString equals: 'Tammuz 24, 5793 AM';
    assert: ( tammuz twentyFifth , 5793 ) printString equals: 'Tammuz 25, 5793 AM';
    assert: ( tammuz twentySixth , 5793 ) printString equals: 'Tammuz 26, 5793 AM';
    assert: ( tammuz twentySeventh , 5793 ) printString equals: 'Tammuz 27, 5793 AM';
    assert: ( tammuz twentyEighth , 5793 ) printString equals: 'Tammuz 28, 5793 AM';
    assert: ( tammuz twentyNinth , 5793 ) printString equals: 'Tammuz 29, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForTevet [

  self
    assert: ( tevet first , 5793 ) printString equals: 'Tevet 1, 5793 AM';
    assert: ( tevet second , 5793 ) printString equals: 'Tevet 2, 5793 AM';
    assert: ( tevet third , 5793 ) printString equals: 'Tevet 3, 5793 AM';
    assert: ( tevet fourth , 5793 ) printString equals: 'Tevet 4, 5793 AM';
    assert: ( tevet fifth , 5793 ) printString equals: 'Tevet 5, 5793 AM';
    assert: ( tevet sixth , 5793 ) printString equals: 'Tevet 6, 5793 AM';
    assert: ( tevet seventh , 5793 ) printString equals: 'Tevet 7, 5793 AM';
    assert: ( tevet eighth , 5793 ) printString equals: 'Tevet 8, 5793 AM';
    assert: ( tevet ninth , 5793 ) printString equals: 'Tevet 9, 5793 AM';
    assert: ( tevet tenth , 5793 ) printString equals: 'Tevet 10, 5793 AM';
    assert: ( tevet eleventh , 5793 ) printString equals: 'Tevet 11, 5793 AM';
    assert: ( tevet twelfth , 5793 ) printString equals: 'Tevet 12, 5793 AM';
    assert: ( tevet thirteenth , 5793 ) printString equals: 'Tevet 13, 5793 AM';
    assert: ( tevet fourteenth , 5793 ) printString equals: 'Tevet 14, 5793 AM';
    assert: ( tevet fifteenth , 5793 ) printString equals: 'Tevet 15, 5793 AM';
    assert: ( tevet sixteenth , 5793 ) printString equals: 'Tevet 16, 5793 AM';
    assert: ( tevet seventeenth , 5793 ) printString equals: 'Tevet 17, 5793 AM';
    assert: ( tevet eighteenth , 5793 ) printString equals: 'Tevet 18, 5793 AM';
    assert: ( tevet nineteenth , 5793 ) printString equals: 'Tevet 19, 5793 AM';
    assert: ( tevet twentieth , 5793 ) printString equals: 'Tevet 20, 5793 AM';
    assert: ( tevet twentyFirst , 5793 ) printString equals: 'Tevet 21, 5793 AM';
    assert: ( tevet twentySecond , 5793 ) printString equals: 'Tevet 22, 5793 AM';
    assert: ( tevet twentyThird , 5793 ) printString equals: 'Tevet 23, 5793 AM';
    assert: ( tevet twentyFourth , 5793 ) printString equals: 'Tevet 24, 5793 AM';
    assert: ( tevet twentyFifth , 5793 ) printString equals: 'Tevet 25, 5793 AM';
    assert: ( tevet twentySixth , 5793 ) printString equals: 'Tevet 26, 5793 AM';
    assert: ( tevet twentySeventh , 5793 ) printString equals: 'Tevet 27, 5793 AM';
    assert: ( tevet twentyEighth , 5793 ) printString equals: 'Tevet 28, 5793 AM';
    assert: ( tevet twentyNinth , 5793 ) printString equals: 'Tevet 29, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testInstanceCreationShortcutForTishrei [

  self
    assert: ( tishrei first , 5793 ) printString equals: 'Tishrei 1, 5793 AM';
    assert: ( tishrei second , 5793 ) printString equals: 'Tishrei 2, 5793 AM';
    assert: ( tishrei third , 5793 ) printString equals: 'Tishrei 3, 5793 AM';
    assert: ( tishrei fourth , 5793 ) printString equals: 'Tishrei 4, 5793 AM';
    assert: ( tishrei fifth , 5793 ) printString equals: 'Tishrei 5, 5793 AM';
    assert: ( tishrei sixth , 5793 ) printString equals: 'Tishrei 6, 5793 AM';
    assert: ( tishrei seventh , 5793 ) printString equals: 'Tishrei 7, 5793 AM';
    assert: ( tishrei eighth , 5793 ) printString equals: 'Tishrei 8, 5793 AM';
    assert: ( tishrei ninth , 5793 ) printString equals: 'Tishrei 9, 5793 AM';
    assert: ( tishrei tenth , 5793 ) printString equals: 'Tishrei 10, 5793 AM';
    assert: ( tishrei eleventh , 5793 ) printString equals: 'Tishrei 11, 5793 AM';
    assert: ( tishrei twelfth , 5793 ) printString equals: 'Tishrei 12, 5793 AM';
    assert: ( tishrei thirteenth , 5793 ) printString equals: 'Tishrei 13, 5793 AM';
    assert: ( tishrei fourteenth , 5793 ) printString equals: 'Tishrei 14, 5793 AM';
    assert: ( tishrei fifteenth , 5793 ) printString equals: 'Tishrei 15, 5793 AM';
    assert: ( tishrei sixteenth , 5793 ) printString equals: 'Tishrei 16, 5793 AM';
    assert: ( tishrei seventeenth , 5793 ) printString equals: 'Tishrei 17, 5793 AM';
    assert: ( tishrei eighteenth , 5793 ) printString equals: 'Tishrei 18, 5793 AM';
    assert: ( tishrei nineteenth , 5793 ) printString equals: 'Tishrei 19, 5793 AM';
    assert: ( tishrei twentieth , 5793 ) printString equals: 'Tishrei 20, 5793 AM';
    assert: ( tishrei twentyFirst , 5793 ) printString equals: 'Tishrei 21, 5793 AM';
    assert: ( tishrei twentySecond , 5793 ) printString equals: 'Tishrei 22, 5793 AM';
    assert: ( tishrei twentyThird , 5793 ) printString equals: 'Tishrei 23, 5793 AM';
    assert: ( tishrei twentyFourth , 5793 ) printString equals: 'Tishrei 24, 5793 AM';
    assert: ( tishrei twentyFifth , 5793 ) printString equals: 'Tishrei 25, 5793 AM';
    assert: ( tishrei twentySixth , 5793 ) printString equals: 'Tishrei 26, 5793 AM';
    assert: ( tishrei twentySeventh , 5793 ) printString equals: 'Tishrei 27, 5793 AM';
    assert: ( tishrei twentyEighth , 5793 ) printString equals: 'Tishrei 28, 5793 AM';
    assert: ( tishrei twentyNinth , 5793 ) printString equals: 'Tishrei 29, 5793 AM';
    assert: ( tishrei thirtieth , 5793 ) printString equals: 'Tishrei 30, 5793 AM'
]

{ #category : 'tests' }
HebrewDayOfMonthTest >> testPrintString [

  self assert: tishrei first printString equals: 'Tishrei 1'
]
