
-- global variables
ms_game_speed = 1

-- crafting lab-burner instead of lab
script.on_event(defines.events.on_player_crafted_item, function(event)
  local unlocks = {
    ["lab-burner"] = 'sb-startup4',
  }

  if unlocks[event.item_stack.name] then
    game.players[event.player_index].force.technologies[unlocks[event.item_stack.name]].researched = true
  end
end)


script.on_init(function(event)
  -- get the game speed on startup
  ms_game_speed = settings.global["MS-game-speed"].value
  game.speed = ms_game_speed
end)


-- called when a mod setting changed
script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
  if event.setting_type == "runtime-global" and event.setting == "MS-game-speed" then

    if game.players[event.player_index].admin then
      ms_game_speed = settings.global[event.setting].value
      game.print(game.players[event.player_index].name .. " changed game speed from " .. game.speed .. " to " .. ms_game_speed)
      game.speed = ms_game_speed

    else
      settings.global[event.setting].value = ms_game_speed

      game.players[event.player_index].print("You do not have permission to change the game speed. Ask an admin instead.")
    end

  end

end)
