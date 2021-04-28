"
I represent an Expression list. 


Contain expression, users can add/remove/modify expression present in an Expression List object. 




Public API and Key Messages
- addExpression: 	<- allows us to add an Expression object in our ExpressionList object.
- addExpression:after:		<- allows us to add an Expression object in our ExpressionList object after another expression present in our ExpressionList.
- addExpressionFromString: 	    	<- allows us to add an Expression object from a given String object in our ExpressionList object.
- contains:			<- allows us to know if our ExpressionList contains a given expression.   
- evaluateExpression:		<- allows us to evaluate an expression.
- evaluationContext:					<- setter for context. 
- expressionList					<- getter for expressionList instance variable.
- expressionList:					<- setter for expressionList instance variable.
- getExpressionAtIndex:					<- allows us to get an expression at a given index. 
- getSize					<- getter for expressionList instance variable size. 
- initialize					<- initialize ExpressionList object. 
- isEmpty					<- allows us to know if expressionList instance variable is empty. 
- removeExpression:					<- allows us to remove a given expression. 
- toggleAutoEvaluateExpression:					<- setter for autoEvaluate instance variable 

Create :
```
|newExpressionList|
newExpressionList := ExpressionList new. 
```

Add:

```
|newExpression newExpressionList|
newExpressionList := ExpressionList new.
newExpression := Expression expression:'1+2'.
newExpressionList addExpression: newExpression. 
```


"
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
		
		@params:
		anExpression				expression we want to add inside our expressionList after otherExpression which is already present in our expressionList
		otherExpression			
	"

	(self contains: otherExpression) ifFalse: [ 
		ExpressionListNotContainExpressionException
			signal: ExpressionListNotContainExpressionException message
			argument: anExpression ].
	expressionList add: anExpression after: otherExpression
]

{ #category : #adding }
ExpressionList >> addExpressionFromString: aString [

	self addExpression: (Expression expression: aString)
]

{ #category : #adding }
ExpressionList >> addExpressionFromStringWithToggleAutoEvaluate: aString [

	self addExpression: (Expression expression: aString autoEvaluate: true)
]

{ #category : #'as yet unclassified' }
ExpressionList >> computeResult: anExpression [

	^ evaluationContext receiver class compiler
		  source: anExpression expression readStream;
		  context: evaluationContext;
		  receiver: evaluationContext receiver;
		  requestor: self;
		  failBlock: [ 
			  ExpressionListEvaluateException
				  signal: ExpressionListEvaluateException message
				  argument: anExpression ];
		  evaluate
]

{ #category : #comparing }
ExpressionList >> contains: anExpression [

	"	allows us to know if an expression is present or not in our expressionList
		
		@param:
		anExpression				
	"	
		
	^ expressionList includes: anExpression
]

{ #category : #'as yet unclassified' }
ExpressionList >> evaluateExpression: anExpression [

	"	Allows us to evaluate the result of an expression in our expressionList
		
		@param:
		anExpression 				an Expression present in our expressionList
		
		@throws:
		ExpressionListNotContainExpressionException		anExpression is not present in our current expressionList. 
		
		@return:
		anExpression result 		evaluted result of anExpression. 
			
	"

	(self contains: anExpression) ifFalse: [ 
		ExpressionListNotContainExpressionException
			signal: ExpressionListNotContainExpressionException message
			argument: anExpression ].
	anExpression result: (evaluationContext receiver class compiler
			 source: anExpression expression readStream;
			 context: evaluationContext;
			 receiver: evaluationContext receiver;
			 requestor: self;
			 failBlock: [ ExpressionListEvaluateException signal: ExpressionListEvaluateException message argument: anExpression ];
			 evaluate).
	^ anExpression result
]

{ #category : #accessing }
ExpressionList >> evaluationContext: aContext [

	evaluationContext := aContext
]

{ #category : #initialization }
ExpressionList >> expressionList [

	^ expressionList
]

{ #category : #initialization }
ExpressionList >> expressionList: anExpressionList [

	expressionList := anExpressionList
]

{ #category : #'as yet unclassified' }
ExpressionList >> getExpressionAtIndex: anIndex [

	"	Allows us to get an expression by is index in our expressionList
		
		@param:
		anIndex 					the index, must be an integer. 
		
		@return:
		anExpression 			the expression which is at anIndex in our expressionList. 
	"

	anIndex isInteger ifFalse: [ 
		ExpressionListNonIntegerException
			signal: ExpressionListNonIntegerException message
			argument: anIndex ].
	anIndex > 0 ifFalse: [ 
		ExpressionListNegativeIndexException
			signal: ExpressionListNegativeIndexException message
			argument: anIndex ].
	self isEmpty ifTrue: [ 
		ExpressionListEmptyException
			signal: ExpressionListEmptyException message
			argument: self getSize ].
	anIndex > self getSize ifTrue: [ 
		ExpressionListIndexOutOfBoundsException
			signal: ExpressionListIndexOutOfBoundsException message
			argument: self getSize ].

	^ expressionList at: anIndex
]

{ #category : #size }
ExpressionList >> getSize [

	"	Allows us to get expressionList size. 
		
		@return:
		size 				the expressionList current size.  
	"

	^ expressionList size
]

{ #category : #initialization }
ExpressionList >> initialize [

	"	changer le nom de la classe ExpressionList
		Initialize the ExpressionList 
		Each ExpressionList object start with an empty OrderedCollection. 
		
	"

	super initialize.
	expressionList := OrderedCollection new
]

{ #category : #initialization }
ExpressionList >> isEmpty [

	"	Allows us to know if the expressionList is empty 
	
		@return
		boolean 					true if the expressionList is empty, false otherwise. 
	"

	^ expressionList isEmpty
]

{ #category : #initialization }
ExpressionList >> removeExpression: anExpression [

	"	Allows us to remove an expression in our expressionList
		
		@param:
		anExpression 			the expression to remove  
	"

	self isEmpty ifTrue: [ 
		ExpressionListEmptyException
			signal: ExpressionListEmptyException message
			argument: self getSize ].
	(self contains: anExpression) ifFalse: [ 
		ExpressionListNotContainExpressionException
			signal: ExpressionListNotContainExpressionException message
			argument: anExpression ].
	expressionList remove: anExpression
]

{ #category : #'as yet unclassified' }
ExpressionList >> toggleAutoEvaluateExpression: anExpression [

	"	Allows us to set an auto evaluate an Expression after each time the context change
		
		@param:
		anExpression				the expression we want to auto evaluate
	"

	anExpression autoEvaluate: anExpression autoEvaluate not
]
