
--Empty game board
emptyBoard = ["...","...","..."]

--Assign each tile a letter and evaluate for win condition
winner :: [[Char]] -> Char
winner [[a,b,c],[d,e,f],[g,h,i]]
       | a == b && b == c && a /= '.'    = a
       | d == e && e == f && d /= '.'    = d
       | g == h && h == i && g /= '.'    = g
       | a == d && d == g && a /= '.'    = a
       | b == e && e == h && b /= '.'    = b
       | c == f && f == i && c /= '.'    = c
       | a == e && e == i && a /= '.'    = a
       | c == e && e == g && c /= '.'    = c
       | '.' `elem` [a,b,c,d,e,f,g,h,i]  = '?'  ---Game in progress
       | otherwise                       = '-'  ---Game ends with tie

--Replace the nth element of a list
replace :: Int -> a -> [a] -> [a]
replace 0 a (x:xs) = a:xs
replace n a (x:xs) = x:(replace (n - 1) a xs)

--Replaces the character at position i, j in board
play :: Int -> Int -> Char -> [[Char]] -> [[Char]]
play i j a board = replace i (replace j a (board !! i)) board

-- ***********************************
-- **       AI Implementation       **
-- ***********************************

--Gives each board tile a value
value :: Char -> [[Char]] -> Int
value player board
      | w == 'X'       =   1
      | w == 'O'       = (-1)
      | w == '-'       =   0
      | player == 'X'  = maximum [value 'O' (play i j 'X' board) | i <- [0..2], j <- [0..2], board !! i !! j == '.']
      | otherwise      = minimum [value 'X' (play i j 'O' board) | i <- [0..2], j <- [0..2], board !! i !! j == '.']
      where w = winner board

--Returns from a list of boards where X has just moved, the one with the max value
bestOf :: [[[Char]]] -> [[Char]]
bestOf [x] = x
bestOf (x:xs)
        | value 'O' x > value 'O' bxs = x
        | otherwise                   = bxs
        where bxs = bestOf xs


--Returns board after X's best move
bestMove :: [[Char]] -> [[Char]]
bestMove board = bestOf [play i j 'O' board | i <- [0..2], j <- [0..2], board !! i !! j == '.']
