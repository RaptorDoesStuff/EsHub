game:GetService("StarterGui"):SetCore("SendNotification", {Title = "yeet", Text = "8 = Enabled : 7 = disabled."})
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Settings

bind = "" 
bind2 = "8"
bind3 = "7"

-- Script

mouse.KeyDown:connect(function(key)
if key == bind then
player.Character.HumanoidRootPart.CFrame = CFrame.new(1254.09656, 137.906067, -172.128204)
end
end)

mouse.KeyDown:connect(function(key2)
if key2 == bind2 then
_G.HeadSize = 20
_G.Disabled = true


if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 1
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("21")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end
end)

mouse.KeyDown:connect(function(key3)
if key3 == bind3 then
_G.HeadSize = 100
_G.Disabled = true


for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
v.Character.HumanoidRootPart.Transparency = 1
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
v.Character.HumanoidRootPart.Material = "Plastic"
v.Character.HumanoidRootPart.CanCollide = true
end)
end
end
end
end)
local new_user = false


function CreateESPPart(BodyPart,color)
local ESPPartparent = BodyPart
local Box = Instance.new("BoxHandleAdornment")
Box.Size = BodyPart.Size + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = ESPPartparent
Box.Color3 = color
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.5
Box.Parent = BodyPart
end


function loadCheck(plr,chr)
if chr:findFirstChild("Humanoid") then
local part = chr:getChildren()
for i=1,#part do
if part[i].ClassName == "Part" or part[i].ClassName == "MeshPart" then
if part[i].Name == "HumanoidRootPart" then
else
wait(0.1)
if part[i]:findFirstChild("ESPPart") then
else
CreateESPPart(part[i],plr.TeamColor.Color)
end



if part[i].Name == "Head" then
if part[i]:findFirstChild("ESPNametag") then
else
local BillboardGui = Instance.new("BillboardGui",part[i])
local TextLabel = Instance.new("TextLabel",BillboardGui)
BillboardGui.Name = "ESPNametag"
BillboardGui.Adornee = part[i]
BillboardGui.ExtentsOffset = Vector3.new(0, 3, 0)
BillboardGui.Size = UDim2.new(0, 200, 0, 50)
BillboardGui.AlwaysOnTop = true
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.Gotham
TextLabel.FontSize = Enum.FontSize.Size14
TextLabel.TextSize = 10
TextLabel.TextStrokeTransparency = 0
TextLabel.TextColor3 = plr.TeamColor.Color


if new_user == false then
spawn(function()
while true do
wait(0.1)
local magnitude = (game.Players.LocalPlayer.Character.Head.Position - part[i].Position).magnitude
local dist = 0
if magnitude > 10 then
dist = string.sub(magnitude,1,1)
end
if magnitude > 100 then
dist = string.sub(magnitude,1,2)
end
if magnitude > 1000 then
dist = string.sub(magnitude,1,3)
end
if magnitude > 10000 then
dist = string.sub(magnitude,1,4)
end
if magnitude > 100000 then
dist = string.sub(magnitude,1,5)
end
if magnitude > 1000000 then
dist = string.sub(magnitude,1,6)
end
TextLabel.Text = "\n" .. part[i].Parent.Name .. "\nHealth: " .. part[i].Parent:findFirstChild("Humanoid").Health .. "\nDistance: " .. dist .. "m\n"
end
end)
else
TextLabel.Text = part[i].Parent.Name
end
end
end
end
end
end
end
end

local player = game.Players:GetChildren()
for i=1,#player do
if player[i].Name == game.Players.LocalPlayer.Name then
else
player[i]:GetPropertyChangedSignal("Team"):connect(function()
local newcolor = player[i].TeamColor.Color
if player[i].Character:findFirstChild("Head") then
if player[i].Character.Head:findFirstChild("ESPNametag") then
player[i].Character.Head.ESPNametag.TextLabel.TextColor3 = newcolor
end
local part = player[i].Character:getChildren()
for i=1,#part do
if part[i]:findFirstChild("ESPPart") then
part[i].ESPPart.Color3 = newcolor
end
end
end
end)

player[i].CharacterAdded:Connect(function(character)
wait(0.5)
loadCheck(player[i],player[i].Character)
end)
loadCheck(player[i],player[i].Character)
end
end

game.Players.PlayerAdded:Connect(function(player)

player:GetPropertyChangedSignal("Team"):connect(function()
local newcolor = player.TeamColor.Color
if player.Character:findFirstChild("Head") then
if player.Character.Head:findFirstChild("ESPNametag") then
player.Character.Head.ESPNametag.TextLabel.TextColor3 = newcolor
end
local part = player.Character:getChildren()
for i=1,#part do
if part[i]:findFirstChild("ESPPart") then
part[i].ESPPart.Color3 = newcolor
end
end
end

end)

player.CharacterAdded:Connect(function(character)
wait(0.5)
loadCheck(player,character)
end)
end)
