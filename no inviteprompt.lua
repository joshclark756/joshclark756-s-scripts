-- made for those games that annoy you with inivte prompt autoexec friendly
while wait() do
for i,v in pairs(game.CoreGui:GetDescendants()) do
    if v:IsA("ScreenGui") then if  v.Name == "invitePrompt" then do
        v:destroy() end else game:GetService("CoreGui").GameInvite:Destroy() end
    end
    end
    end
