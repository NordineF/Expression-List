Class {
	#name : #ExpressionListException,
	#superclass : #Error,
	#category : #'Expression-List'
}

{ #category : #accessing }
ExpressionListException class >> message [
	^ 'ExpressionListException'.
]

{ #category : #accessing }
ExpressionListException class >> signal: aString argument: anObject [
	^ self new
	signal: aString; 
	argument: anObject; 
	yourself. 
	
]
