Class {
	#name : #ExpressionListAddCommandFromSelectionWithToggleAutoEvaluate,
	#superclass : #ExpressionListCommand,
	#instVars : [
		'selection'
	],
	#category : #'Expression-List'
}

{ #category : #converting }
ExpressionListAddCommandFromSelectionWithToggleAutoEvaluate >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #glamorousInspect;
		  yourself
]

{ #category : #executing }
ExpressionListAddCommandFromSelectionWithToggleAutoEvaluate >> execute [

	| expressionListPresenter |
	selection := context code selectedTextOrLine.
	expressionListPresenter := context extensionTools
		                           detect: [ :e | 
		                           e class = ExpressionListPresenter ]
		                           ifNone: [ ^ self ].
	expressionListPresenter listExpressions addExpressionFromStringWithToggleAutoEvaluate: selection.
	expressionListPresenter updatePresenter. 
	
]

{ #category : #initialization }
ExpressionListAddCommandFromSelectionWithToggleAutoEvaluate >> initialize [

	super initialize.
	self
		name: 'Watch expression (auto evaluate)';
		description:
			'Monitor the value of the selected expression. The value is automatically updated after each context change.'
]
