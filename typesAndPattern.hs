-- a type is a kind of label that every expression has
-- it tells us in which category of thing that expression fits
-- True is boolean
-- "hello" is a string

--  :t 'a'
-- a has a type of Char
-- 'a' :: Char

-- maps from a string to a string
-- 1 string as parameter, 1 string as result
-- removeNonUppercase :: [Char] -> [Char]
removeNonUppercase :: String -> String    
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]  

-- return type is last item
addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  

-- Int (max on 32bit is 2147483647). 
-- Integer.. not bounded.  Int is more efficient

-- Float - single precision
-- Double - double

-- 1. Type variables
-- ghci> :t head  
-- head :: [a] -> a
-- becuase not a capital, a is a type variable.. a can be any type
-- like generics

-- fst has a type Tuple of 1 types a and b, and returns and element type a
-- ghci> :t fst  
-- fst :: (a, b) -> a 

-- 2. Type Classes

-- "3"
c = show 3

-- 13
a = read "8" + 5


-- Type annotations
b = read "5" :: Int


-- Pattern Matching
lucky :: (Integral a) => a -> String  
lucky 7 = "LUCKY NUMBER SEVEN!"  
lucky x = "Sorry, you're out of luck, pal!"  

d = lucky 7
e = lucky 8


-- 4*3*2*1
fac n =
    if n < 2
        -- base case of the recursion.. stop at 1
        then 1
        else n * fac (n-1) 
f = fac 4

factorial :: (Integral a) => a -> a
-- just like recursion above  
factorial 0 = 1  
factorial n = n * factorial (n - 1)  

g = factorial 4

-- a list of tuples
xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]  
-- [4,7,6,8,11,4]
-- pattern match in list comprehension?
h = [a+b | (a,b) <- xs]

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

-- i = tell []
j = tell ["thing"] 
k = tell ["thing", "thing2"]
