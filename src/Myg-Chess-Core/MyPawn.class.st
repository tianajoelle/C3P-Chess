Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'testing' }
MyPawn >> isAtStartingPosition [

	^ self isWhite 
	ifTrue: [ square file = $2 ]
	ifFalse: [ square file = $7 ].
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [ 
    | legalMoves forwardOneSquare forwardTwoSquares |

    legalMoves := OrderedCollection new.

    "Définit les mouvements en avant selon la couleur du pion"
    forwardOneSquare := self isWhite ifTrue: [ square up ] ifFalse: [ square down ].
    forwardTwoSquares := self isWhite ifTrue: [ square up up ] ifFalse: [ square down down ].

    "Ajoute le mouvement de 1 case en avant si la case est libre"
    (forwardOneSquare notNil and: [ forwardOneSquare hasPiece not ])
        ifTrue: [ legalMoves addLast: forwardOneSquare ].

    "Ajoute le mouvement de 2 cases en avant si le pion est en position initiale et les cases sont libres"
    (self isAtStartingPosition and: [
        forwardOneSquare hasPiece not and: [ forwardTwoSquares hasPiece not ]
    ]) ifTrue: [ legalMoves addLast: forwardTwoSquares ].

^legalMoves
]
