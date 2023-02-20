getgenv().esp = false
local highlights = {}
 
function start()
    while task.wait() do
        local esp = getgenv().esp
        local rake = game.Workspace:FindFirstChild("Rake")
        local rakeHighlight = game.CoreGui:FindFirstChild("Rake")
 
        if esp and rake then
            if not rakeHighlight then
                local highlight = Instance.new("Highlight", game.CoreGui)
                highlight.Name = "Rake"
                highlight.Adornee = rake
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlights[rake] = highlight
            end
        else
            if rakeHighlight then
                rakeHighlight:Destroy()
                highlights[rake] = nil
            end
        end
    end
end
 
 
local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/cypherdh/VanisUILIB/main/.gitignore'))()
 
local Window = library:CreateWindow("Rake ESP", "Made by Bebedi#9960", 10044538000)
 
local Tab = Window:CreateTab("Main")
 
local Page = Tab:CreateFrame("ESP")
 
 
 
Toggle = Page:CreateToggle("Rake ESP", "Shows the Rake", function(arg)
    getgenv().esp = arg
    start()
end)
