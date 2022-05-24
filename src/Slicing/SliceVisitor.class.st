Class {
	#name : #SliceVisitor,
	#superclass : #Object,
	#instVars : [
		'listVar'
	],
	#category : #Slicing
}

{ #category : #visiting }
SliceVisitor >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	| newJavaMethodEntity newStatements |
	newJavaMethodEntity := FASTJavaMethodEntity new name: aFASTJavaMethodEntity name.
	newStatements := aFASTJavaMethodEntity statementBlock statements collect: [ :stat |
		stat accept: self.
	] thenReject: #isNil.
	^ newJavaMethodEntity.
]
