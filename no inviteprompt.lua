while wait() do
for i,v in pairs(game.CoreGui:GetDescendants()) do
    if v:IsA("ScreenGui") then if  v.Name == "invitePrompt" then do
        v:destroy() end else end
    end
    end
    end