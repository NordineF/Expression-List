Class {
	#name : #ExpressionListTest,
	#superclass : #TestCase,
	#category : #'Expression-ListTest'
}

{ #category : #running }
ExpressionListTest >> testAddExpression [

	| expressionList addedExpression |
	addedExpression := Expression new.
	addedExpression expression: '1+2'.
	addedExpression result: 'nil'.
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty equals: true.
	expressionList addExpression: addedExpression.
	self assert: expressionList isEmpty equals: false.
	self assert: (expressionList contains: addedExpression) equals: true
]

{ #category : #running }
ExpressionListTest >> testAddExpressionResult [

	| expressionList |
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty equals: true.
	expressionList addExpression: '1+2' result: 'nil'.
	self assert: expressionList isEmpty equals: false.
	self assert: expressionList  getSize equals: 1
]

{ #category : #tests }
ExpressionListTest >> testRemoveExpression [

	| removedExpression expressionList notContainExpression|
	removedExpression := Expression new.
	removedExpression expression: '1+2'; result: 'nil'.
	notContainExpression:= Expression new. 
	notContainExpression expression: '10'; result: 'nil'. 
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty equals:true. 
	self should: [ expressionList removeExpression: removedExpression  ] raise: EmptyExpressionListException. 
	expressionList addExpression: removedExpression. 
	self assert: expressionList isEmpty equals:false. 
	self should: [ expressionList removeExpression: notContainExpression ] raise: NotContainExpressionException.
	expressionList removeExpression: removedExpression.  
	self assert: expressionList isEmpty equals:true. 
	 
	
	
]
