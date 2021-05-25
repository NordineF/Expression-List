"
I'm an exception that is signalled in a case an error occured when evaluate an Expression present in Expression List. 

"
Class {
	#name : #ExpressionListEvaluateException,
	#superclass : #ExpressionListException,
	#category : #ExpressionWatcher
}

{ #category : #accessing }
ExpressionListEvaluateException class >> message [

	^ 'ExpressionListEvaluateException.'
]
