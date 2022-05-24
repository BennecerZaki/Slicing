Extension { #name : #FASTJavaVariableExpression }

{ #category : #'*Slicing' }
FASTJavaVariableExpression >> allSlicesDown [
	^ Slice new sliceDown: self
]

{ #category : #'*Slicing' }
FASTJavaVariableExpression >> allSlicesUp [
	^ Slice new sliceUp: self
]

{ #category : #'*Slicing' }
FASTJavaVariableExpression >> oneSliceDown: res [

	(self currentParentSelector == #javaVariableAssignementOwner and: [ 
		 self parentNode expression className ~= 'FASTJavaIntegerLiteral' ]) 
		ifTrue: [ self parentNode expression oneSliceDown: res ].
	res add: (self famixVariable fastAccesses reject: [ :access | 
			 access startPos < self startPos ]).
	^ res
]

{ #category : #'*Slicing' }
FASTJavaVariableExpression >> oneSliceUp: res [

	(self currentParentSelector == #javaVariableAssignementOwner and: [ 
		self parentNode expression className ~= 'FASTJavaIntegerLiteral'
	]) ifTrue: [ 
		self parentNode expression oneSliceUp:res
	].
	res add: (self famixVariable fastAccesses reject: [ :access |
		access startPos > self startPos
	]).
	^ res
]
