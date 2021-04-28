"
I represent Add command. 

When invoked, a pop-up appears and the user can enter a new expression.


Public API and Key Messages

- asSpecCommand 	<- define spec (icon, shortkey).
- execute 	    	<- Add an expression.
- initialize			<- define name and description. 
"
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
	expression := self expressionListPresenter requestExpression.
	self hasSelectedExpression
		ifTrue: [ 
			self expressionList
				addExpression: expression
				after: self selectedExpression ]
		ifFalse: [ self expressionList addExpression: expression ].
	self expressionListPresenter selectExpression: expression.
	self expressionListPresenter updateView.
]

{ #category : #initialization }
ExpressionListAddCommand >> initialize [

	super initialize.
	self
		name: 'New expression';
		description:
			'Create a new expression and add it to our expressionList'
]
