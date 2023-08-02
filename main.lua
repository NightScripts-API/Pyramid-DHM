local Players = game:GetService("Players")
local targetPlayerName = "Inthermals"

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



local function onPlayerChatted(message, player)
    if player.Name == targetPlayerName then
        print(string.format("[%s]: %s", player.Name, message))
        if message:lower() == "!bring" then
            print("Bringing Account!")
            teleportToHost()
        end
    end
end

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
