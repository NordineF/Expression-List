"
I'm an exception that is signalled in a case when a user tried to access or modify an element present in empty Expression List.

"
Class {
	#name : #ExpressionListEmptyException,
	#superclass : #ExpressionListException,
	#category : #ExpressionWatcher
}

{ #category : #accessing }
ExpressionListEmptyException class >> message [

	^ 'ExpressionListEmptyException.'
]
