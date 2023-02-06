for _, v in next, game:GetDescendants() do
       if v and v:IsA"Tool" and v.Name == "Stroller" then
           v:destroy()
       end
       end