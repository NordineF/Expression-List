"
I represent the expression list debugger plugin presenter. 

Users can interact with me :
	- can add Expression
	- can remove an Expression
	- can auto evaluate an Expression
	- can modify an Expression
	- can add an expression from source pane


Public API and Key Messages
-	buildToolBar  					<- Create toolbar with buttons for each command. 
-	debuggerExtensionToolName 	<- Define debugger plugin name. 
-	displayOrder					  	<- Use it to integrate our plugin inside debugger.
-	initializePresenters		 	<-  Initialize the ExpressionListPresenter, initialize toolbar, inspector and table (which contains expressions).
- 	initializeWindow				<- Initialize Window for shortcut key. 
-	isExpressionSelected			<- Allows us to know if an Expression is selected. 
- 	listExpressions					<- getter for listExpressions ( an ExpressionList object which contains all expression). 
-  listExpressions:				<- setter for listExpression ( an ExpressionList object which contains all expression). 
-	modifyExpression:				<- called by Modify command, allows us to modify an expression. 
-	newExpression					<- called by Add command and Add From Selection command, allows us to add a new expression. 
-  onTableSelectionChanged 		<- update inspector
-  selectExpression				<- getter to get the selected expression
-  selectExpression:				<- setter allows us to select an expression
-  setModelBeforeInitialization <- initialize our model before initialization. 
-  table 								<- getter for table
-  updateInspector					<- update inspector
-  updatePresenter					<- update presenter display
-  updateView						<- update display

				

"
Class {
	#name : #ExpressionListPresenter,
	#superclass : #StPresenter,
	#traits : 'TStDebuggerExtension',
	#classTraits : 'TStDebuggerExtension classTrait',
	#instVars : [
		'listExpressions',
		'table',
		'toolbar',
		'inspector',
		'debugger'
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

{ #category : #accessing }
ExpressionListPresenter class >> debugger: aModel [
 
	self new debugger: aModel. 
]

{ #category : #specs }
ExpressionListPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
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
	group register: (ExpressionListAddCommand forSpecContext: self).
	group register: (ExpressionListModifyCommand forSpecContext: self).
	group register:
		(ExpressionListToggleAutoEvaluateCommand forSpecContext: self).
	group register: (ExpressionListRemoveCommand forSpecContext: self).
	group register: (ExpressionListInspectCommand forSpecContext: self).
	group register: (ExpressionListEvaluateCommand forSpecContext: self).
	group register: (ExpressionListClearCache  forSpecContext: self).
	group register: (ExpressionHelpCommand forSpecContext: self).

	^ group asToolbarPresenterWith: [ :presenter | 
		  presenter displayMode: self application toolbarDisplayMode ]
]

{ #category : #'debugger extension' }
ExpressionListPresenter >> debuggerExtensionToolName [

	^ 'ExpressionListPresenter'
]

{ #category : #initialization }
ExpressionListPresenter >> initialize [

	super initialize.
	listExpressions := ExpressionList new.
	ExpressionList expressionCache do: [ :expressionString | 
		listExpressions addExpressionFromString: expressionString ]
]

{ #category : #initialization }
ExpressionListPresenter >> initializePresenters [

	table := self newTable.
	toolbar := self buildToolBar.
	inspector := nil inspectionRaw.
	inspector owner: self.
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
	table items: listExpressions expressionList.
	debugger stackTable selection whenChangedDo: [ 
		self updatePresenter ]
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

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> onTableSelectionChanged [

	self updateInspector
]

{ #category : #initialization }
ExpressionListPresenter >> requestExpression [

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

{ #category : #testing }
ExpressionListPresenter >> selectExpression: anItem [

	table selectItem: anItem
]

{ #category : #initialization }
ExpressionListPresenter >> setListFromCache [

	listExpressions := ExpressionList new.
	ExpressionList expressionCache do: [ :expressionString | 
		listExpressions addExpressionFromString: expressionString ]
]

{ #category : #initialization }
ExpressionListPresenter >> setModelBeforeInitialization: aModel [
	
	debugger := aModel. 
	listExpressions := ExpressionList new.  
]

{ #category : #accessing }
ExpressionListPresenter >> table [

	^ table
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> updateInspector [
	
	self isExpressionSelected ifTrue: [ 
		inspector model: self selectExpression result ]
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> updatePresenter [

	self listExpressions evaluationContext: debugger currentContext.
	self listExpressions expressionList do: [ :e | 
		e autoEvaluate ifTrue: [ self listExpressions evaluateExpression: e ] ].
	self updateInspector.
	self updateView
]

{ #category : #'as yet unclassified' }
ExpressionListPresenter >> updateView [

	| storeSelectedExpression |
	
	storeSelectedExpression := self selectExpression.
	table items: listExpressions expressionList.
	self selectExpression: storeSelectedExpression
]
