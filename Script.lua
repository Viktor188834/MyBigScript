local plr = game.Players.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local uis = game:GetService("UserInputService")

plr.CharacterAdded:Connect(function(NewChar)
	character = NewChar
end)

local function corner(parent, radius)
	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = UDim.new(0, radius)
	uiCorner.Parent = parent
	return uiCorner
end

local gui = {
	ScreenGui = Instance.new("ScreenGui", plr.PlayerGui),
	v1ScrollingFrame = Instance.new("ScrollingFrame"),
	v1TextLabel = Instance.new("TextLabel"),
	v1UIGridLayout = Instance.new("UIGridLayout"),
	v1TextBox = Instance.new("TextBox"),
	v1TextButton = Instance.new("TextButton"),
	v1Frame = Instance.new("Frame"),
	v2TextButton = Instance.new("TextButton"),
	v2TextBox = Instance.new("TextBox"),
	v2Frame = Instance.new("Frame"),
	v3TextButton = Instance.new("TextButton"),
	v4TextButton = Instance.new("TextButton"),
	v3Frame = Instance.new("Frame"),
	v2UIGridLayout = Instance.new("UIGridLayout"),
	v5TextButton = Instance.new("TextButton")
}

gui.ScreenGui.ResetOnSpawn = false

gui.v1ScrollingFrame.Parent = gui.v1TextBox
gui.v1ScrollingFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
gui.v1ScrollingFrame.Size = UDim2.new(1, 0, 4, 0)
gui.v1ScrollingFrame.Position = UDim2.new(0, 0, 1, 0)
gui.v1ScrollingFrame.BorderSizePixel = 0
gui.v1ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(77, 77, 77)
gui.v1ScrollingFrame.ScrollBarThickness = 10
gui.v1ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y

gui.v1ScrollingFrame.ChildAdded:Connect(function()
	gui.v1ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, gui.v1UIGridLayout.AbsoluteContentSize.Y)
end)

gui.v1ScrollingFrame.ChildRemoved:Connect(function()
	gui.v1ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, gui.v1UIGridLayout.AbsoluteContentSize.Y)
end)

gui.v1TextLabel.Parent = gui.ScreenGui
gui.v1TextLabel.BorderSizePixel = 0
gui.v1TextLabel.Size = UDim2.new(0.15, 0, 0.05, 0)
gui.v1TextLabel.Position = UDim2.new(0.85, 0, 0.7, 0)
gui.v1TextLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
gui.v1TextLabel.Text = "Script V1.0 by Viktor188834"
gui.v1TextLabel.TextSize = 8
gui.v1TextLabel.TextColor3 = Color3.fromRGB(230, 230, 230)

for i, v in gui do
	corner(v, 7)
end

gui.v1UIGridLayout.Parent = gui.v1ScrollingFrame
gui.v1UIGridLayout.CellSize = UDim2.new(1, 0, 0, 25)
gui.v1UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 1)

gui.v1TextBox.Parent = gui.v1TextLabel
gui.v1TextBox.Text = 'press ";" and input the comand'
gui.v1TextBox.BorderSizePixel = 0
gui.v1TextBox.TextScaled = true
gui.v1TextBox.TextColor3 = Color3.fromRGB(231, 231, 231)
gui.v1TextBox.TextWrapped = true
gui.v1TextBox.Size = UDim2.new(1, 0, 1, 0)
gui.v1TextBox.Position = UDim2.new(0, 0, 1, 0)
gui.v1TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

gui.v1TextButton.Parent = gui.v1TextLabel
gui.v1TextButton.Text = "Settings"
gui.v1TextButton.Size = UDim2.new(0.23, 0, 1, 0)
gui.v1TextButton.Position = UDim2.new(-0.23, 0, 0, 0)
gui.v1TextButton.TextColor3 = Color3.fromRGB(203, 203, 203)
gui.v1TextButton.BorderSizePixel = 0
gui.v1TextButton.TextScaled = true
gui.v1TextButton.TextWrapped = true
gui.v1TextButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

gui.v1Frame.Parent = gui.v1TextLabel
gui.v1Frame.Size = gui.v1ScrollingFrame.Size + UDim2.new(0, 0, 2, 0)
gui.v1Frame.Position = UDim2.new(0, 0, 7, 0)
gui.v1Frame.BorderSizePixel = 0
gui.v1Frame.Visible = false
gui.v1Frame.BackgroundColor3 = Color3.fromRGB(61, 61, 61)

gui.v3Frame.Parent = gui.v2Frame
gui.v3Frame.Visible = true
gui.v3Frame.BorderSizePixel = 0
gui.v3Frame.BackgroundTransparency = 1
gui.v3Frame.Position = UDim2.new(-0.8, 0, 0, 0)
gui.v3Frame.Size = UDim2.new(0.8, 0, 0, 0)

gui.v2UIGridLayout.Parent = gui.v3Frame
gui.v2UIGridLayout.CellSize = UDim2.new(1, 0, 0, 25)

gui.v1TextButton.MouseButton1Click:Connect(function()
	if gui.v1Frame.Visible == false then
		gui.v1Frame.Visible = true
		gui.v1Frame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 1, false, function()
			gui.v1TextButton.Text = "Close"
		end)
	elseif gui.v1Frame.Visible == true then
		gui.v1Frame:TweenPosition(UDim2.new(0, 0, 7, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 1, false, function()
			gui.v1Frame.Visible = false
			gui.v1TextButton.Text = "Settings"
		end)
	end
end)

local commands = {}

gui.v2Frame.Parent = gui.ScreenGui
gui.v2Frame.Visible = true
gui.v2Frame.Position = UDim2.new(0.6, 0, 0.4, 0)
gui.v2Frame.Size = UDim2.new(0.17, 0, 0.3, 0)
gui.v2Frame.BorderSizePixel = 0
gui.v2Frame.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
gui.v2Frame.Draggable = true
gui.v2Frame.Active = true
gui.v2Frame.Selectable = true

local kb = nil

gui.v2TextBox.Parent = gui.v2Frame
gui.v2TextBox.Text = 'Input The Command'
gui.v2TextBox.Size = UDim2.new(0.8, 0, 0.3, 0)
gui.v2TextBox.Position = UDim2.new(0.1, 0, 0.2, 0)
gui.v2TextBox.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
gui.v2TextBox.BorderSizePixel = 0
gui.v2TextBox.TextScaled = true
gui.v2TextBox.TextWrapped = true
gui.v2TextBox.TextColor3 = Color3.fromRGB(241, 241, 241)

gui.v2TextButton.Parent = gui.v2Frame
gui.v2TextButton.Position = UDim2.new(0.25, 0, 0.75, 0)
gui.v2TextButton.Size = UDim2.new(0.5, 0, 0.2, 0)
gui.v2TextButton.BorderSizePixel = 0
gui.v2TextButton.Text = "Add Keybind"
gui.v2TextButton.BackgroundColor3 = Color3.fromRGB(107, 107, 107)
gui.v2TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
gui.v2TextButton.TextScaled = true
gui.v2TextButton.TextWrapped = true

gui.v2TextButton.MouseButton1Click:Connect(function()
	if kb then
		for i=1, #commands do
			if commands[i][1] == gui.v2TextBox.Text then
				local keybind = kb
				local avaibled = true
				local newButtonToDelete = Instance.new("TextButton")
				newButtonToDelete.Parent = gui.v3Frame
				newButtonToDelete.BorderSizePixel = 0
				newButtonToDelete.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
				newButtonToDelete.Text = commands[i][1]
				newButtonToDelete.TextScaled = true
				newButtonToDelete.TextWrapped = true
				newButtonToDelete.TextColor3 = Color3.fromRGB(255, 255, 255)
				local KeybingShow = Instance.new("TextLabel")
				KeybingShow.Parent = newButtonToDelete
				KeybingShow.Text = keybind.Name
				KeybingShow.BorderSizePixel = 0
				KeybingShow.Size = UDim2.new(0.25, 0, 1, 0)
				KeybingShow.Position = UDim2.new(0.75, 0, 0, 0)
				KeybingShow.BackgroundColor3 = Color3.fromRGB(104, 104, 104)
				KeybingShow.TextColor3 = Color3.fromRGB(255, 255, 255)
				KeybingShow.TextScaled = true
				KeybingShow.TextWrapped = true
				corner(newButtonToDelete, 10)
				corner(KeybingShow, 10)
				local func = commands[i][2]
				uis.InputBegan:Connect(function(i, g)
					if g then return end
					if i.KeyCode == keybind and avaibled == true then
						func()
					end
				end)
				newButtonToDelete.MouseButton1Click:Connect(function()
					newButtonToDelete:Destroy()
					avaibled = false
				end)
			end
		end
	end
end)

gui.v3TextButton.Parent = gui.v2Frame
gui.v3TextButton.Size = UDim2.new(0.75, 0, 0.2, 0)
gui.v3TextButton.Position = UDim2.new(0.125, 0, 0.525, 0)
gui.v3TextButton.BorderSizePixel = 0
gui.v3TextButton.BackgroundColor3 = Color3.fromRGB(107, 107, 107)
gui.v3TextButton.Text = "KeyBind"
gui.v3TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
gui.v3TextButton.TextScaled = true
gui.v3TextButton.TextWrapped = true

gui.v3TextButton.MouseButton1Click:Connect(function()
	gui.v3TextButton.Text = "..."
	local KeyCodeNew = uis.InputBegan:Wait().KeyCode
	gui.v3TextButton.Text = KeyCodeNew.Name
	kb = KeyCodeNew
end)

gui.v4TextButton.Parent = gui.v2Frame
gui.v4TextButton.Size = UDim2.new(0.15, 0, 0.15, 0)
gui.v4TextButton.Position = UDim2.new(0.85, 0, 0, 0)
gui.v4TextButton.Text = "X"
gui.v4TextButton.TextColor3 = Color3.fromRGB(255, 75, 75)
gui.v4TextButton.BackgroundColor3 = Color3.fromRGB(211, 0, 0)
gui.v4TextButton.BorderSizePixel = 0
gui.v4TextButton.TextScaled = true
gui.v4TextButton.TextWrapped = true

gui.v4TextButton.MouseButton1Click:Connect(function()
	gui.v2Frame.Visible = not gui.v2Frame.Visible
	gui.v3TextButton.Text = "KeyBind"
	gui.v2TextBox.Text = 'Input The Command'
end)

gui.v5TextButton.Text = "Keybinds"
gui.v5TextButton.Parent = gui.v1Frame
gui.v5TextButton.Size = UDim2.new(0.8, 0, 0.1, 0)
gui.v5TextButton.Position = UDim2.new(0.1, 0, 0.02, 0)
gui.v5TextButton.TextScaled = true
gui.v5TextButton.TextWrapped = true
gui.v5TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
gui.v5TextButton.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
gui.v5TextButton.BorderSizePixel = 0

gui.v5TextButton.MouseButton1Click:Connect(function()
	gui.v2Frame.Visible = not gui.v2Frame.Visible
	gui.v3TextButton.Text = "KeyBind"
	gui.v2TextBox.Text = 'Input The Command'
end)

local function addcmd(commandIsString, SecondIsNumberIsBoolean, funcIsfunction)
	table.insert(commands, {commandIsString, funcIsfunction})
	local cmdbut = Instance.new("TextButton")
	cmdbut.Parent = gui.v1ScrollingFrame
	cmdbut.BorderSizePixel = 0
	cmdbut.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	cmdbut.TextScaled = true
	cmdbut.TextWrapped = true
	cmdbut.Text = commandIsString
	cmdbut.Name = commandIsString
	cmdbut.TextColor3 = Color3.fromRGB(231, 231, 231)
	local splittedcomand = string.split(commandIsString, " ")
	if SecondIsNumberIsBoolean == false then
		cmdbut.MouseButton1Click:Connect(function()
			funcIsfunction()
		end)
	end
	gui.v1TextBox.FocusLost:Connect(function(enter)
		if enter then
			if SecondIsNumberIsBoolean == true then
				local splited = string.split(gui.v1TextBox.Text, " ")
				if splited[1] == splittedcomand[1] then
					if splited[2] then
						funcIsfunction(splited[2])
					end
				end
			end
			if gui.v1TextBox.Text == commandIsString and SecondIsNumberIsBoolean == false then
				funcIsfunction()
			end
		end
	end)
end

gui.v1TextBox.FocusLost:Connect(function(e)
	wait(.1)
	gui.v1TextBox.Text = 'press ";" and input the comand'
end)

uis.InputBegan:Connect(function(i, g)
	if not g then
		if i.KeyCode == Enum.KeyCode.Semicolon then
			wait(.2)
			gui.v1TextBox:CaptureFocus()
			gui.v1TextBox.Text = ""
		end
	end
end)

addcmd("WalkSpeed", true, function(Value)
	local char = plr.Character
	local hum = char:FindFirstChildOfClass("Humanoid")
	if tonumber(Value) then
		hum.WalkSpeed = tonumber(Value)
	end
end)

addcmd("JumpPower", true, function(Value)
	local char = plr.Character
	local hum = char:FindFirstChildOfClass("Humanoid")
	if tonumber(Value) then
		hum.JumpPower = tonumber(Value)
	end
end)

addcmd("AlwaysJumpPower", true, function(Value)
	local char = plr.Character
	local hum = char:FindFirstChildOfClass("Humanoid")
	while wait(.1) do
		if tonumber(Value) then
			hum.UseJumpPower = true
			hum.JumpPower = tonumber(Value)
			if not char then break end
		end
	end
end)

addcmd("AlwaysWalkSpeed", true, function(Value)
	local char = plr.Character
	local hum = char:FindFirstChildOfClass("Humanoid")
	while wait(.1) do
		if tonumber(Value) then
			hum.WalkSpeed = tonumber(Value)
			if not char then break end
		end
	end
end)

local fly = false

addcmd("fly", false, function()
	local char = plr.Character
	local head = char:FindFirstChild("Head")
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not fly then
		fly = true
		while fly do
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			plr.Character.Head.Velocity = workspace.CurrentCamera.CFrame.LookVector*60 + Vector3.new(0,10,0)
			wait()
		end
	end
end)

addcmd("unfly", false, function()
	local char = plr.Character
	local head = char:FindFirstChild("Head")
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	fly = false
	wait()
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
end)
local lightbef = {}
addcmd("Night Vision", false, function()
	local light = game:GetService("Lighting")
	lightbef = {light.Ambient, light.Brightness, light.ClockTime, light.GlobalShadows}
	light.Ambient = Color3.fromRGB(255, 255, 255)
	light.Brightness = 7
	light.ClockTime = 13
	light.GlobalShadows = false
end)

addcmd("Return Light", false, function()
	local light = game:GetService("Lighting")
	if lightbef[1] and lightbef[2] and lightbef[3] and lightbef[4] then
		light.Ambient = lightbef[1]
		light.Brightness = lightbef[2]
		light.ClockTime = lightbef[3]
		light.GlobalShadows = lightbef[4]
		lightbef = {}
	end
end)

addcmd("Delete Target Mouse", false, function()
	local char = plr.Character
	local head = char:FindFirstChild("Head")
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	local mouse = plr:GetMouse()
	if mouse.Target then
		if mouse.Target.Parent:IsA("Model") then
			mouse.Target.Parent:Destroy()
		else
			mouse.Target:Destroy()
		end
	end
end)

addcmd("TpMouse", false, function()
	local char = plr.Character
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local mouse = plr:GetMouse()
	hrp.CFrame = CFrame.new(mouse.Hit.Position * CFrame.new(0, 4, 0), hrp.Rotation)
end)

local esp = {}

addcmd("esp", false, function()
	local function Box(parent)
		local box = Instance.new("BoxHandleAdornment")
		box.Parent = parent
		box.Color3 = parent.Color
		box.Size = parent.Size
		box.Adornee = parent
		box.ZIndex = 3
		box.Transparency = 0.85
		box.AlwaysOnTop = true
		return box
	end
	local function SetWH(parent)
		parent:WaitForChild("Humanoid")
		wait(1.5)
		local Humanoid = parent:FindFirstChildOfClass("Humanoid")
		local parentPlr = nil
		if game.Players:FindFirstChild(parent.Name) then
			parentPlr = game.Players:GetPlayerFromCharacter(parent)
		end
		local v1 = Instance.new("BillboardGui")
		local v2 = Instance.new("Frame")
		local v3 = Instance.new("UICorner")
		local v5 = Instance.new("Frame")
		local v6 = Instance.new("UICorner")
		local v11 = Instance.new("UICorner")
		local v7 = Instance.new("TextLabel")
		local v8 = Instance.new("TextLabel")
		local v9 = Instance.new("ImageLabel")
		local v10 = Instance.new("TextLabel")
		local v4 = Instance.new("Frame")
		v11.CornerRadius = UDim.new(1, 0)
		v11.Parent = v4
		v4.Parent = v1
		v4.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
		v4.BackgroundTransparency = 0
		v4.Size = UDim2.new(0.07, 0, 0.95, 0)
		v4.Position = UDim2.new(0.0175, 0, 0.025, 0)
		v4.ZIndex = 0
		v1.Size = UDim2.new(10, 0, 9, 0)
		v1.Parent = parent
		v1.Name = "WallHack"
		v1.AlwaysOnTop = true
		v1.ResetOnSpawn = false
		v1.Adornee = parent:FindFirstChild("HumanoidRootPart")
		v2.Parent = v4
		v2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		v2.BackgroundTransparency = 0
		v2.Size = UDim2.new(0.9, 0, 0.98, 0)
		v2.Position = UDim2.new(0.05, 0, 0.01, 0)
		v3.CornerRadius = UDim.new(1, 0)
		v3.Parent = v2
		v5.Parent = v2
		v5.BackgroundColor3 = Color3.fromRGB(13, 191, 0)
		v5.BackgroundTransparency = 0
		v5.Size = UDim2.new(1, 0, Humanoid.Health/Humanoid.MaxHealth, 0)
		v6.CornerRadius = UDim.new(1, 0)
		v6.Parent = v5
		v7.Parent = v1
		v7.Text = "Name: "..parent.Name
		v7.Size = UDim2.new(0.6, 0, 0.2, 0)
		v7.Position = UDim2.new(0.2, 0, 0, 0)
		v7.BackgroundTransparency = 1
		v7.TextColor3 = Color3.fromRGB(255, 255, 255)
		v7.Font = Enum.Font.SourceSansBold
		v7.TextScaled = true
		v7.TextStrokeTransparency = 0
		v7.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		v8.Parent = v1
		v8.Text = Humanoid.Health.."/"..Humanoid.MaxHealth
		v8.Size = UDim2.new(0.6, 0, 0.2, 0)
		v8.Position = UDim2.new(0.2, 0, 0.8, 0)
		v8.BackgroundTransparency = 1
		v8.TextColor3 = Color3.fromRGB(13, 255, 0)
		v8.Font = Enum.Font.SourceSansBold
		v8.TextScaled = true
		v8.TextStrokeTransparency = 0
		v8.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		v9.Parent = v1
		v9.Size = UDim2.new(0.2, 0, 0.2, 0)
		v9.Position = UDim2.new(0.7, 0, 0.4, 0)
		v9.BackgroundTransparency = 0
		v9.BorderSizePixel = 0
		v10.Parent = v1
		v10.Size = UDim2.new(0.3, 0, 0.2, 0)
		v10.Position = UDim2.new(0.7, 0, 0.6, 0)
		v10.BackgroundTransparency = 1
		v10.TextColor3 = Color3.fromRGB(255, 255, 255)
		v10.Font = Enum.Font.SourceSansBold
		v10.TextScaled = true
		v10.TextStrokeTransparency = 0
		v10.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		if game.Teams:FindFirstChildOfClass("Team") and parentPlr then
			v9.BackgroundColor = parentPlr.TeamColor
		else
			v9.BackgroundColor3 = parent:FindFirstChildOfClass("BodyColors").TorsoColor3
		end
		Humanoid.HealthChanged:Connect(function()
			v5:TweenSize(UDim2.new(1, 0, Humanoid.Health/Humanoid.MaxHealth, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, false, function()
				v8.Text = Humanoid.Health.."/"..Humanoid.MaxHealth
			end)
		end)
		Humanoid.Died:Connect(function()
			v1:Destroy()
			for i=1, #parent:GetChildren() do
				local CP = parent:GetChildren()[i]
				if CP:IsA("MeshPart") then
					for o=1, #CP:GetChildren() do
						if CP:GetChildren()[o]:IsA("BoxHandleAdornment") then
							CP:GetChildren()[o]:Destroy()
						end
					end
				end
				if CP:IsA("Part") then
					for o=1, #CP:GetChildren() do
						if CP:GetChildren()[o]:IsA("BoxHandleAdornment") then
							CP:GetChildren()[o]:Destroy()
						end
					end
				end
			end
		end)
		local thumbnailType = Enum.ThumbnailType.HeadShot
		local thumbnailSize = Enum.ThumbnailSize.Size352x352
		if game.Players:FindFirstChild(parent.Name) then
			local content, IsPlayer = game.Players:GetUserThumbnailAsync(parentPlr.UserId, thumbnailType, thumbnailSize)
			v9.Image = content
		end
		if parent:FindFirstChildOfClass("Tool") then
			v10.Text = parent:FindFirstChildOfClass("Tool").Name
		else
			v10.Text = "ToolName"
		end
		parent.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then
				wait(.05)
				v10.Text = child.Name
			end
		end)
		parent.ChildRemoved:Connect(function(child)
			if child:IsA("Tool") then
				wait(.03)
				v10.Text = "ToolName"
			end
		end)
		table.insert(esp, v1)
	end
	for o=1, #game.Players:GetPlayers() do
		local player = game.Players:GetPlayers()[o]
		if player ~= plr then
			local char = player.Character
			if char then
				SetWH(char)
				for i=1, #char:GetChildren() do
					local v = char:GetChildren()[i]
					if v:IsA("BasePart") then
						local Box = Box(v)
						table.insert(esp, Box)
					elseif v:IsA("Part") then
						local Box = Box(v)
						table.insert(esp, Box)
					end
				end
			end
		end
	end
end)

addcmd("unesp", false, function()
	for i=1, #esp do
		esp[i]:Destroy()
	end
	esp = {}
end)
