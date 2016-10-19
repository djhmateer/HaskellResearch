string1 = "hello"
string2 = "world"
greeting = string1 ++ string2

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

-- a list
-- i = [[1,2],[8,11,5],[4,5]]
-- -- get first element [1,2] from list
-- j = head i

-- a tuple
-- k = (1,2)
-- -- a list of tuples
-- l = [(1,2),(8,11,5),(4,5)]

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


isMultipleOf3Or5 num =
    if (mod (num) 3) == 0
        then True
        else if (mod (num) 5) == 0
            then True
            else False

getListOfNumbersDivisibleBy3Or5 nums =
    if null nums
        then []
        else
            if (isMultipleOf3Or5 (head(nums)))
                then (head nums) : (getListOfNumbersDivisibleBy3Or5 (tail nums))
                else getListOfNumbersDivisibleBy3Or5 (tail nums)

-- [1,2,3,4,5,6,7,8,9]
--numsToTest = [1..9]
numsToTest = [1..999]

-- [3,5,6,9]
result = getListOfNumbersDivisibleBy3Or5 numsToTest

-- sum takes a list of numbers and returns their sum
resultSummed = sum result

-- Try with ranges
multOf3 = [3,6..30]
multOf5 = [5,10..30]

-- how to do a union (but what about 15..double?)
-- then just do a sum


-- implementing own version of length (of a list)
-- _ means we don't care what we draw from the list.
-- replace every element of a list with 1, then sum
length' xs = sum [1 | _ <- xs] 

-- 4
o = length' [1,2,3,4]

-- 8
p = fst (8,11) 
-- "Wow"
q = fst ("Wow", False)

-- Which right triangle that has integers for all sides and all sides equal to or 
-- smaller than 10 has a perimeter of 24?
-- a^2 + b^2 = c^2
-- eg 3,4,5 triangle.. perimeter = 12
-- 9 + 16 = 25

-- generate numbers for all sides outputting a Tuple
r = [(a,b,c) | a <- [1..10], b <- [1..10], c <- [1..10], a^2 + b^2 == c^2, a+b+c==24]

-- 10/3 gives 1 as a remainder
s = mod 10 3
-- backtick infix style gives 1 as a remainder
t = 10 `mod` 3

-- [3,5,7,11]
favNums = 3:5:7:11:[]

-- [7,9,11,13,15]
sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]


-- Find the element at index k in list l
-- For example: "findK 2 [0,0,1,0,0,0]" returns 1
findK k l = undefined

u = [0,0,1,0,0,0]!!2

findK' l nums = nums!!l
v = findK' 2 [0,0,1,0,0,0]


-- Question 1
-- last element in a list
-- 4
ad = last [1,2,3,4]
-- returns everything except the last element
-- [1,2,3]
ae = init [1,2,3,4]

-- Find the penultimate element in list l
penultimate l = last (init l)


-- Question 2
-- determine if list l is a palindrome
-- palindrome is the same forward as reversed

-- l is a list of characters (a string)
isPalindrome l = l == reverse l
-- True
w = isPalindrome "abba"


-- Question 3
--  Duplicate the elements in list xs, for example "duplicate [1,2,3]" would give the list [1,1,2,2,3,3]
--  Hint: The "concat [l]" function flattens a list of lists into a single list. 
--  (You can see the function definition by typing ":t concat" into the interpreter. Perhaps try this with other variables and functions)
--  For example: concat [[1,2,3],[3,4,5]] returns [1,2,3,3,4,5]

-- concat the list of lists into a single list
-- [1,1,2,2,3,3]
ag = concat [[1,1],[2,2],[3,3]]

-- returns a list of lists
-- [[1,1],[2,2],[3,3]]
ai = [[x,x] | x <- [1..3]]

duplicate xs = concat [[x,x] | x <- xs]

--[1,1,2,2,3,3]
ah = duplicate [1,2,3]


-- Question 4
-- Imitate the functionality of zip
-- The function "min x y" returns the lower of values x and y
-- For example "ziplike [1,2,3] ['a', 'b', 'c', 'd']" returns [(1,'a'), (2, 'b'), (3, 'c')]
-- ziplike xs ys = undefined

-- use min to get the number of elements
--ab = min ((length [1,2,3]) length(['a', 'b', 'c', 'd']))

-- returns a list of Tuples with the last 'd' missed off as nothing to match
-- [(1,'a'),(2,'b'),(3,'c')]
aj = zip [1,2,3] ['a', 'b', 'c', 'd']

-- find min length of both lists
xs = [1,2,3]
ys = ['a', 'b', 'c', 'd']
-- 2 (3-1)
ak = min (length xs) (length ys)-1

-- x's at element i, y's at element i, such that i is drawn from 0 to the min length of both lists 
ziplike xs ys = [(xs!!i, ys!!i) | i <- [0..(min (length xs) (length ys)-1)]]

-- DG 1 - Factorials
-- the product of an integer and all the integers below it; e.g. factorial four ( 4! ) is equal to 24.

-- 4*3*2*1 = 24

-- recursion
fac n =
    if n < 2
        -- base case of the recursion.. stop at 1
        then 1
        else n * fac (n-1) 
an = fac 4

-- simplicity
fac' n = product [1..n]

ao = fac' 4

-- works
ap = product [1..4]
aq = product [4,3..1]

-- pattern match?
-- same logic as recursion
fact 1 = 1
fact n = n * fact (n-1)
ar = fact 4

-- fold right (higher order fn.. coming to that in the book, so leave for now)
fact2 n = foldr (*) 1 [1..n]
as = fact2 4


-- DG 2 - Fibonacci
-- Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
-- 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

-- write a function to get first 10 fibs

--[1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
--at = fibs 10

-- keep generating fibs.  No base case for recursion
fibs a b =
    --if a > 89
        -- base case of the recursion.. stop at max (eg 89)..return empty list
      --  then [] 
        -- cons operator add a to start of list
        --else a : fibs b (a+b) 
        a : fibs b (a+b)

-- finding the 10,000th fib
at = last (take 10000 (fibs 1 2))
au = (fibs 1 2)!!10000
fibs' n = (fibs 1 2)!!n

-- nice way to test fibs', by throwing a range at it
av = [fibs' x | x <- [1..30]]

-- lazy
fibs'' = 1 : 1 : [x + y | (x,y) <- zip fibs'' (tail fibs'')]

-- zipWith adds 2 lists together
fibs3 = 1 : 1 : zipWith (+) fibs3 (tail fibs3)
