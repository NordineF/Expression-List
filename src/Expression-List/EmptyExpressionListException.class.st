Class {
	#name : #EmptyExpressionListException,
	#superclass : #ExpressionListException,
	#category : #'Expression-List'
}

{ #category : #accessing }
EmptyExpressionListException class >> message [ 
	^ 'EmptyExpressionListException.'. 
]
