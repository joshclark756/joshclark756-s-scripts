while wait(5) do
for i,v in pairs(game:GetDescendants()) do
    if v:IsA("Part") and v.Anchored == false then do
        v.CanCollide = false
    end
    end
end
end