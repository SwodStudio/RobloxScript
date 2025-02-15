local range = 100 -- Radius in pixels.
local aimbotTarget = "HumanoidRootPart" -- Where it will aim at: HumanoidRootPart | Head | LeftArm | RightArm | LeftLeg | RightLeg
local disableKey = Enum.KeyCode.RightControl -- The key to stop the script when pressed.
local diedCheck = true -- false: It will aim at dead plrs. | true: It wont aim at dead plrs.

-- CONFIG

local UIS = game:GetService("UserInputService")
local camera = workspace.CurrentCamera

local aimbotting = false
local cTarget

local function getClosestPLR()
    if cTarget then
        return cTarget
    end

    local closestPLR
    local sd = range

    local mousePos = UIS:GetMouseLocation()

    for _, thing in workspace:GetChildren() do

        if thing:FindFirstChild("HumanoidRootPart") and thing:IsA("Model") then

            local hrp = thing.HumanoidRootPart
            local screenPos, onScreen = camera:WorldToViewportPoint(hrp.Position) -- Useless but looks better.

            if onScreen then
                local distance = (mousePos - Vector2.new(screenPos.X, screenPos.Y)).Magnitude

                if distance < sd then
                    sd = distance

                    if aimbotTarget == "HumanoidRootPart" then

                        closestPLR = hrp

                    elseif aimbotTarget == "Head" then

                        if hrp.Parent:FindFirstChild("Head") then
                            closestPLR = hrp.Parent.Head
                        end

                    elseif aimbotTarget == "LeftArm" then

                        if hrp.Parent:FindFirstChild("Left Arm") then
                            closestPLR = hrp.Parent["Left Arm"]
                        end

                    elseif aimbotTarget == "RightArm" then

                        if hrp.Parent:FindFirstChild("Right Arm") then
                            closestPLR = hrp.Parent["Right Arm"]
                        end

                    elseif aimbotTarget == "LeftLeg" then

                        if hrp.Parent:FindFirstChild("Left Leg") then
                            closestPLR = hrp.Parent["Left Leg"]
                        end

                    elseif aimbotTarget == "RightLeg" then

                        if hrp.Parent:FindFirstChild("Right Leg") then
                            closestPLR = hrp.Parent["Right Leg"]
                        end

                    end

                end

            end

        end

    end

    return closestPLR
end

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent == true then return end

    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotting = true
    end
end)

UIS.InputEnded:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent == true then return end

    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        aimbotting = false
        cTarget = nil
    end
end)

local run = true
game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
    if run == false then return end

    local target = getClosestPLR()

    if diedCheck == true and target.Parent.Humanoid.Health <= 0 then
        return
    end

    if aimbotting and target then
        cTarget = target
        camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
    end
end)

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent == true then return end

    if input.KeyCode == disableKey then
        run = false
    end
end)
