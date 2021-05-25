"
I represent Toggle Auto Evaluate command. 


When invoked, the selected expression switches to auto evaluate mode. 
In auto evaluate mode, expression will be revalued automatically at each context change.


Public API and Key Messages
- asSpecCommand 	<- define spec (icon, shortkey)
- canBeExecuted		<- allows us to know if Toggle Auto Evaluate command can be executed
- execute 	    	<- Toggle Auto Evaluate an expression
- initialize			<- define name and description. 
"
Class {
	#name : #ExpressionListToggleAutoEvaluateCommand,
	#superclass : #ExpressionListCommand,
	#category : #ExpressionWatcher
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
