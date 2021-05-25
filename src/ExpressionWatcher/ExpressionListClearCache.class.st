"
I represent the command Clear Cache. 

When invoked, the expression watcher class cache is cleared. 

Public API and Key Messages

- asSpecCommand 	<- define spec (icon, shortkey).
- execute 	    	<- Clear current expression watcher class cache.
- initialize			<- define name and description. 
"
Class {
	#name : #ExpressionListClearCache,
	#superclass : #ExpressionListCommand,
	#category : #ExpressionWatcher
}

{ #category : #converting }
ExpressionListClearCache >> asSpecCommand [
	
	^ super asSpecCommand
		  iconName: #removeIcon;
		  shortcutKey: $x meta;
		  yourself
]

{ #category : #executing }
ExpressionListClearCache >> execute [

	self expressionList class resetExpressionCache.
	self expressionListPresenter updateTableFromCache. 
]

{ #category : #initialization }
ExpressionListClearCache >> initialize [

	super initialize.
	self
		name: 'Clear cache';
		description: 'Clear cache'.
]
