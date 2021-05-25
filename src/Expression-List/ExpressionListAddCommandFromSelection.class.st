"
I represent Add expression from source pane command. 

Users can add an expression by selecting it from the source code and right-clicking, a menu is displayed an users can select ""New expression from selection"". 
 


Public API and Key Messages

- asSpecCommand 	<- define spec (icon, shortkey). 
- execute 	    	<- Add an expression from source pane.
- initialize			<- define name and description. 
"
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
		  iconName: #glamorousInspect;
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
		name: 'Watch expression (manual update)';
		description:
			'Monitor the value of the selected expression. The value has to be manually updated after context change.'
]
