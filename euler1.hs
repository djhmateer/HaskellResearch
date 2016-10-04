--If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. 
--The sum of these multiples is 23.

--Find the sum of all the multiples of 3 or 5 below 1000.

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

-- Try with filtering
-- filtering (weeding out lists by predicates)
h = sum [x | x <- [1..999], x `mod` 3 == 0 || x `mod` 5 == 0]



