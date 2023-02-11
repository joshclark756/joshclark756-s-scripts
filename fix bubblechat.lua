 if not game:IsLoaded() then game.Loaded:Wait() end
 local plr = game.Players.LocalPlayer
 if plr.PlayerGui:FindFirstChild("BubbleChat") then
        plr.PlayerGui.BubbleChat.DescendantAdded:connect(function(msg)
            if msg:IsA("TextLabel") and msg.Name == "BubbleText" then
                msg.TextSize = 21
            end
        end)
    end