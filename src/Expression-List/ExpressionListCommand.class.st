Class {
	#name : #ExpressionListCommand,
	#superclass : #CmCommand,
	#category : #'Expression-List'
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
