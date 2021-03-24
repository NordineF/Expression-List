Class {
	#name : #Expression,
	#superclass : #Object,
	#instVars : [
		'expression',
		'result'
	],
	#category : #'Expression-List'
}

{ #category : #'instance creation' }
Expression class >> expression: aString [

	^ self new expression: aString
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
