
local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzxerMan000/LeafUI/main/Main/utils.lua"))()

local Tab = {}

function Tab.Add(gui, tabName)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Size = UDim2.new(1, -8, 0, 28)
    tabBtn.Text = tabName
    tabBtn.Font = Enum.Font.Gotham
    tabBtn.TextSize = 14
    tabBtn.TextColor3 = gui.Theme.Text
    tabBtn.BackgroundColor3 = gui.Theme.Accent
    tabBtn.Parent = gui.TabContainer
    Utils.MakeCorner(tabBtn, 4)

    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, 0, 1, 0)
    content.BackgroundTransparency = 1
    content.Visible = false
    content.Parent = gui.ContentFrame

    tabBtn.MouseButton1Click:Connect(function()
        for _, child in ipairs(gui.ContentFrame:GetChildren()) do
            if child:IsA("Frame") then
                child.Visible = false
            end
        end
        content.Visible = true
    end)

    table.insert(gui.Tabs, {Name = tabName, Button = tabBtn, Content = content})
    return content
end

return Tab
