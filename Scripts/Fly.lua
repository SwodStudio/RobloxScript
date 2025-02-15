-- Place this LocalScript in StarterPlayerScripts (or another appropriate client location)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local mouse = player:GetMouse()

local flying = false
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local speed = 50
local maxSpeed = 1000

local function Fly()
	local bg = Instance.new("BodyGyro", rootPart)
	bg.P = 90000
	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	bg.cframe = rootPart.CFrame

	local bv = Instance.new("BodyVelocity", rootPart)
	bv.velocity = Vector3.new(0, 0.1, 0)
	bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

	repeat
		wait()
		humanoid.PlatformStand = true

		-- Movement only if a key is pressed
		if ctrl.f ~= 0 or ctrl.b ~= 0 or ctrl.l ~= 0 or ctrl.r ~= 0 then
			local moveVector = (workspace.CurrentCamera.CFrame.lookVector * (ctrl.f + ctrl.b)) +
				((workspace.CurrentCamera.CFrame * CFrame.new(ctrl.l + ctrl.r, 0, 0).p) - workspace.CurrentCamera.CFrame.p)
			bv.velocity = moveVector.unit * speed
		else
			bv.velocity = Vector3.new(0, 0.1, 0) -- Hover in place
		end

		bg.cframe = workspace.CurrentCamera.CFrame
	until not flying

	-- Cleanup when stopping flight
	bg:Destroy()
	bv:Destroy()
	humanoid.PlatformStand = false
end

mouse.KeyDown:Connect(function(key)
	key = key:lower()
	if key == "g" then
		flying = not flying
		if flying then
			Fly()
		end
	elseif key == "w" then
		ctrl.f = 1
	elseif key == "s" then
		ctrl.b = -1
	elseif key == "a" then
		ctrl.l = -1
	elseif key == "d" then
		ctrl.r = 1
	end
end)

mouse.KeyUp:Connect(function(key)
	key = key:lower()
	if key == "w" then
		ctrl.f = 0
	elseif key == "s" then
		ctrl.b = 0
	elseif key == "a" then
		ctrl.l = 0
	elseif key == "d" then
		ctrl.r = 0
	end
end)
