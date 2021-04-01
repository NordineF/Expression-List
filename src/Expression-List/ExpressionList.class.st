Class {
	#name : #ExpressionList,
	#superclass : #Object,
	#instVars : [
		'expressionList',
		'evaluationContext'
	],
	#category : #'Expression-List'
}

{ #category : #initialization }
ExpressionList >> addExpression: anExpression [
	" 	add an expression into our expressions list.
	"
	expressionList add: anExpression. 
	
]

{ #category : #initialization }
ExpressionList >> addExpression: anExpression after: otherExpression [
	" 	add an expression with result into our expressions list.
	"

	expressionList add: anExpression after:otherExpression. 
	
]

{ #category : #initialization }
ExpressionList >> addExpression: anExpression result: aResult [
	" 	add an expression with result into our expressions list.
	"
	| addedExpression |
	addedExpression := Expression new. 
	addedExpression expression: anExpression. 
	addedExpression result: aResult. 
	
	expressionList add: addedExpression. 
	
]

{ #category : #adding }
ExpressionList >> addExpressionFromString: aString [

	self addExpression: (Expression expression: aString)
]

{ #category : #comparing }
ExpressionList >> contains: anExpression [
	" allows us to know if an expression is present or not in our expressionList"
	
	^ expressionList includes: anExpression. 
]

{ #category : #comparing }
ExpressionList >> contains: anExpression result: aResult [
	" allows us to know if an expression is present or not in our expressionList"
	|checkExpression|
	checkExpression := Expression new. 
	checkExpression expression: anExpression.  
	checkExpression result: aResult. 
	
	^ expressionList includes: anExpression. 
]

{ #category : #'as yet unclassified' }
ExpressionList >> evaluateExpression: anExpression [

	self flag: 'dans failBlock mettre une exception'.

	anExpression result: (evaluationContext receiver class compiler
			 source: anExpression expression readStream;
			 context: evaluationContext;
			 receiver: evaluationContext receiver;
			 requestor: self;
			 failBlock: [ nil ];
			 evaluate).
	^ anExpression result
]

{ #category : #accessing }
ExpressionList >> evaluationContext: aContext [ 
	evaluationContext:= aContext.
]

{ #category : #initialization }
ExpressionList >> expressionList [
	^ expressionList. 
]

{ #category : #initialization }
ExpressionList >> expressionList: anExpressionList [
	expressionList := anExpressionList.
]

{ #category : #'finding/searching' }
ExpressionList >> findExpressionWithText: aText [
	^ expressionList select:[ :e| e hasMatchingText:aText]. 
	
]

{ #category : #'as yet unclassified' }
ExpressionList >> getExpressionAtIndex: anIndex [

	anIndex isInteger ifFalse: [ 
		ExpressionListNonIntegerException 
			signal: ExpressionListNonIntegerException message
			argument: anIndex ].
	anIndex > 0 ifFalse: [ 
		ExpressionListNegativeIndexException
			signal: ExpressionListNegativeIndexException message
			argument: anIndex ].
	self isEmpty ifTrue: [ 
		ExpressionListEmptyException  signal: ExpressionListEmptyException message argument: self getSize ].
	anIndex > self getSize ifTrue: [ 
		ExpressionListIndexOutOfBoundsException
			signal: ExpressionListIndexOutOfBoundsException message
			argument: self getSize ].
		
	^ expressionList at: anIndex
]

{ #category : #size }
ExpressionList >> getSize [ 
	^ expressionList size. 
]

{ #category : #initialization }
ExpressionList >> initialize [
	"changer le nom de la classe ExpressionList"
	super initialize.
	expressionList := OrderedCollection new. 
	
]

{ #category : #initialization }
ExpressionList >> isEmpty [
"	Allows us to know if the expressionList is empty 
	
	@return
	boolean 					true if the expressionList is empty, false otherwise. 
"
	^ expressionList isEmpty. 
]

{ #category : #initialization }
ExpressionList >> removeExpression: anExpression [

	"remove an expression in our expressionList"

	self isEmpty ifTrue: [ 
		ExpressionListEmptyException
			signal: EmptyException message
			argument: self getSize ].
	(self contains: anExpression) ifFalse: [ 
		ExpressionListNotContainExpressionException
			signal: ExpressionListNotContainExpressionException message
			argument: anExpression ].
	expressionList remove: anExpression
]

{ #category : #'as yet unclassified' }
ExpressionList >> toggleAutoEvaluateExpression: anExpression [ 

	anExpression autoEvaluate: anExpression autoEvaluate not. 
	
]
