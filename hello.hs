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

--4613732
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

-- Euler 3
-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ?

-- number is prime if only divisible by 1 and itself
-- only need check up to the sqrt of number to see if it can be divided with remainder of 0
isPrime num = [x | x <- [3..floor (sqrt (fromIntegral (num)))], num `mod` x == 0, odd x] == []

-- only need to check factors up to sqrt, as we know prime can't be bigger than this
facs q =  [x | x <- [3..floor (sqrt (fromIntegral (q)))], q `mod` x  == 0, isPrime x, odd x ]

q = facs 13195
-- 6857
r = facs 600851475143

-- Euler 4
--A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
--Find the largest palindrome made from the product of two 3-digit numbers.

t = maximum [x*y | x <- [100..999], y <- [100..999], isPalindrome (x*y)]
isPalindrome num = show num == reverse (show num) 

u = reverse [1,2,3,4]

-- int to string
v = show 345
-- string to int
w = read "345" :: Int

-- can reverse the string (as it is a list of chars really)
u' = reverse "1234"
z = reverse v

-- Euler 5
--2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
--What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

isDivisibleBy1To10 num = length [x | x <- [1..10], num `mod` x == 0] == 10
isDivisibleBy1To20 num = length [x | x <- [1..20], num `mod` x == 0] == 20
-- isDivisibleBy1To20 num = [x | x <- [1..20], num `mod` x /= 0] == []

aa = isDivisibleBy1To10 2520
ab = isDivisibleBy1To10 11
ac = isDivisibleBy1To10 12

-- works, returning a list of answers
ad = head [x | x <- [10,20..], isDivisibleBy1To10 x]
-- 353s result - 232792560
ae = head [x | x <- [20,40..], isDivisibleBy1To20 x]

-- 19s or so
-- :set +s - to get timings in repl
-- http://stackoverflow.com/questions/6968076/project-euler-a-much-better-way-to-solve-problem-5
-- I know it is divisible by 5,10,20 
pe5 = head [x|x<-[40,60..],x`mod`3==0,x`mod`4==0,x`mod`6==0,x`mod`7==0,x`mod`8==0,x`mod`9==0,x`mod`11==0,x`mod`12==0,x`mod`13==0,x`mod`14==0,x`mod`15==0,x`mod`16==0,x`mod`17==0,x`mod`18==0,x`mod`19==0] 

-- 30s
pe5' = head [x | x<-[40,60..], all (\y -> x`mod`y == 0) [2..20] ]
-- 20s
pe5'' = head [x | x<-[40,60..], all (\y -> x`mod`y == 0) [11..19] ]


-- least common multiple
-- 60
af = lcm 10 12

-- 0.02s
euler5 = foldl lcm 2 [3..20]

--Euler6
-- The sum of the squares of the first ten natural numbers is,
-- 1^2 + 2^2 + ... + 10^2 = 385
-- The square of the sum of the first ten natural numbers is,
-- (1 + 2 + ... + 10)^2 = 55^2 = 3025
-- Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
-- Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

-- 385
sumOfSquares = sum [x*x | x <- [1..100]]
-- 3025
squareOfSums = (sum [x | x <- [1..100]])^2
-- 2640
diff = squareOfSums - sumOfSquares

-- https://wiki.haskell.org/Euler_problems/1_to_10#Problem_6
-- 3025
ag = (sum [1..10])^2

-- Euler 7
-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
-- What is the 10 001st prime number?
-- isPrime' num = [x | x <- [3..floor (sqrt (fromIntegral (num)))], num `mod` x == 0, odd x] == []
-- isPrime' num = [x | x <- [2..num-1], num `mod` x == 0] == []
isPrime' num = [x | x <- [2..floor (sqrt (fromIntegral (num)))], num `mod` x == 0] == []

-- [2,3,5,7,11,13]
primeChecker = [x | x <- [2..15], isPrime' x]

-- 13
ai = [x | x <- [1,2..], isPrime' x]!!6
-- 104743
aj = [x | x <- [1,2..], isPrime' x]!!10001

-- Euler 8
--ak = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450
-- The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
al = [7,3,1,6,7,1,7,6,5,3,1,3,3,0,6,2,4,9,1,9,2,2,5,1,1,9,6,7,4,4,2,6,5,7,4,7,4,2,3,5,5,3,4,9,1,9,4,9,3,4,9,6,9,8,3,5,2,0,3,1,2,7,7,4,5,0,6,3,2,6,2,3,9,5,7,8,3,1,8,0,1,6,9,8,4,8,0,1,8,6,9,4,7,8,8,5,1,8,4,3,8,5,8,6,1,5,6,0,7,8,9,1,1,2,9,4,9,4,9,5,4,5,9,5,0,1,7,3,7,9,5,8,3,3,1,9,5,2,8,5,3,2,0,8,8,0,5,5,1,1,1,2,5,4,0,6,9,8,7,4,7,1,5,8,5,2,3,8,6,3,0,5,0,7,1,5,6,9,3,2,9,0,9,6,3,2,9,5,2,2,7,4,4,3,0,4,3,5,5,7,6,6,8,9,6,6,4,8,9,5,0,4,4,5,2,4,4,5,2,3,1,6,1,7,3,1,8,5,6,4,0,3,0,9,8,7,1,1,1,2,1,7,2,2,3,8,3,1,1,3,6,2,2,2,9,8,9,3,4,2,3,3,8,0,3,0,8,1,3,5,3,3,6,2,7,6,6,1,4,2,8,2,8,0,6,4,4,4,4,8,6,6,4,5,2,3,8,7,4,9,3,0,3,5,8,9,0,7,2,9,6,2,9,0,4,9,1,5,6,0,4,4,0,7,7,2,3,9,0,7,1,3,8,1,0,5,1,5,8,5,9,3,0,7,9,6,0,8,6,6,7,0,1,7,2,4,2,7,1,2,1,8,8,3,9,9,8,7,9,7,9,0,8,7,9,2,2,7,4,9,2,1,9,0,1,6,9,9,7,2,0,8,8,8,0,9,3,7,7,6,6,5,7,2,7,3,3,3,0,0,1,0,5,3,3,6,7,8,8,1,2,2,0,2,3,5,4,2,1,8,0,9,7,5,1,2,5,4,5,4,0,5,9,4,7,5,2,2,4,3,5,2,5,8,4,9,0,7,7,1,1,6,7,0,5,5,6,0,1,3,6,0,4,8,3,9,5,8,6,4,4,6,7,0,6,3,2,4,4,1,5,7,2,2,1,5,5,3,9,7,5,3,6,9,7,8,1,7,9,7,7,8,4,6,1,7,4,0,6,4,9,5,5,1,4,9,2,9,0,8,6,2,5,6,9,3,2,1,9,7,8,4,6,8,6,2,2,4,8,2,8,3,9,7,2,2,4,1,3,7,5,6,5,7,0,5,6,0,5,7,4,9,0,2,6,1,4,0,7,9,7,2,9,6,8,6,5,2,4,1,4,5,3,5,1,0,0,4,7,4,8,2,1,6,6,3,7,0,4,8,4,4,0,3,1,9,9,8,9,0,0,0,8,8,9,5,2,4,3,4,5,0,6,5,8,5,4,1,2,2,7,5,8,8,6,6,6,8,8,1,1,6,4,2,7,1,7,1,4,7,9,9,2,4,4,4,2,9,2,8,2,3,0,8,6,3,4,6,5,6,7,4,8,1,3,9,1,9,1,2,3,1,6,2,8,2,4,5,8,6,1,7,8,6,6,4,5,8,3,5,9,1,2,4,5,6,6,5,2,9,4,7,6,5,4,5,6,8,2,8,4,8,9,1,2,8,8,3,1,4,2,6,0,7,6,9,0,0,4,2,2,4,2,1,9,0,2,2,6,7,1,0,5,5,6,2,6,3,2,1,1,1,1,1,0,9,3,7,0,5,4,4,2,1,7,5,0,6,9,4,1,6,5,8,9,6,0,4,0,8,0,7,1,9,8,4,0,3,8,5,0,9,6,2,4,5,5,4,4,4,3,6,2,9,8,1,2,3,0,9,8,7,8,7,9,9,2,7,2,4,4,2,8,4,9,0,9,1,8,8,8,4,5,8,0,1,5,6,1,6,6,0,9,7,9,1,9,1,3,3,8,7,5,4,9,9,2,0,0,5,2,4,0,6,3,6,8,9,9,1,2,5,6,0,7,1,7,6,0,6,0,5,8,8,6,1,1,6,4,6,7,1,0,9,4,0,5,0,7,7,5,4,1,0,0,2,2,5,6,9,8,3,1,5,5,2,0,0,0,5,5,9,3,5,7,2,9,7,2,5,7,1,6,3,6,2,6,9,5,6,1,8,8,2,6,7,0,4,2,8,2,5,2,4,8,3,6,0,0,8,2,3,2,5,7,5,3,0,4,2,0,7,5,2,9,6,3,4,5,0]
am = [x+1 | x <- al]
-- gives first 4 elements of the list [7,3,1,6]
an = take 4 al
-- returns the product of a list ie 7*3*1*6
ao = product (take 4 al)

ap nums =
    if (length nums)==12
        -- base case of recursion
        then []
        --else (nums!!0*nums!!1*nums!!2*nums!!3) : (ap (tail nums))
        -- else (nums!!0*nums!!1*nums!!2*nums!!3*nums!!4*nums!!5*nums!!6*nums!!7*nums!!8*nums!!9*nums!!10*nums!!11*nums!!12) : (ap (tail nums))
        -- take first 13 numbers and multiply
        else (product(take 13 nums)) : (ap (tail nums))

-- 23514624000
aq = maximum (ap al)

-- Euler 9
-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
-- a^2 + b^2 = c^2
-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.

--t = maximum [x*y | x <- [100..999], y <- [100..999], isPalindrome (x*y)]
--find list of numbers where a + b + c = 100
-- zd = [a | a <- [1..998], b <- [1..998], c <- [1..998], (a + b + c = 1000), (a < b < c)]

--find list of numbers where a + b + c = 100
zd = [a | a <- [1..998], b <- [1..998], c <- [1..998], (a + b + c) == 1000, a < b, b < c]