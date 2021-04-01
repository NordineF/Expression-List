Class {
	#name : #ExpressionCommandTest,
	#superclass : #TestCase,
	#category : #'Expression-ListTest'
}

{ #category : #tests }
ExpressionCommandTest >> testAddExpression [
	
	| presenter addedExpression addedSecondExpression |
	presenter := ExpressionListPresenter new.
	addedExpression := Expression expression: '1+2'.
	addedSecondExpression := Expression expression: '10'.
	presenter listExpressions addExpression: addedExpression.
	presenter listExpressions addExpression: addedSecondExpression.
	self assert: presenter listExpressions getSize equals: 2.
	presenter table selectIndex: 1.
	(ExpressionListAddCommand  new context: presenter) execute.
	self assert: presenter listExpressions getSize equals: 3
]

{ #category : #tests }
ExpressionCommandTest >> testEvaluateExpression [

	| presenter addedExpression |
	presenter := ExpressionListPresenter new.
	addedExpression := Expression expression: '1+2'.
	presenter listExpressions addExpression: addedExpression.
	self assert: presenter listExpressions getSize equals: 1.
	presenter table selectIndex: 1.
	(ExpressionListEvaluateCommand new context: presenter) execute.
	self assert: presenter selectExpression result equals: 3
]

{ #category : #tests }
ExpressionCommandTest >> testRemoveExpression [
	
	| presenter addedExpression addedSecondExpression |
	presenter := ExpressionListPresenter new.
	addedExpression := Expression expression: '1+2'.
	addedSecondExpression := Expression expression: '10'.
	presenter listExpressions addExpression: addedExpression.
	presenter listExpressions addExpression: addedSecondExpression.
	self assert: presenter listExpressions getSize equals: 2.
	presenter table selectIndex: 1.
	(ExpressionListRemoveCommand  new context: presenter) execute.
	self assert: presenter listExpressions getSize equals: 1
]
