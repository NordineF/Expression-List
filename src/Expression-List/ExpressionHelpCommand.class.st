Class {
	#name : #ExpressionHelpCommand,
	#superclass : #ExpressionListCommand,
	#category : #'Expression-List'
}

{ #category : #initialization }
ExpressionHelpCommand >> initialize [

	super initialize.
	self
		name: 'Help';
		description:
			''
]
