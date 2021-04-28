"
I represent Evaluate command. 

When invoked, evaluate the selected expression. 



Public API and Key Messages

- asSpecCommand 	<- define spec (icon, shortkey)
- canBeExecuted		<- allows us to know if Evaluate command can be executed
- execute 	    	<- Evaluate an expression
- initialize			<- define name and description. 
"
Class {
	#name : #ExpressionListEvaluateCommand,
	#superclass : #ExpressionListCommand,
	#category : #'Expression-List'
}

{ #category : #converting }
ExpressionListEvaluateCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #smallDoIt;
		  shortcutKey: $e meta;
		  yourself
]

{ #category : #testing }
ExpressionListEvaluateCommand >> canBeExecuted [ 
	" we can execute only selected expression"
	^ self context isExpressionSelected. 
]

{ #category : #executing }
ExpressionListEvaluateCommand >> execute [

	self expressionList evaluationContext: self expressionListPresenter listExpressions evaluationContext.
	self selectedExpression result:(self expressionList evaluateExpression: self selectedExpression).
	self expressionListPresenter updateView
]

{ #category : #initialization }
ExpressionListEvaluateCommand >> initialize [

	super initialize.
	self
		name: 'Evaluate expression';
		description:
			'Evaluate a selected expression.'
]
