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

{ #category : #executing }
ExpressionListEvaluateCommand >> execute [
	self flag:' context is empty for now'. 
	self expressionList evaluationContext: [  ] asContext.
	self selectedExpression result:
		(self expressionList evaluateExpression:
			 self selectedExpression).
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
