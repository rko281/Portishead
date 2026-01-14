"Filed out from Dolphin Smalltalk"!

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

!SubscriptOutOfBounds categoriesForMethods!
lowerBound!accessing!private! !
lowerBound:!accessing!private! !
messageText!accessing!public! !
signaler:!public! !
standardMessageText!accessing!public! !
subscript!accessing!private! !
subscript:!accessing!private! !
upperBound!accessing!private! !
upperBound:!accessing!private! !
!

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

!SubscriptOutOfBounds class categoriesForMethods!
signalFor:!instance creation!public! !
signalFor:lowerBound:upperBound:!instance creation!public! !
signalFor:lowerBound:upperBound:in:!instance creation!public! !
!

