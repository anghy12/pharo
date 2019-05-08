"
Intialized Slots define a default value as part of their definition.

the default parameter can be literal or a block (which is evaluated on init). If the block has a parameter this will be set to the instance.

There are two subclasses: setting the default value on instantion and lazy initialization on read.

 
"
Class {
	#name : #AbstractInitializedSlot,
	#superclass : #InstanceVariableSlot,
	#instVars : [
		'default'
	],
	#category : #'Slot-Examples-Base'
}

{ #category : #comparing }
AbstractInitializedSlot >> = other [
	^ super = other and: [default = other default]
]

{ #category : #accessing }
AbstractInitializedSlot >> default: anObject [
	"we wrap the default in a block, this way we can support calculated default values"
	default := [anObject]
]

{ #category : #accessing }
AbstractInitializedSlot >> defaultBlock: aBlock [
	default := aBlock
]

{ #category : #comparing }
AbstractInitializedSlot >> hasSameDefinitionAs: otherSlot [

	^ (super hasSameDefinitionAs: otherSlot) 
		and: [ default = otherSlot default ]

]

{ #category : #comparing }
AbstractInitializedSlot >> hash [
	^super hash bitXor: default hash
]

{ #category : #printing }
AbstractInitializedSlot >> printOn: aStream [
	aStream 
		store: self name;
		nextPutAll: ' => ';
		nextPutAll: self class name;
		nextPutAll: ' default: ';
		store: default
]