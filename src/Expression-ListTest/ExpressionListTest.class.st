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
	self assert: expressionList isEmpty.
	expressionList addExpression: addedExpression.
	self deny: expressionList isEmpty.
	self assert: (expressionList contains: addedExpression).
	
]

{ #category : #tests }
ExpressionListTest >> testAddExpressionAfter [

	| expressionList addedFirstExpression addedSecondExpression addedAfterFirstExpression exceptionAddedExpression |
	addedFirstExpression := Expression expression: '1+2'.
	addedSecondExpression := Expression expression: '10'.
	addedAfterFirstExpression := Expression expression: '10'.
	exceptionAddedExpression := Expression expression: '15'.
	expressionList := ExpressionList new.
	expressionList addExpression: addedFirstExpression.
	self assert: (expressionList contains: addedFirstExpression).
	self
		assert: (expressionList getExpressionAtIndex: 1)
		equals: addedFirstExpression. " FIRST ELEMENT IS addedFirstExpression"
	expressionList addExpression: addedSecondExpression.
	self assert: (expressionList contains: addedSecondExpression).
	self
		assert: (expressionList getExpressionAtIndex: 2)
		equals: addedSecondExpression. " SECOND ELEMENT IS addedSecondExpression"
	expressionList
		addExpression: addedAfterFirstExpression
		after: addedFirstExpression.
	self assert: (expressionList contains: addedAfterFirstExpression).
	self
		assert: (expressionList getExpressionAtIndex: 2)
		equals: addedAfterFirstExpression. " SECOND ELEMENT IS addedAfterFirstExpression"
	self
		assert: (expressionList getExpressionAtIndex: 3)
		equals: addedSecondExpression. " THIRD ELEMENT IS addedSecondElement"
	self
		should: [ 
			expressionList
				addExpression: exceptionAddedExpression
				after: (Expression expression: 'notInExpressionList') ]
		raise: ExpressionListNotContainExpressionException " FIRST ELEMENT IS addedFirstExpression"
]

{ #category : #running }
ExpressionListTest >> testAddExpressionFromString [

	| expressionList |
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty equals: true.
	expressionList addExpressionFromString: '1+2'.
	self deny: expressionList isEmpty.
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
	self assert: (exprList evaluateExpression: expr) equals: 3. 
	self assert: expr result equals:3. 
	
]

{ #category : #tests }
ExpressionListTest >> testGetExpressionAtIndex [

	| expressionList addedFirstExpression addedSecondExpression addedThirdExpression |
	addedFirstExpression := Expression expression: '1+2'.
	addedSecondExpression := Expression expression: '10'.
	addedThirdExpression := Expression expression: '10'.
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty.
	self
		should: [ "TEST WHEN EMPTY" expressionList getExpressionAtIndex: 1 ]
		raise: ExpressionListEmptyException.
	self
		should: [ " TEST WHEN NEGATIVE INDEX" 
		expressionList getExpressionAtIndex: -1 ]
		raise: ExpressionListNegativeIndexException.
	expressionList addExpression: addedFirstExpression.
	self
		assert: (expressionList getExpressionAtIndex: 1)
		equals: addedFirstExpression.
	expressionList addExpression: addedSecondExpression.
	self
		assert: (expressionList getExpressionAtIndex: 2)
		equals: addedSecondExpression.

	expressionList addExpression: addedThirdExpression.
	self
		assert: (expressionList getExpressionAtIndex: 3)
		equals: addedThirdExpression.
	self assert: expressionList getSize equals: 3.
	self
		should: [ " TEST WHEN INDEX OUT OF BOUNDS" 
			expressionList getExpressionAtIndex: 4 ]
		raise: ExpressionListIndexOutOfBoundsException.
	self
		should: [ " TEST WHEN INDEX OUT OF BOUNDS" 
			expressionList getExpressionAtIndex: #a ]
		raise: ExpressionListNonIntegerException
]

{ #category : #running }
ExpressionListTest >> testGetSize [

	| expressionList addedExpression |
	addedExpression := Expression expression: '1+2'.
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty.
	expressionList addExpression: addedExpression.
	self deny: expressionList isEmpty.
	self assert: (expressionList contains: addedExpression).
	self assert: expressionList getSize equals:1.
	expressionList removeExpression: addedExpression. 
	self assert: expressionList getSize equals:0.  
]

{ #category : #tests }
ExpressionListTest >> testRemoveExpression [

	| removedExpression expressionList notContainExpression |
	removedExpression := Expression expression: '1+2'.
	notContainExpression := Expression expression: '3'.
	expressionList := ExpressionList new.
	self assert: expressionList isEmpty.
	self
		should: [ expressionList removeExpression: removedExpression ]
		raise: ExpressionListEmptyException.
	expressionList addExpression: removedExpression.
	self deny: expressionList isEmpty.
	self
		should: [ expressionList removeExpression: notContainExpression ]
		raise: ExpressionListNotContainExpressionException.
	expressionList removeExpression: removedExpression.
	self assert: expressionList isEmpty
]
