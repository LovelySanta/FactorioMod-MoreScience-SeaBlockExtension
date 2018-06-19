

-- crafting lab-burner instead of lab
script.on_event(defines.events.on_player_crafted_item, function(event)
  local unlocks = {
    ["lab-burner"] = 'sb-startup4',
  }

  if unlocks[event.item_stack.name] then
    game.players[event.player_index].force.technologies[unlocks[event.item_stack.name]].researched = true
  end
end)
