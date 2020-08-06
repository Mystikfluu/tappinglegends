local library = loadstring(game:HttpGet(('https://pastebin.com/raw/FsJak6AT')))()
local w = library:CreateWindow("Tapping legends")
local Main = w:CreateFolder("Main")
Main:Button("Use all codes", function()
  for i, v in pairs(game.Players.LocalPlayer.Codes:GetChildren()) do
  local args = {
    [1] = v.Name
  }
  game:GetService("ReplicatedStorage").RemoteFunctions.CodeActivated:InvokeServer(unpack(args))
end
end)

_G.deletedm = -9e9
_G.deletecm = -9e9
local Pets = w:CreateFolder("Pets")
Pets:Toggle("Auto craft pets", function(toggle)
spawn(function()
_G.togglecraft = toggle
while wait(0.1) and _G.togglecraft do
  for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
    wait()
    local args = {
      [1] = v.Name,
      [2] = v.Type.Value
    }
    game:GetService("ReplicatedStorage").Remotes.Craft:FireServer(unpack(args))
  end
end
end)
end)
Pets:Toggle("delete common", function(toggle)
_G.common = toggle
spawn(function()
while wait(0.1) and _G.common do
for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
  wait()
  if(game.ReplicatedStorage.PetLibrary.Pets:FindFirstChild(v.Name).Settings.Rarity.Value == "Common") then
    local args = {
      [1] = v.Pet_ID.Value,
      [2] = true
    }
    game:GetService("ReplicatedStorage").RemoteEvents.PetDelete:FireServer(unpack(args))
  end
end
end
end)
end)
Pets:Toggle("delete rare", function(toggle)
_G.rare = toggle
spawn(function()
while wait(0.1) and _G.rare do
for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
wait()
if(game.ReplicatedStorage.PetLibrary.Pets:FindFirstChild(v.Name).Settings.Rarity.Value == "Rare") then
  local args = {
    [1] = v.Pet_ID.Value,
    [2] = true
  }
  game:GetService("ReplicatedStorage").RemoteEvents.PetDelete:FireServer(unpack(args))
end
end
end
end)
end)
Pets:Toggle("delete epic", function(toggle)
_G.epic = toggle
spawn(function()
while wait(0.1) and _G.epic do
for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
wait()
if(game.ReplicatedStorage.PetLibrary.Pets:FindFirstChild(v.Name).Settings.Rarity.Value == "Epic") then
local args = {
  [1] = v.Pet_ID.Value,
  [2] = true
}
game:GetService("ReplicatedStorage").RemoteEvents.PetDelete:FireServer(unpack(args))
end
end
end
end)
end)
Pets:Toggle("delete Legendary", function(toggle)
_G.Legendary = toggle
spawn(function()
while wait(0.1) and _G.Legendary do
for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
wait()
if(game.ReplicatedStorage.PetLibrary.Pets:FindFirstChild(v.Name).Settings.Rarity.Value == "Legendary") then
local args = {
[1] = v.Pet_ID.Value,
[2] = true
}
game:GetService("ReplicatedStorage").RemoteEvents.PetDelete:FireServer(unpack(args))
end
end
end
end)
end)
warn("Auto delete is if below both configurable values, Auto delete2 is if below one Value.")
print("Auto delete deletes Pets which have their Multipliers below the point of the configurable values called 'DeleteClicks' and 'DeleteDiamonds'")
Pets:Toggle("(OLD) Auto delete", function(toggle)
spawn(function()
_G.delete = toggle
while wait(0.1) and _G.delete do
for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
wait()
if(tonumber(v.DiamondMultiplier.Value) <= tonumber(_G.deletedm)) and (tonumber(v.ClickMultiplier.Value) <= tonumber(_G.deletecm)) then
local args = {
[1] = v.Pet_ID.Value,
[2] = true
}
game:GetService("ReplicatedStorage").RemoteEvents.PetDelete:FireServer(unpack(args))
end
end
end
end)
end)
Pets:Toggle("(OLD) Auto delete2", function(toggle)
spawn(function()
_G.delete = toggle
while wait(0.1) and _G.delete do
for i, v in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
wait()
if(tonumber(v.DiamondMultiplier.Value) <= tonumber(_G.deletedm)) or (tonumber(v.ClickMultiplier.Value) <= tonumber(_G.deletecm)) then
local args = {
[1] = v.Pet_ID.Value,
[2] = true
}
game:GetService("ReplicatedStorage").RemoteEvents.PetDelete:FireServer(unpack(args))
end
end
end
end)
--]]
end)
local stuff = w:CreateFolder("Stuff.")
if(_G.ws == nil) then
_G.ws = 16
end
if(_G.speed) then else
game.Players.LocalPlayer.Character.Humanoid.Changed:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.ws
end)
_G.speed = true
end
Pets:Box("DeleteClicks", "number", function(value)
_G.deletecm = value
end)
Pets:Box("DeleteDiamonds", "number", function(value)
_G.deletedm = value
end)
stuff:Box("WalkSpeed", "number", function(value)
_G.ws = tonumber(value)
end)
local Eggs = w:CreateFolder("Eggs")
Eggs:Toggle("Open one", function(toggle)
spawn(function()
_G.one = toggle
while wait(0.1) and _G.one do
if(_G.egg) then
local args = {
[1] = _G.egg,
[2] = "E"
}
game:GetService("ReplicatedStorage").RemoteEvents.EggOpen:FireServer(unpack(args))
end
end
end)
end)
Eggs:Toggle("Open three", function(toggle)
spawn(function()
_G.three = toggle
while wait(0.1) and _G.three do
if(_G.egg) then
local args = {
[1] = _G.egg,
[2] = "R"
}
game:GetService("ReplicatedStorage").RemoteEvents.EggOpen:FireServer(unpack(args))
end
end
end)
end)
Eggs:Box("Eggname", "string", function(value)
_G.egg = tostring(value)
end)
