Class {
	#name : #ExpressionHelpCommand,
	#superclass : #ExpressionListCommand,
	#category : #'Expression-List'
}

{ #category : #converting }
ExpressionHelpCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #help;
		  shortcutKey: $h meta;
		  yourself
]

{ #category : #initialization }
ExpressionHelpCommand >> initialize [

	super initialize.
	self
		name: 'Help';
		description:
			''
]
