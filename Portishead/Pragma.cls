"Filed out from Dolphin Smalltalk"!

Object subclass: #Pragma
	instanceVariableNames: 'method arguments selector'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Pragma guid: (GUID fromString: '{063dd954-ea28-4470-bc1d-6429bf6524a1}')!

Pragma comment: ''!

!Pragma categoriesForClass!Kernel-Objects! !

!Pragma methodsFor!

arguments
	^arguments!

arguments: anObject
	arguments := anObject!

displayMessageOn: aStream

	self arguments isEmpty 
		ifTrue: [aStream nextPutAll: self selector]
		ifFalse: [self selector keywords with: self arguments do: [ :keywordPart :argument | aStream nextPutAll: keywordPart; space; print: argument; space]. aStream position: aStream position - 1]!

displayOn: aStream

	aStream nextPut: $<.
	self displayMessageOn: aStream.
	aStream nextPut: $>!

displaySourceOn: aStream

	aStream nextPutAll: self class name; space.
	self displayMessageOn: aStream!

keyword
	#deprecated.
	^self selector!

method
	^method!

method: anObject
	method := anObject!

methodClass
	^self method methodClass!

methodSelector
	^self method selector!

printOn: aStream
	"Answer the name of the receiver as a developer would wish to see it ."

	super printOn: aStream.
	aStream nextPut: $(.
	self displayOn: aStream.
	aStream nextPut: $).!

selector
	^selector!

selector: anObject
	selector := anObject! !

!Pragma categoriesForMethods!
arguments!accessing!public! !
arguments:!accessing!private! !
displayMessageOn:!printing!private! !
displayOn:!printing!public! !
displaySourceOn:!printing!public! !
keyword!accessing!public! !
method!accessing!public! !
method:!accessing!private! !
methodClass!accessing!public! !
methodSelector!accessing!public! !
printOn:!printing!public! !
selector!accessing!public! !
selector:!accessing!private! !
!

!Pragma class methodsFor!

_captureSourceCode

	"Specify this pragma to save a copy of a method's source code in the method itself.
	Necessary when source code is needed for specific methods in a depoloyed image"

	| compileMethod frame sourceCode |

	compileMethod := Compiler class>>#compile:in:flags:.
	frame := Processor activeProcess topFrame.
	[sourceCode isNil and: [frame notNil]] whileTrue: 
		[frame method = compileMethod 
			ifTrue: [sourceCode := frame arguments first]
			ifFalse: [frame := frame sender]].

	^self new
		selector: #_capturedSourceCode:;
		arguments: (Array with: sourceCode);
		yourself!

allNamed: aSymbol from: aSubClass to: aSuperClass
	"Answer a collection of all pragmas found in methods of all classes between aSubClass and aSuperClass (inclusive) whose selector is aSymbol."
	
	^ Array streamContents: [ :stream |
		aSubClass withAllSuperclassesDo: [ :class |
			self withPragmasIn: class do:  [ :pragma |
				pragma selector = aSymbol
					ifTrue: [ stream nextPut: pragma ] ].
			aSuperClass = class
				ifTrue: [ ^ stream contents ] ] ].!

allNamed: aSymbol from: aSubClass to: aSuperClass sortedUsing: aSortBlock
	"Answer a collection of all pragmas found in methods of all classes between aSubClass and aSuperClass (inclusive) whose keyword is aSymbol, sorted according to aSortBlock."
	
	^ (self allNamed: aSymbol from: aSubClass to: aSuperClass) sort: aSortBlock.!

allNamed: aSymbol in: aClass
	"Answer a collection of all pragmas found in methods of aClass whose selector is aSymbol."
	
	^ Array streamContents: [ :stream |
		self withPragmasIn: aClass do: [ :pragma |
			pragma selector = aSymbol
				ifTrue: [ stream nextPut: pragma ] ] ].!

allNamed: aSymbol in: aClass sortedUsing: aSortBlock
	"Answer a collection of all pragmas found in methods of aClass whose keyword is aSymbol, sorted according to aSortBlock."
	
	^ (self allNamed: aSymbol in: aClass) sort: aSortBlock.!

doesNotUnderstand: aMessage

	"Allow a Pragma to be created via a simple message send, e.g. 
	Pragma blah: 1 blahBlah: 'two' "

	^self new
		selector: aMessage selector;
		arguments: aMessage arguments;
		yourself!

fromString: aString

	"Create an instance of the receiver based on standard (Pharo/VW) pragma syntax, e.g.
	<blah: 1 blahBlah: 'two'> "

	| readStream pragmaSource node |

	readStream := aString readStream.
	readStream next = $< ifFalse: [self error: 'invalid pragma'].
	pragmaSource := readStream upToEnd.
	pragmaSource last = $> ifFalse: [self error: 'invalid pragma'].
	node := SmalltalkParser parseExpression: 'self ', pragmaSource allButLast.

	^self new
		selector: node selector;
		arguments: (node arguments collect: [ :each | each value]) asArray;
		yourself
!

withPragmasIn: aClass do: aBlock
	aClass selectorsAndMethodsDo: [ :selector :method | method pragmas do: aBlock ].! !

!Pragma class categoriesForMethods!
_captureSourceCode!development!instance creation!public! !
allNamed:from:to:!finding!public! !
allNamed:from:to:sortedUsing:!finding!public! !
allNamed:in:!finding!public! !
allNamed:in:sortedUsing:!finding!public! !
doesNotUnderstand:!instance creation!public! !
fromString:!development!instance creation!public! !
withPragmasIn:do:!finding!private! !
!

