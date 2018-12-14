Class {
	#name : #PointInTimeIntervalStrategyTest,
	#superclass : #TestCase,
	#category : #'Chalten-Tests-Time'
}

{ #category : #test }
PointInTimeIntervalStrategyTest >> testStepsFromToBy [
	self
		assert:
			(PointInTimeIntervalStrategy new
				stepsFrom: TimeOfDay midnight
				to: (TimeOfDay hours: 1 minutes: 0 seconds: 0)
				by: 1 minuteMeasure) = 60
]
