while wait(10) do
for i,v in pairs(game:GetDescendants()) do
    if v:IsA("Part") then if  v.Name == "Handle"  then do
        v.CanCollide = false
    end
    end
    end
end
end