local Players = game:GetService("Players")
local targetPlayerName = "Inthermals"
local player = game.Players.LocalPlayer
local character = player.Character
local LocalPlr = Players.LocalPlayer
local SelectedPlayer = ""
local TargetPlr = nil

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
