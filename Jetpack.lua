-- Init
local plr = game.Players.LocalPlayer
local jet = Instance.new("Model")
local val = Instance.new("StringValue",jet)

-- Script
jet.Name = "Jetpack"
val.Name = "RealValue"
val.Value = "Static Jetpack"
jet.Parent = plr.Character:WaitForChild("Util")
