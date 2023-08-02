local Players = game:GetService("Players")
local targetPlayerName = "Inthermals"
local player = game.Players.LocalPlayer
local character = player.Character



-- Command Functions


local function teleportToHost()
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
local function freezeCharacter()
    if character then
        -- Store the current humanoid state
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Seated)
        end
    end
end


local function unfreezeCharacter()
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
        if message:lower() == "!bring" then
            print("Bringing Account!")
            teleportToHost()
        end
    end
end




local function onPlayerChatted(message, player)
    if player.Name == targetPlayerName then
        print(string.format("[%s]: %s", player.Name, message))
        if message:lower() == "!freeze" then
            print("Freezing Account!")
            freezeCharacter()
        end
    end
end


local function onPlayerChatted(message, player)
    if player.Name == targetPlayerName then
        print(string.format("[%s]: %s", player.Name, message))
        if message:lower() == "!unfreeze" then
            print("Freezing Account!")
            unfreezeCharacter()
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
