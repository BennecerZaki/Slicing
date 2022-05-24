Class {
	#name : #Slice,
	#superclass : #Object,
	#instVars : [
		'listVar',
		'method',
		'variable',
		'res'
	],
	#category : #Slicing
}

{ #category : #initialization }
Slice >> initialize [ 
	super initialize.
	listVar := Set new.
	res := OrderedCollection new
]

{ #category : #'private-algorithm' }
Slice >> sliceDown: aFASTJavaEnt [

	| allSlice |
	allSlice := Set new.
	aFASTJavaEnt oneSliceDown: res.
	res flatten do: [ :each | 
		each parentNode className = 'FASTJavaMethodEntity' ifFalse: [ 
			allSlice add: each parentNode ].
		each className = 'FASTJavaParameter' ifTrue: [ allSlice add: each ] ].
	^ allSlice sorted: [ :a :b | a startPos < b startPos ]
]

{ #category : #'private-algorithm' }
Slice >> sliceUp: aFASTJavaEnt [

	| allSlice |
	allSlice := Set new.
	aFASTJavaEnt oneSliceUp: res.
	res flatten do: [ :each | 
		each parentNode className = 'FASTJavaMethodEntity' ifFalse: [ 
			allSlice add: each parentNode ].
		each className = 'FASTJavaParameter' ifTrue: [ allSlice add: each ] ].
	^ allSlice sorted: [ :a :b | a startPos < b startPos ]
]
