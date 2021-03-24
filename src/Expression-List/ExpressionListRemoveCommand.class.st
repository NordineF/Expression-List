Class {
	#name : #ExpressionListRemoveCommand,
	#superclass : #ExpressionListCommand,
	#category : #'Expression-List'
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
	^ self context isExpressionSelected. 
]

{ #category : #initialization }
ExpressionListRemoveCommand >> execute [
	self expressionList removeExpression: self selectedExpression. 
	self expressionListPresenter updateView. 
]

{ #category : #initialization }
ExpressionListRemoveCommand >> initialize [ 
	super initialize. 
	self name:'Remove'; description:'Removes the selected expression'.
]
