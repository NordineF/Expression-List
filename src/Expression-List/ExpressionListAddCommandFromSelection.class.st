Class {
	#name : #ExpressionListAddCommandFromSelection,
	#superclass : #ExpressionListCommand,
	#instVars : [
		'selection'
	],
	#category : #'Expression-List'
}

{ #category : #converting }
ExpressionListAddCommandFromSelection >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #changeAdd;
		  shortcutKey: $n meta;
		  yourself
]

{ #category : #initialization }
ExpressionListAddCommandFromSelection >> execute [

	| expressionListPresenter |
	selection := context code selectedTextOrLine.
	expressionListPresenter := context extensionTools
		                           detect: [ :e | 
		                           e class = ExpressionListPresenter ]
		                           ifNone: [ ^ self ].
	expressionListPresenter listExpressions addExpressionFromString: selection.
	expressionListPresenter updatePresenter. 
	
]

{ #category : #initialization }
ExpressionListAddCommandFromSelection >> initialize [

	super initialize.
	self
		name: 'New expression from selection';
		description:
			'Create a new expression and add it to our expressionList'
]
