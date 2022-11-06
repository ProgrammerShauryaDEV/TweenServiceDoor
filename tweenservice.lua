local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
local ProximityPromptService = game:GetService("ProximityPromptService")

ProximityPromptService.PromptTriggered:Connect(function(prompt, plr)
	if prompt.Name == "keycardDoor" then
		local sensor = prompt.Parent
		local door = sensor.Parent.door
		if plr.Character:FindFirstChild("keycard") then
			sensor.light.BrickColor = BrickColor.new("Lime green")
			
			local doorOpenTween = TweenService:Create(door.PrimaryPart, tweenInfo, {Position = door.PrimaryPart:GetAttribute("openPos")})
			doorOpenTween:Play()
			
			wait(3)
			
			local doorCloseTween = TweenService:Create(door.PrimaryPart, tweenInfo, {Position = door.PrimaryPart:GetAttribute("closePos")})
			doorCloseTween:Play()
			
			sensor.light.BrickColor = BrickColor.new("Neon orange")
		else
			sensor.light.BrickColor = BrickColor.new("Really red")
			wait(1)
			sensor.light.BrickColor = BrickColor.new("Neon orange")
		end
	end
end)
