for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
    if v:isA("Tool") then v.Server:Destroy()
    end
    end