game:GetService('RunService').Heartbeat:connect(function()
   for i, v in pairs(workspace:GetDescendants()) do
           if v:IsA("Part") or   v:IsA("BasePart") then
               sethiddenproperty(v, "NetworkIsSleeping", true)
        end
   end
end)