Class {
	#name : #ExpressionInspectCommand,
	#superclass : #ExpressionListCommand,
	#category : #'Expression-List'
}

{ #category : #converting }
ExpressionInspectCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #smallInspectIt;
		  shortcutKey: $i meta;
		  yourself
]

{ #category : #testing }
ExpressionInspectCommand >> canBeExecuted [

	" we can inspect only selected expression"

	^ self context isExpressionSelected
]

{ #category : #initialization }
ExpressionInspectCommand >> execute [

	self selectedExpression inspect
]

{ #category : #initialization }
ExpressionInspectCommand >> initialize [

	super initialize.
	self
		name: 'Inspect expression';
		description: 'Inspect selected expression.'
]
