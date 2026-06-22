-- Modern Key System GUI
-- Generated for a sleek, dark-themed aesthetic

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Configuration (Change these values easily)
local CORRECT_KEY = "MySecretKey2026"
local KEY_LINK = "https://link-to-your-key-system.com"

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModernKeySystem"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Main Canvas Group (Allows for smooth fade-in animations)
local mainGroup = Instance.new("CanvasGroup")
mainGroup.Size = UDim2.new(0, 420, 0, 240)
mainGroup.Position = UDim2.new(0.5, -210, 0.5, -120)
mainGroup.BackgroundColor3 = Color3.fromRGB(25, 25, 30) -- Deep dark background
mainGroup.BorderSizePixel = 0
mainGroup.GroupAlpha = 0 -- Start hidden for fade-in
mainGroup.Parent = screenGui

-- Rounded Corners for Main Frame
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainGroup

-- Subtle Gradient Border Effect
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(45, 45, 55)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = mainGroup

-- Title Bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "KEY SYSTEM REQUIRED"
title.TextColor3 = Color3.fromRGB(240, 240, 245)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = mainGroup

-- Key Input TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 360, 0, 45)
textBox.Position = UDim2.new(0.5, -180, 0, 70)
textBox.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
textBox.BorderSizePixel = 0
textBox.Text = ""
textBox.PlaceholderText = "Enter your key here..."
textBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 14
textBox.Parent = mainGroup

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 8)
boxCorner.Parent = textBox

-- Status Indicator (For wrong keys)
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 360, 0, 20)
statusLabel.Position = UDim2.new(0.5, -180, 0, 120)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
statusLabel.Font = Enum.Font.GothamMedium
statusLabel.TextSize = 12
statusLabel.Parent = mainGroup

-- BUTTON CONTAINER (Left and Right setup)
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 360, 0, 45)
buttonContainer.Position = UDim2.new(0.5, -180, 0, 155)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainGroup

-- LEFT SIDE: Check Key Button
local checkKeyBtn = Instance.new("TextButton")
checkKeyBtn.Size = UDim2.new(0, 170, 1, 0)
checkKeyBtn.Position = UDim2.new(0, 0, 0, 0)
checkKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255) -- Vibrant Blue
checkKeyBtn.BorderSizePixel = 0
checkKeyBtn.Text = "Check Key"
checkKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
checkKeyBtn.Font = Enum.Font.GothamBold
checkKeyBtn.TextSize = 14
checkKeyBtn.Parent = buttonContainer

local checkCorner = Instance.new("UICorner")
checkCorner.CornerRadius = UDim.new(0, 8)
checkCorner.Parent = checkKeyBtn

-- RIGHT SIDE: Copy Link Button
local copyLinkBtn = Instance.new("TextButton")
copyLinkBtn.Size = UDim2.new(0, 170, 1, 0)
copyLinkBtn.Position = UDim2.new(1, -170, 0, 0)
copyLinkBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45) -- Sleek Slate Gray
copyLinkBtn.BorderSizePixel = 0
copyLinkBtn.Text = "Copy Link"
copyLinkBtn.TextColor3 = Color3.fromRGB(200, 200, 205)
copyLinkBtn.Font = Enum.Font.GothamBold
copyLinkBtn.TextSize = 14
copyLinkBtn.Parent = buttonContainer

local copyCorner = Instance.new("UICorner")
copyCorner.CornerRadius = UDim.new(0, 8)
copyCorner.Parent = copyLinkBtn


-- ====================
-- INTERACTION SCRIPTS
-- ====================

-- 1. Fade In Intro Animation
TweenService:Create(mainGroup, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {GroupAlpha = 1}):Play()

-- 2. Dragging Functionality
local dragging, dragInput, dragStart, startPos
local function update(input)
	local delta = input.Position - dragStart
	mainGroup.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainGroup.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = mainGroup.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then dragging = false end
		end)
	end
end)

mainGroup.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then update(input) end
end)

-- 3. Copy Link Action
copyLinkBtn.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(KEY_LINK)
		copyLinkBtn.Text = "Copied!"
		task.wait(1.5)
		copyLinkBtn.Text = "Copy Link"
	else
		copyLinkBtn.Text = "Error: No Clipboard Support"
		task.wait(1.5)
		copyLinkBtn.Text = "Copy Link"
	end
end)

-- 4. Check Key Action
checkKeyBtn.MouseButton1Click:Connect(function()
	local enteredKey = textBox.Text
	
	if enteredKey == CORRECT_KEY then
		statusLabel.TextColor3 = Color3.fromRGB(75, 255, 75)
		statusLabel.Text = "Access Granted! Loading script..."
		
		-- Fade out and destroy UI
		local fadeTween = TweenService:Create(mainGroup, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {GroupAlpha = 0})
		fadeTween:Play()
		fadeTween.Completed:Connect(function()
			screenGui:Destroy()
			
			-- Put your actual script execution trigger here!
			print("Your main script goes here.")
		end)
	else
		statusLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
		statusLabel.Text = "Incorrect Key! Please try again."
		textBox.Text = ""
	end
end)