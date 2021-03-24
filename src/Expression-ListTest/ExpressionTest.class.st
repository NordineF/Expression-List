Class {
	#name : #ExpressionTest,
	#superclass : #TestCase,
	#category : #'Expression-ListTest'
}

{ #category : #tests }
ExpressionTest >> testExpressionInstantiation [
	
	|expression|
	expression:= Expression expression: '1+2'. 
	self assert: expression expression equals:'1+2'. 
	self assert: expression result equals: nil. 
	
	
]
