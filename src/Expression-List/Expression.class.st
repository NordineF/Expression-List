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
