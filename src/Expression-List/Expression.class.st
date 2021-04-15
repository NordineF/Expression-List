"
I represent an Expression. 

Examples : 
	- 1+2
	- 'Expression'
	- nil
	

Public API and Key Messages
- autoEvaluate 	<- getter for autoEvaluate instance variable 
- autoEvaluate:		<- setter for autoEvaluate instance variable 
- expression 	    	<- getter for expression instance variable 
- expression:			<- setter for autoEvaluate instance variable 
- hasMatchingText:		<- allows us to know if expression contains a given text.
- result					<- getter for result instance variable 
- result:					<- setter for autoEvaluate instance variable 
		
Create :
```
|newExpression|
newExpression := Expression new. 
newExpression expression: '1+2'.
```

Also

```
|newExpression|
newExpression := Expression expression:'1+2'.
```


"
Class {
	#name : #Expression,
	#superclass : #Object,
	#instVars : [
		'expression',
		'result',
		'autoEvaluate'
	],
	#category : #'Expression-List'
}

{ #category : #'instance creation' }
Expression class >> expression: aString [

	^ self new expression: aString
]

{ #category : #'as yet unclassified' }
Expression >> autoEvaluate [

	^ autoEvaluate ifNil: [ autoEvaluate := false ]
]

{ #category : #accessing }
Expression >> autoEvaluate: aBoolean [ 
	autoEvaluate := aBoolean
]

{ #category : #accessing }
Expression >> expression [
	^ expression. 
	
]

{ #category : #accessing }
Expression >> expression: anExpression [
	expression := anExpression. 
	
]

{ #category : #testing }
Expression >> hasMatchingText: aString [

	^ expression includesSubstring: aString caseSensitive: false. 
	
]

{ #category : #accessing }
Expression >> result [
	^ result. 
	
]

{ #category : #accessing }
Expression >> result: aResult [
	result:= aResult. 
	
]
