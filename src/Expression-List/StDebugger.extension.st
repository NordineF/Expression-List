Extension { #name : #StDebugger }

{ #category : #'*Expression-List' }
StDebugger class >> buildExpressionListExtentionCommandsGroupWith: stDebuggerInstance forRoot: rootCommandGroup [

	<extensionCommands>
	| codeGroup |
	codeGroup := rootCommandGroup
	             / StDebuggerCodeCommandTreeBuilder groupName
	             /
	             StDebuggerCodeCommandTreeBuilder new
		             codeDebugCommandsGroupName.


	codeGroup register:
		(ExpressionListAddCommandFromSelection forSpecContext:
			 stDebuggerInstance)
]
