Extension { #name : #FASTJavaFieldAccess }

{ #category : #'*Slicing' }
FASTJavaFieldAccess >> allSlicesDown [
	^ Slice new sliceDown: self
]

{ #category : #'*Slicing' }
FASTJavaFieldAccess >> allSlicesUp [
	^ Slice new sliceUp: self
]

{ #category : #'*Slicing' }
FASTJavaFieldAccess >> oneSliceDown: res [

	self currentParentSelector == #javaVariableAssignementOwner ifTrue: [ 
		self parentNode expression oneSliceDown:res
	].
	res add: (self famixVariable fastAccesses reject: [ :access |
		access startPos < self startPos
	]).
	^ res
]

{ #category : #'*Slicing' }
FASTJavaFieldAccess >> oneSliceUp: res [

	self currentParentSelector == #javaVariableAssignementOwner ifTrue: [ 
		self parentNode expression oneSliceUp:res
	].
	res add: (self famixVariable fastAccesses reject: [ :access |
		access startPos > self startPos
	]).
	^ res
]
