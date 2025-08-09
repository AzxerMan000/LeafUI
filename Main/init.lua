local Leaf = {}

Leaf.Themes = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzxerMan000/LeafUI/main/Main/themes.lua"))()
Leaf.Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzxerMan000/LeafUI/main/Main/window.lua"))()
Leaf.Tab = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzxerMan000/LeafUI/main/Main/tab.lua"))()
Leaf.Utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzxerMan000/LeafUI/main/Main/utils.lua"))()

-- Constructor
function Leaf.new(title, themeName)
    return Leaf.Window.new(title, themeName or "Default")
end

-- Theme setter
function Leaf:SetTheme(gui, themeName)
    local theme = Leaf.Themes[themeName]
    if theme then
        gui.Theme = theme
        gui.MainFrame.BackgroundColor3 = gui.Theme.Background
        gui.TabContainer.BackgroundColor3 = gui.Theme.TabBackground
    end
end

return Leaf
