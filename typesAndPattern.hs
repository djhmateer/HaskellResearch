-- a type is a kind of label that every expression has
-- it tells us in which category of thing that expression fits
-- True is boolean
-- "hello" is a string

--  :t 'a'
-- a has a type of Char
-- 'a' :: Char

-- maps from a string to a string
-- 1 string as parameter, 1 string as result
-- a list of [Char] is a String!
-- removeNonUppercase :: [Char] -> [Char]
removeNonUppercase :: String -> String
-- list comprehension that takes a String and returns a String    
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]  

-- return type is last item
addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  

-- Int (max on 32bit is 2147483647). 
-- Integer.. not bounded.  Int is more efficient

-- Float - single precision
-- Double - double

-- 1. Type variables (not a capital case, so a can be anything).. like generics
-- functions that have type variables are called polymorphic functions
-- ghci> :t head  
-- head :: [a] -> a
-- becuase not a capital, a is a type variable.. a can be any type

-- fst has a type Tuple of 1 types a and b, and returns and element type a
-- ghci> :t fst  
-- fst :: (a, b) -> a 


-- 2. Type Classes (like interfaces)
-- eg Eq is a typeclass


-- :t (==)  
-- (==) :: (Eq a) => a -> a -> Bool 
-- Everthing before the => is a class construct
-- The equality function takes any two values that of the same type
-- and returns a Bool.  The type of the those two values must bve a memver
-- of the Eq class

-- "3"
c = show 3

-- 13
a = read "8" + 5


-- Type annotations
b = read "5" :: Int



-- Pattern Matching
-- when defining fuctions, you can define separate function bodies for different patterns
lucky :: (Integral a) => a -> String
-- as we're defining a pattern below eg 7, then we need an Eq to match, so typeclass (interface)  
-- lucky :: a -> String
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
-- pattern match in list comprehension.. but it will always pass a,b in this case
h = [a+b | (a,b) <- xs]

tell :: (Show a) => [a] -> String  
tell [] = "The list is empty"  
tell (x:[]) = "The list has one element: " ++ show x  
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y  
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

-- i = tell []
j = tell ["thing"] 
k = tell ["thing", "thing2"]


head' :: [a] -> a  
head' [] = error "Can't call head on an empty list, dummy!"
-- x:xs pattern.. only matches to lists of length 1 or more  
head' (x:_) = x

l = head' [4,5,6]
-- 4

m = head' "Hello"
-- 'H'

-- length' :: (Num b) => [a] -> b  
length' [] = 0  
length' (_:xs) = 1 + length' xs  

n = length' [1,2,3,4]
-- 4

-- sum' :: (Num a) => [a] -> a  
sum' [] = 0  
sum' (x:xs) = x + sum' xs  

o = sum' [1,2,3,4]

-- as pattern
-- capital :: String -> String  
capital "" = "Empty string, whoops!"  
--capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]  
capital (x:xs) = "The first letter of " ++ (x:xs) ++ " is " ++ [x]

p = capital "Dracula"

-- Guards
-- indicated by pipes
-- usually indented
-- basicallyl a bool expression.. if else tree :-) far better and more readable
bmiTell :: (RealFloat a) => a -> String  
bmiTell bmi  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  

q = bmiTell 24 
-- "You're supposedly normal. Pffft, I bet you're ugly!"  

-- guard and function
bmiTell' :: (RealFloat a) => a -> a -> String  
bmiTell' weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                 = "You're a whale, congratulations!" 

r = bmiTell' 85 1.90
-- "You're supposedly normal. Pffft, I bet you're ugly!"

max' :: (Ord a) => a -> a -> a  
max' a b   
    | a > b     = a  
    | otherwise = b 

s = max' 8 5
-- 8

-- where bindings

bmiTell'' :: (RealFloat a) => a -> a -> String  
bmiTell'' weight height  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2

t = bmiTell'' 85 1.90


-- let bindings

-- case expressions
