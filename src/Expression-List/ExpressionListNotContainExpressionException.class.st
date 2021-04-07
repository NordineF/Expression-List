"
I'm an exception that is signalled in a case when a user tried to access or modify an element which is not present in the current Expression List.

"
Class {
	#name : #ExpressionListNotContainExpressionException,
	#superclass : #ExpressionListException,
	#category : #'Expression-List'
}

{ #category : #accessing }
ExpressionListNotContainExpressionException class >> message [

	^ 'ExpressionListNotContainExpressionException'
]
