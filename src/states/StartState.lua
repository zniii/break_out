StartState = Class{__includes = BaseState}

local highlited = 1

function StartState:update(dt)
    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
        highlited = highlited == 1 and 2 or 1
        gSounds['paddle-hit']:play()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gSounds['confirm']:play()

        if highlited == 1 then
            gStateMachine:change('play')
        end
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function StartState:render()
    love.graphics.setFont(gFonts['large'])
    love.graphics.printf("BREAKOUT", 0, VIRTUAL_HEIGHT/3, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])

    if highlited == 1 then
        love.graphics.setColor(103/255,1,1,1)
    end

    love.graphics.printf("Start", 0, VIRTUAL_HEIGHT/2 + 70, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(1,1,1,1)

    if highlited == 2 then
        love.graphics.setColor(102/255,1,1,1)
    end

    love.graphics.printf("HIGH SCORE", 0, VIRTUAL_HEIGHT/ 2 + 90, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(1,1,1,1)
end