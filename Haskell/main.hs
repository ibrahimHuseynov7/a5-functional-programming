-- our first rule, remove numbers in even positions, keep the ones in odd positions
-- we look at the numbers two at a time, the first one stays, the second one is skipped (_) as we have same in python
keep_Odd :: [Int] -> [Int]
keep_Odd (first:_:others) = first : keep_Odd others
-- if only one number is left, it is in an odd position, so we keep it
keep_Odd [lastOne] = [lastOne]
-- if list is empty, there is nothing to keep
keep_Odd [] = []

-- our second rule, remove numbers in odd positions, keep the ones in even positions
-- again two at a time, the first one is skipped (_), the second one stays
keep_Even :: [Int] -> [Int]
keep_Even (_:second:others) = second : keep_Even others
-- zero or one number left means there is no even position, so nothing stays
keep_Even _ = []

-- our third rule: remove numbers in positions that are multiples of 3, keep the rest
-- we look at three numbers at a time, the first two stay, the third one is skipped (_)
drop_Third :: [Int] -> [Int]
drop_Third (first:second:_:others) = first : second : drop_Third others
-- fewer than three numbers left means none of them is in a third position, so all stay
drop_Third numbers = numbers

-- this function plays the game until one number is left
-- ruleNumber tells us which rule we are on, 0= even positions, 1= odd positions, 2= every third
-- I refer to this links for syntax wise : https://www.haskell.org/onlinereport/haskell2010/haskellch3.html (Chapter 3.17 - Pattern matching)
solve :: Int -> [Int] -> Int
solve ruleNumber numbers
  -- we count how many numbers are left, and if only one remains, that is our answer
  -- (counting the whole list every round is what makes this version slower on big inputs)
  | length numbers == 1 = head numbers
  -- otherwise we apply the current rule and move to the next one
  -- after rule 2 we go back to rule 0, since we have 3 rules
  | ruleNumber == 0 = solve 1 (keep_Odd numbers)
  | ruleNumber == 1 = solve 2 (keep_Even numbers)
  | otherwise = solve 0 (drop_Third numbers)

main :: IO ()
main = do
  -- it is my input, read as a line of text
  inputLine <- getLine
  -- we use read to turn the text into an Int, since getLine returns a string, think same as n = int(input()) in python
  let n = read inputLine :: Int
  -- start the game with the numbers from 1 to n and rule 0, then print the last remaining number
  print (solve 0 [1 .. n])