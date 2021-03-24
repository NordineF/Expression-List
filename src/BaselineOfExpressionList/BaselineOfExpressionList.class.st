Class {
	#name : #BaselineOfExpressionList,
	#superclass : #BaselineOf,
	#category : #BaselineOfExpressionList
}

{ #category : #baselines }
BaselineOfExpressionList >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'Expression-List';
			package: 'Expression-ListTest'
			with: [ spec requires: #( 'Expression-List' ) ] ]
]
