

-- remove loop in tech tree
MoreScience.lib.technology.removePrerequisite("slag-processing-1", "basic-science-research-1")
MoreScience.lib.technology.addPrerequisite("basic-science-research-1", "chemical-plant")

-- basic automation unlocks automation
MoreScience.lib.technology.removePrerequisite("basic-automation", "slag-processing-1")
MoreScience.lib.technology.addPrerequisite("basic-automation", "sb-startup4")

MoreScience.lib.technology.removeRecipeUnlock("sb-startup2", "inserter")
MoreScience.lib.technology.addRecipeUnlock("basic-automation", "inserter")
if data.raw["recipe"]['basic-transport-belt'] then
  MoreScience.lib.technology.removeRecipeUnlock("sb-startup2", "basic-transport-belt")
  MoreScience.lib.technology.addRecipeUnlock("basic-automation", "basic-transport-belt")
else
  MoreScience.lib.technology.removeRecipeUnlock("sb-startup2", "transport-belt")
  MoreScience.lib.technology.addRecipeUnlock("basic-automation", "transport-belt")
end

if data.raw["technology"]["sb-startup4"] and (not data.raw["technology"]["sb-startup4"].enabled) then
  data.raw["technology"]["sb-startup4"].enabled = true
  MoreScience.lib.technology.addPrerequisite("steel-processing", "sb-startup4")
  MoreScience.lib.technology.addPrerequisite("military", "sb-startup4")
  MoreScience.lib.technology.addPrerequisite("optics", "sb-startup4")
  MoreScience.lib.technology.addPrerequisite("angels-metallurgy-1", "sb-startup4")
  MoreScience.lib.technology.addPrerequisite("basic-chemistry", "sb-startup4")
  MoreScience.lib.technology.addPrerequisite("bio-wood-processing-2", "sb-startup4")
  MoreScience.lib.technology.addPrerequisite("ore-crushing", "sb-startup4")
end

-- move underground pipes back to fluid handing
--MoreScience.lib.technology.removeRecipeUnlock("sb-startup2", "pipe-to-ground")
--MoreScience.lib.technology.addRecipeUnlock("fluid-handling", "pipe-to-ground")
--MoreScience.lib.technology.removeRecipeUnlock("sb-startup2", "copper-pipe-to-ground")
--MoreScience.lib.technology.addRecipeUnlock("fluid-handling", "copper-pipe-to-ground")

-- startup requiring lab-burner instead of lab
MoreScience.lib.technology.removeRecipeUnlock("bio-wood-processing", "lab")
MoreScience.lib.technology.addRecipeUnlock("sct-lab-t1", "lab")
MoreScience.lib.technology.removeRecipeUnlock("bio-wood-processing", "sct-lab1-construction")
MoreScience.lib.technology.addRecipeUnlock("sct-lab-t1", "sct-lab1-construction")
MoreScience.lib.technology.removeRecipeUnlock("bio-wood-processing", "sct-lab1-mechanization")
MoreScience.lib.technology.addRecipeUnlock("sct-lab-t1", "sct-lab1-mechanization")
MoreScience.lib.technology.addRecipeUnlock("bio-wood-processing", "lab-burner")
MoreScience.lib.recipe.disable("lab-burner")
MoreScience.lib.technology.removeRecipeUnlock("sb-startup4", "boiler")
MoreScience.lib.technology.addRecipeUnlock("bio-wood-processing", "boiler")

MoreScience.lib.recipe.disable("science-pack-1")
MoreScience.lib.technology.addRecipeUnlock("sb-startup4", "sct-t1-ironcore")
MoreScience.lib.recipe.disable("sct-t1-ironcore")
MoreScience.lib.technology.addRecipeUnlock("sb-startup4", "sct-t1-magnet-coils")
MoreScience.lib.recipe.disable("sct-t1-magnet-coils")

MoreScience.lib.technology.removeRecipeUnlock("advanced-research-3", "lab-2")






-- technology tree cleanup
local containsExtension = false
for _,extension in pairs({
  --empty
}) do
  if mods["MoreScience-" .. extension] then
    containsExtension = true
    break
  end
end
if not containsExtension then
  log("cleaning up the tech tree")
  MoreScience.lib.technology.removeAllRedundantPrerequisites()
end
