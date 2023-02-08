loadstring(game:HttpGet("https://pastebin.com/raw/tUUGAeaH", true))()

spoof(game.Players.LocalPlayer, "MaximumSimulationRadius", 1000)
spoof(game.Players.LocalPlayer, "SimulationRadius", 1000)
sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)

game:GetService("RunService").Stepped:Connect(function()
 settings().Physics.AllowSleep = false
 setsimulationradius(math.huge*math.huge*math.huge)
end)

local screen = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local topbar = Instance.new("Frame")
local separator = Instance.new("Frame")
local title = Instance.new("TextLabel")
local hide = Instance.new("TextButton")
local baccground = Instance.new("ImageLabel")
local scripts = Instance.new("Frame")
local r6 = Instance.new("TextButton")
local r6icon = Instance.new("ImageLabel")
local r15 = Instance.new("TextButton")
local r15icon = Instance.new("ImageLabel")
local credits = Instance.new("Frame")
local credit1 = Instance.new("TextLabel")
local title2 = Instance.new("TextLabel")
local credit2 = Instance.new("TextLabel")
local credit3 = Instance.new("TextLabel")
local message = Instance.new("TextLabel")
local separator_2 = Instance.new("Frame")
local message2 = Instance.new("TextLabel")
local label = Instance.new("TextLabel")
local ticc = Instance.new("Sound")
screen.Name = "screen"
screen.Parent = game.Players.LocalPlayer.PlayerGui
screen.ResetOnSpawn = false
screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.Name = "main"
main.Parent = screen
main.Active = true
main.BackgroundColor3 = Color3.new(1, 1, 1)
main.BorderColor3 = Color3.new(0.117647, 0.117647, 0.117647)
main.ClipsDescendants = true
main.Position = UDim2.new(0.322828591, 0, 0.263406932, 0)
main.Size = UDim2.new(0, 460, 0, 300)
topbar.Name = "topbar"
topbar.Parent = main
topbar.Active = true
topbar.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
topbar.BorderSizePixel = 0
topbar.Selectable = true
topbar.Size = UDim2.new(0, 460, 0, 25)
topbar.ZIndex = 2
separator.Name = "separator"
separator.Parent = topbar
separator.BackgroundColor3 = Color3.new(1, 0.439216, 0.0666667)
separator.BorderSizePixel = 0
separator.Position = UDim2.new(0, 0, 0, 25)
separator.Size = UDim2.new(0, 460, 0, 1)
title.Name = "title"
title.Parent = topbar
title.BackgroundColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.BorderSizePixel = 0
title.Size = UDim2.new(0, 460, 0, 25)
title.Font = Enum.Font.SourceSansItalic
title.Text = "Head control gui"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 18
hide.Name = "hide"
hide.Parent = topbar
hide.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
hide.BorderSizePixel = 0
hide.Position = UDim2.new(0.945652187, 0, 0, 0)
hide.Size = UDim2.new(0, 25, 0, 25)
hide.Font = Enum.Font.Code
hide.Text = "-"
hide.TextColor3 = Color3.new(1, 1, 1)
hide.TextSize = 20
hide.TextWrapped = true
baccground.Name = "baccground"
baccground.Parent = main
baccground.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
baccground.Size = UDim2.new(0, 460, 0, 300)
baccground.Image = "rbxassetid://3621719851"
scripts.Name = "scripts"
scripts.Parent = baccground
scripts.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
scripts.BackgroundTransparency = 0.20000000298023
scripts.BorderColor3 = Color3.new(1, 0.439216, 0.0666667)
scripts.ClipsDescendants = true
scripts.Position = UDim2.new(0.0173913036, 0, 0.206666663, 0)
scripts.Size = UDim2.new(0, 150, 0, 230)
r6.Name = "r6"
r6.Parent = scripts
r6.BackgroundColor3 = Color3.new(1, 0.439216, 0.0666667)
r6.BorderSizePixel = 0
r6.Size = UDim2.new(0, 150, 0, 30)
r6.Font = Enum.Font.SourceSans
r6.Text = "       Head control(R6)"
r6.TextColor3 = Color3.new(1, 1, 1)
r6.TextSize = 18
r6icon.Name = "r6icon"
r6icon.Parent = r6
r6icon.BackgroundColor3 = Color3.new(1, 1, 1)
r6icon.BackgroundTransparency = 1
r6icon.Size = UDim2.new(0, 31, 0, 30)
r6icon.Image = "rbxassetid://3621754608"
r15.Name = "r15"
r15.Parent = scripts
r15.BackgroundColor3 = Color3.new(1, 0.439216, 0.0666667)
r15.BorderSizePixel = 0
r15.Position = UDim2.new(0, 0, 0.173913047, 0)
r15.Size = UDim2.new(0, 150, 0, 30)
r15.Font = Enum.Font.SourceSans
r15.Text = "       Head cotrol (R15)"
r15.TextColor3 = Color3.new(1, 1, 1)
r15.TextSize = 18
r15icon.Name = "r15icon"
r15icon.Parent = r15
r15icon.BackgroundColor3 = Color3.new(1, 1, 1)
r15icon.BackgroundTransparency = 1
r15icon.Position = UDim2.new(0, 0, -0.0304347873, 0)
r15icon.Size = UDim2.new(0, 31, 0, 30)
r15icon.Image = "rbxassetid://3621754608"
credits.Name = "credits"
credits.Parent = baccground
credits.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
credits.BackgroundTransparency = 0.20000000298023
credits.BorderColor3 = Color3.new(1, 0.439216, 0.0666667)
credits.ClipsDescendants = true
credits.Position = UDim2.new(0.365217388, 0, 0.113333337, 0)
credits.Size = UDim2.new(0, 284, 0, 258)
credit1.Name = "credit1"
credit1.Parent = credits
credit1.BackgroundColor3 = Color3.new(1, 1, 1)
credit1.BackgroundTransparency = 1
credit1.BorderSizePixel = 0
credit1.Position = UDim2.new(0.233772218, 0, 0.136899233, 0)
credit1.Size = UDim2.new(0, 150, 0, 22)
credit1.Font = Enum.Font.SourceSansLight
credit1.Text = "fling removed by joshclark756#7155"
credit1.TextColor3 = Color3.new(1, 0.439216, 0.0666667)
credit1.TextSize = 20
credit1.TextStrokeColor3 = Color3.new(1, 1, 1)
credit1.TextStrokeTransparency = 0.94999998807907
title2.Name = "title2"
title2.Parent = credits
title2.BackgroundColor3 = Color3.new(1, 1, 1)
title2.BackgroundTransparency = 1
title2.BorderSizePixel = 0
title2.Position = UDim2.new(0.234047771, 0, 0.0209302381, 0)
title2.Size = UDim2.new(0, 150, 0, 22)
title2.Font = Enum.Font.SourceSansItalic
title2.Text = "Credits: I dont remember"
title2.TextColor3 = Color3.new(1, 1, 1)
title2.TextSize = 22
credit2.Name = "credit2"
credit2.Parent = credits
credit2.BackgroundColor3 = Color3.new(1, 1, 1)
credit2.BackgroundTransparency = 1
credit2.BorderSizePixel = 0
credit2.Position = UDim2.new(0.233772218, 0, 0.26093024, 0)
credit2.Size = UDim2.new(0, 150, 0, 22)
credit2.Font = Enum.Font.SourceSansLight
credit2.Text = "UI : Mellohic#3546"
credit2.TextColor3 = Color3.new(0.054902, 0.458824, 0.72549)
credit2.TextSize = 20
credit2.TextStrokeColor3 = Color3.new(1, 1, 1)
credit2.TextStrokeTransparency = 0.94999998807907
credit3.Name = "credit3"
credit3.Parent = credits
credit3.BackgroundColor3 = Color3.new(1, 1, 1)
credit3.BackgroundTransparency = 1
credit3.BorderSizePixel = 0
credit3.Position = UDim2.new(0.233772218, 0, 0.377209306, 0)
credit3.Size = UDim2.new(0, 150, 0, 22)
credit3.Font = Enum.Font.SourceSansLight
credit3.Text = "Scripts: I dont know"
credit3.TextColor3 = Color3.new(0.168627, 1, 0.47451)
credit3.TextSize = 20
credit3.TextStrokeColor3 = Color3.new(1, 1, 1)
credit3.TextStrokeTransparency = 0.94999998807907
message.Name = "message"
message.Parent = credits
message.BackgroundColor3 = Color3.new(1, 1, 1)
message.BackgroundTransparency = 1
message.BorderSizePixel = 0
message.Position = UDim2.new(0.233772218, 0, 0.574883699, 0)
message.Size = UDim2.new(0, 150, 0, 22)
message.Font = Enum.Font.SourceSansLight
message.Text = "Thanks for using head control gui "
message.TextColor3 = Color3.new(1, 1, 1)
message.TextSize = 20
message.TextStrokeColor3 = Color3.new(1, 1, 1)
message.TextStrokeTransparency = 0.94999998807907
separator_2.Name = "separator"
separator_2.Parent = credits
separator_2.BackgroundColor3 = Color3.new(1, 0.439216, 0.0666667)
separator_2.BorderSizePixel = 0
separator_2.Position = UDim2.new(0, 7, 0, 132)
separator_2.Size = UDim2.new(0, 270, 0, 1)
message2.Name = "message2"
message2.Parent = credits
message2.BackgroundColor3 = Color3.new(1, 1, 1)
message2.BackgroundTransparency = 1
message2.BorderSizePixel = 0
message2.Position = UDim2.new(0.233772218, 0, 0.691162765, 0)
message2.Size = UDim2.new(0, 150, 0, 22)
message2.Font = Enum.Font.SourceSansLight
message2.Text = "Press ; to hide or show!"
message2.TextColor3 = Color3.new(1, 1, 1)
message2.TextSize = 20
message2.TextStrokeColor3 = Color3.new(1, 1, 1)
message2.TextStrokeTransparency = 0.94999998807907
label.Name = "label"
label.Parent = baccground
label.BackgroundColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.BorderSizePixel = 0
label.Position = UDim2.new(0.0173913036, 0, 0.113333337, 0)
label.Size = UDim2.new(0, 150, 0, 22)
label.Font = Enum.Font.SourceSansItalic
label.Text = "[Scripts]"
label.TextColor3 = Color3.new(1, 1, 1)
label.TextSize = 22
ticc.SoundId = "rbxassetid://558993260"
ticc.Volume = 5
ticc.Parent = game.Players.LocalPlayer.PlayerGui
--Scripts:
local isHidden = false
local mause = game.Players.LocalPlayer:GetMouse()
local isOpen = true

local function ticcsound()
ticc:Play()
end
do
local mouse = game:GetService("Players").LocalPlayer:GetMouse();
local inputService = game:GetService('UserInputService');
local heartbeat = game:GetService("RunService").Heartbeat;
function drag(frame)
local s, event = pcall(function()
return frame.MouseEnter
end)
if s then
frame.Active = true;
event:connect(function()
local input = frame.InputBegan:connect(function(key)
if key.UserInputType == Enum.UserInputType.MouseButton1 then
local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Quad', 0.1, true);
end
end
end)
local leave;
leave = frame.MouseLeave:connect(function()
input:disconnect();
leave:disconnect();
end)
end)
end
end
end

drag(main)

mause.KeyDown:connect(function(key)
if key == ";" then
if isHidden == false then
main:TweenPosition(main.Position - UDim2.new(1,0,0,0),"In","Back",0.4)
isHidden = true
else
main:TweenPosition(main.Position + UDim2.new(1,0,0,0),"Out","Back",0.4)
isHidden = false
end
end
end)

hide.MouseButton1Click:connect(function()
if isOpen == true then
ticcsound()
main:TweenSize(UDim2.new(0,460,0,25),"In","Quad",0.3)
isOpen = false
else
ticcsound()
main:TweenSize(UDim2.new(0,460,0,300),"Out","Quad",0.3)
isOpen = true
end
end)

-- Head control R15
r15.MouseButton1Click:connect(function()
ticcsound()
wait(0.4)
local name = "Torso"
if game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso") then
name = "UpperTorso"
end
if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
name = "Torso"
end
local ch = game.Players.LocalPlayer.Character
local prt=Instance.new("Model", workspace)
local z1 =  Instance.new("Part", prt)
z1.Name="Torso"
z1.CanCollide = true
z1.Anchored = true
local z2  =Instance.new("Part", prt)
z2.Name="Head"
z2.Anchored = true
z2.CanCollide = true
local z3 =Instance.new("Humanoid", prt)
z3.Name="Humanoid"
z1.Position = Vector3.new(0,9999,0)
z2.Position = Vector3.new(0,9991,0)
game.Players.LocalPlayer.Character=prt
wait(5)
game.Players.LocalPlayer.Character=ch
wait(6)
game:GetService('RunService').Stepped:connect(function()
game.Players.LocalPlayer.Character.Head.CanCollide = true
end)
local humano = game.Players.LocalPlayer.Character.Humanoid:Clone()
wait()
game.Players.LocalPlayer.Character[name]:Destroy()
game.Players.LocalPlayer.Character.HumanoidRootPart:Destroy()
game.Players.LocalPlayer.Character["Left Arm"].Anchored = true
game.Players.LocalPlayer.Character["Right Arm"].Anchored = true
game.Players.LocalPlayer.Character["Left Leg"].Anchored = true
game.Players.LocalPlayer.Character["Right Leg"].Anchored = true
--]]
game.Players.LocalPlayer.Character.LeftHand.Anchored = true
game.Players.LocalPlayer.Character.LeftLowerArm.Anchored = true
game.Players.LocalPlayer.Character.LeftUpperArm.Anchored = true
game.Players.LocalPlayer.Character.RightHand.Anchored = true
game.Players.LocalPlayer.Character.RightLowerArm.Anchored = true
game.Players.LocalPlayer.Character.RightUpperArm.Anchored = true
if game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso") ~= nil then
game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso").Anchored = true
end
game.Players.LocalPlayer.Character.LeftLowerLeg.Anchored = true
game.Players.LocalPlayer.Character.LeftUpperLeg.Anchored = true
game.Players.LocalPlayer.Character.RightFoot.Anchored = true
game.Players.LocalPlayer.Character.RightLowerLeg.Anchored = true
game.Players.LocalPlayer.Character.RightUpperLeg.Anchored = true
game.Players.LocalPlayer.Character.LowerTorso.Anchored = true
game.Players.LocalPlayer.Character.LeftHand.Anchored = true
game.Players.LocalPlayer.Character.LeftHand.Anchored = true
local torso = game.Players.LocalPlayer.Character.Head
game.Players.LocalPlayer.Character.Humanoid.Parent = game.Lighting
game:GetService("RunService").Stepped:connect(function()
torso.CanCollide = true
end)
humano.Parent = game.Players.LocalPlayer.Character
local humanoid = Instance.new("Humanoid",game.Players.LocalPlayer.Character)
humanoid.HipHeight = 2
humanoid.RigType = Enum.HumanoidRigType.R15
humanoid.WalkSpeed = 50
local mouse = game.Players.LocalPlayer:GetMouse()
local target = torso
local camera = workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Follow
camera.CameraSubject = target
local plr = game.Players.LocalPlayer
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 4000
local speed = 0
function Fly()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
end
mouse.KeyDown:connect(function(key)
if key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
Fly()
torso.Name = "HumanoidRootPart"
mouse.KeyDown:connect(function(k)
if k:lower() == "z"then
torso.Velocity = Vector3.new(0,1919191,0)
end
end)
end)

-- Head control R6
r6.MouseButton1Click:connect(function()
ticcsound()
wait(0.4)
local name = "Torso"
if game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso") then
name = "UpperTorso"
end
if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
name = "Torso"
end
local ch = game.Players.LocalPlayer.Character
local prt=Instance.new("Model", workspace)
local z1 =  Instance.new("Part", prt)
z1.Name="Torso"
z1.CanCollide = true
z1.Anchored = true
local z2  =Instance.new("Part", prt)
z2.Name="Head"
z2.Anchored = true
z2.CanCollide = true
local z3 =Instance.new("Humanoid", prt)
z3.Name="Humanoid"
z1.Position = Vector3.new(0,9999,0)
z2.Position = Vector3.new(0,9991,0)
game.Players.LocalPlayer.Character=prt
wait(5)
game.Players.LocalPlayer.Character=ch
wait(6)
game:GetService('RunService').Stepped:connect(function()
game.Players.LocalPlayer.Character.Head.CanCollide = true
end)
local humano = game.Players.LocalPlayer.Character.Humanoid:Clone()
wait()
game.Players.LocalPlayer.Character[name]:Destroy()
game.Players.LocalPlayer.Character.HumanoidRootPart:Destroy()
game.Players.LocalPlayer.Character["Left Arm"].Anchored = false
game.Players.LocalPlayer.Character["Right Arm"].Anchored = false
game.Players.LocalPlayer.Character["Left Leg"].Anchored = false
game.Players.LocalPlayer.Character["Right Leg"].Anchored = false
local torso = game.Players.LocalPlayer.Character.Head
game.Players.LocalPlayer.Character.Humanoid.Parent = game.Lighting
game:GetService("RunService").Stepped:connect(function()
torso.CanCollide = true
game.Players.LocalPlayer.Character["Left Arm"].CanCollide = true
game.players.LocalPlayer.Character["Right Arm"].CanCollide = true
game.Players.LocalPlayer.Character["Left Leg"].CanCollide = true
game.Players.LocalPlayer.Character["Right Leg"].CanCollide = true
end)
humano.Parent = game.Players.LocalPlayer.Character
local humanoid = humano--Instance.new("Humanoid",game.Players.LocalPlayer.Character)
humanoid.HipHeight = 2
humanoid.WalkSpeed = 50
local mouse = game.Players.LocalPlayer:GetMouse()
local target = torso
local camera = workspace.CurrentCamera
camera.CameraType = Enum.CameraType.Follow
camera.CameraSubject = target
local plr = game.Players.LocalPlayer
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 4000
local speed = 0
function Fly()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
end
mouse.KeyDown:connect(function(key)
if key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
Fly()
torso.Name = "HumanoidRootPart"
mouse.KeyDown:connect(function(k)
if k:lower() == "z"then
torso.Velocity = Vector3.new(0,1919191,0)
end
end)
end)
