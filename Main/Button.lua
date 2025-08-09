local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzxerMan000/LeafUI/main/Main/utils.lua"))()

local Button = {}

function Button.Add(parentFrame, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 150, 0, 30)
    btn.BackgroundColor3 = parentFrame.Parent.Theme.Accent
    btn.TextColor3 = parentFrame.Parent.Theme.Text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.Text = text
    btn.Parent = parentFrame

    Utils.MakeCorner(btn, 6)

    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)

    return btn
end

return Button
