Class {
	#name : #ExpressionListModifyCommand,
	#superclass : #ExpressionListCommand,
	#category : #'Expression-List'
}

{ #category : #converting }
ExpressionListModifyCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #edit;
		  shortcutKey: $m meta;
		  yourself
]

{ #category : #testing }
ExpressionListModifyCommand >> canBeExecuted [

	" we can remove only selected expression"

	^ self context isExpressionSelected
]

{ #category : #executing }
ExpressionListModifyCommand >> execute [

	self expressionListPresenter modifyExpression:
		self selectedExpression.
	self expressionListPresenter updateView
]

{ #category : #initialization }
ExpressionListModifyCommand >> initialize [

	super initialize.
	self
		name: 'Modify expression';
		description: 'Modify selected expression.'
]
