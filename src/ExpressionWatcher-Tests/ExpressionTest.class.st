Class {
	#name : #ExpressionTest,
	#superclass : #TestCase,
	#category : #'ExpressionWatcher-Tests'
}

{ #category : #tests }
ExpressionTest >> testAutoEvaluation [

	| expr |
	expr := Expression new.
	self deny: expr autoEvaluate.
	expr autoEvaluate: true.
	self assert: expr autoEvaluate
]

{ #category : #tests }
ExpressionTest >> testExpressionInstantiation [
	
	|expression|
	expression:= Expression expression: '1+2'. 
	self assert: expression expression equals:'1+2'. 
	self assert: expression result equals: nil. 
	
	
]
