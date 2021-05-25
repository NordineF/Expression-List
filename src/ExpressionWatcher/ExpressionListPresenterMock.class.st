Class {
	#name : #ExpressionListPresenterMock,
	#superclass : #ExpressionListPresenter,
	#traits : 'TStDebuggerExtension',
	#classTraits : 'TStDebuggerExtension classTrait',
	#category : #ExpressionWatcher
}

{ #category : #initialization }
ExpressionListPresenterMock >> initializePresenters [

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
	table items: listExpressions expressionList.
]

{ #category : #initialization }
ExpressionListPresenterMock >> requestExpression [

	" Create window to ask user to enter a new Expression."

	| inputExpression |


	inputExpression := '1+2'.
	^ Expression new
		  expression: inputExpression;
		  result: 'nil';
		  yourself
]

{ #category : #'as yet unclassified' }
ExpressionListPresenterMock >> updatePresenter [

	self listExpressions evaluationContext: [ ] asContext. "nil context for test"
	self listExpressions expressionList do: [ :e | 
		e autoEvaluate ifTrue: [ self listExpressions evaluateExpression: e ] ].
	self updateInspector.
	self updateView
]
