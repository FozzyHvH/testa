local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))(); -- // library

-- // variables

local players = game.Players;
local localPlayer = players.LocalPlayer;
local CurrentCamera = game.Workspace.CurrentCamera;
local TweenService = game.TweenService;
local UIS = game.UserInputService;
local mouseLocation = UIS.GetMouseLocation;
local CoreGui = game:FindFirstChild("CoreGui");
local replicated_storage = game:GetService("ReplicatedStorage");
local weapons = replicated_storage:FindFirstChild("Weapons")

-- // table

local HyperEscape = {
    AimBot = { -- Same Targeting System Just Sticky Aim Now.
        Enabled = false; -- No Need To Change Anything Here As It Is On The GUI

        TeamCheck = false;
        WallCheck = false;

        Method = "Mouse",

    -- NEW
        StickyAim = false; -- This Will Stick To The Same Target.
        Prediction = false; -- I Will Make Ajustable When People Complain About It.
        PredictionAmmount = 1;

        UseMouse = true;
        MouseBind = "MouseButton2";
        Keybind = Enum.KeyCode.E;  

        ShowFov = false;
        Fov = 360;

        Smoothing = 0.3;

        AimPart = "Head";

        Thickness = 1;
        FovFillColor = Color3.fromRGB(100,0,100);
        FovColor = Color3.fromRGB(100,0,100);
        FovFillTransparency = 1;
        FovTransparenct = 0;

        IsAimKeyDown = false; -- Don't Touch Anything Here Niggas 
        Target = nil;
        CameraTween = nil;
    };

    esp = {
        Enabled = false;
        TeamCheck = false;
    
        MaxDistance = 4000;
    
        CharacterSize = Vector2.new(5,6);
    
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

    Hilights = { -- TODO: Arsenal 

        Hilights = false;

        AllWaysVisible = false;			

        OutlineTransparency = 0.5;
        FillTransparency = 0.5;

        OutlineColor = Color3.fromRGB(255, 0, 0);
        FillColor = Color3.fromRGB(255, 255, 255);
    };
    };
    Misc = {
        bhopenabled = false,
        bhopspeed = 30,
    }
};


local function Rapid()
    for _, weapon in pairs(weapons:GetChildren()) do
        local fire_rate = weapon:FindFirstChild("FireRate")
        if fire_rate and fire_rate:IsA("NumberValue") then
            fire_rate.Value = -999999999
        end
    end
end

local function Ammo()
    for _, weapon in pairs(weapons:GetChildren()) do
        local ammo = weapon:FindFirstChild("Ammo")
        if ammo and ammo:IsA("IntValue") then
            ammo.Value = 999999999
        end
        local stored_ammo = weapon:FindFirstChild("StoredAmmo")
        if stored_ammo and stored_ammo:IsA("IntValue") then
            stored_ammo.Value = 999999999
        end
    end
end

local function Recoil()
    for _, weapon in pairs(weapons:GetChildren()) do
        local recoil = weapon:FindFirstChild("Recoil")
        if recoil and recoil:IsA("NumberValue") then
            recoil.Value = 0
        end
    end
end

local function Spread()
    for _, weapon in pairs(weapons:GetChildren()) do
        local spread = weapon:FindFirstChild("Spread")
        if spread then
            for _, v in pairs(spread:GetChildren()) do
                if v:IsA("NumberValue") then
                    v.Value = 0
                end
            end
        end
    end
end

local function Penetration()
    for _, weapon in pairs(weapons:GetChildren()) do
        local penetration = weapon:FindFirstChild("Penetration")
        if penetration and penetration:IsA("NumberValue") then
            penetration.Value = 400
        end
    end
end

local function Equip()
    for _, weapon in pairs(weapons:GetChildren()) do
        local equip_time = weapon:FindFirstChild("EquipTime")
        if equip_time and equip_time:IsA("NumberValue") then
            equip_time.Value = 0.0001
        end
    end
end

local function Reload()
    for _, weapon in pairs(weapons:GetChildren()) do
        local reload_time = weapon:FindFirstChild("ReloadTime")
        if reload_time and reload_time:IsA("NumberValue") then
            reload_time.Value = 0.0001
        end
    end
end

local function Range()
    for _, weapon in pairs(weapons:GetChildren()) do
        local range = weapon:FindFirstChild("Range")
        if range and range:IsA("NumberValue") then
            range.Value = 9999
        end
    end
end

local function RangeModifier()
    for _, weapon in pairs(weapons:GetChildren()) do
        local range_mod = weapon:FindFirstChild("RangeModifier")
        if range_mod and range_mod:IsA("NumberValue") then
            range_mod.Value = 100
        end
    end
end










Compkiller:Loader("rbxassetid://120245531583106", 2.5).yield();

local Window = Compkiller.new({
	Name = "COMPKILLER",
	Keybind = "Delete",
	Logo = "rbxassetid://120245531583106",
	Scale = Compkiller.Scale.Window, -- Leave blank if you want automatic scale for PC and Mobile.
	TextSize = 15,
});

local ConfigManager = Compkiller:ConfigManager({
	Directory = "Compkiller",
	Config = "Configs"
});


local Watermark = Window:Watermark();

Watermark:AddText({
	Icon = "user",
	Text = "developer",
});

Watermark:AddText({
	Icon = "clock",
	Text = Compkiller:GetDate(),
});

local Time = Watermark:AddText({
	Icon = "timer",
	Text = "TIME",
});

task.spawn(function()
	while true do task.wait()
		Time:SetText(Compkiller:GetTimeNow());
	end
end)

Watermark:AddText({
	Icon = "server",
	Text = Compkiller.Version,
});

Window:DrawCategory({
	Name = "Main"
});

local AimBot = Window:DrawTab({
	Name = "Aimbot",
	Icon = "skull",
});

local Exploits = Window:DrawTab({
	Name = "Exploits",
	Icon = "code",
});

Window:DrawCategory({
	Name = "Visuals"
});

local ESP = Window:DrawTab({
	Name = "Players",
	Icon = "eye",
});

local Misc = Window:DrawTab({
    Name = "Misc",
    Icon = "box",
    -- Icon = "palette", -- // could use this for world visuals but temporarily im changing it to just misc
})

Window:DrawCategory({
	Name = "Settings"
});

local SettingTab = Window:DrawTab({
	Icon = "settings-3",
	Name = "Settings",
	Type = "Single",
	EnableScrolling = true
});

local ThemeTab = Window:DrawTab({
	Icon = "paintbrush",
	Name = "Themes",
	Type = "Single"
});

local Settings = SettingTab:DrawSection({
	Name = "UI Settings",
});

do -- aimbot left section
    local section = AimBot:DrawSection({
        Name = "Aimbot",
        Position = "left"
    })

    section:AddToggle({
        Name = "Enabled",
        Flag = "aimenable",
        Default = false,
        Callback = function(v)
            HyperEscape.AimBot.Enabled = v
        end
    })
    section:AddKeybind({
        Name = "Keybind",
        Default = "E",
        Flag = "aim_keybind",
        Callback = function(v)
            HyperEscape.AimBot.Keybind = Enum.KeyCode[v]
        end
    })
    section:AddToggle({
        Name = "Use Mouse",
        Flag = "use_mouse",
        Default = true,
        Callback = function(v)
            HyperEscape.AimBot.UseMouse = v
        end
    })
    section:AddDropdown({
        Name = "Mouse Bind",
        Default = "MouseButton2",
        Flag = "mouse_bind",
        Values = {"MouseButton1", "MouseButton2"},
        Callback = function(v)
            HyperEscape.AimBot.MouseBind = v
        end
    })
    section:AddToggle({
        Name = "Team Check",
        Flag = "teamcheck",
        Default = false,
        Callback = function(v)
            HyperEscape.AimBot.TeamCheck = v
        end
    })
    section:AddToggle({
        Name = "Wall Check",
        Flag = "wallcheck",
        Default = false,
        Callback = function(v)
            HyperEscape.AimBot.WallCheck = v
        end
    })
    section:AddDropdown({
        Name = "Method",
        Default = "Mouse",
        Flag = "aim_method",
        Values = {"Mouse", "Camera"},
        Callback = function(v)
            HyperEscape.AimBot.Method = v
        end
    })
    section:AddToggle({
        Name = "Sticky Aim",
        Flag = "sticky_aim",
        Default = false,
        Callback = function(v)
            HyperEscape.AimBot.StickyAim = v
        end
    })
    section:AddToggle({
        Name = "Prediction",
        Flag = "prediction",
        Default = false,
        Callback = function(v)
            HyperEscape.AimBot.Prediction = v
        end
    })
    section:AddSlider({
        Name = "Prediction Amount",
        Min = 100,
        Max = 1000,
        Default = HyperEscape.AimBot.PredictionAmmount * 100,
        Flag = "prediction_amount",
        Callback = function(v)
            HyperEscape.AimBot.PredictionAmmount = v / 100
        end
    })
end

do -- aimbot right section
    local rightsec = AimBot:DrawSection({
        Name = "Aimbot Settings",
        Position = "right"
    })
    
    rightsec:AddToggle({
        Name = "Show FOV",
        Flag = "show_fov",
        Default = false,
        Callback = function(v)
            HyperEscape.AimBot.ShowFov = v
        end
    })
    rightsec:AddSlider({
        Name = "FOV",
        Min = 1,
        Max = 360,
        Default = 360,
        Flag = "fov",
        Callback = function(v)
            HyperEscape.AimBot.Fov = v
        end
    })
    rightsec:AddSlider({
        Name = "Smoothing",
        Min = 1,
        Max = 100,
        Default = 1,
        Flag = "smoothing",
        Callback = function(v)
            HyperEscape.AimBot.Smoothing = v / 100
        end
    })
    rightsec:AddDropdown({
        Name = "Aim Part",
        Default = "Head",
        Flag = "aim_part",
        Values = {"Head", "Torso", "HumanoidRootPart"},
        Callback = function(v)
            HyperEscape.AimBot.AimPart = v
        end
    })
    rightsec:AddSlider({
        Name = "Thickness",
        Min = 1,
        Max = 10,
        Default = 1,
        Flag = "thickness",
        Callback = function(v)
            HyperEscape.AimBot.Thickness = v
        end
    })
    rightsec:AddColorPicker({
        Name = "FOV Fill Color",
        Default = Color3.fromRGB(100,0,100),
        Flag = "fov_fill_color",
        Callback = function(v)
            HyperEscape.AimBot.FovFillColor = v
        end
    })
    rightsec:AddColorPicker({
        Name = "FOV Color",
        Default = Color3.fromRGB(100,0,100),
        Flag = "fov_color",
        Callback = function(v)
            HyperEscape.AimBot.FovColor = v
        end
    })
    rightsec:AddSlider({
        Name = "FOV Fill Transparency",
        Min = 0,
        Max = 1,
        Default = 1,
        Flag = "fov_fill_transparency",
        Callback = function(v)
            HyperEscape.AimBot.FovFillTransparency = v
        end
    })
    rightsec:AddSlider({
        Name = "FOV Transparency",
        Min = 0,
        Max = 1,
        Default = 0,
        Flag = "fov_transparency",
        Callback = function(v)
            HyperEscape.AimBot.FovTransparenct = v
        end
    })
end

do -- exploits
    if not game.PlaceId == 301549746 then return end -- if this doesnt work then lord have mercy
    local exploits = Exploits:DrawSection({
        Name = "Exploits",
        Position = "left"
    })
    exploits:AddToggle({
        Name = "No Spread",
        Flag = "no_spread",
        Default = false,
        Callback = function(v)
            if v then Spread() end
        end,
    })
    exploits:AddToggle({
        Name = "No Recoil",
        Flag = "no_recoil",
        Default = false,
        Callback = function(v)
            if v then Recoil() end
        end,
    })
    exploits:AddToggle({
        Name = "Rapid Fire",
        Flag = "rapid_fire",
        Default = false,
        Callback = function(v)
            if v then Rapid() end
        end,
    })
    exploits:AddToggle({
        Name = "Infinite Ammo",
        Flag = "infinite_ammo",
        Default = false,
        Callback = function(v)
            if v then Ammo() end
        end,
    })
    exploits:AddToggle({
        Name = "Magic Bullet",
        Flag = "magic_bullet",
        Default = false,
        Callback = function(v)
            if v then Penetration() end
        end,
    })
    exploits:AddToggle({
        Name = "Fast Equip",
        Flag = "fast_equip",
        Default = false,
        Callback = function(v)
            if v then Equip() end
        end,
    })
    exploits:AddToggle({
        Name = "Fast Reload",
        Flag = "fast_reload",
        Default = false,
        Callback = function(v)
            if v then Reload() end
        end,
    })
    exploits:AddToggle({
        Name = "Infinite Range",
        Flag = "infinite_range",
        Default = false,
        Callback = function(v)
            if v then Range() end
        end,
    })
    exploits:AddToggle({
        Name = "Unlock All Skins",
        Flag = "unlock_skins",
        Risky = true,
        Default = false,

        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/dimension-sources/random-scripts-i-found/main/UnlockAllSkinsCB"))()
        end
    })
end

do -- exploits info section fuck you compkiller ui
    local info = Exploits:DrawSection({
        Name = "Info",
        Position = "right"
    })
    info:AddParagraph({
        Title = "Removes Spread",
        Content = ""
    })
    info:AddParagraph({
        Title = "Removes Recoil",
        Content = ""
    })
    info:AddParagraph({
        Title = "Removes Shot Delay",
        Content = ""
    })
    info:AddParagraph({
        Title = "Infinite Ammo",
        Content = ""
    })
    info:AddParagraph({
        Title = "Max Penetration",
        Content = ""
    })
    info:AddParagraph({
        Title = "Removes Equip Animation",
        Content = ""
    })
    info:AddParagraph({
        Title = "Removes Reload Animation",
        Content = ""
    })
    info:AddParagraph({
        Title = "Removes Range Cap",
        Content = ""
    })
    info:AddParagraph({
        Title = "Self Explanatory",
        Content = ""
    })
end

do -- misc
    local misc = Misc:DrawSection({
        Name = "Misc",
        Position = "left"
    })

    misc:AddToggle({
        Name = "Bhop Enabled",
        Flag = "bhop_enabled",
        Default = HyperEscape.Misc.bhopenabled,
        Callback = function(v)
            HyperEscape.Misc.bhopenabled = v
        end,
    })
    
    misc:AddSlider({
        Name = "Bhop Speed",
        Min = 1,
        Max = 100,
        Default = HyperEscape.Misc.bhopspeed,
        Flag = "bhop_speed",
        Callback = function(v)
            HyperEscape.Misc.bhopspeed = v
        end,
    })


    misc:AddToggle({
        Name = "Queue on teleport",
        Default = true,
        Flag = "queue_on_teleport",

        Callback = function()
            queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/FozzyHvH/testa/refs/heads/main/compkiller.lua'))()")
        end
    })
end

do -- ESP left section
    local esp_left = ESP:DrawSection({
        Name = "ESP Options",
        Position = "left"
    })

    esp_left:AddToggle({
        Name = "Enabled",
        Flag = "esp_enabled",
        Default = HyperEscape.esp.Enabled,
        Callback = function(v)
            HyperEscape.esp.Enabled = v
        end
    })
    esp_left:AddToggle({
        Name = "Team Check",
        Flag = "esp_team_check",
        Default = HyperEscape.esp.TeamCheck,
        Callback = function(v)
            HyperEscape.esp.TeamCheck = v
        end
    })
    esp_left:AddSlider({
        Name = "Max Distance",
        Min = 100,
        Max = 10000,
        Default = HyperEscape.esp.MaxDistance,
        Flag = "esp_max_distance",
        Callback = function(v)
            HyperEscape.esp.MaxDistance = v
        end
    })

    esp_left:AddToggle({
        Name = "Box",
        Flag = "esp_box",
        Default = HyperEscape.esp.Box.Box,
        Callback = function(v)
            HyperEscape.esp.Box.Box = v
        end
    })
    esp_left:AddToggle({
        Name = "Name",
        Flag = "esp_name",
        Default = HyperEscape.esp.Box.Name,
        Callback = function(v)
            HyperEscape.esp.Box.Name = v
        end
    })
    esp_left:AddToggle({
        Name = "Distance",
        Flag = "esp_distance",
        Default = HyperEscape.esp.Box.Distance,
        Callback = function(v)
            HyperEscape.esp.Box.Distance = v
        end
    })
    esp_left:AddToggle({
        Name = "Health Text",
        Flag = "esp_health_text",
        Default = HyperEscape.esp.Box.Health,
        Callback = function(v)
            HyperEscape.esp.Box.Health = v
        end
    })
    esp_left:AddToggle({
        Name = "Health Bar",
        Flag = "esp_health_bar",
        Default = HyperEscape.esp.Box.HealthBar,
        Callback = function(v)
            HyperEscape.esp.Box.HealthBar = v
        end
    })
    esp_left:AddToggle({
        Name = "Box Outline",
        Flag = "esp_box_outline",
        Default = HyperEscape.esp.Box.Outline,
        Callback = function(v)
            HyperEscape.esp.Box.Outline = v
        end
    })

    esp_left:AddToggle({
        Name = "Tracer",
        Flag = "esp_tracer",
        Default = HyperEscape.esp.Tracer.Tracer,
        Callback = function(v)
            HyperEscape.esp.Tracer.Tracer = v
        end
    })
    esp_left:AddToggle({
        Name = "Tracer Team Color",
        Flag = "esp_tracer_team_color",
        Default = HyperEscape.esp.Tracer.TeamColor,
        Callback = function(v)
            HyperEscape.esp.Tracer.TeamColor = v
        end
    })
    esp_left:AddToggle({
        Name = "Tracer Outline",
        Flag = "esp_tracer_outline",
        Default = HyperEscape.esp.Tracer.Outline,
        Callback = function(v)
            HyperEscape.esp.Tracer.Outline = v
        end
    })

    esp_left:AddToggle({
        Name = "Hilights",
        Flag = "esp_hilights",
        Default = HyperEscape.esp.Hilights.Hilights,
        Callback = function(v)
            HyperEscape.esp.Hilights.Hilights = v
        end
    })
    esp_left:AddToggle({
        Name = "Always Visible",
        Flag = "esp_always_visible",
        Default = HyperEscape.esp.Hilights.AllWaysVisible,
        Callback = function(v)
            HyperEscape.esp.Hilights.AllWaysVisible = v
        end
    })
end

do -- ESP right section
    local esp_right = ESP:DrawSection({
        Name = "ESP Colors & Visuals",
        Position = "right"
    })


    esp_right:AddColorPicker({
        Name = "Box Color",
        Default = HyperEscape.esp.Box.Color,
        Flag = "esp_box_color",
        Callback = function(v)
            HyperEscape.esp.Box.Color = v
        end
    })
    esp_right:AddColorPicker({
        Name = "Box Outline Color",
        Default = HyperEscape.esp.Box.OutlineColor,
        Flag = "esp_box_outline_color",
        Callback = function(v)
            HyperEscape.esp.Box.OutlineColor = v
        end
    })

    esp_right:AddColorPicker({
        Name = "Tracer Color",
        Default = HyperEscape.esp.Tracer.Color,
        Flag = "esp_tracer_color",
        Callback = function(v)
            HyperEscape.esp.Tracer.Color = v
        end
    })
    esp_right:AddColorPicker({
        Name = "Tracer Outline Color",
        Default = HyperEscape.esp.Tracer.OutlineColor,
        Flag = "esp_tracer_outline_color",
        Callback = function(v)
            HyperEscape.esp.Tracer.OutlineColor = v
        end
    })

    esp_right:AddColorPicker({
        Name = "Hilight Fill Color",
        Default = HyperEscape.esp.Hilights.FillColor,
        Flag = "esp_hilight_fill_color",
        Callback = function(v)
            HyperEscape.esp.Hilights.FillColor = v
        end
    })
    esp_right:AddColorPicker({
        Name = "Hilight Outline Color",
        Default = HyperEscape.esp.Hilights.OutlineColor,
        Flag = "esp_hilight_outline_color",
        Callback = function(v)
            HyperEscape.esp.Hilights.OutlineColor = v
        end
    })

    esp_right:AddSlider({
        Name = "Hilight Fill Transparency",
        Min = 0,
        Max = 1,
        Default = HyperEscape.esp.Hilights.FillTransparency,
        Flag = "esp_hilight_fill_transparency",
        Callback = function(v)
            HyperEscape.esp.Hilights.FillTransparency = v
        end
    })
    esp_right:AddSlider({
        Name = "Hilight Outline Transparency",
        Min = 0,
        Max = 1,
        Default = HyperEscape.esp.Hilights.OutlineTransparency,
        Flag = "esp_hilight_outline_transparency",
        Callback = function(v)
            HyperEscape.esp.Hilights.OutlineTransparency = v
        end
    })
end







do -- settings
    Settings:AddToggle({
        Name = "Alway Show Frame",
        Default = false,
        Callback = function(v)
            Window.AlwayShowTab = v;
        end,
    })

    Settings:AddColorPicker({
        Name = "Highlight",
        Default = Compkiller.Colors.Highlight,
        Callback = function(v)
            Compkiller.Colors.Highlight = v;
            Compkiller:RefreshCurrentColor();
        end,
    })

    Settings:AddColorPicker({
        Name = "Toggle Color",
        Default = Compkiller.Colors.Toggle,
        Callback = function(v)
            Compkiller.Colors.Toggle = v;
            
            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "Drop Color",
        Default = Compkiller.Colors.DropColor,
        Callback = function(v)
            Compkiller.Colors.DropColor = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "Risky",
        Default = Compkiller.Colors.Risky,
        Callback = function(v)
            Compkiller.Colors.Risky = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "Mouse Enter",
        Default = Compkiller.Colors.MouseEnter,
        Callback = function(v)
            Compkiller.Colors.MouseEnter = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "Block Color",
        Default = Compkiller.Colors.BlockColor,
        Callback = function(v)
            Compkiller.Colors.BlockColor = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "Background Color",
        Default = Compkiller.Colors.BGDBColor,
        Callback = function(v)
            Compkiller.Colors.BGDBColor = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "Block Background Color",
        Default = Compkiller.Colors.BlockBackground,
        Callback = function(v)
            Compkiller.Colors.BlockBackground = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "Stroke Color",
        Default = Compkiller.Colors.StrokeColor,
        Callback = function(v)
            Compkiller.Colors.StrokeColor = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "High Stroke Color",
        Default = Compkiller.Colors.HighStrokeColor,
        Callback = function(v)
            Compkiller.Colors.HighStrokeColor = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "Switch Color",
        Default = Compkiller.Colors.SwitchColor,
        Callback = function(v)
            Compkiller.Colors.SwitchColor = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddColorPicker({
        Name = "Line Color",
        Default = Compkiller.Colors.LineColor,
        Callback = function(v)
            Compkiller.Colors.LineColor = v;

            Compkiller:RefreshCurrentColor(v);
        end,
    })

    Settings:AddButton({
        Name = "Get Theme",
        Callback = function()
            print(Compkiller:GetTheme())
            
            Notifier.new({
                Title = "Notification",
                Content = "Copied Them Color to your clipboard",
                Duration = 5,
                Icon = "rbxassetid://120245531583106"
            });
        end,
    })

    ThemeTab:DrawSection({
        Name = "UI Themes"
    }):AddDropdown({
        Name = "Select Theme",
        Default = "Default",
        Flag = "theme",
        Values = {
            "Default",
            "Dark Green",
            "Dark Blue",
            "Purple Rose",
            "Skeet"
        },
        Callback = function(v)
            Compkiller:SetTheme(v)
        end,
    })

    -- Creating Config Tab --
    local ConfigUI = Window:DrawConfig({
        Name = "Config",
        Icon = "folder",
        Config = ConfigManager
    })

    ConfigUI:Init()
end


-- Functionality

local IsArsenal = false;
if game.PlaceId == 286090429 then
    IsArsenal = true;
end

local ESPHolder = Instance.new("Folder", (CoreGui or localPlayer.PlayerGui)); 
local Fov = Instance.new("ScreenGui",(CoreGui or localPlayer.PlayerGui))Fov.Name = "Fov" Fov.ZIndexBehavior = Enum.ZIndexBehavior.Sibling Fov.ResetOnSpawn = false; -- Yapee
local FOVFFrame = Instance.new("Frame")FOVFFrame.Parent = Fov FOVFFrame.Name = "FOVFFrame" FOVFFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) FOVFFrame.BorderColor3 = Color3.fromRGB(0, 0, 0) FOVFFrame.BorderSizePixel = 0 FOVFFrame.BackgroundTransparency = 1 FOVFFrame.AnchorPoint = Vector2.new(0.5, 0.5) FOVFFrame.Position = UDim2.new(0.5, 0,0.5, 0) FOVFFrame.Size = UDim2.new(0, HyperEscape.AimBot.Fov, 0, HyperEscape.AimBot.Fov) FOVFFrame.BackgroundTransparency = 1;
local UICorner = Instance.new("UICorner")UICorner.CornerRadius = UDim.new(1, 0) UICorner.Parent = FOVFFrame;
local UIStroke = Instance.new("UIStroke")UIStroke.Color = Color3.fromRGB(100,0,100) UIStroke.Parent = FOVFFrame UIStroke.Thickness = 1 UIStroke.ApplyStrokeMode = "Border";

local function IsAlive(Player)
    if Player and Player.Character and Player.Character:FindFirstChild("Humanoid") ~= nil and (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value > 0 or not IsArsenal and Player.Character.Humanoid.Health > 0) then
        return true
    end
    return false
end

local function GetTeam(Player)
    if not game.Players.LocalPlayer.Neutral then
        return game.Teams[Player.Team.Name];
    end
    return true;
end

function isVisible(p, ...)

    if not (HyperEscape.AimBot.WallCheck == true) then
        return true;
    end

    return #CurrentCamera:GetPartsObscuringTarget({ p }, { CurrentCamera, localPlayer.Character, ... }) == 0;
end

function CameraGetClosestToMouse()
    local AimFov = HyperEscape.AimBot.Fov;
    local targetPos = nil;

    for i,v in pairs (game:GetService("Players"):GetPlayers()) do
        if v ~= localPlayer then
            if HyperEscape.AimBot.TeamCheck ~= true or GetTeam(v) ~= GetTeam(localPlayer) then 
                if IsAlive(v) then
                    local screen_pos, on_screen = CurrentCamera:WorldToViewportPoint(v.Character[HyperEscape.AimBot.AimPart].Position)
                    local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
                    local new_magnitude = (screen_pos_2D - mouseLocation(UIS)).Magnitude
                    if on_screen and new_magnitude < AimFov and isVisible(v.Character[HyperEscape.AimBot.AimPart].Position, v.Character.Head.Parent) then
                        AimFov = new_magnitude;
                        targetPos = v;
                    end
                end
            end
        end
    end
    return targetPos;
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
        Distance.Text = math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
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
        Health.Text = (IsArsenal and players[Player.Character.Name].NRPBS["Health"].Value or Player.Character.Humanoid.Health);
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
                local screen, onScreen = CurrentCamera:WorldToScreenPoint(Player.Character.HumanoidRootPart.Position); 
                local frustumHeight = math.tan(math.rad(CurrentCamera.FieldOfView * 0.5)) * 2 * screen.Z ; -- Thank you mickeydev, Join .gg/lunarity for the best paid script hub for fps games made by known and trusted developers. 
                local size = CurrentCamera.ViewportSize.Y / frustumHeight * HyperEscape.esp.CharacterSize;
                local position = Vector2.new(screen.X, screen.Y) - (size / 2 - Vector2.new(0, size.Y) / 20);

                if onScreen and (HyperEscape.esp.TeamCheck ~= true  or GetTeam(Player) ~= GetTeam(localPlayer)) and HyperEscape.esp.Enabled then	
                    local DistanceNumb = math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
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

                            Distance.Text = math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude);
                            Name.Text = (HyperEscape.esp.Box.Name and HyperEscape.esp.Box.Distance and Player.Name .. " [" .. math.floor(0.5+(CurrentCamera.CFrame.Position - Player.Character.HumanoidRootPart.Position).magnitude / 3.5714285714) .. "]" or Player.Name);

                        else
                            Name.Visible = false;
                            Distance.Visible = false;
                        end

                        -- Tracer

                        if HyperEscape.esp.Tracer.Tracer then

                            local ScreenVec2 = Vector2.new(screen.X, screen.Y + size.Y / 2 + size.Y / 20);
                            local Origin = Vector2.new(CurrentCamera.ViewportSize.X/2, CurrentCamera.ViewportSize.Y - 1);
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
    if plr ~= localPlayer then
        LoadESP(plr);
    end
end

players.PlayerAdded:Connect(function(plr)
    if plr ~= localPlayer then
        LoadESP(plr);
    end
end)


game:GetService("RunService").RenderStepped:Conenct(function()
    if HyperEscape.Misc.bhopenabled and UIS:IsKeyDown("Space") then
        local localplr = game.Players.LocalPlayer
        if localplr.Character:FindFirstChild("jumpcd") then
            localplr.Character.jumpcd:Destroy()
        end
        localplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
    
        local vel = Vector3.zero
    
        if UIS:IsKeyDown("W") then
            vel = vel + workspace.CurrentCamera.CFrame.LookVector
        end
        if UIS:IsKeyDown("S") then
            vel = vel - workspace.CurrentCamera.CFrame.LookVector
        end
        if UIS:IsKeyDown("A") then
            vel = vel - workspace.CurrentCamera.CFrame.RightVector
        end
        if UIS:IsKeyDown("D") then
            vel = vel + workspace.CurrentCamera.CFrame.RightVector
        end
    
        if vel.Magnitude > 0 then
            vel = Vector3.new(vel.X, 0, vel.Z)
            localplr.Character.HumanoidRootPart.Velocity = (vel.Unit * (HyperEscape.Misc.bhopspeed * 1.3)) + Vector3.new(0, localplr.Character.HumanoidRootPart.Velocity.Y, 0)
            localplr.Character.Humanoid.Jump = true
        end
    end
end)









UIS.InputBegan:Connect(function(Key)
    if Key.KeyCode == HyperEscape.AimBot.Keybind and not HyperEscape.AimBot.UseMouse then
        HyperEscape.AimBot.Target = CameraGetClosestToMouse();
        HyperEscape.AimBot.IsAimKeyDown = true;
    end
end)
UIS.InputEnded:Connect(function(Key)
    if Key.KeyCode == HyperEscape.AimBot.Keybind and not HyperEscape.AimBot.UseMouse then
        HyperEscape.AimBot.Target = CameraGetClosestToMouse();
        HyperEscape.AimBot.IsAimKeyDown = false;
        if HyperEscape.AimBot.CameraTween ~= nil then
            HyperEscape.AimBot.CameraTween:Cancel();
        end
    end
end)

localPlayer:GetMouse().Button1Down:Connect(function(Key)
    if HyperEscape.AimBot.MouseBind == "MouseButton1" and HyperEscape.AimBot.UseMouse then
        if HyperEscape.AimBot.IsAimKeyDown then
            HyperEscape.AimBot.Target = CameraGetClosestToMouse();
            HyperEscape.AimBot.IsAimKeyDown = false;
            if HyperEscape.AimBot.CameraTween ~= nil then
                HyperEscape.AimBot.CameraTween:Cancel();
            end
        else
            HyperEscape.AimBot.Target = CameraGetClosestToMouse();
            HyperEscape.AimBot.IsAimKeyDown = true;
        end
    end
end)
localPlayer:GetMouse().Button1Up:Connect(function(Key)
    if HyperEscape.AimBot.MouseBind == "MouseButton1" and HyperEscape.AimBot.UseMouse then
        HyperEscape.AimBot.Target = CameraGetClosestToMouse();
        HyperEscape.AimBot.IsAimKeyDown = false;
        if HyperEscape.AimBot.CameraTween ~= nil then
            HyperEscape.AimBot.CameraTween:Cancel();
        end
    end
end)

localPlayer:GetMouse().Button2Down:Connect(function(Key)
    if HyperEscape.AimBot.MouseBind == "MouseButton2" and HyperEscape.AimBot.UseMouse then
        HyperEscape.AimBot.Target = CameraGetClosestToMouse();
        HyperEscape.AimBot.IsAimKeyDown = true;
    end
end)
localPlayer:GetMouse().Button2Up:Connect(function(Key)
    if HyperEscape.AimBot.MouseBind == "MouseButton2" and HyperEscape.AimBot.UseMouse then
        HyperEscape.AimBot.Target = CameraGetClosestToMouse();
        HyperEscape.AimBot.IsAimKeyDown = false;
        if HyperEscape.AimBot.CameraTween ~= nil then
            HyperEscape.AimBot.CameraTween:Cancel();
        end
    end
end)

game:GetService("RunService").Heartbeat:Connect(function() 
    if HyperEscape.AimBot.Enabled and HyperEscape.AimBot.ShowFov then
        UIStroke.Enabled = true
        UIStroke.Color = HyperEscape.AimBot.FovColor

        local posd = UIS:GetMouseLocation()
        FOVFFrame.Position = UDim2.new(0, posd.X, 0, posd.Y - 36)
        FOVFFrame.Size = UDim2.fromOffset(HyperEscape.AimBot.Fov * 1.5, HyperEscape.AimBot.Fov * 1.5)
    else
        UIStroke.Enabled = false
    end

    if HyperEscape.AimBot.Enabled and HyperEscape.AimBot.IsAimKeyDown then
        local target = HyperEscape.AimBot.StickyAim and HyperEscape.AimBot.Target or CameraGetClosestToMouse()
        if target and IsAlive(target) then
            local aim_part = target.Character[HyperEscape.AimBot.AimPart]
            local predicted = aim_part.Position
            if HyperEscape.AimBot.Prediction then
                predicted = predicted + (aim_part.Velocity * (localPlayer:GetNetworkPing() * HyperEscape.AimBot.PredictionAmmount))
            end

            -- clamp smoothing
            local smoothing = math.clamp(HyperEscape.AimBot.Smoothing, 0.01, 1)

            if HyperEscape.AimBot.Method == "Mouse" then
                local screen_pos = CurrentCamera:WorldToViewportPoint(predicted)
                local mouse_pos = UIS:GetMouseLocation()
                local dx = (screen_pos.X - mouse_pos.X) * smoothing
                local dy = (screen_pos.Y - mouse_pos.Y) * smoothing
                mousemoverel(dx, dy)
                if HyperEscape.AimBot.CameraTween ~= nil then
                    HyperEscape.AimBot.CameraTween:Cancel()
                    HyperEscape.AimBot.CameraTween = nil
                end
            else
                if HyperEscape.AimBot.CameraTween ~= nil then
                    HyperEscape.AimBot.CameraTween:Cancel()
                end
                HyperEscape.AimBot.CameraTween = TweenService:Create(
                    CurrentCamera,
                    TweenInfo.new(smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                    {CFrame = CFrame.new(CurrentCamera.CFrame.Position, predicted)}
                )
                HyperEscape.AimBot.CameraTween:Play()
            end
        elseif HyperEscape.AimBot.CameraTween ~= nil then
            HyperEscape.AimBot.CameraTween:Cancel()
            HyperEscape.AimBot.CameraTween = nil
        end
    elseif HyperEscape.AimBot.CameraTween ~= nil then
        HyperEscape.AimBot.CameraTween:Cancel()
        HyperEscape.AimBot.CameraTween = nil
    end
end)
