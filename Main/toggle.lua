local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzxerMan000/LeafUI/main/Main/utils.lua"))()

local Toggle = {}

function Toggle.Add(parentFrame, text, default, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 150, 0, 30)
    frame.BackgroundTransparency = 1
    frame.Parent = parentFrame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 30, 1, 0)
    btn.BackgroundColor3 = parentFrame.Parent.Theme.TabBackground
    btn.Position = UDim2.new(1, -30, 0, 0)
    btn.Text = ""
    btn.Parent = frame
    Utils.MakeCorner(btn, 6)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -35, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = parentFrame.Parent.Theme.Text
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local toggled = default or false
    local function updateVisual()
        if toggled then
            btn.BackgroundColor3 = parentFrame.Parent.Theme.Accent
        else
            btn.BackgroundColor3 = parentFrame.Parent.Theme.TabBackground
        end
    end

    updateVisual()

    btn.MouseButton1Click:Connect(function()
        toggled = not toggled
        updateVisual()
        if callback then callback(toggled) end
    end)

    return frame
end

return Toggle
