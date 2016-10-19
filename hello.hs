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


-- 2
-- determine if list l is a palindrome
-- palindrome is the same forward as reversed

isPalindrome l = l == reverse l

w = isPalindrome "abba"
-- reverse


-- 3
{-
 - Duplicate the elements in list xs, for example "duplicate [1,2,3]" would give the list [1,1,2,2,3,3]
 - Hint: The "concat [l]" function flattens a list of lists into a single list. 
 - (You can see the function definition by typing ":t concat" into the interpreter. Perhaps try this with other variables and functions)
 -
 - For example: concat [[1,2,3],[3,4,5]] returns [1,2,3,3,4,5]
 -}
-- duplicate xs = undefined

--aa = sort (concat [[1,2,3],[1,2,3]])

--concat [[1,1],[2,2], [3,3]]

duplicate xs = concat [[x,x] | x <- xs]

duplicate' xs = xs >>= \x -> [x,x]

-- 4
{-
 - Imitate the functinality of zip
 - The function "min x y" returns the lower of values x and y
 - For example "ziplike [1,2,3] ['a', 'b', 'c', 'd']" returns [(1,'a'), (2, 'b'), (3, 'c')]
 -}
-- ziplike xs ys = undefined

-- use min to get the number of elements
--ab = min ((length [1,2,3]) length(['a', 'b', 'c', 'd']))

ziplike xs ys = [(xs!!i,ys!!i) | i <- [0..(min (length xs) (length ys)-1)]]