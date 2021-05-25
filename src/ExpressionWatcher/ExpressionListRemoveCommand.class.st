"
I represent Remove command. 

When invoked, remove a selected expression. 


Public API and Key Messages

- asSpecCommand 	<- define spec (icon, shortkey)
- canBeExecuted		<- allows us to know if Remove command can be executed
- execute 	    	<- Remove an expression
- initialize			<- define name and description. 
"
Class {
	#name : #ExpressionListRemoveCommand,
	#superclass : #ExpressionListCommand,
	#category : #ExpressionWatcher
}

{ #category : #converting }
ExpressionListRemoveCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #removeIcon;
		  shortcutKey: $x meta;
		  yourself
]

{ #category : #initialization }
ExpressionListRemoveCommand >> canBeExecuted [

	" we can remove only selected expression"

	^ self context isExpressionSelected
]

{ #category : #initialization }
ExpressionListRemoveCommand >> execute [

	self expressionList removeExpression: self selectedExpression.
	self expressionListPresenter selectExpression:
		(self expressionList isEmpty
			 ifTrue: [ nil ]
			 ifFalse: [ 
				 self expressionListPresenter table selection selectedIndex = 1 " if it's the first element we want to remove and our list is not empty we cannot decrease the index of selected expression"
					 ifTrue: [ self expressionList getExpressionAtIndex: 1 ] " so we put it a index 1 <- the new first expression in our table"
					 ifFalse: [ 
						 self expressionList getExpressionAtIndex:
							 self expressionListPresenter table selection selectedIndex - 1 ] ]). " otherwise we decrease the index of selected expression."
	self expressionListPresenter updateView
]

{ #category : #initialization }
ExpressionListRemoveCommand >> initialize [

	super initialize.
	self
		name: 'Remove';
		description: 'Removes the selected expression'
]
