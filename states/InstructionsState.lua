InstructionsState = Class{__includes = BaseState}

function InstructionsState:init()
   self.instructions1 = "  You have been appointed head of an archeological expedition,  sponsored by the British Museum, and have been sent to Egypt to explore newly found pyramids. \n \n \n"
   self.instructions1 = self.instructions1 .. "  Your party, initially, consists of five members.  Your task is to enter the five levels of each pyramid, and recover from them five Royal Mummies and as much treasure as you can."
   self.continueText = 'Press "C" or Fire Button to Continue'
end

function InstructionsState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('c') then
        gStateMachine:change('pre')
    end
end

function InstructionsState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.rectangle("fill", 40, 60, 310, 150)
    -- drawItem(itemCoffin, 4, 4)
    setColour("Sky Blue")
    love.graphics.printf('OH MUMMY - SCENARIO', 90, 20, 310)
    setColour("Bright Yellow")
    love.graphics.printf(self.instructions1, 50, 70, 310)
    setColour("Orange")
    love.graphics.printf(self.continueText, 50, 190, 310)
end

function InstructionsState:exit()
    love.keyboard.reset()
end