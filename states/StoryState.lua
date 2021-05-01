StoryState = Class{__includes = BaseState}

function StoryState:init()
    self.story = [[
  !!  STOP   PRESS  !!
  

    British Museum today announced successful excavation of ancient Egyptian pyramid.


    Leade of team given extra man for next dig.
    ]]
   self.continueText = 'Press "C" or Fire Button to Continue'
end

function StoryState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('c') then
        gStateMachine:change('play')
    end
end

function StoryState:render()
    love.graphics.clear(getColour("Bright Yellow"))
    setColour("Black")
    love.graphics.rectangle("fill", 40, 60, 310, 150)
    -- drawItem(itemCoffin, 4, 4)
    setColour("Sky Blue")
    love.graphics.printf('OH MUMMY - SCENARIO', 90, 20, 310)
    setColour("Bright Yellow")
    love.graphics.printf(self.story, 50, 70, 310)
    setColour("Orange")
    love.graphics.printf(self.continueText, 50, 190, 310)
end

function StoryState:exit()
    love.keyboard.reset()
end