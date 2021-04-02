Class {
	#name : #ExpressionListToggleAutoEvaluateCommand,
	#superclass : #ExpressionListCommand,
	#category : #'Expression-List'
}

{ #category : #converting }
ExpressionListToggleAutoEvaluateCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #glamorousRefresh;
		  shortcutKey: $z meta;
		  yourself
]

{ #category : #testing }
ExpressionListToggleAutoEvaluateCommand >> canBeExecuted [

	" we can remove only selected expression"

	^ self context isExpressionSelected
]

{ #category : #executing }
ExpressionListToggleAutoEvaluateCommand >> execute [

	self expressionList toggleAutoEvaluateExpression: self selectedExpression.
	self selectedExpression autoEvaluate ifTrue:[ self expressionList evaluateExpression: self selectedExpression]. 
	self expressionListPresenter updateView
]

{ #category : #initialization }
ExpressionListToggleAutoEvaluateCommand >> initialize [

	super initialize.
	self
		name: 'Toggle Auto Evaluate';
		description: 'Auto evaluate selected expression'
]
