"
I'm an Exception related to Expression List Error.

Here is classes which inherite from ExpressionListException class:
	-	ExpressionListEmptyException
	-	ExpressionListEvaluateException
	-	ExpressionListIndexOutOfBoundsException
	-	ExpressionListNegativeIndexException	
	-	ExpressionListNonIntegerException
	-	ExpressionListNotContainExpressionException
	
Messages:
	class side: 
		- message
		- signal:argument: 
"
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
