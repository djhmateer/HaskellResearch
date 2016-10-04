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
