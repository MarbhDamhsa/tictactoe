*** Tic-Tac-Toe *** 

Instructions:
Played with either two players or one player with an AI

Because Haskell does not allow mutability, 
game is played through use of special value 'it'

First, evaluate the emptyBoard
-- emptyBoard

Then, call the play function replacing 'i' and 'j' with desired board coordinates 
and 'a' with your chosen marker
-- play 0 0 'X' emptyBoard
This will place an X at (0,0)

Subsequent plays will require use of 'it' to preserve board state
-- play 0 1 'O' it
This will place an O at (0,1) on the board that was returned 
from the previous function call.

If you wish to play against a computer, call the bestMove function
NOTE: This can take up to 20 seconds the first time it is called.

-- bestMove it

By default, the AI plays as circle (O)

To determine a winner, simply call the winner function passing the value of it
-- winner it

This will return either an 'X', an 'O', a '-' indicating a tie, or a '?' indicating the game is not finished
