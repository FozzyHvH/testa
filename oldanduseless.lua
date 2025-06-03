repeat wait() until game:IsLoaded()

local Decimals = 4
local Clock = os.clock()
local ValueText = "Value Is Now :"

local repo = "https://raw.githubusercontent.com/f1nobe7650/Lynx/main/"

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local players = game:GetService("Players")

Drawing = Drawing
mousemoverel = mousemoverel

local CoreGui = game:GetService("CoreGui")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StarterGui = game:GetService("StarterGui")
local Stats = game:GetService("Stats")
local Camera = Workspace.Camera or Workspace.CurrentCamera

local TargetPlr, CamlockPlr
local LocalPlr = Players.LocalPlayer

local TargBindEnabled, CamBindEnabled = false, false

local TargResolvePos

local Connections = {}

local DrawBox = Drawing.new("Square")
DrawBox.Color = Color3.new(1, 1, 1)

local CFrameVisualize = Instance.new("Highlight", CoreGui)
CFrameVisualize.FillColor = Color3.new(1, 1, 1)
CFrameVisualize.OutlineColor = Color3.new(1, 1, 1)

local TargHighlight = Instance.new("Highlight", CoreGui)
TargHighlight.FillColor = Color3.new(1, 1, 1)
TargHighlight.OutlineColor = Color3.new(0, 0, 0)

local TargFovCircle = Drawing.new("Circle")
TargFovCircle.Thickness = 1.5
TargFovCircle.Visible = false
TargFovCircle.Color = Color3.new(1, 1, 1)

local CamHighlight = Instance.new("Highlight", CoreGui)
local CamTracerLine = Drawing.new("Line")
CamTracerLine.Thickness = 2

local StrafeSpeed = 0

local TargetAimbot = {
    Enabled = true, 
    Keybind = nil, 
    Autoselect = nil,

    Prediction = nil, 
    RealPrediction = nil, 

    Resolver = false, 
    ResolverType = "Recalculate", 

    JumpOffset = 0, 
    RealJumpOffset = nil, 

    HitParts = {"HumanoidRootPart"}, 
    RealHitPart = nil, 


    KoCheck = false, 

    LookAt = false, 
    ViewAt = false, 

    Tracer = false, 

    Highlight = false, 
    Stats = false, 

    UseFov = false
}

local CameraAimbot = {
    Enabled = false, 
    Keybind = nil, 

    Prediction = nil, 
    RealPrediction = nil, 

    Resolver = false, 
    ResolverType = "Recalculate", 

    JumpOffset = 0, 
    RealJumpOffset = nil, 

    HitPart = "HumanoidRootPart", 
    RealHitPart = nil, 

    UseAirPart = false, 
    AirPart = "LowerTorso", 
    AirCheckType = "Once in Air", 

    AutoPred = false, 

    Notify = false, 
    KoCheck = false, 

    Tracer = false, 
    Highlight = false, 

    AimMethod = "Camera", 

    Smoothing = false, 
    Smoothness = nil, 

    UseFov = false
}

local TargetStrafe = {
    Enabled = false, 
    Spoof = false,
    SavedCFrame = nil,

    Speed = 1, 
    Distance = 1, 
    Height = 1
}

local ESPHolder = Instance.new("Folder", (CoreGui or LocalPlr.PlayerGui));

local HyperEscape = {
    esp = {
        Enabled = false;
        TeamCheck = false;
        
        MaxDistance = 4000;
        
        CharacterSize = Vector2.new(3,6);
        
        Box = {
            Box = false;
            Name = false;
            Distance = false;
            Health = false; -- This Is Text
            HealthBar = false;

            Color = Color3.fromRGB(255, 255, 255);

            Outline = false;
            OutlineColor = Color3.fromRGB(0,0,0);	
        };

        Tracer = {
            TeamColor = false;

            Tracer = false;
            Color = Color3.fromRGB(255, 255, 255);

            Outline = false;
            OutlineColor = Color3.fromRGB(0, 0, 0);
        };

        Hilights = {

            Hilights = false;

            AllWaysVisible = false;			

            OutlineTransparency = 0.5;
            FillTransparency = 0.5;

            OutlineColor = Color3.fromRGB(255, 0, 0);
            FillColor = Color3.fromRGB(255, 255, 255);
        };
    };
};




local IsArsenal = false;
if game.PlaceId == 286090429 then
    IsArsenal = true;
end


local function IsAlive(Player)
    if Player and Player.Character and Player.Character:FindFirstChild("Humanoid") ~= nil and Player.Character.Humanoid.Health > 0 then
        return true
    end
    return false
end


local Movement = {
    SpeedEnabled = false,
    SpeedAmount = 1
}

local function ClosestPlr(Part, UseFov, FovCircle)
    local Distance, Closest = math.huge, nil

    for I, Target in pairs(Players:GetPlayers()) do
        if Target ~= LocalPlr then
            local Position = Workspace.CurrentCamera:WorldToViewportPoint(Target.Character[Part].Position)
            local Magnitude = (Vector2.new(Position.X, Position.Y) - UserInputService:GetMouseLocation()).Magnitude

            if UseFov then
                if Magnitude < Distance and Magnitude < FovCircle.Radius then
                    Closest = Target
                    Distance = Magnitude
                end
            else
                if Magnitude < Distance then
                    Closest = Target
                    Distance = Magnitude
                end
            end
        end
    end

    return Closest
end

local function Resolver(Target, Aimbot)
    local Part = Target.Character[Aimbot.RealHitPart]

    local CurrentPosition = Part.Position
    local CurrentTime = tick()

    wait()

    local NewPosition = Part.Position
    local NewTime = tick()
    local DistanceTraveled = (NewPosition - CurrentPosition)
    local TimeInterval = NewTime - CurrentTime
    local Velocity = DistanceTraveled / TimeInterval

    CurrentPosition = NewPosition
    CurrentTime = NewTime

    if Aimbot.ResolverType == "MoveDirection" then
        return Target.Character.Humanoid.MoveDirection * Target.Character.Humanoid.WalkSpeed
    end

    return Velocity
end

local function AimRedirect()
    if TargetAimbot.Enabled and TargBindEnabled then
        if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 or game.PlaceId == 16033173781 then
            if TargetAimbot.Resolver then
                ReplicatedStorage.MainEvent:FireServer("UpdateMousePosI", TargetPlr.Character[TargetAimbot.RealHitPart].Position + Vector3.new(0, TargetAimbot.RealJumpOffset, 0) + (TargResolvePos * TargetAimbot.RealPrediction))
            else
                ReplicatedStorage.MainEvent:FireServer("UpdateMousePosI", TargetPlr.Character[TargetAimbot.RealHitPart].Position + Vector3.new(0, TargetAimbot.RealJumpOffset, 0) + (TargetPlr.Character[TargetAimbot.RealHitPart].AssemblyLinearVelocity * TargetAimbot.RealPrediction))
            end
        else
            if TargetAimbot.Resolver then
                ReplicatedStorage.MainEvent:FireServer("UpdateMousePosI", TargetPlr.Character[TargetAimbot.RealHitPart].Position + Vector3.new(0, TargetAimbot.RealJumpOffset, 0) + (TargResolvePos * TargetAimbot.RealPrediction))
            else
                ReplicatedStorage.MainEvent:FireServer("UpdateMousePosI", TargetPlr.Character[TargetAimbot.RealHitPart].Position + Vector3.new(0, TargetAimbot.RealJumpOffset, 0) + (TargetPlr.Character[TargetAimbot.RealHitPart].AssemblyLinearVelocity * TargetAimbot.RealPrediction))
            end
        end
    end
end

local function LoadESP(Player) -- I Thought It Would Be Harder To Make, Idk Why
    local PlayerESP = Instance.new("Folder", ESPHolder);
    PlayerESP.Name = Player.Name .. "ESP";
    -- Box
    local BoxHolder = Instance.new("ScreenGui", PlayerESP);
    BoxHolder.Name = "Box";
    BoxHolder.DisplayOrder = 2;

    local TracerHolder = Instance.new("ScreenGui", PlayerESP);
    TracerHolder.Name = "Tracer";

    local HilightHolder = Instance.new("Folder", PlayerESP);
    HilightHolder.Name = "Hilight"

    local LeftOutline = Instance.new("Frame", BoxHolder);
    LeftOutline.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
    LeftOutline.Visible = false;
    LeftOutline.BorderSizePixel = 1;

    local RightOutline = Instance.new("Frame", BoxHolder);
    RightOutline.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
    RightOutline.Visible = false;
    RightOutline.BorderSizePixel = 1;

    local TopOutline = Instance.new("Frame", BoxHolder);
    TopOutline.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
    TopOutline.Visible = false;
    TopOutline.BorderSizePixel = 1;

    local BottomOutline = Instance.new("Frame", BoxHolder);
    BottomOutline.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
    BottomOutline.Visible = false;
    BottomOutline.BorderSizePixel = 1;

    local Left = Instance.new("Frame", BoxHolder);
    Left.BackgroundColor3 = HyperEscape.esp.Box.Color;
    Left.Visible = false;
    Left.BorderSizePixel = 0;

    local Right = Instance.new("Frame", BoxHolder);
    Right.BackgroundColor3 = HyperEscape.esp.Box.Color;
    Right.Visible = false;
    Right.BorderSizePixel = 0;

    local Top = Instance.new("Frame", BoxHolder);
    Top.BackgroundColor3 = HyperEscape.esp.Box.Color;
    Top.Visible = false;
    Top.BorderSizePixel = 0;

    local Bottom = Instance.new("Frame", BoxHolder);
    Bottom.BackgroundColor3 = HyperEscape.esp.Box.Color;
    Bottom.Visible = false;
    Bottom.BorderSizePixel = 0;

    local Name = Instance.new("TextLabel", BoxHolder);
    Name.BackgroundTransparency = 1;
    Name.Text = Player.Name;
    Name.Visible = false;
    Name.AnchorPoint = Vector2.new(0.5, 0.5);
    Name.TextSize = 12;
    Name.Font = 2;
    Name.TextColor3 = Color3.fromRGB(255, 255, 255);
    Name.TextStrokeTransparency = 0;

    local Distance = Instance.new("TextLabel", BoxHolder);
    Distance.BackgroundTransparency = 1;
    if IsAlive(Player) then
        Distance.Text = math.floor(0.5+(Camera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
    end
    Distance.Visible = false;
    Distance.AnchorPoint = Vector2.new(0.5, 0.5);
    Distance.TextSize = 12;
    Distance.Font = 2;
    Distance.TextColor3 = Color3.fromRGB(255, 255, 255);
    Distance.TextStrokeTransparency = 0;

    local HealthBackground = Instance.new("Frame", BoxHolder);
    HealthBackground.Visible = false;
    HealthBackground.BorderSizePixel = 1;
    HealthBackground.BorderColor3 = HyperEscape.esp.Box.OutlineColor;

    local HealthBar = Instance.new("Frame", BoxHolder);
    HealthBar.Visible = false;
    HealthBar.BorderSizePixel = 0;
    HealthBar.BackgroundColor3 = Color3.fromRGB(0, 255 ,0); 

    local Health = Instance.new("TextLabel", BoxHolder);
    Health.BackgroundTransparency = 1;
    if IsAlive(Player) then
        Health.Text = Player.Character.Humanoid.Health;
    end
    Health.Visible = false;
    Health.AnchorPoint = Vector2.new(0.5, 0.5);
    Health.TextSize = 12;
    Health.Font = 2;
    Health.TextColor3 = Color3.fromRGB(255, 255, 255);
    Health.TextStrokeTransparency = 0;

    -- Tracer 

    local TracerOutline = Instance.new("Frame", TracerHolder);
    TracerOutline.BackgroundColor3 = HyperEscape.esp.Tracer.OutlineColor;
    TracerOutline.Visible = false;
    TracerOutline.BorderSizePixel = 1;
    TracerOutline.AnchorPoint = Vector2.new(0.5, 0.5);

    local Tracer = Instance.new("Frame", TracerHolder);
    Tracer.BackgroundColor3 = HyperEscape.esp.Tracer.Color;
    Tracer.Visible = false;
    Tracer.BorderSizePixel = 0;
    Tracer.AnchorPoint = Vector2.new(0.5, 0.5);

    -- Hilight

    local Hilight = Instance.new("Highlight", HilightHolder); -- Don't Work On Arsenal. Needs Fix Nigga.
    Hilight.Enabled = false;

    local co = coroutine.create(function()
			game:GetService("RunService").RenderStepped:Connect(function()
				if IsAlive(Player) and (HyperEscape.esp.Box.Box or HyperEscape.esp.Box.HealthBar or HyperEscape.esp.Box.Name or HyperEscape.esp.Box.Health or HyperEscape.esp.Tracer.Tracer or HyperEscape.esp.Hilights.Hilights) then
					local screen, onScreen = Camera:WorldToScreenPoint(Player.Character.HumanoidRootPart.Position); 
					local frustumHeight = math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2 * screen.Z ;
					local size = Camera.ViewportSize.Y / frustumHeight * HyperEscape.esp.CharacterSize;
					local position = Vector2.new(screen.X, screen.Y) - (size / 2 - Vector2.new(0, size.Y) / 20);

					if onScreen and HyperEscape and HyperEscape.esp and HyperEscape.esp.Enabled then	
						local DistanceNumb = math.floor(0.5+(Camera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
						if HyperEscape.esp.MaxDistance > DistanceNumb then
							-- Box

							if HyperEscape.esp.Box.Box then

								LeftOutline.Visible = HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
								RightOutline.Visible =  HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
								TopOutline.Visible =  HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;
								BottomOutline.Visible =  HyperEscape.esp.Box.Box and HyperEscape.esp.Box.Outline;

								Left.Position = UDim2.fromOffset(position.X, position.Y);
								Right.Position = UDim2.fromOffset(position.X, position.Y + size.Y - 1);
								Top.Position = UDim2.fromOffset(position.X, position.Y);
								Bottom.Position = UDim2.fromOffset(position.X + size.X - 1, position.Y);

								LeftOutline.Position = Left.Position;
								RightOutline.Position =  Right.Position;
								TopOutline.Position =  Top.Position;
								BottomOutline.Position =  Bottom.Position;

								Left.Visible = HyperEscape.esp.Box.Box;
								Right.Visible =  HyperEscape.esp.Box.Box;
								Top.Visible =  HyperEscape.esp.Box.Box;
								Bottom.Visible =  HyperEscape.esp.Box.Box;

								Left.Size = UDim2.fromOffset(size.X, 1);
								Right.Size = UDim2.fromOffset(size.X, 1);
								Top.Size = UDim2.fromOffset(1, size.Y);
								Bottom.Size = UDim2.fromOffset(1, size.Y);

								LeftOutline.Size = Left.Size;
								RightOutline.Size = Right.Size;
								TopOutline.Size = Top.Size;
								BottomOutline.Size = Bottom.Size;

								LeftOutline.BorderColor3 = HyperEscape.esp.Box.OutlineColor;
								RightOutline.BorderColor3 =  HyperEscape.esp.Box.OutlineColor;
								TopOutline.BorderColor3 =  HyperEscape.esp.Box.OutlineColor;
								BottomOutline.BorderColor3 =  HyperEscape.esp.Box.OutlineColor;

								Left.BackgroundColor3 = HyperEscape.esp.Box.Color;
								Right.BackgroundColor3 = HyperEscape.esp.Box.Color;
								Top.BackgroundColor3 = HyperEscape.esp.Box.Color;
								Bottom.BackgroundColor3 = HyperEscape.esp.Box.Color;
								LeftOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
								RightOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
								TopOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
								BottomOutline.BackgroundColor3 = HyperEscape.esp.Box.Color;
							else
								LeftOutline.Visible = false;
								RightOutline.Visible =  false;
								TopOutline.Visible =  false;
								BottomOutline.Visible =  false;
								Left.Visible = false;
								Right.Visible =  false;
								Top.Visible =  false;
								Bottom.Visible =  false;
							end

							if HyperEscape.esp.Box.HealthBar then

								local health = (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value or Player.Character.Humanoid.Health);
								local healthScale = (IsArsenal and health / players[Player.Character.Name].NRPBS["MaxHealth"].Value or health / Player.Character.Humanoid.MaxHealth);
								local healthSizeY = size.Y * healthScale;

								HealthBackground.Visible = HyperEscape.esp.Box.HealthBar;
								HealthBar.Visible = HyperEscape.esp.Box.HealthBar;

								HealthBackground.Size = UDim2.fromOffset(4, size.Y);
								HealthBar.Size = UDim2.fromOffset(2, -healthSizeY);

								HealthBackground.Position = UDim2.fromOffset(position.X - 8, position.Y); 
								HealthBar.Position = UDim2.fromOffset(position.x - 7, position.y + size.Y);

								HealthBackground.BackgroundColor3 = HyperEscape.esp.Box.OutlineColor;
								HealthBackground.BorderColor3 = HyperEscape.esp.Box.OutlineColor;
							else
								HealthBackground.Visible = false;
								HealthBar.Visible = false;
							end

							if HyperEscape.esp.Box.Health then

								local health = (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value or Player.Character.Humanoid.Health);
								local healthScale = (IsArsenal and health / players[Player.Character.Name].NRPBS["MaxHealth"].Value or health / Player.Character.Humanoid.MaxHealth);
								local healthSizeY = size.Y * healthScale;

								Health.Visible = HyperEscape.esp.Box.Health;

								Health.Position = (HyperEscape.esp.Box.HealthBar and UDim2.fromOffset(position.X - 25, position.y + size.Y + -healthSizeY) or UDim2.fromOffset(position.X - 25, position.Y + size.Y));

								Health.Text = (IsArsenal and math.floor(players[Player.Character.Name].NRPBS["Health"].Value) or math.floor(Player.Character.Humanoid.Health));
							else
								Health.Visible = false;
							end

							-- Distance

							if HyperEscape.esp.Box.Distance or HyperEscape.esp.Box.Name then

								Name.Visible = HyperEscape.esp.Box.Name;
								Distance.Visible = HyperEscape.esp.Box.Distance and not HyperEscape.esp.Box.Name;

								Name.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 14) / 2);
								Distance.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 14) / 2);

								Distance.Text = math.floor(0.5+(Camera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
								Name.Text = (HyperEscape.esp.Box.Name and HyperEscape.esp.Box.Distance and Player.Name .. " [" .. math.floor(0.5+(Camera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude / 3.5714285714) .. "]" or Player.Name);

							else
								Name.Visible = false;
								Distance.Visible = false;
							end

							-- Tracer

							if HyperEscape.esp.Tracer.Tracer then

								local ScreenVec2 = Vector2.new(screen.X, screen.Y + size.Y / 2 + size.Y / 20);
								local Origin = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y - 1);
								local TracerPosition = (Origin + ScreenVec2) / 2;

								TracerOutline.Visible = HyperEscape.esp.Tracer.Outline and HyperEscape.esp.Tracer.Tracer;
								Tracer.Visible = HyperEscape.esp.Tracer.Tracer;

								Tracer.Rotation = math.deg(math.atan2(ScreenVec2.Y - Origin.Y, ScreenVec2.X - Origin.X));
								Tracer.Position = UDim2.new(0, TracerPosition.X, 0, TracerPosition.Y);
								Tracer.Size = UDim2.fromOffset((Origin - ScreenVec2).Magnitude, 1);

								TracerOutline.Rotation = Tracer.Rotation;
								TracerOutline.Position = Tracer.Position;
								TracerOutline.Size = Tracer.Size;

								TracerOutline.BorderColor3 = HyperEscape.esp.Tracer.OutlineColor;
								Tracer.BackgroundColor3 = HyperEscape.esp.Tracer.Color;

							else
								TracerOutline.Visible = false;
								Tracer.Visible = false;
							end

							-- Hilight 

							if HyperEscape.esp.Hilights.Hilights then

								Hilight.Enabled = HyperEscape.esp.Hilights.Hilights;

								if not IsArsenal then
									Hilight.Adornee = Player.Character;
								end

								Hilight.OutlineColor = HyperEscape.esp.Hilights.OutlineColor;
								Hilight.FillColor = HyperEscape.esp.Hilights.FillColor;

								Hilight.FillTransparency = HyperEscape.esp.Hilights.FillTransparency;
								Hilight.OutlineTransparency = HyperEscape.esp.Hilights.OutlineTransparency;

								Hilight.DepthMode = (HyperEscape.esp.Hilights.AllWaysVisible and "AlwaysOnTop" or not HyperEscape.esp.Hilights.AllWaysVisible and "Occluded");
							else
								Hilight.Enabled = false;
								Hilight.Adornee = nil;
							end

						else
							LeftOutline.Visible = false;
							RightOutline.Visible =  false;
							TopOutline.Visible =  false;
							BottomOutline.Visible =  false;
							Left.Visible = false;
							Right.Visible =  false;
							Top.Visible =  false;
							Bottom.Visible =  false;
							TracerOutline.Visible = false;
							Tracer.Visible = false;
							Name.Visible = false;
							Distance.Visible = false;
							HealthBackground.Visible = false;
							HealthBar.Visible = false;
							Health.Visible = false;	
							Hilight.Enabled = false;
							Hilight.Adornee = nil;
						end
					else
						LeftOutline.Visible = false;
						RightOutline.Visible =  false;
						TopOutline.Visible =  false;
						BottomOutline.Visible =  false;
						Left.Visible = false;
						Right.Visible =  false;
						Top.Visible =  false;
						Bottom.Visible =  false;
						TracerOutline.Visible = false;
						Tracer.Visible = false;
						Name.Visible = false;
						Distance.Visible = false;
						HealthBackground.Visible = false;
						HealthBar.Visible = false;
						Health.Visible = false;	
						Hilight.Enabled = false;
						Hilight.Adornee = nil;
					end

				else
					LeftOutline.Visible = false;
					RightOutline.Visible =  false;
					TopOutline.Visible =  false;
					BottomOutline.Visible =  false;
					Left.Visible = false;
					Right.Visible =  false;
					Top.Visible =  false;
					Bottom.Visible =  false;
					TracerOutline.Visible = false;
					Tracer.Visible = false;
					Name.Visible = false;
					Distance.Visible = false;
					HealthBackground.Visible = false;
					HealthBar.Visible = false;
					Health.Visible = false;
					Hilight.Enabled = false;
					Hilight.Adornee = nil;
				end
			end)
			if not players:FindFirstChild(Player.Name) then
				PlayerESP:Destroy()
				coroutine.yield()
			end
		end)
		coroutine.resume(co)
	end


	for i,plr in pairs(players:GetChildren()) do
		if plr ~= LocalPlr then
			LoadESP(plr);
		end
	end

	players.PlayerAdded:Connect(function(plr)
		if plr ~= LocalPlr then
			LoadESP(plr);
		end
	end)



    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/drillygzzly/Roblox-UI-Libs/main/1%20Tokyo%20Lib%20(FIXED)/Tokyo%20Lib%20Source.lua"))({
    cheatname = "@pharanoh", -- watermark text
    gamename = "da hood", -- watermark text
})

library:init()

local Window1  = library.NewWindow({
    title = "@pharanoh | skidded", -- Mainwindow Text
    size = UDim2.new(0, 460, 0.5, 6
)})

local targetaimtab = Window1:AddTab("  Ragebot  ")
local legittab = Window1:AddTab("  Legitbot  ")
local visualtab = Window1:AddTab("  Visuals  ")
local misc = Window1:AddTab("  Miscillanous  ")
local SettingsTab = library:CreateSettingsTab(Window1)

local targetaimsection = targetaimtab:AddSection("  Target Aim  ", 1)

targetaimsection:AddToggle({
    text = "Enable Target Aim",
    state = false,
    tooltip = nil,
    flag = "targetaimenable",
    risky = false,
    callback = function(v)
        TargetAimbot.Enabled = v
    end
})

targetaimsection:AddBind({
    enabled = true,
    text = "Target Aim Bind",
    tooltip = nil,
    mode = "toggle",
    bind = "None",
    flag = "targetaimbind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        TargBindEnabled = v
    end,
    keycallback = function(v)
        TargetAimbot.Keybind = v
    end
})

targetaimsection:AddSlider({
    enabled = true,
    text = "Prediction",
    tooltip = nil,
    flag = "predval",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 1,
    increment = 0.0001,
    risky = false,
    callback = function(v)
        TargetAimbot.Prediction = v
        TargetAimbot.RealPrediction = v
    end
})

targetaimsection:AddToggle({
    text = "Auto Prediction",
    state = false,
    tooltip = nil,
    flag = "autopredenable",
    risky = false,
    callback = function(v)
        TargetAimbot.AutoPred = v
    end
})

targetaimsection:AddToggle({
    text = "Autoselect Target",
    state = false,
    tooltip = nil,
    flag = "autoselectenable",
    risky = false,
    callback = function(v)
        TargBindEnabled = v
        TargetAimbot.AutoSelect = v
    end
})

targetaimsection:AddToggle({
    text = "Anti-lock Resolver",
    state = false,
    tooltip = nil,
    flag = "resolvetog",
    risky = false,
    callback = function(v)
        TargetAimbot.Resolver = v
    end
})

targetaimsection:AddSlider({
    enabled = true,
    text = "Aimbot Offset",
    tooltip = nil,
    flag = "offsetval",
    suffix = "",
    dragging = true,
    focused = false,
    min = -1,
    max = 1,
    increment = 0.01,
    risky = false,
    callback = function(v)
        TargetAimbot.JumpOffset = v
        TargetAimbot.RealJumpOffset = v
    end
})

targetaimsection:AddList({
    enabled = true,
    text = "Hitpart [Broken]", 
    tooltip = nil,
    selected = "HumanoidRootPart",
    multi = false,
    open = false,
    max = 4,
    values = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"},
    risky = false,
    callback = function(v)
        TargetAimbot.RealHitPart = v
        TargetAimbot.HitParts = v
    end
})

targetaimsection:AddToggle({
    text = "View at",
    state = false,
    tooltip = nil,
    flag = "viewattog",
    risky = false,
    callback = function(v)
        TargetAimbot.Viewat = v
    end
})

targetaimsection:AddToggle({
    text = "Ko Check",
    state = false,
    tooltip = nil,
    flag = "kochecktog",
    risky = false,
    callback = function(v)
        TargetAimbot.KoCheck = v
    end
})

targetaimsection:AddToggle({
    text = "Highlight Target",
    state = false,
    tooltip = nil,
    flag = "highlighttog",
    risky = false,
    callback = function(v)
        TargetAimbot.Highlight = v
    end
})

targetaimsection:AddColor({
    enabled = true,
    text = "Highlight Fill Color",
    tooltip = nil,
    color = Color3.fromRGB(255, 255, 255),
    flag = "fillcolor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        TargHighlight.FillColor = v
    end
})

targetaimsection:AddColor({
    enabled = true,
    text = "Highlight Outline Color",
    tooltip = nil,
    color = Color3.fromRGB(0, 0, 0),
    flag = "houtlinecolor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        TargHighlight.OutlineColor = v
    end
})

-- Fov Section

local FOVSection = targetaimtab:AddSection("  FOV  ", 2)

FOVSection:AddToggle({
    text = "Enable FOV",
    state = false,
    tooltip = nil,
    flag = "fovtog",
    risky = false,
    callback = function(v)
        TargetAimbot.UseFov = v
    end
})

FOVSection:AddToggle({
    text = "FOV Visible",
    state = false,
    tooltip = nil,
    flag = "fovvisibletog",
    risky = false,
    callback = function(v)
        TargFovCircle.Visible = v
    end
})

FOVSection:AddSlider({
    enabled = true,
    text = "FOV Radius",
    tooltip = nil,
    flag = "fovradius",
    suffix = "",
    dragging = true,
    focused = false,
    min = 1,
    max = 360,
    increment = 1,
    risky = false,
    callback = function(v)
        TargFovCircle.Radius = v * 2
    end
})

-- Targetstrafe box

local TargetStrafeSection  = targetaimtab:AddSection("  Target Strafe  ", 3)

TargetStrafeSection:AddToggle({
    text = "Enable",
    state = false,
    tooltip = nil,
    flag = "targetstrafetog",
    risky = false,
    callback = function(v)
        TargetStrafe.Enabled = v
    end
})

TargetStrafeSection:AddSlider({
    enabled = true,
    text = "Speed",
    tooltip = nil,
    flag = "strafespeed",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 20,
    increment = 1,
    risky = false,
    callback = function(v)
        TargetStrafe.Speed = v
    end
})

TargetStrafeSection:AddSlider({
    enabled = true,
    text = "Distance",
    tooltip = nil,
    flag = "strafedistance",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 20,
    increment = 1,
    risky = false,
    callback = function(v)
        TargetStrafe.Distance = v
    end
})

TargetStrafeSection:AddSlider({
    enabled = true,
    text = "Height",
    tooltip = nil,
    flag = "strafeheight",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 20,
    increment = 1,
    risky = false,
    callback = function(v)
        TargetStrafe.Height = v
    end
})

local random = false

TargetStrafeSection:AddToggle({
    text = "Randomized",
    state = false,
    tooltip = nil,
    flag = "straferandom",
    risky = false,
    callback = function(v)
        random = v
        if random then
            spawn(function()
                while random do
                    TargetStrafe.Speed = math.random(4, 9)
                    TargetStrafe.Height = math.random(-4, 7)
                    TargetStrafe.Distance = math.random(4, 7.5)
                    wait(0.000000001)
                end
            end)
        end
    end
})

TargetStrafeSection:AddToggle({
    text = "Spoof",
    state = false,
    tooltip = nil,
    flag = "targetstrafevisual",
    risky = false,
    callback = function(v)
        TargetStrafe.Spoof = v
    end
})


-- Legitbot

local legitbotsection = legittab:AddSection("  Camera Aimbot  ", 1)

legitbotsection:AddToggle({
    text = "Enable Camera Aimbot",
    state = false,
    tooltip = nil,
    flag = "camenable",
    risky = false,
    callback = function(v)
        CameraAimbot.Enabled = v
    end
})

legitbotsection:AddBind({
    enabled = true,
    text = "Aim Bind",
    tooltip = nil,
    mode = "toggle",
    bind = "None",
    flag = "camaimbind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        CamBindEnabled = v
    end,
    keycallback = function(v)
        CameraAimbot.Keybind = v
    end
})

legitbotsection:AddSlider({
    enabled = true,
    text = "Prediction",
    tooltip = nil,
    flag = "predcamval",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 1,
    increment = 0.001,
    risky = false,
    callback = function(v)
        CameraAimbot.Prediction = v
        CameraAimbot.RealPrediction = v
    end
})

legitbotsection:AddToggle({
    text = "Auto Prediction",
    state = false,
    tooltip = nil,
    flag = "camautopred",
    risky = false,
    callback = function(v)
        CameraAimbot.AutoPred = v
    end
})

legitbotsection:AddToggle({
    text = "Anti-lock Resolver",
    state = false,
    tooltip = nil,
    flag = "camresolvetog",
    risky = false,
    callback = function(v)
        CameraAimbot.Resolver = v
    end
})

legitbotsection:AddList({
    enabled = true,
    text = "Hitpart", 
    tooltip = nil,
    selected = "HumanoidRootPart",
    multi = false,
    open = false,
    max = 1,
    values = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"},
    risky = false,
    callback = function(v)
        CameraAimbot.Hitpart = v
    end
})

legitbotsection:AddToggle({
    text = "Use Air Part",
    state = false,
    tooltip = nil,
    flag = "camairpart",
    risky = false,
    callback = function(v)
        CameraAimbot.UseAirPart = v
    end
})

legitbotsection:AddList({
    enabled = true,
    text = "Air Part", 
    tooltip = nil,
    selected = "HumanoidRootPart",
    multi = false,
    open = false,
    max = 4,
    values = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso"},
    risky = false,
    callback = function(v)
        CameraAimbot.AirPart = v
    end
})

legitbotsection:AddList({
    enabled = true,
    text = "Air Check Type", 
    tooltip = nil,
    selected = "Once in Air",
    multi = false,
    open = false,
    max = 1,
    values = {"Once in Air", "Once Freefalling"},
    risky = false,
    callback = function(v)
        print(v)
        CameraAimbot.AirCheckType = v
    end
})

legitbotsection:AddToggle({
    text = "Ko Check",
    state = false,
    tooltip = nil,
    flag = "camkochecktog",
    risky = false,
    callback = function(v)
        CameraAimbot.KoCheck = v
    end
})

legitbotsection:AddToggle({
    text = "Enable Smoothing",
    state = false,
    tooltip = nil,
    flag = "camsmoothtog",
    risky = false,
    callback = function(v)
        CameraAimbot.Smoothing = v
    end
})

legitbotsection:AddSlider({
    enabled = true,
    text = "Smoothness Value",
    tooltip = nil,
    flag = "camsmoothval",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 1,
    increment = 0.001,
    risky = false,
    callback = function(v)
        CameraAimbot.Smoothness = v
    end
})


legitbotsection:AddToggle({
    text = "Highlight Target",
    state = false,
    tooltip = nil,
    flag = "highlightcamtog",
    risky = false,
    callback = function(v)
        CameraAimbot.Highlight = v
    end
})

legitbotsection:AddColor({
    enabled = true,
    text = "Highlight Fill Color",
    tooltip = nil,
    color = Color3.fromRGB(255, 255, 255),
    flag = "camfillcolor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        CamHighlight.FillColor = v
    end
})

legitbotsection:AddColor({
    enabled = true,
    text = "Highlight Outline Color",
    tooltip = nil,
    color = Color3.fromRGB(0, 0, 0),
    flag = "camoutlinecolor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        CamHighlight.OutlineColor = v
    end
})

-- Visuals

local espsection = visualtab:AddSection("  Visuals  ", 1)

espsection:AddToggle({
    text = "Enable ESP",
    state = false,
    tooltip = nil,
    flag = "esptog",
    risky = false,
    callback = function(v)
        HyperEscape.esp.Enabled = v
    end
})

espsection:AddToggle({
    text = "Enable Box",
    state = false,
    tooltip = nil,
    flag = "boxtog",
    risky = false,
    callback = function(v)
        HyperEscape.esp.Box.Box = v
    end
})


espsection:AddToggle({
    text = "Enable Name",
    state = false,
    tooltip = nil,
    flag = "nametog",
    risky = false,
    callback = function(v)
        HyperEscape.esp.Box.Name = v
    end
})

espsection:AddToggle({
    text = "Enable Healthbar",
    state = false,
    tooltip = nil,
    flag = "healthbartog",
    risky = false,
    callback = function(v)
        HyperEscape.esp.Box.HealthBar = v
    end
})

local visualsetts = visualtab:AddSection("  Visual Settings  ", 2)

visualsetts:AddToggle({
    text = "Enable Outline",
    state = false,
    tooltip = nil,
    flag = "BoxOutlineTog",
    risky = false,
    callback = function(v)
        HyperEscape.esp.Box.Outline = v
    end
})

visualsetts:AddColor({
    enabled = true,
    text = "Box Color",
    tooltip = nil,
    color = Color3.fromRGB(255, 255, 255),
    flag = "boxcolor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        HyperEscape.esp.Box.Color = v
    end
})

visualsetts:AddColor({
    enabled = true,
    text = "Box Outline Color",
    tooltip = nil,
    color = Color3.fromRGB(255, 255, 255),
    flag = "boxcolor",
    trans = 0,
    open = false,
    risky = false,
    callback = function(v)
        HyperEscape.esp.Box.OutlineColor = v
    end
})

-- Misc tab

local movementsection = misc:AddSection("  Movement  ", 1)
local antisection = misc:AddSection("  Antilock  ", 2)

movementsection:AddToggle({
    text = "CFrame Speed",
    state = false,
    tooltip = nil,
    flag = "cfspdtog",
    risky = false,
    callback = function(v)
        
    end
}):AddBind({
    enabled = true,
    text = "CFrame Speed Bind",
    tooltip = nil,
    mode = "toggle",
    bind = "None",
    flag = "cfspdbind",
    state = false,
    nomouse = false,
    risky = false,
    noindicator = false,
    callback = function(v)
        Movement.SpeedEnabled = v
    end
})

movementsection:AddSlider({
    enabled = true,
    text = "Speed Value",
    tooltip = nil,
    flag = "cfspdval",
    suffix = "",
    dragging = true,
    focused = false,
    min = 0,
    max = 5000,
    increment = 1,
    risky = false,
    callback = function(v)
        Movement.SpeedAmount = v / 1000
    end
})

-- Anti














-- Target Aimbot Hook

do
    for I, Tool in pairs(LocalPlr.Backpack:GetChildren()) do
        if Tool:IsA("Tool") and not Connections[Tool] then
            Connections[Tool] = Tool.Activated:Connect(AimRedirect)
        end
    end

    for I, Tool in pairs(LocalPlr.Character:GetChildren()) do
        if Tool:IsA("Tool") and not Connections[Tool] then
            Connections[Tool] = Tool.Activated:Connect(AimRedirect)
        end
    end

    LocalPlr.Character.ChildAdded:Connect(function(Tool)
        if Tool:IsA("Tool") and not Connections[Tool] then
            Connections[Tool] = Tool.Activated:Connect(AimRedirect)
        end
    end)

    LocalPlr.CharacterAdded:Connect(function(Tool)
        Tool.ChildAdded:Connect(function(Tool)
            if Tool:IsA("Tool") and not Connections[Tool] then
                Connections[Tool] = Tool.Activated:Connect(AimRedirect)
            end
        end)
    end)
end


-- Heartbeat Functions

RunService.Heartbeat:Connect(function()
    if TargetAimbot.Enabled and TargBindEnabled then
        TargResolvePos = Resolver(TargetPlr, TargetAimbot)
    end
end)

RunService.Heartbeat:Connect(function()
    if TargetAimbot.Enabled and TargetAimbot.AutoSelect then
        TargetPlr = ClosestPlr(TargetAimbot.RealHitPart, TargetAimbot.UseFov, TargFovCircle)
    end
end)


RunService.RenderStepped:Connect(function()
    TargFovCircle.Position = UserInputService:GetMouseLocation()
end)

RunService.Heartbeat:Connect(function()
    if TargetAimbot.Enabled and TargBindEnabled and TargetAimbot.LookAt then
        LocalPlr.Character.Humanoid.AutoRotate = false
        LocalPlr.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlr.Character.HumanoidRootPart.Position, Vector3.new(TargetPlr.Character.HumanoidRootPart.Position.X, LocalPlr.Character.HumanoidRootPart.Position.Y, TargetPlr.Character.HumanoidRootPart.Position.Z))
    else
        LocalPlr.Character.Humanoid.AutoRotate = true
    end
end)


RunService.Heartbeat:Connect(function()
    if TargetAimbot.Enabled and TargBindEnabled and TargetStrafe.Enabled then
        local FakeCFrame = LocalPlr.Character.HumanoidRootPart.CFrame
        TargetStrafe.SavedCFrame = LocalPlr.Character.HumanoidRootPart.CFrame
        StrafeSpeed = StrafeSpeed + TargetStrafe.Speed

        LocalPlr.Character.HumanoidRootPart.CFrame = TargetPlr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(StrafeSpeed), 0) * CFrame.new(0, TargetStrafe.Height, TargetStrafe.Distance) * CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), math.rad(math.random(0, 360)))

        if TargetStrafe.Spoof then
            FakeCFrame = TargetPlr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(StrafeSpeed), 0) * CFrame.new(0, TargetStrafe.Height, TargetStrafe.Distance) * CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), math.rad(math.random(0, 360)))
           
            LocalPlr.Character.HumanoidRootPart.CFrame = FakeCFrame
            RunService.RenderStepped:Wait()
            LocalPlr.Character.HumanoidRootPart.CFrame = TargetStrafe.SavedCFrame
        end
    end
end)



RunService.Heartbeat:Connect(function()
    if LocalPlr.character:FindFirstChildOfClass("Tool") and LocalPlr.character:FindFirstChildOfClass("Tool").Activated then
    AimRedirect()
    end
end)

-- Stepped Functions

RunService.Stepped:Connect(function()
    if TargetAimbot.Enabled and TargBindEnabled and TargetPlr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        TargetAimbot.RealJumpOffset = TargetAimbot.JumpOffset
    else
        TargetAimbot.RealJumpOffset = 0
    end
end)

RunService.Stepped:Connect(function()
    if TargetAimbot.Enabled then
        TargetAimbot.RealHitPart = TargetAimbot.HitParts[math.random(#TargetAimbot.HitParts)]
        wait(0.6)
    end
end)

RunService.RenderStepped:Connect(function()
    if TargetAimbot.Enabled and TargBindEnabled and TargetAimbot.Highlight then
        TargHighlight.Parent = TargetPlr.Character
    else
        TargHighlight.Parent = CoreGui
    end
end)

RunService.Stepped:Connect(function()
    if CameraAimbot.Enabled and CamBindEnabled and CamlockPlr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        CameraAimbot.RealJumpOffset = CameraAimbot.JumpOffset
    else
        CameraAimbot.RealJumpOffset = 0
    end
end)

RunService.Stepped:Connect(function()
    local AirCheckType

    if CameraAimbot.Enabled and CamBindEnabled and CameraAimbot.UseAirPart then
        if CameraAimbot.AirCheckType == "Once in Air" then
            AirCheckType = CamlockPlr.Character.Humanoid.FloorMaterial == Enum.Material.Air
        else
            AirCheckType = CamlockPlr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall
        end
    end

    if CameraAimbot.Enabled and CamBindEnabled and CameraAimbot.UseAirPart and AirCheckType then
        CameraAimbot.RealHitPart = CameraAimbot.AirPart
    else
        CameraAimbot.RealHitPart = CameraAimbot.HitPart
    end
end)

RunService.RenderStepped:Connect(function()
    if CameraAimbot.Enabled and CamBindEnabled then
        if CameraAimbot.AimMethod == "Camera" then
            if CameraAimbot.Resolver then
                if CameraAimbot.Smoothing then
                    Workspace.CurrentCamera.CFrame = Workspace.CurrentCamera.CFrame:Lerp(CFrame.new(Workspace.CurrentCamera.CFrame.p, CamlockPlr.Character[CameraAimbot.RealHitPart].Position + Vector3.new(0, CameraAimbot.RealJumpOffset, 0) + (Resolver(CamlockPlr, CameraAimbot) * CameraAimbot.RealPrediction)), CameraAimbot.Smoothness, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                else
                    Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.p, CamlockPlr.Character[CameraAimbot.RealHitPart].Position + Vector3.new(0, CameraAimbot.RealJumpOffset, 0) + (Resolver(CamlockPlr, CameraAimbot) * CameraAimbot.RealPrediction))
                end
            else
                if CameraAimbot.Smoothing then
                    Workspace.CurrentCamera.CFrame = Workspace.CurrentCamera.CFrame:Lerp(CFrame.new(Workspace.CurrentCamera.CFrame.p, CamlockPlr.Character[CameraAimbot.RealHitPart].Position + Vector3.new(0, CameraAimbot.RealJumpOffset, 0) + (CamlockPlr.Character[CameraAimbot.RealHitPart].AssemblyLinearVelocity * CameraAimbot.RealPrediction)), CameraAimbot.Smoothness, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
                else
                    Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.p, CamlockPlr.Character[CameraAimbot.RealHitPart].Position + Vector3.new(0, CameraAimbot.RealJumpOffset, 0) + (CamlockPlr.Character[CameraAimbot.RealHitPart].AssemblyLinearVelocity * CameraAimbot.RealPrediction))
                end
            end
        else
            local Position

            if CameraAimbot.Resolver then
                Position = Workspace.CurrentCamera:WorldToViewportPoint(CamlockPlr.Character[CameraAimbot.RealHitPart].Position + Vector3.new(0, CameraAimbot.RealJumpOffset, 0) + (Resolver(CamlockPlr, CameraAimbot) * CameraAimbot.RealPrediction))
            else
                Position = Workspace.CurrentCamera:WorldToViewportPoint(CamlockPlr.Character[CameraAimbot.RealHitPart].Position + Vector3.new(0, CameraAimbot.RealJumpOffset, 0) + (CamlockPlr.Character[CameraAimbot.RealHitPart].AssemblyLinearVelocity * CameraAimbot.RealPrediction))
            end

            if CameraAimbot.Smoothing then
                mousemoverel((Position.X - UserInputService:GetMouseLocation().X) * CameraAimbot.Smoothness, (Position.Y - UserInputService:GetMouseLocation().Y) * CameraAimbot.Smoothness)
            else
                mousemoverel(Position.X - UserInputService:GetMouseLocation().X, Position.Y - UserInputService:GetMouseLocation().Y)
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if CameraAimbot.Enabled and CamBindEnabled and CameraAimbot.AutoPred then
        CameraAimbot.RealPrediction = math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) / 200 * 0.1 + 0.1
    else
        CameraAimbot.RealPrediction = CameraAimbot.Prediction
    end
end)

RunService.RenderStepped:Connect(function()
    if CameraAimbot.Enabled and CamBindEnabled and CameraAimbot.KoCheck and (CamlockPlr.Character.Humanoid.Health <= 2.15 or LocalPlr.Character.Humanoid.Health <= 2.15) then
        CamBindEnabled = false
    end
end)

RunService.RenderStepped:Connect(function()
	if TargetAimbot.Enabled and TargBindEnabled and TargetAimbot.AutoPred then
		TargetAimbot.RealPrediction = math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) / 200 * 0.1 + 0.1
	else
		TargetAimbot.RealPrediction = TargetAimbot.Prediction
	end
end)

RunService.RenderStepped:Connect(function()
	if CameraAimbot.Enabled and CamBindEnabled and CameraAimbot.AutoPred then
		CameraAimbot.RealPrediction = math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) / 200 * 0.1 + 0.1
	else
		CameraAimbot.RealPrediction = CameraAimbot.Prediction
	end
end)

RunService.RenderStepped:Connect(function()
    local Position, OnScreen

    if CameraAimbot.Enabled and CamBindEnabled and CameraAimbot.Tracer then
        if CameraAimbot.Resolver then
            Position, OnScreen = Workspace.CurrentCamera:WorldToViewportPoint(CamlockPlr.Character[CameraAimbot.RealHitPart].Position + Vector3.new(0, CameraAimbot.RealJumpOffset, 0) + (Resolver(CamlockPlr, CameraAimbot) * CameraAimbot.RealPrediction))
        else
            Position, OnScreen = Workspace.CurrentCamera:WorldToViewportPoint(CamlockPlr.Character[CameraAimbot.RealHitPart].Position + Vector3.new(0, CameraAimbot.RealJumpOffset, 0) + (CamlockPlr.Character[CameraAimbot.RealHitPart].AssemblyLinearVelocity * CameraAimbot.RealPrediction))
        end
    end

    if CameraAimbot.Enabled and CamBindEnabled and CameraAimbot.Tracer and OnScreen then
        CamTracerLine.Visible = true
        CamTracerLine.From = UserInputService:GetMouseLocation()
        CamTracerLine.To = Vector2.new(Position.X, Position.Y)
    else
        CamTracerLine.Visible = false
    end
end)

RunService.RenderStepped:Connect(function()
    if CameraAimbot.Enabled and CamBindEnabled and CameraAimbot.Highlight then
        CamHighlight.Parent = CamlockPlr.Character
    else
        CamHighlight.Parent = CoreGui
    end
end)

RunService.Stepped:Connect(function()
    if Movement.SpeedEnabled then
        LocalPlr.Character.HumanoidRootPart.CFrame = LocalPlr.Character.HumanoidRootPart.CFrame + LocalPlr.Character.Humanoid.MoveDirection * Movement.SpeedAmount
    end
end)

-- InputBegan Functions

UserInputService.InputBegan:Connect(function(Key)
    if TargetAimbot.Enabled and Key.KeyCode == TargetAimbot.Keybind and not UserInputService:GetFocusedTextBox() then
        local Position, OnScreen = Workspace.CurrentCamera:WorldToViewportPoint(ClosestPlr(TargetAimbot.RealHitPart, TargetAimbot.UseFov, TargFovCircle).Character[TargetAimbot.RealHitPart].Position)

        if TargBindEnabled then
            TargBindEnabled = false

            if TargetAimbot.Notify then
                StarterGui:SetCore("SendNotification", {
                    Title = "Azure paste by akira", 
                    Text = "Untargeting: " .. TargetPlr.DisplayName, 
                    Duration = 2.5
                })
            end
        else
            if OnScreen then
                TargBindEnabled = true
                TargetPlr = ClosestPlr(TargetAimbot.RealHitPart, TargetAimbot.UseFov, TargFovCircle)

                if TargetAimbot.Notify then
                    StarterGui:SetCore("SendNotification", {
                        Title = "Azure paste by akira", 
                        Text = "Targeting: " .. TargetPlr.DisplayName, 
                        Duration = 2.5
                    })
                end
            end
        end
    end
end)

UserInputService.InputBegan:Connect(function(Key)
    if CameraAimbot.Enabled and Key.KeyCode == CameraAimbot.Keybind and not UserInputService:GetFocusedTextBox() then
        local Position, OnScreen = Workspace.CurrentCamera:WorldToViewportPoint(ClosestPlr(CameraAimbot.RealHitPart, CameraAimbot.UseFov, CamFovCircle).Character[CameraAimbot.RealHitPart].Position)

        if CamBindEnabled then
            CamBindEnabled = false
        else
            if OnScreen then
                CamBindEnabled = true
                CamlockPlr = ClosestPlr(CameraAimbot.RealHitPart, CameraAimbot.UseFov, CamFovCircle)
            end
        end
    end
end)

--[[

THIS SHIT DONT WORK GRAAAAAAAH

local old
old = hookmetamethod(game, "__index", LPH_NO_VIRTUALIZE(function(self, key)
    if not checkcaller() then
        if key == "CFrame" and LocalPlr.Character and self == LocalPlr.Character.HumanoidRootPart and LocalPlr.Character:FindFirstChild("HumanoidRootPart") and LocalPlr.Character:FindFirstChild("Humanoid") and LocalPlr.Character:FindFirstChild("Humanoid").Health > 0 then
            return TargetStrafe.SavedCFrame
        end
    end 
    return old(self, key)
end))

--]]



local Time = (string.format("%."..tostring(Decimals).."f", os.clock() - Clock))
library:SendNotification(("Loaded In "..tostring(Time)), 6)
