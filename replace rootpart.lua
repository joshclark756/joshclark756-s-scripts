local clone = game.Players.LocalPlayer.Character.HumanoidRootPart:Clone() 
for i,v in pairs(game:GetDescendants()) do
    if v.Name == "HumanoidRootPart" then v.Parent =  game.Players.LocalPlayer.Character.Health clone.Parent = game.Players.LocalPlayer.Character game.Players.LocalPlayer.Character.Health:Destroy()   end
    end
