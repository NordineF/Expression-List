Extension { #name : #StDebugger }

{ #category : #'*Expression-List' }
StDebugger class >> buildExpressionListExtentionCommandsGroupWith: stDebuggerInstance forRoot: rootCommandGroup [

	<extensionCommands>
	| codeGroup expressionWatcherGroup |
	codeGroup := rootCommandGroup
	             / StDebuggerCodeCommandTreeBuilder groupName
	             /
	             StDebuggerCodeCommandTreeBuilder new
		             codeDebugCommandsGroupName.
	expressionWatcherGroup := (CmCommandGroup named: 'Expression Watcher')
		                          asSpecGroup iconName:#glamorousInspect; yourself.

	codeGroup register: expressionWatcherGroup.
	expressionWatcherGroup
		register: (ExpressionListAddCommandFromSelection forSpecContext:
					 stDebuggerInstance);
		register:
			(ExpressionListAddCommandFromSelectionWithToggleAutoEvaluate 
				 forSpecContext: stDebuggerInstance)


]
