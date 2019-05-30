"Filed out from Dolphin Smalltalk 7"!

Error subclass: #SubscriptOutOfBounds
	instanceVariableNames: 'subscript lowerBound upperBound'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SubscriptOutOfBounds guid: (GUID fromString: '{3d03b08b-76a0-4a87-9f6c-0f5c794bdfcc}')!
SubscriptOutOfBounds comment: ''!
!SubscriptOutOfBounds categoriesForClass!Kernel-Exception Handling! !
!SubscriptOutOfBounds methodsFor!

lowerBound
	^lowerBound!

lowerBound: anObject
	lowerBound := anObject!

messageText
	"Overwritten to initialiaze the message text to a standard text if it has not yet been set"
	
	^ messageText ifNil: [ messageText := self standardMessageText ]!

signaler: anObject

	self tag: anObject!

standardMessageText
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		self subscript 
			ifNil: [
				stream << 'subscript' ]
			ifNotNil: [ 
				stream print: self subscript ].
		(self lowerBound notNil and: [ self upperBound notNil])
			ifTrue: [
				stream << ' is not between '.
				stream print: self lowerBound.
				stream << ' and '.
				stream print: self upperBound ] ]!

subscript
	^subscript!

subscript: anObject
	subscript := anObject!

upperBound
	^upperBound!

upperBound: anObject
	upperBound := anObject! !
!SubscriptOutOfBounds categoriesFor: #lowerBound!accessing!private! !
!SubscriptOutOfBounds categoriesFor: #lowerBound:!accessing!private! !
!SubscriptOutOfBounds categoriesFor: #messageText!accessing!public! !
!SubscriptOutOfBounds categoriesFor: #signaler:!public! !
!SubscriptOutOfBounds categoriesFor: #standardMessageText!accessing!public! !
!SubscriptOutOfBounds categoriesFor: #subscript!accessing!private! !
!SubscriptOutOfBounds categoriesFor: #subscript:!accessing!private! !
!SubscriptOutOfBounds categoriesFor: #upperBound!accessing!private! !
!SubscriptOutOfBounds categoriesFor: #upperBound:!accessing!private! !

!SubscriptOutOfBounds class methodsFor!

signalFor: subscript
	^ self 
		signalFor: subscript 
		lowerBound: nil 
		upperBound: nil!

signalFor: subscript lowerBound: lowerBound upperBound: upperBound
	^ self 
		signalFor: subscript 
		lowerBound: lowerBound 
		upperBound: upperBound 
		in: nil
!

signalFor: subscript lowerBound: lowerBound upperBound: upperBound in: object
	^ self new
		signaler: object;
		subscript: subscript;
		lowerBound: lowerBound;
		upperBound: upperBound;
		signal! !
!SubscriptOutOfBounds class categoriesFor: #signalFor:!instance creation!public! !
!SubscriptOutOfBounds class categoriesFor: #signalFor:lowerBound:upperBound:!instance creation!public! !
!SubscriptOutOfBounds class categoriesFor: #signalFor:lowerBound:upperBound:in:!instance creation!public! !

