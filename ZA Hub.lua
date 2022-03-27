-- // UI COLOR \\ --
_G.Color = Color3.fromRGB(176, 38, 255)
_G.Color2 = Color3.fromRGB(176, 38, 255)



-- // MAIN UI LIB \\ --
local library = loadstring(game:HttpGet("https://pastebin.com/raw/wTRkSQU8"))()
local window = library:CreateWindow("Zombie Attack Hub", Enum.KeyCode.RightControl)
local plr = game.Players.LocalPlayer

-- // GUI TABS \\ --
local tab1 = window:CreateTab("Welcome")
local tab2 = window:CreateTab("Main")
local tab3 = window:CreateTab("Player")
local tab4 = window:CreateTab("Game")
local tab8 = window:CreateTab("Other Hubs")
local tab9 = window:CreateTab("Misc")

-- // TAB 1 STUFF \\ --
local t1sect1 = tab1:CreateSector("Welcome", 'left')
local t1sect1sub1 = tab1:CreateSector("Social Media", 'left')
local t1sect2 = tab1:CreateSector("Game Settings", 'right')
local t1sect3 = tab1:CreateSector("GUI Settings", 'right')
local t1sect4 = tab1:CreateSector("GUI Close Settings", 'right')

-- // TAB 1 Sector 1 \\ --
t1sect1:AddLabel("Welcome to ZA Hub!")

-- // TAB 1 Sector 1 sub1 \\ --
t1sect1sub1:AddButton("Discord Server", function() 
    local StarterGui = game:GetService("StarterGui") -- not sure why you used CoreGui
    local bindable = Instance.new("BindableFunction")

    function bindable.OnInvoke(response)
      setclipboard("DiscordServerLinkHere")
    end

    StarterGui:SetCore("SendNotification", {
    	Title = "Discord Server",
    	Text = "Click the button below to copy the server link!",
    	Duration = 10,
    	Callback = bindable,
    	Button1 = "Copy Server Link",
    })
end)
t1sect1sub1:AddButton("V3rmillion", function() 
    local StarterGui = game:GetService("StarterGui") -- not sure why you used CoreGui
    local bindable = Instance.new("BindableFunction")

    function bindable.OnInvoke(response)
      setclipboard("V3rmillionAccountLinkHere")
    end

    StarterGui:SetCore("SendNotification", {
    	Title = "V3rmillion Account Link",
    	Text = "Click the button below to copy the account link!",
    	Duration = 10,
    	Callback = bindable,
    	Button1 = "Copy Account Link!",
    })
end)

-- // TAB 1 Sector 2 \\ --
t1sect2:AddButton("Anti Lag", function() 
end)
t1sect2:AddButton("ServerHop", function() 
end)
t1sect2:AddButton("Rejoin", function() 
end)

-- // TAB 1 Sector 3 \\ --
t1sect3:AddLabel("More Coming Soon!")

-- // TAB 1 Sector 4 \\ --
t1sect4:AddSeperator("Closing Settings")
t1sect4:AddButton("Close ZA Hub Forever", function(zacl)
    game:GetService("CoreGui")["Zombie Attack Hub"]:Destroy()
end)


-- // TAB 2 STUFF \\ --
local t2sect1 = tab2:CreateSector("Autofarm", 'left')
local t2sect2 = tab2:CreateSector("Section 2", 'right')

-- // TAB 2 Sector 1 \\ --
t2sect1:AddButton("Autofarm", function() 
    local groundDistance = 12
local Player = game:GetService("Players").LocalPlayer
local function getNearest()
local nearest, dist = nil, 99999
for _,v in pairs(game.Workspace.BossFolder:GetChildren()) do
if(v:FindFirstChild("Head")~=nil)then
local m =(Player.Character.Head.Position-v.Head.Position).magnitude
if(m<dist)then
dist = m
nearest = v
end
end
end
for _,v in pairs(game.Workspace.enemies:GetChildren()) do
if(v:FindFirstChild("Head")~=nil)then
local m =(Player.Character.Head.Position-v.Head.Position).magnitude
if(m<dist)then
dist = m
nearest = v
end
end
end
return nearest
end
_G.farm2 = true
Player.Chatted:Connect(function(m)
if(m==";autofarm false")then
_G.farm2 = false
elseif(m==";autofarm true")then
_G.farm2 = true
end
end)
_G.globalTarget = nil
game:GetService("RunService").RenderStepped:Connect(function()
if(_G.farm2==true)then
local target = getNearest()
if(target~=nil)then
game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.p, target.Head.Position)
Player.Character.HumanoidRootPart.CFrame = (target.HumanoidRootPart.CFrame * CFrame.new(0, groundDistance, 9))
_G.globalTarget = target
end
end
end)
spawn(function()
while wait() do
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
game.Players.LocalPlayer.Character.Torso.Velocity = Vector3.new(0,0,0)
end
end)
while wait() do
if(_G.farm2==true and _G.globalTarget~=nil and _G.globalTarget:FindFirstChild("Head") and Player.Character:FindFirstChildOfClass("Tool"))then
local target = _G.globalTarget
game.ReplicatedStorage.Gun:FireServer({["Normal"] = Vector3.new(0, 0, 0), ["Direction"] = target.Head.Position, ["Name"] = Player.Character:FindFirstChildOfClass("Tool").Name, ["Hit"] = target.Head, ["Origin"] = target.Head.Position, ["Pos"] = target.Head.Position,})
wait()
end
end
end)
t2sect1:AddSeperator("AUTOFARM INFORMATION")
t2sect1:AddLabel(";autofarm true")
t2sect1:AddLabel(";autofarm false")

-- // TAB 2 Sector 2 \\ --



-- // TAB 3 STUFF \\ --
local t3sect1 = tab3:CreateSector("Player Movement", 'left')
local t3sect2 = tab3:CreateSector("Player", 'right')

-- // TAB 3 Sector 1 \\ --
t3sect1:AddSeperator("Walkspeed Settings")
t3sect1:AddButton("Normal Walkspeed", function() 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)
t3sect1:AddSlider("Walkspeed", 16, 16, 200, false, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)
t3sect1:AddSeperator("JumpPower Settings")
t3sect1:AddButton("Normal JumpPower", function() 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)
t3sect1:AddSlider("JumpPower", 50, 50, 200, false, function(v)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)
t3sect1:AddSeperator("Fly Settings")
t3sect1:AddKeybind("Fly Keybind", 'B', function(togglekey)

end)
t3sect1:AddToggle("Toggle Fly", false, function(toggle)
    print("Toggle Working!")
end)
t3sect1:AddSeperator("NoClip Settings")

-- // TAB 3 Sector 2 \\ --



-- // TAB 4 STUFF \\ --
local t4sect2 = tab4:CreateSector("Game Settings", 'right')

-- // TAB 4 Sector 1 \\ --


-- // TAB 4 Sector 2 \\ --
t4sect2:AddButton("Anti Lag", function() 
end)
t4sect2:AddButton("ServerHop", function() 
end)
t4sect2:AddButton("Rejoin", function() 
end)



-- // TAB 8 STUFF \\ --
local t8sect1 = tab8:CreateSector("Zombie Attack Hubs", 'left')
local t8sect2 = tab8:CreateSector("Extra Info", 'right')

-- // TAB 8 Sector 1 \\ --
t8sect1:AddSeperator("VG Hub")
t8sect1:AddButton("Load VG Hub", function() 
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()
end)


-- // TAB 8 Sector 2 \\ --
t8sect2:AddButton("Close ZA Hub", function()
    game:GetService("CoreGui")["Zombie Attack Hub"]:Destroy()
end)



-- // TAB 9 STUFF \\ --
local t9sect1 = tab9:CreateSector("GUI Settings", 'left')
local t9sect2 = tab9:CreateSector("Extra Info", 'right')

-- // TAB 9 Sector 1 \\ --
t9sect1:AddSeperator("Color Settings")


-- // TAB 9 Sector 2 \\ --
t9sect2:AddButton("Close ZA Hub", function()
    game:GetService("CoreGui")["Zombie Attack Hub"]:Destroy()
end)
