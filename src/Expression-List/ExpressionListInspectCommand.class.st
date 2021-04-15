"
I represent Inspect command. 

When invoked, users can inspect a selected expression. 


Public API and Key Messages

- asSpecCommand 	<- define spec (icon, shortkey)
- canBeExecuted		<- allows us to know if Inspect command can be executed
- execute 	    	<- Inspect a selected expression
- initialize			<- define name and description. 
"
Class {
	#name : #ExpressionListInspectCommand,
	#superclass : #ExpressionListCommand,
	#category : #'Expression-List'
}

{ #category : #converting }
ExpressionListInspectCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #smallInspectIt;
		  shortcutKey: $i meta;
		  yourself
]

{ #category : #testing }
ExpressionListInspectCommand >> canBeExecuted [

	" we can inspect only selected expression"

	^ self context isExpressionSelected
]

{ #category : #initialization }
ExpressionListInspectCommand >> execute [

	self selectedExpression inspect
]

{ #category : #initialization }
ExpressionListInspectCommand >> initialize [

	super initialize.
	self
		name: 'Inspect expression';
		description: 'Inspect selected expression.'
]
