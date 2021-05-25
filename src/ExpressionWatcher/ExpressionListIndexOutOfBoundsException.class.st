"
I'm an exception that is signalled in a case when a user tried to access or modify an index of of bounds of the current Expression.

"
Class {
	#name : #ExpressionListIndexOutOfBoundsException,
	#superclass : #ExpressionListException,
	#category : #ExpressionWatcher
}

{ #category : #accessing }
ExpressionListIndexOutOfBoundsException class >> message [

	^ 'ExpressionListIndexOutOfBoundsException.'
]
