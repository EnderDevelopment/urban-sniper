-- player.lua

-- Player script for the FPS game with wall-running and sniper mechanics

-- Player attributes
local player = {
    health = 100,
    armor = 50,
    ammo = {
        pistol = 100,
        rifle = 30,
        sniper = 10,
    },
    position = { x = 0, y = 0, z = 0 },
    velocity = { x = 0, y = 0, z = 0 },
    is_wall_running = false,
    wall_run_timer = 0,
}

-- Function to update player position and velocity
function update_player_position(dt)
    -- Update player position based on velocity
    player.position.x = player.position.x + player.velocity.x * dt
    player.position.y = player.position.y + player.velocity.y * dt
    player.position.z = player.position.z + player.velocity.z * dt

    -- Apply gravity
    player.velocity.y = player.velocity.y - game_settings.gravity * dt

    -- Handle wall running
    if player.is_wall_running then
        player.wall_run_timer = player.wall_run_timer - dt
        if player.wall_run_timer <= 0 then
            player.is_wall_running = false
        end
    end
end

-- Function to handle player input
function handle_player_input(dt)
    -- Handle movement input
    if love.keyboard.isDown("w") then
        player.velocity.z = player.velocity.z - player_speed * dt
    end
    if love.keyboard.isDown("s") then
        player.velocity.z = player.velocity.z + player_speed * dt
    end
    if love.keyboard.isDown("a") then
        player.velocity.x = player.velocity.x - player_speed * dt
    end
    if love.keyboard.isDown("d") then
        player.velocity.x = player.velocity.x + player_speed * dt
    end

    -- Handle jump input
    if love.keyboard.isDown("space") and not player.is_wall_running then
        player.velocity.y = player_jump_height
    end

    -- Handle wall run input
    if love.keyboard.isDown("shift") and not player.is_wall_running then
        player.is_wall_running = true
        player.wall_run_timer = wall_run_duration
        player.velocity.y = wall_run_speed
    end
end

-- Function to check for collisions
function check_collisions()
    -- Check for collisions with the game world
    -- Handle collisions accordingly
end

-- Function to update player state
function update_player(dt)
    update_player_position(dt)
    handle_player_input(dt)
    check_collisions()
end

-- Function to render the player
function render_player()
    -- Render the player model
    -- Render player UI
end

-- Return player module
return {
    player = player,
    update_player = update_player,
    render_player = render_player,
}