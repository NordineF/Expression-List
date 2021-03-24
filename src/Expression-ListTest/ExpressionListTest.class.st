Class {
	#name : #ExpressionListTest,
	#superclass : #TestCase,
	#category : #'Expression-ListTest'
}

{ #category : #running }
ExpressionListTest >> testAddExpression [

	| expressionList addedExpression |
	addedExpression := Expression expression: '1+2'.
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty equals: true.
	expressionList addExpression: addedExpression.
	self assert: expressionList isEmpty equals: false.
	self assert: (expressionList contains: addedExpression) equals: true
	
]

{ #category : #running }
ExpressionListTest >> testAddExpressionFromString [

	| expressionList |
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty equals: true.
	expressionList addExpressionFromString: '1+2'.
	self assert: expressionList isEmpty equals: false.
	self assert: expressionList getSize equals: 1.
	self
		assert: expressionList expressionList first expression
		equals: '1+2'
]

{ #category : #tests }
ExpressionListTest >> testEvaluateExpression [

	| expr exprList |
	expr := Expression expression: '1+2'.
	exprList := ExpressionList new.
	exprList evaluationContext: [  ] asContext.
	self assert: (exprList evaluateExpression: expr) equals: 3
]

{ #category : #tests }
ExpressionListTest >> testRemoveExpression [

	| removedExpression expressionList notContainExpression |
	removedExpression := Expression expression: '1+2'.
	notContainExpression := Expression expression: '3'.
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty equals: true.
	self
		should: [ expressionList removeExpression: removedExpression ]
		raise: EmptyExpressionListException.
	expressionList addExpression: removedExpression.
	self assert: expressionList isEmpty equals: false.
	self
		should: [ expressionList removeExpression: notContainExpression ]
		raise: NotContainExpressionException.
	expressionList removeExpression: removedExpression.
	self assert: expressionList isEmpty equals: true
]
