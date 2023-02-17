for _, v in next, game:GetDescendants() do
    if v:isA("Part") or v:isA("MeshPart") and v.Parent.ClassName `= "Tool" then v.CanTouch = false
    end
    end
