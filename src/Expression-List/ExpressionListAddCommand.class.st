Class {
	#name : #ExpressionListAddCommand,
	#superclass : #ExpressionListCommand,
	#category : #'Expression-List'
}

{ #category : #converting }
ExpressionListAddCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #changeAdd;
		  shortcutKey: $n meta;
		  yourself
]

{ #category : #initialization }
ExpressionListAddCommand >> execute [

	| expression |
	expression := self expressionListPresenter newExpression.
	self hasSelectedExpression
		ifTrue: [ 
			self expressionList
				addExpression: expression
				after: self selectedExpression ]
		ifFalse: [ self expressionList addExpression: expression ].
	self expressionListPresenter updateView.
	self expressionListPresenter selectExpression: expression
]

{ #category : #initialization }
ExpressionListAddCommand >> initialize [

	super initialize.
	self
		name: 'New expression';
		description:
			'Create a new expression and add it to our expressionList'
]
