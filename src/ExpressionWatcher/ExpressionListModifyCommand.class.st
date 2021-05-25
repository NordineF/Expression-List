"
I represent Modify command. 

When invoked, users can modify a selected expression;



Public API and Key Messages

- asSpecCommand 	<- define spec (icon, shortkey)
- canBeExecuted		<- allows us to know if Modify command can be executed
- execute 	    	<- Modify an expression
- initialize			<- define name and description. 
"
Class {
	#name : #ExpressionListModifyCommand,
	#superclass : #ExpressionListCommand,
	#category : #ExpressionWatcher
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
