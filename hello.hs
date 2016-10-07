-- string1 = "hello"
-- string2 = "world"
-- greeting = string1 ++ string2

doubleMe x = x + x

-- multiplies the largest of a b by x
multMax a b x = (max a b) * x

-- had to do posOrNeg (-3) for neg
posOrNeg x =
    if x >= 0
        then "Positive"
        else "Negative"

-- pow2 n = 2 to the power n
-- eg pow2 4 = 2*2*2*2
pow2 n =
    if n == 0
        -- base case of the recursion
        then 1 
        else 2 * (pow2 (n-1))

-- c# imperative version
-- public int pow2(int n) {
--     int x = 1;
--     for(int i =0; i < n; i++) {
--         x = x * 2;
--     }
--     return x;
-- }

-- 2 parameters
repeatString str n =
    if n == 0
        then ""
        else str ++ (repeatString str (n-1))

-- c# 
-- public string RepeatString(String str, int n) {
--     var result = "";
--     for(int i = 0; i < n' i++) {
--         result += str;
--     }
--     return result;
-- }

x = [1,2,3,4,5]
-- get 4 element from list
x' = x !! 3 

empty = []

-- cons operator.  Makes a new list with the 0 prepended to original list
y = 0 : x -- [0,1,2,3]

-- ++ concat

-- 1
a = head [1,2,3]

-- 2,3
b = tail [1,2,3]

-- 2
c = head (tail [1,2,3])

-- true
d = null []

-- false
e = null [1,2]


double nums =
    if null nums
        -- base case of recursion
        then []
        -- take first element, double it, then add to front of new list
        else (2 * (head nums)) : (double (tail nums))

-- ahh, this can be written in 1 line
removeOdd nums =
    if null nums
        then []
        else
            if (mod (head nums) 2) == 0 -- even
                then (head nums) : (removeOdd (tail nums))
                else removeOdd (tail nums)

f = take 100 [2,4..]

-- list comprehension
-- output fn is before the pipe
-- x is the list of ints
g = [x*2 | x <- [1..10]]

-- condition (predicate)
-- only want elements which when doubled are >= 12
h = [x*2 | x <- [1..10], x*2 >= 12]

-- filtering (weeding out lists by predicates)

-- tuple
i = (8,9,10)

-- list comprehension.. just a list of ints
j = [x | x <- [1..10]]

-- list comprehension with a condition (predicate)
k = [x | x <- [1..10], x > 3]

-- list comprehension with a condition (predicate), and output fn
l = [x*2 | x <- [1..10], x > 3]

-- drawing from several lists
-- makes a list of 10 1's, 10 2's etc..
m = [x | x <- [1..10], y <- [1..10]]

 -- makes a list of tuples of all combinations of a,b,c
triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]

 -- makes a list of tuples of all combinations of a,b,c
rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10], a^2 + b^2 == c^2]

-- perim 24
rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10],
    a^2 + b^2 == c^2, a+b+c == 24]

-- Euler2
-- Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
-- 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
-- By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

--first10FibNumbers

-- Euler2 recursion
-- want to count up until base case (max value) is reached
fib a b =
    if a > 89
        -- base case of the recursion.. stop at max (eg 89)..return empty list
        then [] 
        -- cons operator add a to start of list
        else a : fib b (a+b) 

fib' a b =
    if a > 4000000
        -- base case of the recursion.. stop at max (eg 89)..return empty list
        then [] 
        -- cons operator add a to start of list
        else a : fib' b (a+b) 

fib'' a b =
    --4m
    if a > 4000000
        -- base case of the recursion.. stop at max (eg 89)..return empty list
        then [] 
        -- cons operator add a to start of list
        else a : fib'' b (a+b) 

--4613732
-- n = sum[x | x <- fib' 1 2, x `mod` 2 == 0]
n' = sum[x | x <- fib' 1 2, even x]

-- Euler2 shifting a list left by one an adding to itself
-- http://stackoverflow.com/questions/26497410/project-euler-2-solution-from-the-haskell-wiki
-- https://wiki.haskell.org/Euler_problems/1_to_10#Problem_2
-- o :: Integer
-- fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

--4613732
o = sum [ x | x <- takeWhile (< 4000000) fibs, even x]

p = [ x | x <- takeWhile (< 4000000) fibs]
