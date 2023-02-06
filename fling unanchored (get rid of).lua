for i,v in pairs(game.workspace:GetDescendants()) do if v:isA("Part")  and v.Anchored == false then  v.Velocity = Vector3.new(9e9,9e9,9e9)
end
end