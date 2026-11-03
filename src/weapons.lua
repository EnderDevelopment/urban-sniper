-- weapons.lua

-- Weapons script for the FPS game with wall-running and sniper mechanics

-- Weapons
local weapons = {
    {
        name = "Pistol",
        damage = 10,
        fire_rate = 5,
        range = 100,
        ammo_type = "pistol",
    },
    {
        name = "Rifle",
        damage = 20,
        fire_rate = 10,
        range = 200,
        ammo_type = "rifle",
    },
    {
        name = "Sniper",
        damage = 50,
        fire_rate = 2,
        range = 500,
        ammo_type = "sniper",
    },
}

-- Function to shoot a weapon
function shoot_weapon(weapon_index)
    local weapon = weapons[weapon_index]
    if weapon then
        -- Check if player has ammo
        if player.ammo[weapon.ammo_type] > 0 then
            -- Decrease ammo
            player.ammo[weapon.ammo_type] = player.ammo[weapon.ammo_type] - 1
            
            -- Create a bullet
            local bullet = {
                position = {
                    x = player.position.x,
                    y = player.position.y,
                    z = player.position.z,
                },
                velocity = {
                    x = 0,
                    y = 0,
                    z = weapon.range,
                },
                damage = weapon.damage,
            }
            
            -- Add bullet to the game world
            table.insert(game_world.bullets, bullet)
        end
    end
end

-- Function to reload a weapon
function reload_weapon(weapon_index)
    local weapon = weapons[weapon_index]
    if weapon then
        -- Reload ammo for the weapon
        player.ammo[weapon.ammo_type] = 100
    end
end

-- Return weapons module
return {
    weapons = weapons,
    shoot_weapon = shoot_weapon,
    reload_weapon = reload_weapon,
}