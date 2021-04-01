Class {
	#name : #ExpressionListPresenter,
	#superclass : #StPresenter,
	#instVars : [
		'listExpressions',
		'table',
		'toolbar',
		'inspector'
	],
	#category : #'Expression-List'
}

{ #category : #commands }
ExpressionListPresenter class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register: (ExpressionListAddCommand forSpec context: presenter);
		register: (ExpressionListRemoveCommand forSpec context: presenter);
		register: (ExpressionListEvaluateCommand forSpec context: presenter);
		register: (ExpressionListInspectCommand forSpec context: presenter);
		register: (ExpressionListModifyCommand forSpec context: presenter);
		register:(ExpressionListToggleAutoEvaluateCommand forSpec context: presenter)
]

{ #category : #specs }
ExpressionListPresenter class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  add: #toolbar
			withConstraints:[:constraints| constraints height: self toolbarHeight + 5]; 
		  add: #table;
		  add: #inspector; 
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

	table := self newTable.
	toolbar := self buildToolBar.
	inspector := nil inspectionRaw.
	inspector owner: self.
	listExpressions := ExpressionList new.
	table
		addColumn:
			(SpStringTableColumn title: 'Expression' evaluated: #expression);
		addColumn: (SpStringTableColumn
				 title: 'Result'
				 evaluated: [ :e | e result printString ]);
		addColumn: (SpStringTableColumn
				 title: 'Auto-Evalute'
				 evaluated: [ :e | e autoEvaluate printString ]).
	table contextMenu: [ self rootCommandsGroup beRoot asMenuPresenter ].
	table selection whenChangedDo: [ self onTableSelectionChanged ].
	table items: listExpressions expressionList
]

{ #category : #initialization }
ExpressionListPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	self rootCommandsGroup installShortcutsIn: aWindowPresenter
]

{ #category : #testing }
ExpressionListPresenter >> isExpressionSelected [
	
	^ table selectedItems isNotEmpty. 
	
]

{ #category : #accessing }
ExpressionListPresenter >> listExpressions [
	^ listExpressions.
]

{ #category : #accessing }
ExpressionListPresenter >> listExpressions: aList [
	listExpressions := aList.
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> modifyExpression: aSelectedExpression [

	aSelectedExpression expression: (self
			 request: 'Enter a new Expression'
			 initialAnswer: ''
			 title: 'Modify Expression').

	^ aSelectedExpression
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

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> onTableSelectionChanged [

	self updateInspector
]

{ #category : #testing }
ExpressionListPresenter >> selectExpression [

	^ table selection selectedItem. 
]

{ #category : #testing }
ExpressionListPresenter >> selectExpression: anItem [

	table selectItem: anItem
]

{ #category : #initialization }
ExpressionListPresenter >> setModelBeforeInitialization: anExpressionList [
	super setModelBeforeInitialization: anExpressionList. 
	listExpressions := anExpressionList.  	
]

{ #category : #accessing }
ExpressionListPresenter >> table [

	^ table
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> updateInspector [ 
	self isExpressionSelected ifTrue:[ inspector model: self selectExpression result]. 
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> updateView [

	| storeSelectedExpression |
	self flag:
		'Change way we give back the selectedExpression after updateView.'.
	storeSelectedExpression := self selectExpression.
	table items: listExpressions expressionList.
	self selectExpression: storeSelectedExpression
]
