Class {
	#name : 'IslamicDayOfMonthTest',
	#superclass : 'IslamicCalendarTest',
	#category : 'Chalten-Islamic-Calendar-Tests',
	#package : 'Chalten-Islamic-Calendar-Tests'
}

{ #category : 'tests' }
IslamicDayOfMonthTest >> testCannotCreateWithMonthOfAnotherCalendar [

  self
    should: [ CalendarDayOfMonth gregorianMonth: muharram dayNumber: 1 ]
    raise: AssertionFailed
    withMessageText: 'Cannot use non-gregorian months for days of gregorian months';
    should: [ CalendarDayOfMonth islamicMonth: april dayNumber: 1 ]
    raise: AssertionFailed
    withMessageText: 'Cannot use non-islamic months for days of islamic months'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testComparing [

  self
    assert: ramadan first equals: ramadan first;
    deny: ramadan first equals: ramadan second;
    deny: shaban first equals: ramadan first
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testDateCreation [

  | date |
  date := safar nineteenth , 1447.
  self
    assert: date month equals: safar;
    assert: date dayNumber equals: 19;
    assert: date yearNumber equals: 1447
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreation [

  | dayOfMonth |
  dayOfMonth := CalendarDayOfMonth islamicMonth: ramadan dayNumber: 1.
  self
    assert: dayOfMonth month equals: ramadan;
    assert: dayOfMonth dayNumber equals: 1
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcut [

  | dayOfMonth |
  dayOfMonth := safar first.
  self
    assert: dayOfMonth month equals: safar;
    assert: dayOfMonth dayNumber equals: 1
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForDuAlQiDah [

  self
    assert: ( duAlQiDah first , 1417 ) printString equals: 'Dhu al-Qi''dah 1, 1417 AH';
    assert: ( duAlQiDah second , 1417 ) printString equals: 'Dhu al-Qi''dah 2, 1417 AH';
    assert: ( duAlQiDah third , 1417 ) printString equals: 'Dhu al-Qi''dah 3, 1417 AH';
    assert: ( duAlQiDah fourth , 1417 ) printString equals: 'Dhu al-Qi''dah 4, 1417 AH';
    assert: ( duAlQiDah fifth , 1417 ) printString equals: 'Dhu al-Qi''dah 5, 1417 AH';
    assert: ( duAlQiDah sixth , 1417 ) printString equals: 'Dhu al-Qi''dah 6, 1417 AH';
    assert: ( duAlQiDah seventh , 1417 ) printString equals: 'Dhu al-Qi''dah 7, 1417 AH';
    assert: ( duAlQiDah eighth , 1417 ) printString equals: 'Dhu al-Qi''dah 8, 1417 AH';
    assert: ( duAlQiDah ninth , 1417 ) printString equals: 'Dhu al-Qi''dah 9, 1417 AH';
    assert: ( duAlQiDah tenth , 1417 ) printString equals: 'Dhu al-Qi''dah 10, 1417 AH';
    assert: ( duAlQiDah eleventh , 1417 ) printString equals: 'Dhu al-Qi''dah 11, 1417 AH';
    assert: ( duAlQiDah twelfth , 1417 ) printString equals: 'Dhu al-Qi''dah 12, 1417 AH';
    assert: ( duAlQiDah thirteenth , 1417 ) printString equals: 'Dhu al-Qi''dah 13, 1417 AH';
    assert: ( duAlQiDah fourteenth , 1417 ) printString equals: 'Dhu al-Qi''dah 14, 1417 AH';
    assert: ( duAlQiDah fifteenth , 1417 ) printString equals: 'Dhu al-Qi''dah 15, 1417 AH';
    assert: ( duAlQiDah sixteenth , 1417 ) printString equals: 'Dhu al-Qi''dah 16, 1417 AH';
    assert: ( duAlQiDah seventeenth , 1417 ) printString equals: 'Dhu al-Qi''dah 17, 1417 AH';
    assert: ( duAlQiDah eighteenth , 1417 ) printString equals: 'Dhu al-Qi''dah 18, 1417 AH';
    assert: ( duAlQiDah nineteenth , 1417 ) printString equals: 'Dhu al-Qi''dah 19, 1417 AH';
    assert: ( duAlQiDah twentieth , 1417 ) printString equals: 'Dhu al-Qi''dah 20, 1417 AH';
    assert: ( duAlQiDah twentyFirst , 1417 ) printString equals: 'Dhu al-Qi''dah 21, 1417 AH';
    assert: ( duAlQiDah twentySecond , 1417 ) printString equals: 'Dhu al-Qi''dah 22, 1417 AH';
    assert: ( duAlQiDah twentyThird , 1417 ) printString equals: 'Dhu al-Qi''dah 23, 1417 AH';
    assert: ( duAlQiDah twentyFourth , 1417 ) printString equals: 'Dhu al-Qi''dah 24, 1417 AH';
    assert: ( duAlQiDah twentyFifth , 1417 ) printString equals: 'Dhu al-Qi''dah 25, 1417 AH';
    assert: ( duAlQiDah twentySixth , 1417 ) printString equals: 'Dhu al-Qi''dah 26, 1417 AH';
    assert: ( duAlQiDah twentySeventh , 1417 ) printString equals: 'Dhu al-Qi''dah 27, 1417 AH';
    assert: ( duAlQiDah twentyEighth , 1417 ) printString equals: 'Dhu al-Qi''dah 28, 1417 AH';
    assert: ( duAlQiDah twentyNinth , 1417 ) printString equals: 'Dhu al-Qi''dah 29, 1417 AH';
    assert: ( duAlQiDah thirtieth , 1417 ) printString equals: 'Dhu al-Qi''dah 30, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForDuAlQiHijjah [

  self
    assert: ( duAlHijjah first , 1417 ) printString equals: 'Dhu al-Hijjah 1, 1417 AH';
    assert: ( duAlHijjah second , 1417 ) printString equals: 'Dhu al-Hijjah 2, 1417 AH';
    assert: ( duAlHijjah third , 1417 ) printString equals: 'Dhu al-Hijjah 3, 1417 AH';
    assert: ( duAlHijjah fourth , 1417 ) printString equals: 'Dhu al-Hijjah 4, 1417 AH';
    assert: ( duAlHijjah fifth , 1417 ) printString equals: 'Dhu al-Hijjah 5, 1417 AH';
    assert: ( duAlHijjah sixth , 1417 ) printString equals: 'Dhu al-Hijjah 6, 1417 AH';
    assert: ( duAlHijjah seventh , 1417 ) printString equals: 'Dhu al-Hijjah 7, 1417 AH';
    assert: ( duAlHijjah eighth , 1417 ) printString equals: 'Dhu al-Hijjah 8, 1417 AH';
    assert: ( duAlHijjah ninth , 1417 ) printString equals: 'Dhu al-Hijjah 9, 1417 AH';
    assert: ( duAlHijjah tenth , 1417 ) printString equals: 'Dhu al-Hijjah 10, 1417 AH';
    assert: ( duAlHijjah eleventh , 1417 ) printString equals: 'Dhu al-Hijjah 11, 1417 AH';
    assert: ( duAlHijjah twelfth , 1417 ) printString equals: 'Dhu al-Hijjah 12, 1417 AH';
    assert: ( duAlHijjah thirteenth , 1417 ) printString equals: 'Dhu al-Hijjah 13, 1417 AH';
    assert: ( duAlHijjah fourteenth , 1417 ) printString equals: 'Dhu al-Hijjah 14, 1417 AH';
    assert: ( duAlHijjah fifteenth , 1417 ) printString equals: 'Dhu al-Hijjah 15, 1417 AH';
    assert: ( duAlHijjah sixteenth , 1417 ) printString equals: 'Dhu al-Hijjah 16, 1417 AH';
    assert: ( duAlHijjah seventeenth , 1417 ) printString equals: 'Dhu al-Hijjah 17, 1417 AH';
    assert: ( duAlHijjah eighteenth , 1417 ) printString equals: 'Dhu al-Hijjah 18, 1417 AH';
    assert: ( duAlHijjah nineteenth , 1417 ) printString equals: 'Dhu al-Hijjah 19, 1417 AH';
    assert: ( duAlHijjah twentieth , 1417 ) printString equals: 'Dhu al-Hijjah 20, 1417 AH';
    assert: ( duAlHijjah twentyFirst , 1417 ) printString equals: 'Dhu al-Hijjah 21, 1417 AH';
    assert: ( duAlHijjah twentySecond , 1417 ) printString equals: 'Dhu al-Hijjah 22, 1417 AH';
    assert: ( duAlHijjah twentyThird , 1417 ) printString equals: 'Dhu al-Hijjah 23, 1417 AH';
    assert: ( duAlHijjah twentyFourth , 1417 ) printString equals: 'Dhu al-Hijjah 24, 1417 AH';
    assert: ( duAlHijjah twentyFifth , 1417 ) printString equals: 'Dhu al-Hijjah 25, 1417 AH';
    assert: ( duAlHijjah twentySixth , 1417 ) printString equals: 'Dhu al-Hijjah 26, 1417 AH';
    assert: ( duAlHijjah twentySeventh , 1417 ) printString equals: 'Dhu al-Hijjah 27, 1417 AH';
    assert: ( duAlHijjah twentyEighth , 1417 ) printString equals: 'Dhu al-Hijjah 28, 1417 AH';
    assert: ( duAlHijjah twentyNinth , 1417 ) printString equals: 'Dhu al-Hijjah 29, 1417 AH';
    assert: ( duAlHijjah thirtieth , 1442 ) printString equals: 'Dhu al-Hijjah 30, 1442 AH';
    should: [ duAlHijjah thirtieth , 1443 ]
    raise: InstanceCreationFailed
    withMessageText: '30 is an invalid day number in Dhu al-Hijjah, 1443 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForJumadaI [

  self
    assert: ( jumadaAlAwwal first , 1417 ) printString equals: 'Jumada al-Awwal 1, 1417 AH';
    assert: ( jumadaAlAwwal second , 1417 ) printString equals: 'Jumada al-Awwal 2, 1417 AH';
    assert: ( jumadaAlAwwal third , 1417 ) printString equals: 'Jumada al-Awwal 3, 1417 AH';
    assert: ( jumadaAlAwwal fourth , 1417 ) printString equals: 'Jumada al-Awwal 4, 1417 AH';
    assert: ( jumadaAlAwwal fifth , 1417 ) printString equals: 'Jumada al-Awwal 5, 1417 AH';
    assert: ( jumadaAlAwwal sixth , 1417 ) printString equals: 'Jumada al-Awwal 6, 1417 AH';
    assert: ( jumadaAlAwwal seventh , 1417 ) printString equals: 'Jumada al-Awwal 7, 1417 AH';
    assert: ( jumadaAlAwwal eighth , 1417 ) printString equals: 'Jumada al-Awwal 8, 1417 AH';
    assert: ( jumadaAlAwwal ninth , 1417 ) printString equals: 'Jumada al-Awwal 9, 1417 AH';
    assert: ( jumadaAlAwwal tenth , 1417 ) printString equals: 'Jumada al-Awwal 10, 1417 AH';
    assert: ( jumadaAlAwwal eleventh , 1417 ) printString equals: 'Jumada al-Awwal 11, 1417 AH';
    assert: ( jumadaAlAwwal twelfth , 1417 ) printString equals: 'Jumada al-Awwal 12, 1417 AH';
    assert: ( jumadaAlAwwal thirteenth , 1417 ) printString equals: 'Jumada al-Awwal 13, 1417 AH';
    assert: ( jumadaAlAwwal fourteenth , 1417 ) printString equals: 'Jumada al-Awwal 14, 1417 AH';
    assert: ( jumadaAlAwwal fifteenth , 1417 ) printString equals: 'Jumada al-Awwal 15, 1417 AH';
    assert: ( jumadaAlAwwal sixteenth , 1417 ) printString equals: 'Jumada al-Awwal 16, 1417 AH';
    assert: ( jumadaAlAwwal seventeenth , 1417 ) printString equals: 'Jumada al-Awwal 17, 1417 AH';
    assert: ( jumadaAlAwwal eighteenth , 1417 ) printString equals: 'Jumada al-Awwal 18, 1417 AH';
    assert: ( jumadaAlAwwal nineteenth , 1417 ) printString equals: 'Jumada al-Awwal 19, 1417 AH';
    assert: ( jumadaAlAwwal twentieth , 1417 ) printString equals: 'Jumada al-Awwal 20, 1417 AH';
    assert: ( jumadaAlAwwal twentyFirst , 1417 ) printString equals: 'Jumada al-Awwal 21, 1417 AH';
    assert: ( jumadaAlAwwal twentySecond , 1417 ) printString equals: 'Jumada al-Awwal 22, 1417 AH';
    assert: ( jumadaAlAwwal twentyThird , 1417 ) printString equals: 'Jumada al-Awwal 23, 1417 AH';
    assert: ( jumadaAlAwwal twentyFourth , 1417 ) printString equals: 'Jumada al-Awwal 24, 1417 AH';
    assert: ( jumadaAlAwwal twentyFifth , 1417 ) printString equals: 'Jumada al-Awwal 25, 1417 AH';
    assert: ( jumadaAlAwwal twentySixth , 1417 ) printString equals: 'Jumada al-Awwal 26, 1417 AH';
    assert: ( jumadaAlAwwal twentySeventh , 1417 ) printString equals: 'Jumada al-Awwal 27, 1417 AH';
    assert: ( jumadaAlAwwal twentyEighth , 1417 ) printString equals: 'Jumada al-Awwal 28, 1417 AH';
    assert: ( jumadaAlAwwal twentyNinth , 1417 ) printString equals: 'Jumada al-Awwal 29, 1417 AH';
    assert: ( jumadaAlAwwal thirtieth , 1417 ) printString equals: 'Jumada al-Awwal 30, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForJumadaII [

  self
    assert: ( jumadaAlThani first , 1417 ) printString equals: 'Jumada al-Thani 1, 1417 AH';
    assert: ( jumadaAlThani second , 1417 ) printString equals: 'Jumada al-Thani 2, 1417 AH';
    assert: ( jumadaAlThani third , 1417 ) printString equals: 'Jumada al-Thani 3, 1417 AH';
    assert: ( jumadaAlThani fourth , 1417 ) printString equals: 'Jumada al-Thani 4, 1417 AH';
    assert: ( jumadaAlThani fifth , 1417 ) printString equals: 'Jumada al-Thani 5, 1417 AH';
    assert: ( jumadaAlThani sixth , 1417 ) printString equals: 'Jumada al-Thani 6, 1417 AH';
    assert: ( jumadaAlThani seventh , 1417 ) printString equals: 'Jumada al-Thani 7, 1417 AH';
    assert: ( jumadaAlThani eighth , 1417 ) printString equals: 'Jumada al-Thani 8, 1417 AH';
    assert: ( jumadaAlThani ninth , 1417 ) printString equals: 'Jumada al-Thani 9, 1417 AH';
    assert: ( jumadaAlThani tenth , 1417 ) printString equals: 'Jumada al-Thani 10, 1417 AH';
    assert: ( jumadaAlThani eleventh , 1417 ) printString equals: 'Jumada al-Thani 11, 1417 AH';
    assert: ( jumadaAlThani twelfth , 1417 ) printString equals: 'Jumada al-Thani 12, 1417 AH';
    assert: ( jumadaAlThani thirteenth , 1417 ) printString equals: 'Jumada al-Thani 13, 1417 AH';
    assert: ( jumadaAlThani fourteenth , 1417 ) printString equals: 'Jumada al-Thani 14, 1417 AH';
    assert: ( jumadaAlThani fifteenth , 1417 ) printString equals: 'Jumada al-Thani 15, 1417 AH';
    assert: ( jumadaAlThani sixteenth , 1417 ) printString equals: 'Jumada al-Thani 16, 1417 AH';
    assert: ( jumadaAlThani seventeenth , 1417 ) printString equals: 'Jumada al-Thani 17, 1417 AH';
    assert: ( jumadaAlThani eighteenth , 1417 ) printString equals: 'Jumada al-Thani 18, 1417 AH';
    assert: ( jumadaAlThani nineteenth , 1417 ) printString equals: 'Jumada al-Thani 19, 1417 AH';
    assert: ( jumadaAlThani twentieth , 1417 ) printString equals: 'Jumada al-Thani 20, 1417 AH';
    assert: ( jumadaAlThani twentyFirst , 1417 ) printString equals: 'Jumada al-Thani 21, 1417 AH';
    assert: ( jumadaAlThani twentySecond , 1417 ) printString equals: 'Jumada al-Thani 22, 1417 AH';
    assert: ( jumadaAlThani twentyThird , 1417 ) printString equals: 'Jumada al-Thani 23, 1417 AH';
    assert: ( jumadaAlThani twentyFourth , 1417 ) printString equals: 'Jumada al-Thani 24, 1417 AH';
    assert: ( jumadaAlThani twentyFifth , 1417 ) printString equals: 'Jumada al-Thani 25, 1417 AH';
    assert: ( jumadaAlThani twentySixth , 1417 ) printString equals: 'Jumada al-Thani 26, 1417 AH';
    assert: ( jumadaAlThani twentySeventh , 1417 ) printString equals: 'Jumada al-Thani 27, 1417 AH';
    assert: ( jumadaAlThani twentyEighth , 1417 ) printString equals: 'Jumada al-Thani 28, 1417 AH';
    assert: ( jumadaAlThani twentyNinth , 1417 ) printString equals: 'Jumada al-Thani 29, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForMuharram [

  self
    assert: ( muharram first , 1417 ) printString equals: 'Muharram 1, 1417 AH';
    assert: ( muharram second , 1417 ) printString equals: 'Muharram 2, 1417 AH';
    assert: ( muharram third , 1417 ) printString equals: 'Muharram 3, 1417 AH';
    assert: ( muharram fourth , 1417 ) printString equals: 'Muharram 4, 1417 AH';
    assert: ( muharram fifth , 1417 ) printString equals: 'Muharram 5, 1417 AH';
    assert: ( muharram sixth , 1417 ) printString equals: 'Muharram 6, 1417 AH';
    assert: ( muharram seventh , 1417 ) printString equals: 'Muharram 7, 1417 AH';
    assert: ( muharram eighth , 1417 ) printString equals: 'Muharram 8, 1417 AH';
    assert: ( muharram ninth , 1417 ) printString equals: 'Muharram 9, 1417 AH';
    assert: ( muharram tenth , 1417 ) printString equals: 'Muharram 10, 1417 AH';
    assert: ( muharram eleventh , 1417 ) printString equals: 'Muharram 11, 1417 AH';
    assert: ( muharram twelfth , 1417 ) printString equals: 'Muharram 12, 1417 AH';
    assert: ( muharram thirteenth , 1417 ) printString equals: 'Muharram 13, 1417 AH';
    assert: ( muharram fourteenth , 1417 ) printString equals: 'Muharram 14, 1417 AH';
    assert: ( muharram fifteenth , 1417 ) printString equals: 'Muharram 15, 1417 AH';
    assert: ( muharram sixteenth , 1417 ) printString equals: 'Muharram 16, 1417 AH';
    assert: ( muharram seventeenth , 1417 ) printString equals: 'Muharram 17, 1417 AH';
    assert: ( muharram eighteenth , 1417 ) printString equals: 'Muharram 18, 1417 AH';
    assert: ( muharram nineteenth , 1417 ) printString equals: 'Muharram 19, 1417 AH';
    assert: ( muharram twentieth , 1417 ) printString equals: 'Muharram 20, 1417 AH';
    assert: ( muharram twentyFirst , 1417 ) printString equals: 'Muharram 21, 1417 AH';
    assert: ( muharram twentySecond , 1417 ) printString equals: 'Muharram 22, 1417 AH';
    assert: ( muharram twentyThird , 1417 ) printString equals: 'Muharram 23, 1417 AH';
    assert: ( muharram twentyFourth , 1417 ) printString equals: 'Muharram 24, 1417 AH';
    assert: ( muharram twentyFifth , 1417 ) printString equals: 'Muharram 25, 1417 AH';
    assert: ( muharram twentySixth , 1417 ) printString equals: 'Muharram 26, 1417 AH';
    assert: ( muharram twentySeventh , 1417 ) printString equals: 'Muharram 27, 1417 AH';
    assert: ( muharram twentyEighth , 1417 ) printString equals: 'Muharram 28, 1417 AH';
    assert: ( muharram twentyNinth , 1417 ) printString equals: 'Muharram 29, 1417 AH';
    assert: ( muharram thirtieth , 1417 ) printString equals: 'Muharram 30, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForRabiI [

  self
    assert: ( rabiAlAwwal first , 1417 ) printString equals: 'Rabi'' al-Awwal 1, 1417 AH';
    assert: ( rabiAlAwwal second , 1417 ) printString equals: 'Rabi'' al-Awwal 2, 1417 AH';
    assert: ( rabiAlAwwal third , 1417 ) printString equals: 'Rabi'' al-Awwal 3, 1417 AH';
    assert: ( rabiAlAwwal fourth , 1417 ) printString equals: 'Rabi'' al-Awwal 4, 1417 AH';
    assert: ( rabiAlAwwal fifth , 1417 ) printString equals: 'Rabi'' al-Awwal 5, 1417 AH';
    assert: ( rabiAlAwwal sixth , 1417 ) printString equals: 'Rabi'' al-Awwal 6, 1417 AH';
    assert: ( rabiAlAwwal seventh , 1417 ) printString equals: 'Rabi'' al-Awwal 7, 1417 AH';
    assert: ( rabiAlAwwal eighth , 1417 ) printString equals: 'Rabi'' al-Awwal 8, 1417 AH';
    assert: ( rabiAlAwwal ninth , 1417 ) printString equals: 'Rabi'' al-Awwal 9, 1417 AH';
    assert: ( rabiAlAwwal tenth , 1417 ) printString equals: 'Rabi'' al-Awwal 10, 1417 AH';
    assert: ( rabiAlAwwal eleventh , 1417 ) printString equals: 'Rabi'' al-Awwal 11, 1417 AH';
    assert: ( rabiAlAwwal twelfth , 1417 ) printString equals: 'Rabi'' al-Awwal 12, 1417 AH';
    assert: ( rabiAlAwwal thirteenth , 1417 ) printString equals: 'Rabi'' al-Awwal 13, 1417 AH';
    assert: ( rabiAlAwwal fourteenth , 1417 ) printString equals: 'Rabi'' al-Awwal 14, 1417 AH';
    assert: ( rabiAlAwwal fifteenth , 1417 ) printString equals: 'Rabi'' al-Awwal 15, 1417 AH';
    assert: ( rabiAlAwwal sixteenth , 1417 ) printString equals: 'Rabi'' al-Awwal 16, 1417 AH';
    assert: ( rabiAlAwwal seventeenth , 1417 ) printString equals: 'Rabi'' al-Awwal 17, 1417 AH';
    assert: ( rabiAlAwwal eighteenth , 1417 ) printString equals: 'Rabi'' al-Awwal 18, 1417 AH';
    assert: ( rabiAlAwwal nineteenth , 1417 ) printString equals: 'Rabi'' al-Awwal 19, 1417 AH';
    assert: ( rabiAlAwwal twentieth , 1417 ) printString equals: 'Rabi'' al-Awwal 20, 1417 AH';
    assert: ( rabiAlAwwal twentyFirst , 1417 ) printString equals: 'Rabi'' al-Awwal 21, 1417 AH';
    assert: ( rabiAlAwwal twentySecond , 1417 ) printString equals: 'Rabi'' al-Awwal 22, 1417 AH';
    assert: ( rabiAlAwwal twentyThird , 1417 ) printString equals: 'Rabi'' al-Awwal 23, 1417 AH';
    assert: ( rabiAlAwwal twentyFourth , 1417 ) printString equals: 'Rabi'' al-Awwal 24, 1417 AH';
    assert: ( rabiAlAwwal twentyFifth , 1417 ) printString equals: 'Rabi'' al-Awwal 25, 1417 AH';
    assert: ( rabiAlAwwal twentySixth , 1417 ) printString equals: 'Rabi'' al-Awwal 26, 1417 AH';
    assert: ( rabiAlAwwal twentySeventh , 1417 ) printString equals: 'Rabi'' al-Awwal 27, 1417 AH';
    assert: ( rabiAlAwwal twentyEighth , 1417 ) printString equals: 'Rabi'' al-Awwal 28, 1417 AH';
    assert: ( rabiAlAwwal twentyNinth , 1417 ) printString equals: 'Rabi'' al-Awwal 29, 1417 AH';
    assert: ( rabiAlAwwal thirtieth , 1417 ) printString equals: 'Rabi'' al-Awwal 30, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForRabiII [

  self
    assert: ( rabiAlThani first , 1417 ) printString equals: 'Rabi'' al-Thani 1, 1417 AH';
    assert: ( rabiAlThani second , 1417 ) printString equals: 'Rabi'' al-Thani 2, 1417 AH';
    assert: ( rabiAlThani third , 1417 ) printString equals: 'Rabi'' al-Thani 3, 1417 AH';
    assert: ( rabiAlThani fourth , 1417 ) printString equals: 'Rabi'' al-Thani 4, 1417 AH';
    assert: ( rabiAlThani fifth , 1417 ) printString equals: 'Rabi'' al-Thani 5, 1417 AH';
    assert: ( rabiAlThani sixth , 1417 ) printString equals: 'Rabi'' al-Thani 6, 1417 AH';
    assert: ( rabiAlThani seventh , 1417 ) printString equals: 'Rabi'' al-Thani 7, 1417 AH';
    assert: ( rabiAlThani eighth , 1417 ) printString equals: 'Rabi'' al-Thani 8, 1417 AH';
    assert: ( rabiAlThani ninth , 1417 ) printString equals: 'Rabi'' al-Thani 9, 1417 AH';
    assert: ( rabiAlThani tenth , 1417 ) printString equals: 'Rabi'' al-Thani 10, 1417 AH';
    assert: ( rabiAlThani eleventh , 1417 ) printString equals: 'Rabi'' al-Thani 11, 1417 AH';
    assert: ( rabiAlThani twelfth , 1417 ) printString equals: 'Rabi'' al-Thani 12, 1417 AH';
    assert: ( rabiAlThani thirteenth , 1417 ) printString equals: 'Rabi'' al-Thani 13, 1417 AH';
    assert: ( rabiAlThani fourteenth , 1417 ) printString equals: 'Rabi'' al-Thani 14, 1417 AH';
    assert: ( rabiAlThani fifteenth , 1417 ) printString equals: 'Rabi'' al-Thani 15, 1417 AH';
    assert: ( rabiAlThani sixteenth , 1417 ) printString equals: 'Rabi'' al-Thani 16, 1417 AH';
    assert: ( rabiAlThani seventeenth , 1417 ) printString equals: 'Rabi'' al-Thani 17, 1417 AH';
    assert: ( rabiAlThani eighteenth , 1417 ) printString equals: 'Rabi'' al-Thani 18, 1417 AH';
    assert: ( rabiAlThani nineteenth , 1417 ) printString equals: 'Rabi'' al-Thani 19, 1417 AH';
    assert: ( rabiAlThani twentieth , 1417 ) printString equals: 'Rabi'' al-Thani 20, 1417 AH';
    assert: ( rabiAlThani twentyFirst , 1417 ) printString equals: 'Rabi'' al-Thani 21, 1417 AH';
    assert: ( rabiAlThani twentySecond , 1417 ) printString equals: 'Rabi'' al-Thani 22, 1417 AH';
    assert: ( rabiAlThani twentyThird , 1417 ) printString equals: 'Rabi'' al-Thani 23, 1417 AH';
    assert: ( rabiAlThani twentyFourth , 1417 ) printString equals: 'Rabi'' al-Thani 24, 1417 AH';
    assert: ( rabiAlThani twentyFifth , 1417 ) printString equals: 'Rabi'' al-Thani 25, 1417 AH';
    assert: ( rabiAlThani twentySixth , 1417 ) printString equals: 'Rabi'' al-Thani 26, 1417 AH';
    assert: ( rabiAlThani twentySeventh , 1417 ) printString equals: 'Rabi'' al-Thani 27, 1417 AH';
    assert: ( rabiAlThani twentyEighth , 1417 ) printString equals: 'Rabi'' al-Thani 28, 1417 AH';
    assert: ( rabiAlThani twentyNinth , 1417 ) printString equals: 'Rabi'' al-Thani 29, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForRajab [

  self
    assert: ( rajab first , 1417 ) printString equals: 'Rajab 1, 1417 AH';
    assert: ( rajab second , 1417 ) printString equals: 'Rajab 2, 1417 AH';
    assert: ( rajab third , 1417 ) printString equals: 'Rajab 3, 1417 AH';
    assert: ( rajab fourth , 1417 ) printString equals: 'Rajab 4, 1417 AH';
    assert: ( rajab fifth , 1417 ) printString equals: 'Rajab 5, 1417 AH';
    assert: ( rajab sixth , 1417 ) printString equals: 'Rajab 6, 1417 AH';
    assert: ( rajab seventh , 1417 ) printString equals: 'Rajab 7, 1417 AH';
    assert: ( rajab eighth , 1417 ) printString equals: 'Rajab 8, 1417 AH';
    assert: ( rajab ninth , 1417 ) printString equals: 'Rajab 9, 1417 AH';
    assert: ( rajab tenth , 1417 ) printString equals: 'Rajab 10, 1417 AH';
    assert: ( rajab eleventh , 1417 ) printString equals: 'Rajab 11, 1417 AH';
    assert: ( rajab twelfth , 1417 ) printString equals: 'Rajab 12, 1417 AH';
    assert: ( rajab thirteenth , 1417 ) printString equals: 'Rajab 13, 1417 AH';
    assert: ( rajab fourteenth , 1417 ) printString equals: 'Rajab 14, 1417 AH';
    assert: ( rajab fifteenth , 1417 ) printString equals: 'Rajab 15, 1417 AH';
    assert: ( rajab sixteenth , 1417 ) printString equals: 'Rajab 16, 1417 AH';
    assert: ( rajab seventeenth , 1417 ) printString equals: 'Rajab 17, 1417 AH';
    assert: ( rajab eighteenth , 1417 ) printString equals: 'Rajab 18, 1417 AH';
    assert: ( rajab nineteenth , 1417 ) printString equals: 'Rajab 19, 1417 AH';
    assert: ( rajab twentieth , 1417 ) printString equals: 'Rajab 20, 1417 AH';
    assert: ( rajab twentyFirst , 1417 ) printString equals: 'Rajab 21, 1417 AH';
    assert: ( rajab twentySecond , 1417 ) printString equals: 'Rajab 22, 1417 AH';
    assert: ( rajab twentyThird , 1417 ) printString equals: 'Rajab 23, 1417 AH';
    assert: ( rajab twentyFourth , 1417 ) printString equals: 'Rajab 24, 1417 AH';
    assert: ( rajab twentyFifth , 1417 ) printString equals: 'Rajab 25, 1417 AH';
    assert: ( rajab twentySixth , 1417 ) printString equals: 'Rajab 26, 1417 AH';
    assert: ( rajab twentySeventh , 1417 ) printString equals: 'Rajab 27, 1417 AH';
    assert: ( rajab twentyEighth , 1417 ) printString equals: 'Rajab 28, 1417 AH';
    assert: ( rajab twentyNinth , 1417 ) printString equals: 'Rajab 29, 1417 AH';
    assert: ( rajab thirtieth , 1417 ) printString equals: 'Rajab 30, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForRamadan [

  self
    assert: ( ramadan first , 1417 ) printString equals: 'Ramadan 1, 1417 AH';
    assert: ( ramadan second , 1417 ) printString equals: 'Ramadan 2, 1417 AH';
    assert: ( ramadan third , 1417 ) printString equals: 'Ramadan 3, 1417 AH';
    assert: ( ramadan fourth , 1417 ) printString equals: 'Ramadan 4, 1417 AH';
    assert: ( ramadan fifth , 1417 ) printString equals: 'Ramadan 5, 1417 AH';
    assert: ( ramadan sixth , 1417 ) printString equals: 'Ramadan 6, 1417 AH';
    assert: ( ramadan seventh , 1417 ) printString equals: 'Ramadan 7, 1417 AH';
    assert: ( ramadan eighth , 1417 ) printString equals: 'Ramadan 8, 1417 AH';
    assert: ( ramadan ninth , 1417 ) printString equals: 'Ramadan 9, 1417 AH';
    assert: ( ramadan tenth , 1417 ) printString equals: 'Ramadan 10, 1417 AH';
    assert: ( ramadan eleventh , 1417 ) printString equals: 'Ramadan 11, 1417 AH';
    assert: ( ramadan twelfth , 1417 ) printString equals: 'Ramadan 12, 1417 AH';
    assert: ( ramadan thirteenth , 1417 ) printString equals: 'Ramadan 13, 1417 AH';
    assert: ( ramadan fourteenth , 1417 ) printString equals: 'Ramadan 14, 1417 AH';
    assert: ( ramadan fifteenth , 1417 ) printString equals: 'Ramadan 15, 1417 AH';
    assert: ( ramadan sixteenth , 1417 ) printString equals: 'Ramadan 16, 1417 AH';
    assert: ( ramadan seventeenth , 1417 ) printString equals: 'Ramadan 17, 1417 AH';
    assert: ( ramadan eighteenth , 1417 ) printString equals: 'Ramadan 18, 1417 AH';
    assert: ( ramadan nineteenth , 1417 ) printString equals: 'Ramadan 19, 1417 AH';
    assert: ( ramadan twentieth , 1417 ) printString equals: 'Ramadan 20, 1417 AH';
    assert: ( ramadan twentyFirst , 1417 ) printString equals: 'Ramadan 21, 1417 AH';
    assert: ( ramadan twentySecond , 1417 ) printString equals: 'Ramadan 22, 1417 AH';
    assert: ( ramadan twentyThird , 1417 ) printString equals: 'Ramadan 23, 1417 AH';
    assert: ( ramadan twentyFourth , 1417 ) printString equals: 'Ramadan 24, 1417 AH';
    assert: ( ramadan twentyFifth , 1417 ) printString equals: 'Ramadan 25, 1417 AH';
    assert: ( ramadan twentySixth , 1417 ) printString equals: 'Ramadan 26, 1417 AH';
    assert: ( ramadan twentySeventh , 1417 ) printString equals: 'Ramadan 27, 1417 AH';
    assert: ( ramadan twentyEighth , 1417 ) printString equals: 'Ramadan 28, 1417 AH';
    assert: ( ramadan twentyNinth , 1417 ) printString equals: 'Ramadan 29, 1417 AH';
    assert: ( ramadan thirtieth , 1417 ) printString equals: 'Ramadan 30, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForSafar [

  self
    assert: ( safar first , 1417 ) printString equals: 'Safar 1, 1417 AH';
    assert: ( safar second , 1417 ) printString equals: 'Safar 2, 1417 AH';
    assert: ( safar third , 1417 ) printString equals: 'Safar 3, 1417 AH';
    assert: ( safar fourth , 1417 ) printString equals: 'Safar 4, 1417 AH';
    assert: ( safar fifth , 1417 ) printString equals: 'Safar 5, 1417 AH';
    assert: ( safar sixth , 1417 ) printString equals: 'Safar 6, 1417 AH';
    assert: ( safar seventh , 1417 ) printString equals: 'Safar 7, 1417 AH';
    assert: ( safar eighth , 1417 ) printString equals: 'Safar 8, 1417 AH';
    assert: ( safar ninth , 1417 ) printString equals: 'Safar 9, 1417 AH';
    assert: ( safar tenth , 1417 ) printString equals: 'Safar 10, 1417 AH';
    assert: ( safar eleventh , 1417 ) printString equals: 'Safar 11, 1417 AH';
    assert: ( safar twelfth , 1417 ) printString equals: 'Safar 12, 1417 AH';
    assert: ( safar thirteenth , 1417 ) printString equals: 'Safar 13, 1417 AH';
    assert: ( safar fourteenth , 1417 ) printString equals: 'Safar 14, 1417 AH';
    assert: ( safar fifteenth , 1417 ) printString equals: 'Safar 15, 1417 AH';
    assert: ( safar sixteenth , 1417 ) printString equals: 'Safar 16, 1417 AH';
    assert: ( safar seventeenth , 1417 ) printString equals: 'Safar 17, 1417 AH';
    assert: ( safar eighteenth , 1417 ) printString equals: 'Safar 18, 1417 AH';
    assert: ( safar nineteenth , 1417 ) printString equals: 'Safar 19, 1417 AH';
    assert: ( safar twentieth , 1417 ) printString equals: 'Safar 20, 1417 AH';
    assert: ( safar twentyFirst , 1417 ) printString equals: 'Safar 21, 1417 AH';
    assert: ( safar twentySecond , 1417 ) printString equals: 'Safar 22, 1417 AH';
    assert: ( safar twentyThird , 1417 ) printString equals: 'Safar 23, 1417 AH';
    assert: ( safar twentyFourth , 1417 ) printString equals: 'Safar 24, 1417 AH';
    assert: ( safar twentyFifth , 1417 ) printString equals: 'Safar 25, 1417 AH';
    assert: ( safar twentySixth , 1417 ) printString equals: 'Safar 26, 1417 AH';
    assert: ( safar twentySeventh , 1417 ) printString equals: 'Safar 27, 1417 AH';
    assert: ( safar twentyEighth , 1417 ) printString equals: 'Safar 28, 1417 AH';
    assert: ( safar twentyNinth , 1417 ) printString equals: 'Safar 29, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForShaban [

  self
    assert: ( shaban first , 1417 ) printString equals: 'Sha''ban 1, 1417 AH';
    assert: ( shaban second , 1417 ) printString equals: 'Sha''ban 2, 1417 AH';
    assert: ( shaban third , 1417 ) printString equals: 'Sha''ban 3, 1417 AH';
    assert: ( shaban fourth , 1417 ) printString equals: 'Sha''ban 4, 1417 AH';
    assert: ( shaban fifth , 1417 ) printString equals: 'Sha''ban 5, 1417 AH';
    assert: ( shaban sixth , 1417 ) printString equals: 'Sha''ban 6, 1417 AH';
    assert: ( shaban seventh , 1417 ) printString equals: 'Sha''ban 7, 1417 AH';
    assert: ( shaban eighth , 1417 ) printString equals: 'Sha''ban 8, 1417 AH';
    assert: ( shaban ninth , 1417 ) printString equals: 'Sha''ban 9, 1417 AH';
    assert: ( shaban tenth , 1417 ) printString equals: 'Sha''ban 10, 1417 AH';
    assert: ( shaban eleventh , 1417 ) printString equals: 'Sha''ban 11, 1417 AH';
    assert: ( shaban twelfth , 1417 ) printString equals: 'Sha''ban 12, 1417 AH';
    assert: ( shaban thirteenth , 1417 ) printString equals: 'Sha''ban 13, 1417 AH';
    assert: ( shaban fourteenth , 1417 ) printString equals: 'Sha''ban 14, 1417 AH';
    assert: ( shaban fifteenth , 1417 ) printString equals: 'Sha''ban 15, 1417 AH';
    assert: ( shaban sixteenth , 1417 ) printString equals: 'Sha''ban 16, 1417 AH';
    assert: ( shaban seventeenth , 1417 ) printString equals: 'Sha''ban 17, 1417 AH';
    assert: ( shaban eighteenth , 1417 ) printString equals: 'Sha''ban 18, 1417 AH';
    assert: ( shaban nineteenth , 1417 ) printString equals: 'Sha''ban 19, 1417 AH';
    assert: ( shaban twentieth , 1417 ) printString equals: 'Sha''ban 20, 1417 AH';
    assert: ( shaban twentyFirst , 1417 ) printString equals: 'Sha''ban 21, 1417 AH';
    assert: ( shaban twentySecond , 1417 ) printString equals: 'Sha''ban 22, 1417 AH';
    assert: ( shaban twentyThird , 1417 ) printString equals: 'Sha''ban 23, 1417 AH';
    assert: ( shaban twentyFourth , 1417 ) printString equals: 'Sha''ban 24, 1417 AH';
    assert: ( shaban twentyFifth , 1417 ) printString equals: 'Sha''ban 25, 1417 AH';
    assert: ( shaban twentySixth , 1417 ) printString equals: 'Sha''ban 26, 1417 AH';
    assert: ( shaban twentySeventh , 1417 ) printString equals: 'Sha''ban 27, 1417 AH';
    assert: ( shaban twentyEighth , 1417 ) printString equals: 'Sha''ban 28, 1417 AH';
    assert: ( shaban twentyNinth , 1417 ) printString equals: 'Sha''ban 29, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testInstanceCreationShortcutForShawwal [

  self
    assert: ( shawwal first , 1417 ) printString equals: 'Shawwal 1, 1417 AH';
    assert: ( shawwal second , 1417 ) printString equals: 'Shawwal 2, 1417 AH';
    assert: ( shawwal third , 1417 ) printString equals: 'Shawwal 3, 1417 AH';
    assert: ( shawwal fourth , 1417 ) printString equals: 'Shawwal 4, 1417 AH';
    assert: ( shawwal fifth , 1417 ) printString equals: 'Shawwal 5, 1417 AH';
    assert: ( shawwal sixth , 1417 ) printString equals: 'Shawwal 6, 1417 AH';
    assert: ( shawwal seventh , 1417 ) printString equals: 'Shawwal 7, 1417 AH';
    assert: ( shawwal eighth , 1417 ) printString equals: 'Shawwal 8, 1417 AH';
    assert: ( shawwal ninth , 1417 ) printString equals: 'Shawwal 9, 1417 AH';
    assert: ( shawwal tenth , 1417 ) printString equals: 'Shawwal 10, 1417 AH';
    assert: ( shawwal eleventh , 1417 ) printString equals: 'Shawwal 11, 1417 AH';
    assert: ( shawwal twelfth , 1417 ) printString equals: 'Shawwal 12, 1417 AH';
    assert: ( shawwal thirteenth , 1417 ) printString equals: 'Shawwal 13, 1417 AH';
    assert: ( shawwal fourteenth , 1417 ) printString equals: 'Shawwal 14, 1417 AH';
    assert: ( shawwal fifteenth , 1417 ) printString equals: 'Shawwal 15, 1417 AH';
    assert: ( shawwal sixteenth , 1417 ) printString equals: 'Shawwal 16, 1417 AH';
    assert: ( shawwal seventeenth , 1417 ) printString equals: 'Shawwal 17, 1417 AH';
    assert: ( shawwal eighteenth , 1417 ) printString equals: 'Shawwal 18, 1417 AH';
    assert: ( shawwal nineteenth , 1417 ) printString equals: 'Shawwal 19, 1417 AH';
    assert: ( shawwal twentieth , 1417 ) printString equals: 'Shawwal 20, 1417 AH';
    assert: ( shawwal twentyFirst , 1417 ) printString equals: 'Shawwal 21, 1417 AH';
    assert: ( shawwal twentySecond , 1417 ) printString equals: 'Shawwal 22, 1417 AH';
    assert: ( shawwal twentyThird , 1417 ) printString equals: 'Shawwal 23, 1417 AH';
    assert: ( shawwal twentyFourth , 1417 ) printString equals: 'Shawwal 24, 1417 AH';
    assert: ( shawwal twentyFifth , 1417 ) printString equals: 'Shawwal 25, 1417 AH';
    assert: ( shawwal twentySixth , 1417 ) printString equals: 'Shawwal 26, 1417 AH';
    assert: ( shawwal twentySeventh , 1417 ) printString equals: 'Shawwal 27, 1417 AH';
    assert: ( shawwal twentyEighth , 1417 ) printString equals: 'Shawwal 28, 1417 AH';
    assert: ( shawwal twentyNinth , 1417 ) printString equals: 'Shawwal 29, 1417 AH'
]

{ #category : 'tests' }
IslamicDayOfMonthTest >> testPrintString [

  self assert: safar first printString equals: 'Safar 1'
]
