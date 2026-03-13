Class {
	#name : 'HebrewYearTest',
	#superclass : 'HebrewCalendarTest',
	#category : 'Chalten-Hebrew-Calendar-Tests',
	#package : 'Chalten-Hebrew-Calendar-Tests'
}

{ #category : 'tests' }
HebrewYearTest >> testBetweenAnd [

  self
    assert: ( 2 asHebrewYear between: 2 asHebrewYear and: 3 asHebrewYear );
    assert: ( 3 asHebrewYear between: 2 asHebrewYear and: 3 asHebrewYear );
    assert: ( 3 asHebrewYear between: 2 asHebrewYear and: 4 asHebrewYear );
    deny: ( 4 asHebrewYear between: 2 asHebrewYear and: 3 asHebrewYear );
    deny: ( 1 asHebrewYear between: 2 asHebrewYear and: 3 asHebrewYear )
]

{ #category : 'tests' }
HebrewYearTest >> testComparing [

  self
    assert: 1 asHebrewYear equals: 1 asHebrewYear;
    assert: 2025 asHebrewYear equals: 2025 asHebrewYear;
    deny: 1 asHebrewYear equals: 2025 asHebrewYear;
    deny: 1 asHebrewYear equals: 1 asGregorianYear;
    deny: 1 asGregorianYear equals: 1 asHebrewYear
]

{ #category : 'tests' }
HebrewYearTest >> testGreaterThan [

  self
    assert: 2 asHebrewYear greaterThan: 1 asHebrewYear;
    assert: 2 asHebrewYear greaterThanOrEquals: 1 asHebrewYear;
    assert: 1 asHebrewYear greaterThanOrEquals: 1 asHebrewYear;
    deny: 1 asHebrewYear greaterThan: 2025 asHebrewYear.

  self
    should: [ 2 asHebrewYear > 1 asGregorianYear ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable';
    should: [ 1 asGregorianYear > 2 asHebrewYear ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable'
]

{ #category : 'tests' }
HebrewYearTest >> testInstanceCreation [

  self
    assert: ( HebrewYear number: 2025 ) number equals: 2025;
    should: [ HebrewYear number: 0 ]
    raise: InstanceCreationFailed
    withMessageText: 'Negative years are unsupported for the Hebrew calendar';
    should: [ HebrewYear number: -13 ]
    raise: InstanceCreationFailed
    withMessageText: 'Negative years are unsupported for the Hebrew calendar';
    should: [ HebrewYear number: 1.5 ]
    raise: InstanceCreationFailed
    withMessageText: '1.5 is an invalid number for a year in the Hebrew calendar'
]

{ #category : 'tests' }
HebrewYearTest >> testInstanceCreationShortcut [

  self
    assert: 2025 asHebrewYear number equals: 2025;
    should: [ 0 asHebrewYear ] raise: InstanceCreationFailed;
    should: [ -13 asHebrewYear ] raise: InstanceCreationFailed
]

{ #category : 'tests' }
HebrewYearTest >> testIsCompleteYear [

  #( 5661 5663 5666 5669 5672 5678 5682 5685 5686 5693 5696 5702 5705 5709 5712 5713 5716 5720 5723
     5729 5732 5734 5739 5740 5743 5747 5750 5754 5756 5759 ) do: [ :number |
      self
        assert: number asHebrewYear isCompleteYear;
        deny: number asHebrewYear isLeapYear;
        assert: number asHebrewYear numberOfDays equals: 355 * day
    ].

  #( 5665 5673 5676 5681 5689 5692 5698 5700 5708 5717 5725 5727 5736 5744 5752 5760 ) do: [ :number |
      self
        assert: number asHebrewYear isCompleteYear;
        assert: number asHebrewYear isLeapYear;
        assert: number asHebrewYear numberOfDays equals: 385 * day
    ]
]

{ #category : 'tests' }
HebrewYearTest >> testIsDeficientYear [

  #( 5675 5683 5690 5699 5710 5726 5737 5753 ) do: [ :number |
      self
        assert: number asHebrewYear isDeficientYear;
        deny: number asHebrewYear isLeapYear;
        assert: number asHebrewYear numberOfDays equals: 353 * day
    ].
  #( 5662 5668 5670 5679 5687 5695 5703 5706 5714 5719 5722 5730 5733 5741 5746 5749 5757 ) do: [
    :number |
      self
        assert: number asHebrewYear isDeficientYear;
        assert: number asHebrewYear isLeapYear;
        assert: number asHebrewYear numberOfDays equals: 383 * day
    ]
]

{ #category : 'tests' }
HebrewYearTest >> testIsLeapYear [

  #( 3 6 8 11 14 17 19 5787 5790 5793 ) do: [ :number | self assert: number asHebrewYear isLeapYear ].

  #( 1 2 4 5 7 9 10 12 5786 5788 ) do: [ :number | self deny: number asHebrewYear isLeapYear ]
]

{ #category : 'tests' }
HebrewYearTest >> testIsRegularYear [

  #( 5664 5667 5671 5674 5677 5680 5688 5691 5694 5697 5701 5704 5707 5715 5718 5721 5724 5728 5731
     5735 5742 5745 5748 5751 5758 ) do: [ :number |
      self
        assert: number asHebrewYear isRegularYear;
        deny: number asHebrewYear isLeapYear;
        assert: number asHebrewYear numberOfDays equals: 354 * day
    ].

  #( 5684 5711 5738 5755 ) do: [ :number |
      self
        assert: number asHebrewYear isRegularYear;
        assert: number asHebrewYear isLeapYear;
        assert: number asHebrewYear numberOfDays equals: 384 * day
    ]
]

{ #category : 'tests' }
HebrewYearTest >> testLessThan [

  self
    assert: 1 asHebrewYear lessThan: 2 asHebrewYear;
    assert: 1 asHebrewYear lessThanOrEquals: 2 asHebrewYear;
    assert: 1 asHebrewYear lessThanOrEquals: 1 asHebrewYear;
    deny: 2025 asHebrewYear lessThan: 1 asHebrewYear.

  self
    should: [ 2 asHebrewYear < 1 asGregorianYear ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable';
    should: [ 1 asGregorianYear < 2 asHebrewYear ]
    raise: ArithmeticError
    withMessageText: 'Years in different time scales are incommensurable'
]

{ #category : 'tests' }
HebrewYearTest >> testNext [

  self
    assert: 1 asHebrewYear nextIs: 2 asHebrewYear;
    assert: 2 asHebrewYear nextIs: 3 asHebrewYear;
    assert: 2025 asHebrewYear nextIs: 2026 asHebrewYear.

  self
    assert: ( 1 asHebrewYear next: 2025 * hebrewYear ) equals: 2026 asHebrewYear;
    assert: ( 2025 asHebrewYear next: -1 * hebrewYear ) equals: 2024 asHebrewYear;
    assert: ( 2020 asHebrewYear next: 10 * hebrewYear ) equals: 2030 asHebrewYear.

  self
    should: [ 2025 asHebrewYear next: 12 * hebrewMonth ] raise: ArithmeticError;
    should: [ 1 asHebrewYear next: 1 / 2 * hebrewYear ] raise: InstanceCreationFailed
]

{ #category : 'tests' }
HebrewYearTest >> testNumberOfDays [

  self assert: 5761 asHebrewYear numberOfDays equals: 353 * day.
  self assert: 5762 asHebrewYear numberOfDays equals: 354 * day.
  self assert: 5763 asHebrewYear numberOfDays equals: 385 * day.
  self assert: 5764 asHebrewYear numberOfDays equals: 355 * day.
  self assert: 5765 asHebrewYear numberOfDays equals: 383 * day.
  self assert: 5766 asHebrewYear numberOfDays equals: 354 * day.
  self assert: 5767 asHebrewYear numberOfDays equals: 355 * day.
  self assert: 5768 asHebrewYear numberOfDays equals: 383 * day.
  self assert: 5769 asHebrewYear numberOfDays equals: 354 * day.
  self assert: 5770 asHebrewYear numberOfDays equals: 355 * day.
  self assert: 5771 asHebrewYear numberOfDays equals: 385 * day.
  self assert: 5772 asHebrewYear numberOfDays equals: 354 * day.
  self assert: 5773 asHebrewYear numberOfDays equals: 353 * day.
  self assert: 5774 asHebrewYear numberOfDays equals: 385 * day.
  self assert: 5775 asHebrewYear numberOfDays equals: 354 * day.
  self assert: 5776 asHebrewYear numberOfDays equals: 385 * day.
  self assert: 5777 asHebrewYear numberOfDays equals: 353 * day.
  self assert: 5778 asHebrewYear numberOfDays equals: 354 * day.
  self assert: 5779 asHebrewYear numberOfDays equals: 385 * day.
  self assert: 5780 asHebrewYear numberOfDays equals: 355 * day.
  self assert: 5781 asHebrewYear numberOfDays equals: 353 * day.
  self assert: 5782 asHebrewYear numberOfDays equals: 384 * day
]

{ #category : 'tests' }
HebrewYearTest >> testNumberOfMonths [

  self assert: 5786 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5787 asHebrewYear numberOfMonths equals: 13 * hebrewMonth.
  self assert: 5788 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5789 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5790 asHebrewYear numberOfMonths equals: 13 * hebrewMonth.
  self assert: 5791 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5792 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5793 asHebrewYear numberOfMonths equals: 13 * hebrewMonth.
  self assert: 5794 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5795 asHebrewYear numberOfMonths equals: 13 * hebrewMonth.
  self assert: 5796 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5797 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5798 asHebrewYear numberOfMonths equals: 13 * hebrewMonth.
  self assert: 5799 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5800 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5801 asHebrewYear numberOfMonths equals: 13 * hebrewMonth.
  self assert: 5802 asHebrewYear numberOfMonths equals: 12 * hebrewMonth.
  self assert: 5803 asHebrewYear numberOfMonths equals: 13 * hebrewMonth.
  self assert: 5804 asHebrewYear numberOfMonths equals: 12 * hebrewMonth
]

{ #category : 'tests' }
HebrewYearTest >> testPrevious [

  self
    assert: 2 asHebrewYear previousIs: 1 asHebrewYear;
    assert: 3 asHebrewYear previousIs: 2 asHebrewYear;
    assert: 2025 asHebrewYear previousIs: 2024 asHebrewYear.

  self
    assert: ( 4050 asHebrewYear previous: 2025 * hebrewYear ) equals: 2025 asHebrewYear;
    assert: ( 2025 asHebrewYear previous: -1 * hebrewYear ) equals: 2026 asHebrewYear.

  self
    should: [ 2025 asHebrewYear previous: 12 * hebrewMonth ] raise: ArithmeticError;
    should: [ 1 asHebrewYear previous: 1 / 2 * hebrewYear ] raise: InstanceCreationFailed
]

{ #category : 'tests' }
HebrewYearTest >> testPrintString [

  self
    assert: 1445 asHebrewYear printString equals: '1445 AM';
    assert: 1 asHebrewYear printString equals: '1 AM'
]
