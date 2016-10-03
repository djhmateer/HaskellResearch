-- string1 = "hello"
-- string2 = "world"
-- greeting = string1 ++ string2

-- multiplies the largest of a b by x
multMax a b x = (max a b) * x

-- had to do posOrNeg (-3) for neg
posOrNeg x =
    if x >= 0
        then "Positive"
        else "Negative"
