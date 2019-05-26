"Filed out from Dolphin Smalltalk 7"!

Notification subclass: #DynamicVariable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DynamicVariable guid: (GUID fromString: '{368647b8-4d7d-4301-a6c9-b6303ba473c1}')!
DynamicVariable comment: ''!
!DynamicVariable categoriesForClass!Kernel-Objects! !
!DynamicVariable methodsFor!

default

	^nil!

defaultAction

	^self default! !
!DynamicVariable categoriesFor: #default!accessing!public! !
!DynamicVariable categoriesFor: #defaultAction!handling!public! !

!DynamicVariable class methodsFor!

value

	^self signal!

value: aValue during: aBlock

	^aBlock on: self do: [ :dv | dv resume: aValue]! !
!DynamicVariable class categoriesFor: #value!accessing!public! !
!DynamicVariable class categoriesFor: #value:during:!public! !

