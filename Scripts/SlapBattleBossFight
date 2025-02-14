local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TITLE", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Main")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function teleportToMarker(marker)
    if marker.PrimaryPart then
        character:SetPrimaryPartCFrame(marker.PrimaryPart.CFrame + Vector3.new(0, 3, 0))
    end
end

local markers = {}

local function createESP(obj)
    if obj.PrimaryPart then
        local BillboardGui = Instance.new("BillboardGui")
        BillboardGui.Size = UDim2.new(0, 100, 0, 50)
        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
        BillboardGui.Adornee = obj.PrimaryPart
        BillboardGui.AlwaysOnTop = true

        local TextLabel = Instance.new("TextLabel", BillboardGui)
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = obj.Name
        TextLabel.TextColor3 = Color3.new(1, 0, 0)
        TextLabel.TextScaled = true

        BillboardGui.Parent = obj.PrimaryPart
    end
end

Section:NewButton("ESP Markers", "ESP all markers", function()
    for _, marker in pairs(workspace:GetChildren()) do
        if marker:IsA("Model") and marker.Name:match(" Marker$") then
            if not marker.PrimaryPart then
                marker.PrimaryPart = marker:FindFirstChildWhichIsA("BasePart")
            end
            if marker.PrimaryPart then
                createESP(marker)
            end
        end
    end
end)

Section:NewButton("Teleport", "Teleport all markers", function()
    for _, marker in pairs(workspace:GetChildren()) do
        if marker:IsA("Model") and marker.Name:match(" Marker$") then
            if not marker.PrimaryPart then
                marker.PrimaryPart = marker:FindFirstChildWhichIsA("BasePart")
            end
            if marker.PrimaryPart then
                table.insert(markers, marker)
            end
        end
    end

    for _, marker in pairs(markers) do
        teleportToMarker(marker)
        task.wait(5)
    end

end)
