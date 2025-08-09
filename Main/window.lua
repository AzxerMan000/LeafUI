local Themes = loadstring(game:HttpGet("https:/raw.githubusercontent.com/Azxerman000/LeafUI/main/Main/themes.lua"))()
local Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzxerMan000/LeafUI/main/Main/utils.lua"))()

local Window = {}

function Window.new(title, themeName)
    local gui = {}
    gui.Theme = Themes[themeName] or Themes.Default
    gui.Tabs = {}

    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    gui.Screen = Instance.new("ScreenGui")
    gui.Screen.Name = "LeafGUI"
    gui.Screen.ResetOnSpawn = false
    gui.Screen.Parent = playerGui

    gui.MainFrame = Instance.new("Frame")
    gui.MainFrame.Size = UDim2.new(0, 500, 0, 300)
    gui.MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    gui.MainFrame.BackgroundColor3 = gui.Theme.Background
    gui.MainFrame.Active = true
    gui.MainFrame.Draggable = true
    gui.MainFrame.Parent = gui.Screen
    Utils.MakeCorner(gui.MainFrame, 8)

    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.BackgroundColor3 = gui.Theme.Accent
    TitleBar.Parent = gui.MainFrame

    local TitleText = Instance.new("TextLabel")
    TitleText.Size = UDim2.new(1, -60, 1, 0)
    TitleText.Position = UDim2.new(0, 10, 0, 0)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = title
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextSize = 14
    TitleText.TextColor3 = gui.Theme.Text
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.Parent = TitleBar

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -30, 0, 0)
    CloseBtn.Text = "X"
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 14
    CloseBtn.TextColor3 = gui.Theme.Text
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Parent = TitleBar
    CloseBtn.MouseButton1Click:Connect(function()
        gui.Screen.Enabled = false
    end)

    local MinBtn = Instance.new("TextButton")
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -60, 0, 0)
    MinBtn.Text = "-"
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 14
    MinBtn.TextColor3 = gui.Theme.Text
    MinBtn.BackgroundTransparency = 1
    MinBtn.Parent = TitleBar
    MinBtn.MouseButton1Click:Connect(function()
        gui.MainFrame.Visible = not gui.MainFrame.Visible
    end)

    gui.TabContainer = Instance.new("ScrollingFrame")
    gui.TabContainer.Size = UDim2.new(0, 120, 1, -30)
    gui.TabContainer.Position = UDim2.new(0, 0, 0, 30)
    gui.TabContainer.BackgroundColor3 = gui.Theme.TabBackground
    gui.TabContainer.ScrollBarThickness = 4
    gui.TabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
    gui.TabContainer.Parent = gui.MainFrame

    local tabListLayout = Instance.new("UIListLayout")
    tabListLayout.Parent = gui.TabContainer
    tabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabListLayout.Padding = UDim.new(0, 4)

    gui.ContentFrame = Instance.new("Frame")
    gui.ContentFrame.Size = UDim2.new(1, -120, 1, -30)
    gui.ContentFrame.Position = UDim2.new(0, 120, 0, 30)
    gui.ContentFrame.BackgroundTransparency = 1
    gui.ContentFrame.Parent = gui.MainFrame

    return gui
end

return Window
