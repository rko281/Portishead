"Filed out from Dolphin Smalltalk 7"!

Color subclass: #PharoColor
	instanceVariableNames: 'argb'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
PharoColor guid: (GUID fromString: '{fedde2d0-cde1-4a60-9d68-6bdcc91c79a8}')!
PharoColor comment: ''!
!PharoColor categoriesForClass!Drawing! !
!PharoColor methodsFor!

argb
	^argb!

argb: anObject
	argb := anObject!

asRGB

	^self argb!

privateRGB

	^(((self red * 1023) // 255 bitAnd: 1023) bitShift: 20) + (((self green * 1023) // 255 bitAnd: 1023) bitShift: 10) + ((self blue * 1023) // 255 bitAnd: 1023)! !
!PharoColor categoriesFor: #argb!accessing!private! !
!PharoColor categoriesFor: #argb:!accessing!private! !
!PharoColor categoriesFor: #asRGB!converting!public! !
!PharoColor categoriesFor: #privateRGB!accessing!public! !

!PharoColor class methodsFor!

r: r g: g b: b

	^self basicNew
		argb: (ARGB r: r g: g b: b);
		yourself!

r: r g: g b: b range: range

	^self basicNew
		argb: (ARGB r: r g: g b: b range: range);
		yourself! !
!PharoColor class categoriesFor: #r:g:b:!instance creation!public! !
!PharoColor class categoriesFor: #r:g:b:range:!instance creation!public! !

