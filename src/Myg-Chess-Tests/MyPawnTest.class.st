Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testInitialDoubleMove [
	| pawn board squares |
	
	board:= MyChessBoard empty.
	pawn:= MyPawn white.
	board at: 'd2' put: pawn.

	squares := pawn targetSquares .

self
	assertCollection: squares includesAll: (Array with: (board at: 'd3') with:(board at: 'd4') )
]
