for i,v in pairs(game.Workspace:GetDescendants())
do 
    

game:service'ReplicatedStorage'.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v.Name, 'All')
wait(2)
end