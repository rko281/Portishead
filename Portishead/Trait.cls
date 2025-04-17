"Filed out from Dolphin Smalltalk"!

Object subclass: #Trait
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: 'instanceTrait classTrait'!

Trait guid: (GUID fromString: '{4e54a10b-f8f7-46be-b9e6-11ab17d7bb9d}')!

Trait comment: ''!

!Trait categoriesForClass!Kernel-Objects! !

!Trait methodsFor!

explicitRequirement

	"Just here to prevent unimplemented message warnings"! !

!Trait categoriesForMethods!
explicitRequirement!public! !
!

!Trait class methodsFor!

+ aTraitClass

	^TraitArray with: self with: aTraitClass!

addClientClass: aClass

	instanceTrait addClientClass: aClass!

classTrait

	^classTrait!

createTraitedClasses

	instanceTrait := TraitedClass for: self.
	classTrait := TraitedClass for: self class!

initialize

	self == ##(self) ifTrue: 
		[self environment 
			when: #methodAdded: send: #onMethodAddedOrUpdated: to: self;
			when: #methodUpdated: send: #onMethodAddedOrUpdated: to: self;
			when: #methodRemoved: send: #onMethodRemoved: to: self]!

installNewMethods

	instanceTrait installNewMethods.
	classTrait installNewMethods!

instanceTrait

	^instanceTrait!

isTrait

	^self ~~ ##(self)!

named: aSymbol instanceVariableNames: ivString package: aString

	^self named: aSymbol uses: #() instanceVariableNames: ivString package: aString!

named: aSymbol uses: anArray category: aString

	#deprecated.
	^self named: aSymbol uses: anArray package: aString!

named: aSymbol uses: anArray instanceVariableNames: ivString package: aString

	(self subclasses detect: [ :each | each name = aSymbol] ifNone: [nil]) ifNotNil: [ :existing | ^existing].

	^(self
		subclass: aSymbol
		instanceVariableNames: ivString
		classVariableNames: ''
		poolDictionaries: ''
		classInstanceVariableNames: '') 
			createTraitedClasses;
			uses: anArray;
			yourself!

named: aSymbol uses: anArray package: aString

	^self named: aSymbol uses: anArray instanceVariableNames: '' package: aString!

named: aSymbol uses: anArray slots: slotsArray package: aString

	| trait |

	trait := self named: aSymbol uses: anArray category: aString.
	trait instanceTrait slots: slotsArray.
	^trait!

onMethodAddedOrUpdated: aCompilationResult

	| methodClass |

	methodClass := aCompilationResult method methodClass.
	methodClass instanceClass isTrait ifTrue: 
		[methodClass isMetaclass
			ifTrue: [methodClass instanceClass classTrait onMethodAddedOrUpdated: aCompilationResult method]
			ifFalse: [methodClass instanceTrait onMethodAddedOrUpdated: aCompilationResult method]]!

onMethodRemoved: aCompiledMethod

	| methodClass |

	methodClass := aCompiledMethod methodClass.
	methodClass instanceClass isTrait ifTrue: 
		[methodClass isMetaclass
			ifTrue: [methodClass instanceClass classTrait onMethodRemoved: aCompiledMethod]
			ifFalse: [methodClass instanceTrait onMethodRemoved: aCompiledMethod]]!

reset

	self createTraitedClasses!

subclass: aClassSymbol
		instanceVariableNames: instVarString
		classVariableNames: classVarString
		poolDictionaries: poolDictString
		classInstanceVariableNames: classInstVarString

	^(super 
		subclass: aClassSymbol
		instanceVariableNames: instVarString
		classVariableNames: classVarString
		poolDictionaries: poolDictString
		classInstanceVariableNames: classInstVarString)
			createTraitedClasses;
			yourself
!

uninitialize

	self == ##(self) ifTrue: [self environment removeEventsTriggeredFor: self]! !

!Trait class categoriesForMethods!
+!public! !
addClientClass:!adding!public! !
classTrait!accessing!public! !
createTraitedClasses!class initialization!private! !
initialize!class initialization!public! !
installNewMethods!private! !
instanceTrait!accessing!public! !
isTrait!public!testing! !
named:instanceVariableNames:package:!public! !
named:uses:category:!public! !
named:uses:instanceVariableNames:package:!public! !
named:uses:package:!public! !
named:uses:slots:package:!public! !
onMethodAddedOrUpdated:!event handling!public! !
onMethodRemoved:!event handling!public! !
reset!private! !
subclass:instanceVariableNames:classVariableNames:poolDictionaries:classInstanceVariableNames:!public! !
uninitialize!class initialization!public! !
!

