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

asWeek

	^self dateAndTime asWeek!

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

do: aBlock with: aFirstElement

 	self do: aBlock with: aFirstElement when: [ :t | true ]. !

do: aBlock with: aFirstElement when: aConditionBlock

	| element end |
	element := aFirstElement.
	end := self end.
	[ element start <= end ] whileTrue:
	
	[(aConditionBlock value: element)
			ifTrue: [ aBlock value: element ].
		element := element next. ]!

duration

	^self subclassResponsibility!

end

	^self next dateAndTime - 1 nanoseconds!

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
	aStream nextPut: $)!

start

	^self dateAndTime!

weeks


	| weeks |
	weeks := OrderedCollection new.
	self weeksDo: [ :m | weeks add: m ].
	^ weeks asArray.!

weeksDo: aBlock

	self do: aBlock with: self asWeek.! !
!Timespan categoriesFor: #=!comparing!public! !
!Timespan categoriesFor: #asDate!converting!public! !
!Timespan categoriesFor: #asWeek!converting!public! !
!Timespan categoriesFor: #dateAndTime!accessing!private! !
!Timespan categoriesFor: #dateAndTime:!accessing!private! !
!Timespan categoriesFor: #dates!accessing!public! !
!Timespan categoriesFor: #displayOn:!printing!public! !
!Timespan categoriesFor: #do:with:!accessing!public! !
!Timespan categoriesFor: #do:with:when:!accessing!public! !
!Timespan categoriesFor: #duration!accessing!public! !
!Timespan categoriesFor: #end!accessing!public! !
!Timespan categoriesFor: #hash!comparing!public! !
!Timespan categoriesFor: #next!accessing!public! !
!Timespan categoriesFor: #printOn:!printing!public! !
!Timespan categoriesFor: #start!accessing!public! !
!Timespan categoriesFor: #weeks!accessing!public! !
!Timespan categoriesFor: #weeksDo:!accessing!public! !

