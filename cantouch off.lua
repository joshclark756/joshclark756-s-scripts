for _, v in next, game.Players.LocalPlayer.Character:GetDescendants() do
    if v:isA("Part") or v:isA("MeshPart") then v.CanTouch = false
    end
    end
