local char = game.Players.localPlayer.Character
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")
local bp = Instance.new("BodyPosition")
local newhum = Instance.new("Humanoid")
local newhum2 = Instance.new("Humanoid")
local char = game.Players.LocalPlayer.Character
local hum = char.Humanoid
hum.Parent = char.Health
char.Health:Destroy()
newhum.Parent = char
char.HumanoidRootPart:Destroy()
char.Torso.Neck.Parent = newhum
newhum:Destroy()
for i,v in pairs(char:GetDescendants()) do if v and v:isA("Part") or v:isA("MeshPart") then v.CanCollide = true v.Massless = true 
end
end
wait(2)
char:BreakJoints()
