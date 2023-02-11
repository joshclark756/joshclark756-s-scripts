local char = game.Players.localPlayer.Character
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")
local bp = Instance.new("BodyPosition")
local newhum = Instance.new("Humanoid")
local char = game.Players.LocalPlayer.Character
newhum.Parent = char
local hum = char.Humanoid
hum.Parent = char.Health
char.Health:Destroy()
local newhum2 = newhum:Clone()
newhum:Destroy()
newhum2.Parent = char
newhum2.HipHeight = 2
