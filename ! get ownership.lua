for i,v in next, game:GetDescendants() do
    if v:isA("Part") and v.Anchored == false then do 
game.Players.LocalPlayer.Character.PrimaryPart.CFrame = v.CFrame
wait(0)
end
end
end
