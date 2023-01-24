PlayState = Class{__includes = BaseState()}

function PlayState:init()
    self.ball = Ball(1)
    self.paddle = Paddle()

    self.ball.dx = math.random(-200, 200)
    self.ball.dy = math.random(-50, -60)

    self.ball.x = VIRTUAL_WIDTH / 2 - 4
    self.ball.y = VIRTUAL_HEIGHT - 42
end

function PlayState:update(dt)
    if self.paused then
        if love.keyboard.wasPressed('space') then
            self.paused = false
            gSounds['pause']:play()
        else
            return
        end
    elseif love.keyboard.wasPressed('space') then
        self.paused = true
        gSounds['pause']:play()
        return
    end

    self.ball:update(dt)
    self.paddle:update(dt)

    if self.ball:collides(self.paddle) then
        self.ball.dy = -self.ball.dy
        gSounds['paddle-hit']:play()
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function PlayState:render()
    self.ball:render()
    self.paddle:render()

    if self.paused then
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf("PAUSED", 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')
    end
end