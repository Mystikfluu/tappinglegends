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
Main:Toggle("Auto craft pets", function(toggle)
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
_G.deletedm = -9e9
_G.deletecm = -9e9

Main:Label("Auto delete is if below both configurable values, Auto delete2 is if below one Value.")
warn("Auto delete is if below both configurable values, Auto delete2 is if below one Value.")
print("Auto delete deletes Pets which have their Multipliers below the point of the configurable values called 'DeleteClicks' and 'DeleteDiamonds'")
Main:Toggle("Auto delete", function(toggle)
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
Main:Toggle("Auto delete2", function(toggle)
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
end)
if(_G.ws == nil) then
_G.ws = 16
end
if(_G.speed) then else
game.Players.LocalPlayer.Character.Humanoid.Changed:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.ws
end)
_G.speed = true
end
Main:Box("DeleteClicks", "number", function(value)
_G.deletecm = value
end)
Main:Box("DeleteDiamonds", "number", function(value)
_G.deletedm = value
end)
Main:Box("WalkSpeed", "number", function(value)
_G.ws = tonumber(value)
end)
