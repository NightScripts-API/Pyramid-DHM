local Players = game:GetService("Players")
local targetPlayerName = "Inthermals";
local player = game.Players.LocalPlayer
local character = player.Character
local LocalPlr = Players.LocalPlayer
local SelectedPlayer = ""
local TargetPlr = nil









-- Ignore GUI



-- Function to create a shadow for the panel




local function createShadow(frame)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://"
    shadow.ImageColor3 = Color3.new(0, 0, 0)
    shadow.ImageTransparency = 0.6
    shadow.Position = UDim2.new(0, -6, 0, -6)
    shadow.Size = UDim2.new(1, 12, 1, 12)
    shadow.Parent = frame
end

-- Create the UI
local gui = Instance.new("ScreenGui")
gui.Name = "PyramidUI"
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.ResetOnSpawn = false

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.BackgroundColor3 = Color3.new(0, 0, 0)
panel.BackgroundTransparency = 0.1
panel.Position = UDim2.new(0.5, -200, 0.3, 0)
panel.Size = UDim2.new(0, 400, 0, 200) -- A LOT bigger panel
panel.ZIndex = 0
panel.Parent = gui

-- Create the title and settings button
local title = Instance.new("TextLabel")
title.Name = "Title"
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.Text = "Pyramid v1.8"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 20
title.Position = UDim2.new(0.5, -100, 0, 5)
title.Size = UDim2.new(0, 200, 0, 30)
title.Parent = panel

createShadow(title)

local settingsButton = Instance.new("TextButton")
settingsButton.Name = "SettingsButton"
settingsButton.BackgroundColor3 = Color3.new(0, 0.25, 0.5)
settingsButton.BackgroundTransparency = 0.5
settingsButton.Font = Enum.Font.SourceSans
settingsButton.Text = "Settings"
settingsButton.TextColor3 = Color3.new(1, 1, 1)
settingsButton.TextSize = 14
settingsButton.Position = UDim2.new(0.5, 55, 0, 5)
settingsButton.Size = UDim2.new(0, 70, 0, 25)
settingsButton.AutoButtonColor = false
settingsButton.Parent = panel

createShadow(settingsButton)

-- ... (previous code remains unchanged)

-- Create the "Host" label, TextBox, and "Set Host" button
local hostLabel = Instance.new("TextLabel")
hostLabel.Name = "HostLabel"
hostLabel.BackgroundTransparency = 1
hostLabel.Font = Enum.Font.SourceSansBold
hostLabel.Text = "Host:"
hostLabel.TextColor3 = Color3.new(1, 1, 1)
hostLabel.TextSize = 16
hostLabel.Position = UDim2.new(0, 5, 0, 110)
hostLabel.Size = UDim2.new(0, 60, 0, 25)
hostLabel.Parent = panel

local hostTextBox = Instance.new("TextBox")
hostTextBox.Name = "HostTextBox"
hostTextBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
hostTextBox.BackgroundTransparency = 0.5
hostTextBox.Font = Enum.Font.SourceSans
hostTextBox.Text = ""
hostTextBox.TextColor3 = Color3.new(1, 1, 1)
hostTextBox.TextSize = 14
hostTextBox.Position = UDim2.new(0, 70, 0, 110)
hostTextBox.Size = UDim2.new(0.7, -90, 0, 25)
hostTextBox.Parent = panel

local setHostButton = Instance.new("TextButton")
setHostButton.Name = "SetHostButton"
setHostButton.BackgroundColor3 = Color3.new(0, 0.25, 0.5)
setHostButton.BackgroundTransparency = 0.5
setHostButton.Font = Enum.Font.SourceSansBold
setHostButton.Text = "Set Host"
setHostButton.TextColor3 = Color3.new(1, 1, 1)
setHostButton.TextSize = 14
setHostButton.Position = UDim2.new(0, 5, 0, 150)
setHostButton.Size = UDim2.new(0.3, -2, 0, 20)
setHostButton.AutoButtonColor = false
setHostButton.Parent = panel

-- Function to animate the "Set Host" button
local originalSize = setHostButton.Size

local function removeit()
		 hostLabel.Visible = false;
    hostTextBox.Visible = false;
    setHostButton.Visible = false;

end

removeit()

local function animateSetHostButton()
	
    setHostButton.Size = UDim2.new(0.9, 0, 0, 30)
    wait(0.1)
    setHostButton.BackgroundColor3 = Color3.new(0, 1, 0)
    wait(0.2)
    setHostButton.Size = originalSize
    wait(0.1)
    setHostButton.BackgroundColor3 = Color3.new(0, 0.25, 0.5)
end

setHostButton.MouseButton1Click:Connect(animateSetHostButton)

-- ... (remaining code remains unchanged)


-- Create the dynamic text
local connectedText = Instance.new("TextLabel")
connectedText.Name = "ConnectedText"
connectedText.BackgroundTransparency = 1
connectedText.Font = Enum.Font.SourceSans
connectedText.Text = "Connected: "
connectedText.TextColor3 = Color3.new(1, 1, 1)
connectedText.TextSize = 16
connectedText.Position = UDim2.new(0, 5, 0, 40)
connectedText.Size = UDim2.new(1, -10, 0, 30)
connectedText.Parent = panel

local rainbowText = Instance.new("TextLabel")
rainbowText.Name = "RainbowText"
rainbowText.BackgroundTransparency = 1
rainbowText.Font = Enum.Font.SourceSans
rainbowText.Text = targetPlayerName;
rainbowText.TextColor3 = Color3.new(1, 1, 1)
rainbowText.TextSize = 18
rainbowText.Position = UDim2.new(0, 5, 0, 70)
rainbowText.Size = UDim2.new(1, -10, 0, 30)
rainbowText.Parent = panel

-- Create the close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.BackgroundColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundTransparency = 0.5
closeButton.Font = Enum.Font.SourceSans
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(0, 0, 0)
closeButton.TextSize = 16
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.AutoButtonColor = false
closeButton.Parent = panel

createShadow(closeButton)

-- Create the settings mini panel
local settingsPanel = Instance.new("Frame")
settingsPanel.Name = "SettingsPanel"
settingsPanel.BackgroundColor3 = Color3.new(0, 0.25, 0.5)
settingsPanel.BackgroundTransparency = 0.5
settingsPanel.Position = UDim2.new(0, 5, 0, 35)
settingsPanel.Size = UDim2.new(1, -10, 0, 130)
settingsPanel.Visible = false
settingsPanel.Parent = panel

createShadow(settingsPanel)

-- Create the settings title
local settingsTitle = Instance.new("TextLabel")
settingsTitle.Name = "SettingsTitle"
settingsTitle.BackgroundTransparency = 1
settingsTitle.Font = Enum.Font.SourceSansBold
settingsTitle.Text = "Settings"
settingsTitle.TextColor3 = Color3.new(1, 1, 1)
settingsTitle.TextSize = 16
settingsTitle.Position = UDim2.new(0.5, -50, 0, 5)
settingsTitle.Size = UDim2.new(0, 100, 0, 30)
settingsTitle.Parent = settingsPanel


-- Create two settings buttons
local button1 = Instance.new("TextButton")
button1.Name = "Button1"
button1.BackgroundColor3 = Color3.new(0.1, 0.2, 0.3)
button1.BackgroundTransparency = 0.5
button1.Font = Enum.Font.SourceSans
button1.Text = "Coming Soon.."
button1.TextColor3 = Color3.new(1, 1, 1)
button1.TextSize = 14
button1.Position = UDim2.new(0.5, -50, 0, 40)
button1.Size = UDim2.new(0, 100, 0, 25)
button1.AutoButtonColor = false
button1.Parent = settingsPanel

local button2 = Instance.new("TextButton")
button2.Name = "Button2"
button2.BackgroundColor3 = Color3.new(0.1, 0.2, 0.3)
button2.BackgroundTransparency = 0.5
button2.Font = Enum.Font.SourceSans
button2.Text = "Coming Soon..."
button2.TextColor3 = Color3.new(1, 1, 1)
button2.TextSize = 14
button2.Position = UDim2.new(0.5, -50, 0, 75)
button2.Size = UDim2.new(0, 100, 0, 25)
button2.AutoButtonColor = false
button2.Parent = settingsPanel

-- Function to toggle the settings mini panel
-- Function to toggle the settings mini panel
-- ... (previous code remains unchanged)

-- Function to toggle the settings mini panel
local settingsOpen = false

local function toggleSettings()
    settingsOpen = not settingsOpen
    settingsPanel.Visible = settingsOpen

    -- Hide other elements in the background
    
    connectedText.Visible = not settingsOpen
    rainbowText.Visible = not settingsOpen
    closeButton.Visible = not settingsOpen
    hostLabel.Visible = not settingsOpen
    hostTextBox.Visible = not settingsOpen
    setHostButton.Visible = not settingsOpen

    -- Show settings button and panel title even when settings are open
    settingsButton.Visible = true
    settingsTitle.Visible = settingsOpen
end

settingsButton.MouseButton1Click:Connect(toggleSettings)

-- Function to handle Button1 and Button2 click events
button1.MouseButton1Click:Connect(function()
    print("Hey from Button1!")
end)

button2.MouseButton1Click:Connect(function()
    print("Hey from Button2!")
end)

-- ... (remaining code remains unchanged)


-- Function to make the title bar draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = panel.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Function to animate the settings button
local function animateButton()
    local buttonColor = settingsButton.BackgroundColor3
    local targetColor = settingsOpen and Color3.new(0, 0.5, 1) or Color3.new(0, 0.25, 0.5)
    for i = 1, 10 do
        settingsButton.BackgroundColor3 = buttonColor:Lerp(targetColor, i * 0.1)
        wait(0.03)
    end
end

settingsButton.MouseButton1Click:Connect(animateButton)

-- Run the rainbow text animation
local hue = 0
game:GetService("RunService").RenderStepped:Connect(function()
    hue = (hue + 1) % 360
    local hueColor = Color3.fromHSV(hue / 360, 1, 1)
    rainbowText.TextColor3 = hueColor
end)

-- Function to destroy the GUI
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)


































































local StrafeSpeed = 0

local TargetStrafe = {
    Enabled = false,
    Speed = 30,
    Distance = 1,
    Height = 3
}

local function getPlr()
    StrafeSpeed = StrafeSpeed + TargetStrafe.Speed

    if TargetPlr then
        LocalPlr.Character.HumanoidRootPart.CFrame = TargetPlr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(StrafeSpeed), 0) * CFrame.new(0, TargetStrafe.Height, TargetStrafe.Distance)
    end
end

local heartbeatConnection
heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(getPlr)

local function getStop()
    heartbeatConnection:Disconnect()
end




-- Command Functions


local function tpHOST()
    local targetPlayer = Players:FindFirstChild(targetPlayerName)

    if targetPlayer then
        local targetCharacter = targetPlayer.Character
        if targetCharacter then
            local targetPosition = targetCharacter.PrimaryPart.Position




			local function teleportTo(position)
    local character = game.Players.LocalPlayer.Character
    if character then
        character:SetPrimaryPartCFrame(CFrame.new(position))
    end
end

local function getPreviousPosition()
    local character = game.Players.LocalPlayer.Character
    if character then
        return character.PrimaryPart.CFrame.Position
    end
end

local function handleTeleporting()
 
    local prevPosition = getPreviousPosition()

    -- Freeze the player
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
    end

    -- Teleport the player 500 units away
    local teleportPosition = targetCharacter.PrimaryPart.Position
    teleportTo(teleportPosition)

    -- Wait for 1 second (you can adjust the duration as needed)
    wait(1)

    -- Attempt to teleport the player back to the previous position
    repeat
        teleportTo(prevPosition)
        wait()
    until (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - prevPosition).Magnitude <= 1

    -- Check if the player is still alive, if not, wait for them to respawn
    while game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= 0 do
        wait()
    end

    -- Unfreeze the player after teleporting back and respawn
    if humanoid then
        humanoid.PlatformStand = false
    end

    -- Enable checking armor again once the armor value is above 10
end

handleTeleporting()


			


			
        end
    end
end



-- Function to freeze the character's movement
local function freeze()
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
end


local function unfreeze()
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end










-- Command Executer




local function onPlayerChatted(message, player)
    if player.Name == targetPlayerName then
        print(string.format("[%s]: %s", player.Name, message))
        
        -- Command Yeti v2.7 By Badovh
        
        
        if message:lower() == "!bring" then
            print("Bringing Account!")
            tpHOST()
        end
        
        
          if message:lower() == "!freeze" then
            print("Freezing Account!")
            freeze()
        end
        
        
          if message:lower() == "!unfreeze" then
            print("Unfreezing Account!")
            unfreeze()
        end


         if message:sub(1, 5):lower() == "!get " then
            local playerName = message:sub(6) -- Extract the player name from the message

            if playerName ~= "" then
                print("Getting player: " .. playerName)
                SelectedPlayer = playerName -- Set the player name in the SelectedPlayer variable
                TargetPlr = Players:FindFirstChild(SelectedPlayer)
                getPlr() -- Start following the selected player
            else
                print("Invalid player name")
            end
        end

        if message:lower() == "!stopget" then
            print("Stopping!")
            getStop()
        end



		    if message:sub(1, 5):lower() == "!say " then
            local text = message:sub(6) -- Extract the player name from the message

            if text ~= "" then
                print("Saying player: " .. text)
               game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
            else
                print("Invalid player name")
            end
        end


        
        
        
        
    end
end

















-- Control Jet

Players.PlayerAdded:Connect(function(player)
    if player.Name == targetPlayerName then
        player.Chatted:Connect(function(message)
            onPlayerChatted(message, player)
        end)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player.Name == targetPlayerName then
        player.Chatted:Connect(function(message)
            onPlayerChatted(message, player)
        end)
    end
end















































local StrafeSpeed = 0

local TargetStrafe = {
    Enabled = false,
    Speed = 30,
    Distance = 1,
    Height = 3
}

local function getPlr()
    StrafeSpeed = StrafeSpeed + TargetStrafe.Speed

    if TargetPlr then
        LocalPlr.Character.HumanoidRootPart.CFrame = TargetPlr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(StrafeSpeed), 0) * CFrame.new(0, TargetStrafe.Height, TargetStrafe.Distance)
    end
end

local heartbeatConnection
heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(getPlr)

local function getStop()
    heartbeatConnection:Disconnect()
end




-- Command Functions


local function tpHOST()
    local targetPlayer = Players:FindFirstChild(targetPlayerName)

    if targetPlayer then
        local targetCharacter = targetPlayer.Character
        if targetCharacter then
            local targetPosition = targetCharacter.PrimaryPart.Position
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
        end
    end
end



-- Function to freeze the character's movement
local function freeze()
    if character then
        -- Store the current humanoid state
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Seated)
        end
    end
end


local function unfreeze()
    if character then
        -- Store the current humanoid state
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.None) -- Change back to "None" to enable movement.
        end
    end
end










-- Command Executer




local function onPlayerChatted(message, player)
    if player.Name == targetPlayerName then
        print(string.format("[%s]: %s", player.Name, message))
        
        -- Command Yeti v2.7 By Badovh
        
        
        if message:lower() == "!bring" then
            print("Bringing Account!")
            tpHOST()
        end
        
        
          if message:lower() == "!freeze" then
            print("Freezing Account!")
            freeze()
        end
        
        
          if message:lower() == "!unfreeze" then
            print("Unfreezing Account!")
            unfreeze()
        end


         if message:sub(1, 5):lower() == "!get " then
            local playerName = message:sub(6) -- Extract the player name from the message

            if playerName ~= "" then
                print("Getting player: " .. playerName)
                SelectedPlayer = playerName -- Set the player name in the SelectedPlayer variable
                TargetPlr = Players:FindFirstChild(SelectedPlayer)
                getPlr() -- Start following the selected player
            else
                print("Invalid player name")
            end
        end

        if message:lower() == "!stopget" then
            print("Stopping!")
            getStop()
        end
        
        
        
    end
end

















-- Control Jet

Players.PlayerAdded:Connect(function(player)
    if player.Name == targetPlayerName then
        player.Chatted:Connect(function(message)
            onPlayerChatted(message, player)
        end)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player.Name == targetPlayerName then
        player.Chatted:Connect(function(message)
            onPlayerChatted(message, player)
        end)
    end
end
