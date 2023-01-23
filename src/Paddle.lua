Paddle = Class{}

function Paddle:init()
    --placing x in the middle of the screen and y just above the bottom of the screen
    self.x = VIRTUAL_WIDTH / 2 - 32
    self.y = VIRTUAL_HEIGHT - 32

    --velocity which starts with value 0
    self.dx = 0

    self.height = 64
    self.width = 16

    self.skin = 1
    
    --size of the paddle 2 is the size of the starting paddle size
    self.size = 2 
end

function Paddle:update(dt)
    if love.keyboard.isDown('left') then
        self.dx = -PADDLE_SPEED
    elseif love.keyboard.isDown('right') then
        self.dx = PADDLE_SPEED
    else
        self.dx = 0
    end

    --to keep the paddle inside the screen
    if self.dx < 0 then
        self.x = math.max(0, self.x + self.dx * dt)
    else
        self.x = math.min(VIRTUAL_WIDTH - self.width - 47, self.x + self.dx * dt)
    end
end

function Paddle:render()
    love.graphics.draw(gTextures['main'], gFrames['paddles'][self.size + 4 * (self.skin -1)],
        self.x, self.y)
end