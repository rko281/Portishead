"Filed out from Dolphin Smalltalk 7"!

Object subclass: #MD5
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
MD5 guid: (GUID fromString: '{61121f96-3709-424f-af12-77b6f475968c}')!
MD5 comment: ''!
!MD5 categoriesForClass!Kernel-Objects! !
!MD5 class methodsFor!

hashMessage: aStringOrByteArray

	"Not actually MD5"

	^SecureHashAlgorithm new hashMessage: aStringOrByteArray! !
!MD5 class categoriesFor: #hashMessage:!public! !

