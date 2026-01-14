"Filed out from Dolphin Smalltalk"!

LookupTable variableSubclass: #OrderedDictionary
	instanceVariableNames: 'orderedKeys'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

OrderedDictionary guid: (GUID fromString: '{e5ae1509-c7db-4dde-b7b1-2375fd813880}')!

OrderedDictionary comment: ''!

!OrderedDictionary categoriesForClass!Collections-Unordered! !

!OrderedDictionary methodsFor!

addAll: anAssociationCollection
	"Since Collection implements #associationsDo:, this method can accept
	any collection of associations including Arrays and OrderedCollections"

	anAssociationCollection associationsDo: [:each | self add: each].
	^ anAssociationCollection.!

at: key put: newElement 
	"Store the argument newElement with the external key, key,
	in the receiver. Answer newElement."

	| index |
	key isNil ifTrue: [^self error: 'key cannot be nil'].
	index := self findKeyOrNil: key.
	"We must store the value first, as a resize may occur during privateAt:put:"
	values at: index put: newElement.
	(self basicAt: index) isNil ifTrue: 
		[orderedKeys add: key.
		self privateAt: index put: key].
	^newElement!

do: aBlock

	self keysDo: [ :key | aBlock value: (self at: key)]!

indexOfKey: anObject

	^orderedKeys indexOf: anObject!

initialize

	super initialize.

	orderedKeys := OrderedCollection new!

keys

	^orderedKeys!

keysAndValuesDo: aBlock

	self keysDo: [ :key | aBlock value: key value: (self at: key)]!

keysDo: aBlock

	orderedKeys do: aBlock!

orderedKeys
	^orderedKeys!

orderedKeys: anObject
	orderedKeys := anObject!

removeKey: key ifAbsent: exceptionHandler 
	"Remove the key (and its associated value), from the receiver. If key is not in the 
	receiver, answer the result of evaluating the niladic valuable, exceptionHandler.
	Otherwise, answer the value named by key."

	| index |
	index := self findKeyOrNil: key.
	^(self basicAt: index) isNil 
		ifTrue: [exceptionHandler value]
		ifFalse: 
			[| value |
			value := values at: index.
			values at: index put: nil.
			self removeIndex: index.
			orderedKeys remove: key.
			value]!

uncheckedAt: key put: anObject

	orderedKeys addLast: key.
	^super uncheckedAt: key put: anObject! !

!OrderedDictionary categoriesForMethods!
addAll:!public! !
at:put:!accessing!public! !
do:!enumerating!public! !
indexOfKey:!accessing!public! !
initialize!initializing!public! !
keys!accessing!public! !
keysAndValuesDo:!enumerating!public! !
keysDo:!enumerating!public! !
orderedKeys!accessing!private! !
orderedKeys:!accessing!private! !
removeKey:ifAbsent:!public!removing! !
uncheckedAt:put:!accessing!public! !
!

