"Filed out from Dolphin Smalltalk"!

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

!Timespan categoriesForMethods!
=!comparing!public! !
asDate!converting!public! !
asWeek!converting!public! !
dateAndTime!accessing!private! !
dateAndTime:!accessing!private! !
dates!accessing!public! !
displayOn:!printing!public! !
do:with:!accessing!public! !
do:with:when:!accessing!public! !
duration!accessing!public! !
end!accessing!public! !
hash!comparing!public! !
next!accessing!public! !
printOn:!printing!public! !
start!accessing!public! !
weeks!accessing!public! !
weeksDo:!accessing!public! !
!

