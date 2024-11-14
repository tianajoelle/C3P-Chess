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

{ #category : 'tests' }
MyPawnTest >> testIsAtStartingPosition [
| board whitePawn blackPawn |
    
    board := MyChessBoard empty.
    whitePawn := MyPawn white.
    blackPawn := MyPawn black.

    "Place un pion blanc en position initiale sur la case 'd2'"
    board at: 'd2' put: whitePawn.
    
    "Place un pion noir en position initiale sur la case 'd7'"
    board at: 'd7' put: blackPawn.
    
    "Vérifie que le pion blanc est en position initiale"
    self assert: whitePawn isAtStartingPosition.
    
    "Vérifie que le pion noir est en position initiale"
    self assert: blackPawn isAtStartingPosition.
]
