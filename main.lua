getgenv().autoTap = false
getgenv().autoRebirth = false
getgenv().autoEgg = false
local remoteParent = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Clicker Madness")
local b = w:CreateFolder("Farming")
local c = w:CreateFolder("Eggs")
local d = w:CreateFolder("Teleport")

b:Toggle("Auto Tap",function(bool)
    getgenv().autoTap = bool
    print("Auto Tap is:", bool)
    if bool then
        doTap()
    end
end)

local selectedRebirth
b:Dropdown("Amount of rebirths:",{1,10,100,1000,10000,100000,1000000,10000000},true,function(value)
    selectedRebirth = value
end)

b:Toggle("Auto Rebirth",function(bool)
    getgenv().autoRebirth = bool
    print("Auto Rebirth is:", bool)
    if bool then
        doRebirth(selectedRebirth)
    end
end)

c:Toggle("Auto Buy Eggs",function(bool)
    getgenv().autoEgg = bool
    print("Auto Buy Eggs is:", bool)
    if bool then
        hatchEgg("basic")
    end
end)

local selectedWorld
d:Dropdown("World",{"Desert","Winter","Lava","Toxic","Ocean","Candy","Space","Forest","City","Blocks","Future","Infinity","Moon","Fire","Storm","Dominus"},true,function(value)
    selectedWorld = value
end)

d:Button("Teleport",function()
    if selectedWorld then
        worldTeleport(selectedWorld)
    end
end)

b:DestroyGui()


function doTap()
    spawn(function()
        while wait() do
            if not autoTap then break end
            remoteParent.ClickService.Click:FireServer(1)
        end
    end)
end

function doRebirth(rebirthAmount)
    spawn(function()
        while wait() do
            if not autoRebirth then break end
            local args = {[1] = rebirthAmount}
            remoteParent.RebirthService.BuyRebirths:FireServer(unpack(args))
        end
    end)
end

function hatchEgg(eggType)
    spawn(function()
        while wait() do
            if not autoEgg then break end
            remoteParent.EggService.Purchase:FireServer(eggType)
        end
end)
end

function playerPosition()
    local plr = game.Players.LocalPlayer
    if plr.Character then
        return plr.Character.Humanoid.RootPart.Position
    end
        return false
end

function teleportTo(placeCFrame)
    local plr = game.Players.LocalPlayer
    if plr.Character then
        plr.Character.Humanoid.RootPart.CFrame = placeCFrame
    end
end

function worldTeleport(world)
    if game:GetService("Workspace").Portals:FindFirstChild(world) then
		teleportTo(game:GetService("Workspace").Worlds[world].Teleport.CFrame)
    end
end