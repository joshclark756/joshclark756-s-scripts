local RunService, FindFirstChildOfClass = game.GetService(game, "RunService"), game.FindFirstChildOfClass;
local Client = game.GetService(game, "Players").LocalPlayer
   for _, v in pairs(game.workspace:GetDescendants()) do
       if  v:IsA"Part"  and v.Parent ~= Client.Character and v.Anchored == false then 
           local glow = Instance.new("Highlight")
           HeartbeatLoop = RunService.Heartbeat:Connect(function()
          glow.Parent = v
               if v.ReceiveAge ~= 0 then glow.Enabled = false
                   elseif
                    v.ReceiveAge == 0 then glow.Enabled = true
               
           end
       end)
   end
       end
