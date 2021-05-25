"
I represent commands which users can use to interact with ExpressionList. 


Public API and Key Messages

-	expressionList 			 	<- return the expression list on which we can apply commands.
-	expressionListPresenter	<- return the expression presenter UI. 
-	hasSelectedExpression		<- return true if an expression is currently selected in the current expression presenter UI. 
-  selectedExpression			<- return the current selected Expression.  

Here is classes which inherites from ExpressionListCommand:

-	ExpressionHelpCommand							<- 	Display help menu
-	ExpressionListAddCommand						<-	Add an expression
-	ExpressionListAddCommandFromSelection	<- 	Add an expression from source pane
-	ExpressionListEvaluateCommand				<-	Evaluate an expression
-	ExpressionListInspectCommand				<-	Inspect an expression
-	ExpressionListModifyCommand					<-	Modify an Expression
-	ExpressionListRemoveCommand					<-	Remove an Expression
-	ExpressionListToggleAutoEvaluateCommand	<- 	Auto evaluate an Expression each time context changes.
			
		
"
Class {
	#name : #ExpressionListCommand,
	#superclass : #CmCommand,
	#category : #ExpressionWatcher
}

{ #category : #initialization }
ExpressionListCommand >> expressionList [
	^ self expressionListPresenter listExpressions. 
]

{ #category : #initialization }
ExpressionListCommand >> expressionListPresenter [
	^ self context. 
]

{ #category : #initialization }
ExpressionListCommand >> hasSelectedExpression [
	^ self expressionListPresenter isExpressionSelected. 
]

{ #category : #initialization }
ExpressionListCommand >> selectedExpression [
	^ self expressionListPresenter selectExpression. 
]
