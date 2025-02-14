local Fluent = loadstring(game:HttpGet("https://pastebin.com/raw/rwbENLjf"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "大象旅館",
    SubTitle = "by Swod",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl 
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "無限金錢選單", Icon = "coins" }),
	Main2 = Window:AddTab({ Title = "其他選單", Icon = "tools" })
}

local Options = Fluent.Options

do
    Tabs.Main:AddParagraph({
        Title = "無限金錢",
    })


    local MoneyInput = Tabs.Main:AddInput("Input", {
        Title = "輸入金錢",
        Default = "100",
        Placeholder = "輸入金錢",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
    })

	Tabs.Main:AddButton({
        Title = "給自己金錢",
        Description = "給自己金錢",
        Callback = function()
		    local amount = tonumber(MoneyInput.Value) or 100
    		local args = {false, amount, "Cash"}
    		game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
        end
    })

	Tabs.Main:AddButton({
        Title = "給所有人金錢",
        Description = "給所有人金錢",
        Callback = function()
		    local amount = tonumber(MoneyInput.Value) or 100
			for i, plr in pairs(game:GetService("Players"):GetPlayers()) do
			    local args = {false, amount, "Cash", plr}
			    game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
			end
        end
    })

	local ToggleInfMoneySelf = Tabs.Main:AddToggle("ToggleInfMoneySelf", {Title = "持續給自己無限金錢", Default = false })
    ToggleInfMoneySelf:OnChanged(function()
        while ToggleInfMoneySelf.Value do
			local amount = tonumber(MoneyInput.Value) or 100
    		local args = {false, amount, "Cash"}
    		game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
			wait(0.1)
		end
    end)

	local ToggleInfMoneyAll = Tabs.Main:AddToggle("ToggleInfMoneyAll", {Title = "持續給所有人無限金錢", Default = false })
	ToggleInfMoneyAll:OnChanged(function()
        while ToggleInfMoneyAll.Value do
			local amount = tonumber(MoneyInput.Value) or 100
			for i, plr in pairs(game:GetService("Players"):GetPlayers()) do
			    local args = {false, amount, "Cash", plr}
			    game:GetService("ReplicatedStorage").MoneyRequest:FireServer(unpack(args))
			end
			wait(0.1)
		end
    end)

	--------------------------------其他選單--------------------------------

	Tabs.Main2:AddParagraph({
        Title = "人物調整",
    })

	local Input = Tabs.Main2:AddInput("Input", {
        Title = "調整速度(按下Enter確認)",
        Default = "16",
        Placeholder = "輸入你想要的速度",
        Numeric = true, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(Value)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    })

	local Input = Tabs.Main2:AddInput("Input", {
        Title = "調整跳躍力(按下Enter確認)",
        Default = "50",
        Placeholder = "輸入你想要的跳躍力",
        Numeric = true, -- Only allows numbers
        Finished = true, -- Only calls callback when you press enter
        Callback = function(Value)
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    })


end




Window:SelectTab(1)

Fluent:Notify({
    Title = "通知",
    Content = "腳本成功載入",
    Duration = 8
})
