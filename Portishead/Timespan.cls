"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Timespan
	instanceVariableNames: 'dateAndTime'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Timespan guid: (GUID fromString: '{3c4e1840-8b7e-49a5-a45f-5c0f4ff823f8}')!
Timespan comment: ''!
!Timespan categoriesForClass!Kernel-Objects! !
!Timespan methodsFor!

= aMonth

	^self dateAndTime = aMonth dateAndTime!

asDate

	^self dateAndTime asDate!

dateAndTime
	^dateAndTime!

dateAndTime: anObject
	dateAndTime := anObject!

dates

	| dates date next |

	dates := OrderedCollection new.
	date := self asDate.
	next := self next asDate.

	[date < next] whileTrue: 
		[dates add: date.
		date := date addDays: 1].

	^dates!

displayOn: aStream

	self dateAndTime asDate displayOn: aStream!

duration

	^self subclassResponsibility!

hash

	^self dateAndTime hash!

next

	^self class new
		dateAndTime: (self dateAndTime + self duration);
		yourself!

printOn: aStream

	super printOn: aStream.
	aStream nextPutAll: ' ('.
	self displayOn: aStream.
	aStream nextPut: $)! !
!Timespan categoriesFor: #=!comparing!public! !
!Timespan categoriesFor: #asDate!converting!public! !
!Timespan categoriesFor: #dateAndTime!accessing!private! !
!Timespan categoriesFor: #dateAndTime:!accessing!private! !
!Timespan categoriesFor: #dates!accessing!public! !
!Timespan categoriesFor: #displayOn:!printing!public! !
!Timespan categoriesFor: #duration!accessing!public! !
!Timespan categoriesFor: #hash!comparing!public! !
!Timespan categoriesFor: #next!accessing!public! !
!Timespan categoriesFor: #printOn:!printing!public! !

