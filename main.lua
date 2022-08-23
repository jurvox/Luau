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

b:Toggle("Auto Rebirth",function(bool)
    getgenv().autoRebirth = bool
    print("Auto Rebirth is:", bool)
    if bool then
        doRebirth(1000)
    end
end)

c:Toggle("Auto Buy Eggs",function(bool)
    getgenv().autoEgg = bool
    print("Auto Buy Eggs is:", bool)
    if bool then
        hatchEgg("basic")
    end
end)

d:Button("Desert",function()
    worldTeleport("Desert")
end)
d:Button("Winter",function()
    worldTeleport("Winter")
end)
d:Button("Lava",function()
    worldTeleport("Lava")
end)
d:Button("Toxic",function()
    worldTeleport("Toxic")
end)
d:Button("Ocean",function()
    worldTeleport("Ocean")
end)
d:Button("Candy",function()
    worldTeleport("Candy")
end)
d:Button("Space",function()
    worldTeleport("Space")
end)
d:Button("Forest",function()
    worldTeleport("Forest")
end)
d:Button("City",function()
    worldTeleport("City")
end)
d:Button("Blocks",function()
    worldTeleport("Blocks")
end)
d:Button("Future",function()
    worldTeleport("Future")
end)
d:Button("Infinity",function()
    worldTeleport("Infinity")
end)
d:Button("Moon",function()
    worldTeleport("Moon")
end)
d:Button("Fire",function()
    worldTeleport("Fire")
end)
d:Button("Storm",function()
    worldTeleport("Storm")
end)
d:Button("Dominus",function()
    worldTeleport("Dominus")
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

print('sus amogus')