"
I'm an exception that is signalled in a case when a user tried to access the current Expression List with negative index.

"
Class {
	#name : #ExpressionListNegativeIndexException,
	#superclass : #ExpressionListException,
	#category : #'Expression-List'
}

{ #category : #accessing }
ExpressionListNegativeIndexException class >> message [

	^ 'ExpressionListNegativeIndexException.'
]
