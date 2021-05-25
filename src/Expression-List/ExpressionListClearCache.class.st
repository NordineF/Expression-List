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
	#category : #'Expression-List'
}
