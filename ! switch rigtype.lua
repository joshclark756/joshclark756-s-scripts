local avs = game:GetService("AvatarEditorService") 
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then avs:PromptSaveAvatar(game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription,Enum.HumanoidRigType.R15)
avs:PromptSaveAvatar(game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription,Enum.HumanoidRigType.R15)
end
if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15
then avs:PromptSaveAvatar(game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription,Enum.HumanoidRigType.R6)
end
