for i=1,_G.ammount do             
local block = Instance.new("Part")
local bp = Instance.new("BodyPosition")
block.CFrame = CFrame.new(9e9,9e9,9e9)
block.Anchored = true
local player = game.Players.LocalPlayer
local character = player.Character
local savepos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
for i,v in pairs(player.Backpack:GetChildren()) do
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = block.CFrame
 v.Parent = Character bp.Parent = v.Handle bp.Position = block.Position v.Handle.Velocity = Vector3.new(25.70,0,0) v.Handle.RotVelocity = Vector3.new(9e9,9e9,9e9)  v.Parent = game.Players.LocalPlayer.Backpack wait(1)   v.Parent = character task.wait(0)   v.Parent = workspace 
end
character:ClearAllChildren()
wait(7)
 for i,v in pairs(game.workspace:GetDescendants()) do 
        if v:IsA("Tool") then
            v.Handle.CanCollide = false
            bp:Destroy()
            v.Handle.RotVelocity = Vector3.new(0,0,0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savepos
            v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            block:Destroy()
        end
      
end
end
