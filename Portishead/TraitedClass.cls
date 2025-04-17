"Filed out from Dolphin Smalltalk"!

Object subclass: #TraitedClass
	instanceVariableNames: 'traitClass clientClasses'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

TraitedClass guid: (GUID fromString: '{9687380a-c069-4568-8077-2fec7d330150}')!

TraitedClass comment: ''!

!TraitedClass categoriesForClass!Kernel-Objects! !

!TraitedClass methodsFor!

+ aTraitedClass

	^TraitArray with: self with: aTraitedClass!

addClientClass: aClass

	self clientClasses add: aClass.
	self
		installTraitInstanceVariablesIn: aClass;
		installTraitMethodsIn: aClass!

clientClasses
	^clientClasses!

clientClasses: anObject
	clientClasses := anObject!

comment: aString

	self traitClass comment: aString!

initialize

	self clientClasses: IdentitySet new!

installTraitInstanceVariablesIn: aClass

	| existing | 

	self traitClass allInstVarNames isEmpty ifTrue: [^self].
	aClass isMetaclass ifTrue: [^self].

	existing := aClass allInstVarNames.
	self traitClass allInstVarNames do: [ :each | (existing includes: each) ifFalse: [aClass addInstVarName: each]]!

installTraitMethod: aCompiledMethod in: aClass

	(aClass includesSelector: aCompiledMethod selector) ifFalse: [aClass compile: aCompiledMethod getSource categories: aCompiledMethod realCategories]!

installTraitMethodsIn: aClass

	self traitClass methodDictionary do: [ :method | self installTraitMethod: method in: aClass]!

instanceVariableNames: aString

!

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

!TraitedClass categoriesForMethods!
+!accessing!public! !
addClientClass:!adding!public! !
clientClasses!accessing!private! !
clientClasses:!accessing!private! !
comment:!accessing!public! !
initialize!initialize/release!public! !
installTraitInstanceVariablesIn:!operations!private! !
installTraitMethod:in:!operations!private! !
installTraitMethodsIn:!operations!private! !
instanceVariableNames:!public! !
methodsFor:!accessing!public! !
onMethodAddedOrUpdated:!event handling!public! !
onMethodRemoved:!event handling!public! !
traitClass!accessing!private! !
traitClass:!accessing!private! !
uses:!class initialization!public! !
!

!TraitedClass class methodsFor!

for: aTraitClass

	^self new
		traitClass: aTraitClass;
		yourself!

new

	^super new initialize! !

!TraitedClass class categoriesForMethods!
for:!instance creation!public! !
new!instance creation!public! !
!

