"Filed out from Dolphin Smalltalk 7"!

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
!Trait categoriesFor: #explicitRequirement!public! !

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

named: aSymbol uses: anArray category: aString

	#deprecated.
	^self named: aSymbol uses: anArray package: aString!

named: aSymbol uses: anArray package: aString

	(self subclasses detect: [ :each | each name = aSymbol] ifNone: [nil]) ifNotNil: [ :existing | ^existing].

	^(self
		subclass: aSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		classInstanceVariableNames: '') 
			createTraitedClasses;
			uses: anArray;
			yourself!

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
! !
!Trait class categoriesFor: #+!public! !
!Trait class categoriesFor: #addClientClass:!adding!public! !
!Trait class categoriesFor: #classTrait!accessing!public! !
!Trait class categoriesFor: #createTraitedClasses!class initialization!private! !
!Trait class categoriesFor: #initialize!class initialization!public! !
!Trait class categoriesFor: #installNewMethods!private! !
!Trait class categoriesFor: #instanceTrait!accessing!public! !
!Trait class categoriesFor: #isTrait!public!testing! !
!Trait class categoriesFor: #named:uses:category:!public! !
!Trait class categoriesFor: #named:uses:package:!public! !
!Trait class categoriesFor: #named:uses:slots:package:!public! !
!Trait class categoriesFor: #onMethodAddedOrUpdated:!event handling!public! !
!Trait class categoriesFor: #onMethodRemoved:!event handling!public! !
!Trait class categoriesFor: #reset!private! !
!Trait class categoriesFor: #subclass:instanceVariableNames:classVariableNames:poolDictionaries:classInstanceVariableNames:!public! !

