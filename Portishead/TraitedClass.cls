"Filed out from Dolphin Smalltalk 7"!

Object subclass: #TraitedClass
	instanceVariableNames: 'traitClass clientClasses'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
TraitedClass guid: (GUID fromString: '{9687380a-c069-4568-8077-2fec7d330150}')!
TraitedClass comment: ''!
!TraitedClass categoriesForClass!Kernel-Objects! !
!TraitedClass methodsFor!

addClientClass: aClass

	self clientClasses add: aClass.
	self installTraitMethodsIn: aClass!

clientClasses
	^clientClasses!

clientClasses: anObject
	clientClasses := anObject!

initialize

	self clientClasses: IdentitySet new!

installTraitMethod: aCompiledMethod in: aClass

	(aClass includesSelector: aCompiledMethod selector) ifFalse: [aClass compile: aCompiledMethod getSource categories: aCompiledMethod realCategories]!

installTraitMethodsIn: aClass

	self traitClass methodDictionary do: [ :method | self installTraitMethod: method in: aClass]!

methodsFor: aString

	"Metaclass behavior"

	^self traitClass methodsFor: aString!

onMethodAddedOrUpdated: aCompiledMethod

	self clientClasses do: [ :each | self installTraitMethod: aCompiledMethod in: each]!

onMethodRemoved: aCompiledMethod

	self clientClasses do: [ :each | each removeSelector: aCompiledMethod selector]!

traitClass
	^traitClass!

traitClass: anObject
	traitClass := anObject!

uses: aTraitOrArray

	self traitClass uses: aTraitOrArray! !
!TraitedClass categoriesFor: #addClientClass:!adding!public! !
!TraitedClass categoriesFor: #clientClasses!accessing!private! !
!TraitedClass categoriesFor: #clientClasses:!accessing!private! !
!TraitedClass categoriesFor: #initialize!initialize/release!public! !
!TraitedClass categoriesFor: #installTraitMethod:in:!operations!private! !
!TraitedClass categoriesFor: #installTraitMethodsIn:!operations!private! !
!TraitedClass categoriesFor: #methodsFor:!accessing!public! !
!TraitedClass categoriesFor: #onMethodAddedOrUpdated:!event handling!public! !
!TraitedClass categoriesFor: #onMethodRemoved:!event handling!public! !
!TraitedClass categoriesFor: #traitClass!accessing!private! !
!TraitedClass categoriesFor: #traitClass:!accessing!private! !
!TraitedClass categoriesFor: #uses:!class initialization!public! !

!TraitedClass class methodsFor!

for: aTraitClass

	^self new
		traitClass: aTraitClass;
		yourself!

new

	^super new initialize! !
!TraitedClass class categoriesFor: #for:!instance creation!public! !
!TraitedClass class categoriesFor: #new!instance creation!public! !

