getgenv().esp = false



game.Workspace.ChildRemoved:Connect(function(v)
	if v.Name == "Rake" then
		for _,v in pairs(game.CoreGui:GetChildren()) do
			if v.Name == "Rake" then
				v:Destroy()
			end
		end
	end
end)


game.Workspace.ChildAdded:Connect(function(v)
	if getgenv().esp == true then
		if v.Name == "Rake" then
			local highlight = Instance.new("Highlight", game.CoreGui)
			highlight.Name = "Rake"
			highlight.Adornee = game:GetService("Workspace"):FindFirstChild("Rake")
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.FillColor = Color3.fromRGB(255, 0, 0)
			highlights[game:GetService("Workspace").Rake] = highlight
		end
	end
end)


function start()
	while task.wait() do
		if getgenv().esp == true then
			if game.Workspace:FindFirstChild("Rake") then
				if not game.CoreGui:FindFirstChild("Rake") then
					local highlight = Instance.new("Highlight", game.CoreGui)
					highlight.Name = "Rake"
					highlight.Adornee = game:GetService("Workspace").Rake
					highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					highlight.FillColor = Color3.fromRGB(255, 0, 0)
				end
			end
		else
			if getgenv().esp == false then
				if game.CoreGui:FindFirstChild("Rake") then
					for _,v in pairs(game.CoreGui:GetChildren()) do
						if v.Name == "Rake" then
							v:Destroy()
						end
					end
				end
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

