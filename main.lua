--[[
    Lua Guessing Game
    By: Chance Lively
    Date: 10/3/2026
]]

-- Player's attempts 
Attempts = 0

-- Range of numbers
--- Updates based on the player's guesses
High = 100
Low = 1

-- Replay variables
Replay = true
Won = false

-- Random number generator
math.randomseed(os.time())
RandomNumber = math.random(1, 100)

-- Replay loop 
--- Checks if the player wants to play again once the game is over
while Replay do
    -- Game loop 
    --- Checks if the player has run out of attempts or has won the game
    while Attempts  ~= 7 and Won == false do
        -- Repeating display of the range and attempts left
        print("\n:.:.: Number Guessing Game :.:.: " .. "(" .. Low .. "-" .. High .. ") (Attempt: " .. (Attempts + 1) .. ")")
        Guess = tonumber(io.read())

        -- Input validation check
        if Guess == nil then
            print("\n-> *Invalid Input* -Enter a valid number-")

        -- Checks if the guess is out of range
        elseif Guess < Low or Guess > High then
            print("\n-> *Out of Range* -Guess between the range-")

        -- If the guess is a valid number, adds to attempts
        else
            Attempts = Attempts + 1
            -- Once a attempt is made, checks if the guess is too high, too low, or correct (and isnt out of attempts)
            
            -- End the game if the player has run out of attempts and hasn't guessed the number
            if Attempts == 7 and Guess ~= RandomNumber then
                print("\n-> *No Attempts Left* -The number was " .. RandomNumber .. "-")
                break
            -- Checks if the guess is too low
            elseif Guess < RandomNumber then
                print("\n-> *Too Low* -Try Again!-")
                -- Updates the Low range if the guess is higher than the current Low
                    Low = Guess + 1

            -- Checks if the guess is too high
            elseif Guess > RandomNumber then
                print("\n-> *Too High* -Try Again!-")
                -- Updates the High range if the guess is lower than the current High
                    High = Guess - 1

            -- Checks if the guess is correct
            else
                print("\n-> *Correct!* -The number was " .. RandomNumber .. "-")
                Won = true
                break
            end
        end
    end
    -- Game loop ends

    -- Replay loop starts
    while Attempts == 7 or Won == true do
        print("\n-> -Play again?- (Y/N)")
        Answer = tostring(io.read())

        -- If the player wants to play again
        if Answer == "Y" or Answer == "y" then
            -- Resets variables
            Attempts = 0
            High = 100
            Low = 1
            Won = false
            RandomNumber = math.random(1, 100)
            break

        -- If the player doesn't want to play again
        elseif Answer == "N" or Answer == "n" then
            -- Ends game
            print("\n-> -Goodbye!-")
            Replay = false
            break

        -- Input validation check
        else
            print("\n-> *Invalid Input* -(Y or N)-\n")
        end
    end
end