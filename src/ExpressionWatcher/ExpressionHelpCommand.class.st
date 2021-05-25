"
I represent the command Help. 

When invoked, the help menu is displayed. 


Public API and Key Messages

- asSpecCommand 	<- define spec (icon, shortkey)
- execute 	    	<- Display help menu
- initialize			<- define name and description. 
"
Class {
	#name : #ExpressionHelpCommand,
	#superclass : #ExpressionListCommand,
	#category : #ExpressionWatcher
}

{ #category : #converting }
ExpressionHelpCommand >> asSpecCommand [

	^ super asSpecCommand
		  iconName: #help;
		  shortcutKey: $h meta;
		  yourself
]

{ #category : #executing }
ExpressionHelpCommand >> execute [ 

]

{ #category : #initialization }
ExpressionHelpCommand >> initialize [

	super initialize.
	self
		name: 'Help';
		description:
			''
]
