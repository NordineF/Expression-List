"
I'm an exception that is signalled in a case when a user tried to access element of the current expression list with non integer index.

"
Class {
	#name : #ExpressionListNonIntegerException,
	#superclass : #ExpressionListException,
	#category : #ExpressionWatcher
}

{ #category : #accessing }
ExpressionListNonIntegerException class >> message [

	^ 'ExpressionListNonIntegerException.'
]
