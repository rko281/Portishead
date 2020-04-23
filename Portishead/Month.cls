"Filed out from Dolphin Smalltalk 7"!

Timespan subclass: #Month
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Month guid: (GUID fromString: '{dd646e80-7715-4866-8cad-95fd4329ea78}')!
Month comment: ''!
!Month categoriesForClass!Kernel-Objects! !
!Month methodsFor!

daysInMonth

	^DateAndTime daysInMonth: self dateAndTime month forYear: self dateAndTime year!

duration

	^self daysInMonth days!

previous

	^(self dateAndTime - 1 day) asMonth! !
!Month categoriesFor: #daysInMonth!accessing!public! !
!Month categoriesFor: #duration!accessing!public! !
!Month categoriesFor: #previous!accessing!public! !

!Month class methodsFor!

indexOfMonth: aString

	^Locale default indexOfMonth: aString!

month: monthInteger year: yearInteger

	^(DateAndTime year: yearInteger month: monthInteger day: 1) asMonth! !
!Month class categoriesFor: #indexOfMonth:!public! !
!Month class categoriesFor: #month:year:!public! !

