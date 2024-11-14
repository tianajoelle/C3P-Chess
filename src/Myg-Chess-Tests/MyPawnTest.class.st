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
	"put a pawn at a file 2 as it's an initial position to a white pawn"
    board at: 'd2' put: pawn.

    squares := pawn targetSquares .

	"Vérifie que le pion peut avancer de deux cases pour son premier mouvement."
	self
    assertCollection: squares includesAll: (Array with: (board at: 'd3') with:(board at: 'd4') )
]
