Class {
	#name : #ExpressionListPresenter,
	#superclass : #StPresenter,
	#instVars : [
		'listExpressions',
		'table',
		'toolbar'
	],
	#category : #'Expression-List'
}

{ #category : #commands }
ExpressionListPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

rootCommandGroup 
	register: (ExpressionListAddCommand forSpec context: presenter);
	register: (ExpressionListRemoveCommand forSpec context: presenter).
	
]

{ #category : #specs }
ExpressionListPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  add: #toolbar
			withConstraints:[:constraints| constraints height: self toolbarHeight + 5]; 
		  add: #table;
		  yourself
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter class >> openWithExpressionList: anExpressionList [
	(self on: anExpressionList) openWithSpec. 
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter class >> openWithInspector: anExpressionList [

	(self on: anExpressionList) openWithSpec presenter inspect.
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> buildToolBar [

	| group |
	group := CmCommandGroup forSpec.
	ExpressionListCommand allSubclasses do: [ :cmd | 
		group register: (cmd forSpecContext: self) ].
	^ group asToolbarPresenterWith: [ :presenter | 
		  presenter
			  displayMode: self application toolbarDisplayMode;
			  addStyle: 'stToolbar' ]
]

{ #category : #initialization }
ExpressionListPresenter >> initializePresenters [
	table:= self newTable. 
	toolbar:= self buildToolBar. 
	table 
		addColumn: (SpStringTableColumn title: 'Expression' evaluated:#expression);
		addColumn: (SpStringTableColumn title: 'Result' evaluated:#result).
	table contextMenu: [ self rootCommandsGroup beRoot asMenuPresenter ]. 
	table items: listExpressions expressionList. 	
]

{ #category : #testing }
ExpressionListPresenter >> isExpressionSelected [
	
	^ table selectedItems isNotEmpty. 
	
]

{ #category : #accessing }
ExpressionListPresenter >> listExpressions [
	^ listExpressions.
]

{ #category : #initialization }
ExpressionListPresenter >> newExpression [
	" Create window to ask user to enter a new Expression."
	| inputExpression |
	inputExpression := self
		                 request: 'Enter a new Expression'
		                 initialAnswer: ''
		                 title: 'Create new Expression'.
	^ Expression new
		  expression: inputExpression;
		  result: 'nil';
		  yourself
]

{ #category : #testing }
ExpressionListPresenter >> selectExpression [

	^ table selection selectedItem. 
]

{ #category : #initialization }
ExpressionListPresenter >> setModelBeforeInitialization: anExpressionList [
	super setModelBeforeInitialization: anExpressionList. 
	listExpressions := anExpressionList.  	
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> updateView [
	table items: listExpressions expressionList. 
	
]
