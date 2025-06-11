-- GhostReap990 Hub | Made by ReapsReality & GhostByte

local key = "reapsreality990key8"
local input = Instance.new("TextBox")
input.Text = ""
input.PlaceholderText = "Enter Key Here"
input.Parent = game:GetService("CoreGui")
input.Size = UDim2.new(0, 200, 0, 50)
input.Position = UDim2.new(0.5, -100, 0.5, -25)
input.TextScaled = true

local function destroyScript()
    script:Destroy()
end

input.FocusLost:Connect(function()
    if input.Text == key then
        input:Destroy()

        -- Ear rape sound (verified working)
        local earSound = Instance.new("Sound", game.Workspace)
        earSound.SoundId = "rbxassetid://9122196334"
        earSound.Volume = 10
        earSound:Play()

        -- Main GUI
        local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
        ScreenGui.Name = "GhostReap990Hub"
        ScreenGui.ResetOnSpawn = false

        local Frame = Instance.new("Frame", ScreenGui)
        Frame.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
        Frame.Size = UDim2.new(0, 400, 0, 300)
        Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
        Frame.Name = "MainUI"
        Frame.Visible = true

        local title = Instance.new("TextLabel", Frame)
        title.Text = "GhostReap990 Hub"
        title.Size = UDim2.new(1, 0, 0, 50)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBlack
        title.TextColor3 = Color3.fromRGB(255, 0, 0)
        title.TextScaled = true

        -- Minimize button
        local MinBtn = Instance.new("TextButton", Frame)
        MinBtn.Text = "-"
        MinBtn.Size = UDim2.new(0, 50, 0, 50)
        MinBtn.Position = UDim2.new(1, -50, 0, 0)
        MinBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        MinBtn.TextScaled = true

        local minimized = false
        MinBtn.MouseButton1Click:Connect(function()
            minimized = not minimized
            Frame.Visible = not minimized
        end)

        -- Hotkey reopen (Right Control)
        game:GetService("UserInputService").InputBegan:Connect(function(keyEvent)
            if keyEvent.KeyCode == Enum.KeyCode.RightControl then
                Frame.Visible = true
                minimized = false
            end
        end)

        -- Command bar
        local CmdBox = Instance.new("TextBox", ScreenGui)
        CmdBox.Size = UDim2.new(0, 300, 0, 40)
        CmdBox.Position = UDim2.new(0.5, -150, 1, -50)
        CmdBox.PlaceholderText = "Enter Command Here"
        CmdBox.Visible = false
        CmdBox.TextScaled = true
        CmdBox.BackgroundColor3 = Color3.fromRGB(80, 0, 0)

        -- Command bar toggle (; key)
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Semicolon then
                CmdBox.Visible = not CmdBox.Visible
                CmdBox:CaptureFocus()
            end
        end)

        -- Command handler
        CmdBox.FocusLost:Connect(function()
            local txt = CmdBox.Text
            if txt:lower():sub(1,5) == "goto " then
                local targetName = txt:sub(6)
                local players = game.Players:GetPlayers()
                for _, plr in pairs(players) do
                    if plr.Name:lower():sub(1, #targetName) == targetName:lower() then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
                    end
                end
            end
            CmdBox.Text = ""
        end)

        -- Lag Switch
        local lagActive = false
        local toggleLag = Instance.new("TextButton", Frame)
        toggleLag.Text = "Lag Server"
        toggleLag.Size = UDim2.new(0, 120, 0, 40)
        toggleLag.Position = UDim2.new(0, 10, 0, 60)
        toggleLag.BackgroundColor3 = Color3.fromRGB(150,0,0)
        toggleLag.TextScaled = true

        toggleLag.MouseButton1Click:Connect(function()
            lagActive = not lagActive
            if lagActive then
                while lagActive do
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("SpamPayload")
                    wait()
                end
            end
        end)

        -- Godmode toggle (Method 1: Clone Humanoid)
        local godMode = Instance.new("TextButton", Frame)
        godMode.Text = "Godmode (Clone)"
        godMode.Size = UDim2.new(0, 120, 0, 40)
        godMode.Position = UDim2.new(0, 10, 0, 110)
        godMode.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        godMode.TextScaled = true

        godMode.MouseButton1Click:Connect(function()
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local clone = humanoid:Clone()
                humanoid.Parent = nil
                clone.Parent = game.Players.LocalPlayer.Character
            end
        end)

        -- Remote Blocker toggle
        local blockRemotes = false
        local remoteBlockBtn = Instance.new("TextButton", Frame)
        remoteBlockBtn.Text = "Remote Blocker"
        remoteBlockBtn.Size = UDim2.new(0, 120, 0, 40)
        remoteBlockBtn.Position = UDim2.new(0, 140, 0, 110)
        remoteBlockBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 150)
        remoteBlockBtn.TextScaled = true

        remoteBlockBtn.MouseButton1Click:Connect(function()
            blockRemotes = not blockRemotes
            if blockRemotes then
                getrawmetatable(game).__namecall = newcclosure(function(self, ...)
                    local method = getnamecallmethod()
                    if method == "FireServer" or method == "InvokeServer" then
                        return
                    end
                    return old(self, ...)
                end)
            else
                setreadonly(getrawmetatable(game), false)
                getrawmetatable(game).__namecall = old
                setreadonly(getrawmetatable(game), true)
            end
        end)

        -- Phantom Escape toggle
        local escapeBtn = Instance.new("TextButton", Frame)
        escapeBtn.Text = "Phantom Escape"
        escapeBtn.Size = UDim2.new(0, 120, 0, 40)
        escapeBtn.Position = UDim2.new(0, 270, 0, 110)
        escapeBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 120)
        escapeBtn.TextScaled = true

        escapeBtn.MouseButton1Click:Connect(function()
            local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then
                root.Anchored = false
                root.CFrame = CFrame.new(9999,9999,9999)
            end
        end)

    else
        -- Wrong key, destroy everything
        game:GetService("CoreGui"):ClearAllChildren()
        destroyScript()
    end
end)
