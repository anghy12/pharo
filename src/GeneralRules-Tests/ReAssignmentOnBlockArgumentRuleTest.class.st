"
A RBAssignmentOnBlockArgumentRuleTest is a test class for testing the behavior of RBAssignmentOnBlockArgumentRule
"
Class {
	#name : #ReAssignmentOnBlockArgumentRuleTest,
	#superclass : #ReAbstractRuleTestCase,
	#category : #'GeneralRules-Tests-Migrated'
}

{ #category : #'test-help' }
ReAssignmentOnBlockArgumentRuleTest >> sampleMethod [
	"Assignment to blockArgument is bad - here x"
	| myBlock |
	myBlock := [:x :y|
		x := x+y.
		y := y+x
	]
]

{ #category : #tests }
ReAssignmentOnBlockArgumentRuleTest >> testRule [
	| critiques|
	self class compile: 'sampleMethod
	"Assignment to blockArgument is bad - here x"
	| myBlock |
	myBlock := [:x :y|
		x := x+y.
		y := y+x
	]' classified: 'test-help'.
 	critiques := self myCritiques.
	
 	self assert: critiques size equals: 2.
 	self assert: (self sourceAtChritique: critiques second)  equals: 'y := y+x'.
]
