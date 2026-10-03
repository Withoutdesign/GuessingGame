--[[
    Lua Guessing Game
    By: Chance Lively
    Date: 10/3/2026
]]

--> Variables
-- Number of attempts the player has made (Max is 7)
Attempts = 0

-- Range of numbers that updates based on the player's guesses
High = 100
Low = 1

-- Random number generator
math.randomseed(os.time())
RandomNumber = math.random(1, 100)

--> Main Loop
-- Gives the player 7 attempts to guess the number
while Attempts  ~= 7 do
    -- Title with the range of numbers and the number of attempts left
    print("\n:.:.: Number Guessing Game :.:.: " .. "(" .. Low .. "-" .. High .. ") (Attempt: " .. (Attempts + 1) .. ")")
    Guess = tonumber(io.read())

    -- Input validation check
    if Guess == nil then
        print("\n-> *Invalid Input* -Enter a valid number-")

    -- Check if the guess is out of range
    elseif Guess < Low or Guess > High then
        print("\n-> *Out of Range* -Guess between the range-")
    -- If the guess is a valid number, and within the range, checks to see where the guess falls under
    else
        Attempts = Attempts + 1

        -- Checks if the player has run out of attempts
        if Attempts == 7 and Guess ~= RandomNumber then
            print("\n-> *No Attempts Left* -The number was " .. RandomNumber .. "-\n")
        -- Checks if the guess is too low
        elseif Guess < RandomNumber then
            print("\n-> *Too Low* -Try Again!-")

            -- Updates the Low range if the guess is higher than the current Low
            if Guess > Low then
                Low = Guess + 1
            end

        -- Checks if the guess is too high
        elseif Guess > RandomNumber then
            print("\n-> *Too High* -Try Again!-")

            -- Updates the High range if the guess is lower than the current High
            if Guess < High then
                High = Guess - 1
            end

        --Checks if the guess is correct
        else
            print("\n-> *Correct!* -The number was " .. RandomNumber .. "-\n")
            break
        end
    end
end