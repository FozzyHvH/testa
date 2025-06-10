-- hookfunction security
local exe_name, exe_version = identifyexecutor()
local function home999() end
local function home888() end

if exe_name ~= "Wave Windows" then
    hookfunction(home888, home999)
    if isfunctionhooked(home888) == false then
        game.Players.LocalPlayer:Destroy()
        return LPH_CRASH()
    end
end 

local function check_env(env)
    for _, func in env do
        if type(func) ~= "function" then
            continue
        end

        local functionhook = isfunctionhooked(func)

        if functionhook then
            game.Players.LocalPlayer:Destroy()
            return LPH_CRASH()
        end
    end
end

check_env( getgenv() )
check_env( getrenv() )
--

local Lua_Fetch_Connections = getconnections
local Lua_Fetch_Upvalues = getupvalues
local Lua_Hook = hookfunction 
local Lua_Hook_Method = hookmetamethod
local Lua_Unhook = restorefunction
local Lua_Replace_Function = replaceclosure
local Lua_Set_Upvalue = setupvalue
local Lua_Clone_Function = clonefunction

local Game_RunService = game:GetService("RunService")
local Game_LogService = game:GetService("LogService")
local Game_LogService_MessageOut = Game_LogService.MessageOut

local String_Lower = string.lower
local Table_Find = table.find
local Get_Type = type

local Current_Connections = {};
local Hooked_Connections = {};

local function Test_Table(Table, Return_Type)
for TABLE_INDEX, TABLE_VALUE in Table do
    if type(TABLE_VALUE) == String_Lower(Return_Type) then
        return TABLE_VALUE, TABLE_INDEX
    end

    continue
end
end

local function Print_Table(Table)
table.foreach(Table, print)
end

if getgenv().DEBUG then
print("[auth.injected.live] Waiting...")
end

local good_check = 0

function auth_heart()


return true , true
end

function Lua_Common_Intercept(old, ...)
print(...)
return old(...)
end

function XVNP_L(CONNECTION)
local s, e = pcall(function()
    local OPENAC_TABLE = Lua_Fetch_Upvalues(CONNECTION.Function)[9]
    local OPENAC_FUNCTION = OPENAC_TABLE[1]
    local IGNORED_INDEX = {3, 12, 1, 11, 15, 8, 20, 18, 22}




    Lua_Set_Upvalue(OPENAC_FUNCTION, 14, function(...)
        return function(...)
            local args = {...}

            if type(args[1]) == "table" and args[1][1] then
                pcall(function()
                    if type(args[1][1]) == "userdata" then
                        args[1][1]:Disconnect()
                        args[1][2]:Disconnect()
                        args[1][3]:Disconnect()
                        args[1][4]:Disconnect()

                    end


                end)
            end 
        end
    end)

    Lua_Set_Upvalue(OPENAC_FUNCTION, 1, function(...)
        task.wait(200)
    end)

    hookfunction(OPENAC_FUNCTION, function(...)

        return {}
    end)
end)
end

local XVNP_LASTUPDATE = 0
local XVNP_UPDATEINTERVAL = 5

local XVNP_CONNECTIONSNIFFER;

XVNP_CONNECTIONSNIFFER = Game_RunService.RenderStepped:Connect(function()
if #Lua_Fetch_Connections(Game_LogService_MessageOut) >= 2 then

    XVNP_CONNECTIONSNIFFER:Disconnect()
end

if tick() - XVNP_LASTUPDATE >= XVNP_UPDATEINTERVAL then
    XVNP_LASTUPDATE = tick() 

    local OpenAc_Connections = Lua_Fetch_Connections(Game_LogService_MessageOut)

    for _, CONNECTION in OpenAc_Connections do
        if not table.find(Current_Connections, CONNECTION) then
            table.insert(Current_Connections, CONNECTION)
            table.insert(Hooked_Connections, CONNECTION)

            XVNP_L(CONNECTION)
            
        end
    end
end
end)

local last_beat = 0
Game_RunService.RenderStepped:Connect(function()
if last_beat + 1 < tick() then
    last_beat = tick() + 1 

    local what, are = auth_heart()

    if not are or not what then
        if good_check <= 0 then
            game.Players.LocalPlayer:Destroy()
            return LPH_CRASH()
        else
            good_check -=1
        end
    else
        good_check += 1
    end

end
end)

if getgenv().DEBUG then
print("started emulation thread")
end


getfenv().LPH_NO_VIRTUALIZE = function(f) return f end;

-- ac bypass above
-- local replicated_storage = game:GetService("ReplicatedStorage");
-- local old_namecall;
-- local blacklisted = {
--     "BreathingHAMON",
--     "OneMoreTime",
--     "TeleportDetect",
--     "GUI_CHECK",
--     "checkingSPEED",
--     "BANREMOTE",
--     "PERMAIDBAN",
--     "KICKREMOTE",
--     "BR_KICKPC",
--     "BR_KICKMOBILE",
--     "UpdateMousePosI",
--     "UpdateMousePos",
--     "CalculateShootClient"
-- }

-- old_namecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
--     local self, args = ..., {select(2, ...)};
--     local method = string.lower(getnamecallmethod());

--     if typeof(self) == "Instance" and self:IsA("RemoteEvent") then
--         if method == "fireserver" and table.find(blacklisted, self.Name) then
--             return
--         end
--     end
    
--     return old_namecall(...);
-- end))
-- fuckass checks for the new fuckass update (openacK till i decay)
print("executed")

if not (hookmetamethod or makefolder) then 
    warn("this shit not gonna work shitsploit user")
end 

-- tables cuz ts pmo esp dogshit poo poo
local colorsets = {
    boxcolor = Color3.fromRGB(255, 255, 255),
    boxoutlinecolor = Color3.fromRGB(0, 0, 0),
    highlightfillcolor = Color3.fromRGB(50, 110, 170),
    highlightoutlinecolor = Color3.fromRGB(50, 110, 170),
    highlighttargetcolor = Color3.fromRGB(50, 110, 170),
    highlighttargetoutlinecolor = Color3.fromRGB(50, 110, 170),
    targetauracolor = Color3.fromRGB(50, 110, 170)
}




-- variables
local Lighting = game:GetService("Lighting");
local Lighting_Save = {["ColorShift_Bottom"] = Lighting.ColorShift_Bottom, ["Ambient"]=Lighting.Ambient, ["OutdoorAmbient"]=Lighting.OutdoorAmbient, ["ColorShift_Top"]=Lighting.ColorShift_Top, ["FogColor"]=Lighting.FogColor, ["FogEnd"]=Lighting.FogEnd, ["FogStart"]=Lighting.FogStart, ["ClockTime"]=Lighting.ClockTime, ["Brightness"]=Lighting.Brightness}
local RunService = game:GetService("RunService");
local framework = {connections = {}};
local Players = game:GetService("Players")
local SilentAimTarget = nil
local SilentAimLocked = false
local LocalPlr = Players.LocalPlayer
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Camera = Workspace.CurrentCamera
local PreviousGun, PreviousAmmo = nil, nil
local framework = {connections = {}};
local C_Desync = {Enabled = false, OldPosition = nil}
local bodyClone = game:GetObjects("rbxassetid://8246626421")[1]; bodyClone.Humanoid:Destroy(); bodyClone.Head.Face:Destroy(); bodyClone.Parent = game.Workspace; bodyClone.HumanoidRootPart.Velocity = Vector3.new(); bodyClone.HumanoidRootPart.CFrame = CFrame.new(9999,9999,9999); bodyClone.HumanoidRootPart.Transparency = 1; bodyClone.HumanoidRootPart.CanCollide = false
for _, part in pairs(bodyClone:GetDescendants()) do
    if part:IsA("BasePart") then
        part.CanCollide = false
        part.Transparency = 0.5
        part.Color = Color3.new(0.937254, 0.058823, 1)
    end
end
local visualizeChams = Instance.new("Highlight"); visualizeChams.Enabled = true; visualizeChams.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; visualizeChams.FillColor = Color3.fromRGB(102, 60, 153); visualizeChams.OutlineColor =  Color3.fromRGB(0, 0, 0); visualizeChams.Adornee = bodyClone; visualizeChams.OutlineTransparency = 0.2; visualizeChams.FillTransparency = 0.5; visualizeChams.Parent = game.CoreGui 
local col1, col2 = nil, nil
local desyncenabled = nil
local checks; 
local nojump_hooked = false
local nojump_oldhook
local ESPHolder = Instance.new("Folder", game:GetService("CoreGui"))
ESPHolder.Name = "ESPHolder"
local EtherealParts = Instance.new('Folder', workspace)
EtherealParts.Name  = 'EtherealParts'
-- hit sounds! yaay
getgenv().hitsounds = {
    ["Bubble"] = "rbxassetid://6534947588",
    ["Lazer"] = "rbxassetid://130791043",
    ["Pick"] = "rbxassetid://1347140027",
    ["Pop"] = "rbxassetid://198598793",
    ["Rust"] = "rbxassetid://1255040462",
    ["Sans"] = "rbxassetid://3188795283",
    ["Fart"] = "rbxassetid://130833677",
    ["Big"] = "rbxassetid://5332005053",
    ["Vine"] = "rbxassetid://5332680810",
    ["UwU"] = "rbxassetid://8679659744",
    ["Bruh"] = "rbxassetid://4578740568",
    ["Skeet"] = "rbxassetid://5633695679",
    ["Neverlose"] = "rbxassetid://6534948092",
    ["Fatality"] = "rbxassetid://6534947869",
    ["Bonk"] = "rbxassetid://5766898159",
    ["Minecraft"] = "rbxassetid://5869422451",
    ["Gamesense"] = "rbxassetid://4817809188",
    ["RIFK7"] = "rbxassetid://9102080552",
    ["Bamboo"] = "rbxassetid://3769434519",
    ["Crowbar"] = "rbxassetid://546410481",
    ["Weeb"] = "rbxassetid://6442965016",
    ["Beep"] = "rbxassetid://8177256015",
    ["Bambi"] = "rbxassetid://8437203821",
    ["Stone"] = "rbxassetid://3581383408",
    ["Old Fatality"] = "rbxassetid://6607142036",
    ["Click"] = "rbxassetid://8053704437",
    ["Ding"] = "rbxassetid://7149516994",
    ["Snow"] = "rbxassetid://6455527632",
    ["Laser"] = "rbxassetid://7837461331",
    ["Mario"] = "rbxassetid://2815207981",
    ["Steve"] = "rbxassetid://4965083997",
    ["Call of Duty"] = "rbxassetid://5952120301",
    ["Bat"] = "rbxassetid://3333907347",
    ["TF2 Critical"] = "rbxassetid://296102734",
    ["Saber"] = "rbxassetid://8415678813",
    ["Baimware"] = "rbxassetid://3124331820",
    ["Osu"] = "rbxassetid://7149255551",
    ["TF2"] = "rbxassetid://2868331684",
    ["Slime"] = "rbxassetid://6916371803",
    ["Among Us"] = "rbxassetid://5700183626",
    ["One"] = "rbxassetid://7380502345"
}
local flashValue = 0.1
local flashTime = 0
-- variables
    local uis = game:GetService("UserInputService") 
    local players = game:GetService("Players") 
    local ws = game:GetService("Workspace")
    local rs = game:GetService("ReplicatedStorage")
    local http_service = game:GetService("HttpService")
    local gui_service = game:GetService("GuiService")
    local lighting = game:GetService("Lighting")
    local run = game:GetService("RunService")
    local stats = game:GetService("Stats")
    local coregui = game:GetService("CoreGui")
    local debris = game:GetService("Debris")
    local tween_service = game:GetService("TweenService")
    local sound_service = game:GetService("SoundService")

    local vec2 = Vector2.new
    local vec3 = Vector3.new
    local dim2 = UDim2.new
    local dim = UDim.new 
    local rect = Rect.new
    local cfr = CFrame.new
    local angle = CFrame.Angles

    local color = Color3.new
    local rgb = Color3.fromRGB
    local hex = Color3.fromHex
    local rgbseq = ColorSequence.new
    local rgbkey = ColorSequenceKeypoint.new
    local numseq = NumberSequence.new
    local numkey = NumberSequenceKeypoint.new

    local camera = ws.CurrentCamera
    local lp = players.LocalPlayer 
    local mouse = lp:GetMouse() 
    local gui_offset = gui_service:GetGuiInset().Y

    local max = math.max 
    local floor = math.floor 
    local min = math.min 
    local abs = math.abs 
    local noise = math.noise
    local rad = math.rad 
    local random = math.random 
    local pow = math.pow 

    local main_event = rs:FindFirstChild("MainEvent")
-- 

if not LPH_OBFUSCATED then
    getfenv().LPH_NO_VIRTUALIZE = function(...) return (...) end
end

-- library init
    local library = {
        directory = "primordial",
        folders = {
            "/sounds",
            "/fonts",
            "/configs",
            "/images"
        },
        flags = {},
        config_flags = {},
        guis = {}, 
        connections = {},   

        current_tab, 
        current_element_open, 
        dock_button_holder,  
        font, 
        keybind_list
    }

    local flags = library.flags
    local config_flags = library.config_flags

    themes = {
        preset = {
            ["outline"] = rgb(15, 15, 18),
            ["inline"] = rgb(28, 28, 35),
            ["accent"] = rgb(50, 110, 170),
            ["high_contrast"] = rgb(22, 22, 28),
            ["low_contrast"] = rgb(28, 28, 35),
            ["text"] = rgb(170, 170, 170),
            ["text_outline"] = rgb(0, 0, 0),
            ["glow"] = rgb(50, 110, 170),
        },

        utility = {
            ["outline"] = {
                ["BackgroundColor3"] = {}, 	
                ["Color"] = {}, 
            },
            ["inline"] = {
                ["BackgroundColor3"] = {}, 	
            },
            ["accent"] = {
                ["BackgroundColor3"] = {}, 	
                ["TextColor3"] = {}, 
                ["ImageColor3"] = {}, 
                ["ScrollBarImageColor3"] = {} 
            },
            ["contrast"] = {
                ["Color"] = {}, 	
            },
            ["text"] = {
                ["TextColor3"] = {}, 	
            },
            ["text_outline"] = {
                ["Color"] = {}, 	
            },
            ["glow"] = {
                ["ImageColor3"] = {}, 	
            }, 
        }, 

        find = {
            ["Frame"] = "BackgroundColor3", 
            ["TextLabel"] = "TextColor3", 
            ["UIGradient"] = "Color",
            ["UIStroke"] = "Color",
            ["ImageLabel"] = "ImageColor3",
            ["TextButton"] = "BackgroundColor3", 
            ["ScrollingFrame"] = "ScrollBarImageColor3"
        }
    }

    local keys = {
        [Enum.KeyCode.LeftShift] = "LS",
        [Enum.KeyCode.RightShift] = "RS",
        [Enum.KeyCode.LeftControl] = "LC",
        [Enum.KeyCode.RightControl] = "RC",
        [Enum.KeyCode.Insert] = "INS",
        [Enum.KeyCode.Backspace] = "BS",
        [Enum.KeyCode.Return] = "Ent",
        [Enum.KeyCode.LeftAlt] = "LA",
        [Enum.KeyCode.RightAlt] = "RA",
        [Enum.KeyCode.CapsLock] = "CAPS",
        [Enum.KeyCode.One] = "1",
        [Enum.KeyCode.Two] = "2",
        [Enum.KeyCode.Three] = "3",
        [Enum.KeyCode.Four] = "4",
        [Enum.KeyCode.Five] = "5",
        [Enum.KeyCode.Six] = "6",
        [Enum.KeyCode.Seven] = "7",
        [Enum.KeyCode.Eight] = "8",
        [Enum.KeyCode.Nine] = "9",
        [Enum.KeyCode.Zero] = "0",
        [Enum.KeyCode.KeypadOne] = "Num1",
        [Enum.KeyCode.KeypadTwo] = "Num2",
        [Enum.KeyCode.KeypadThree] = "Num3",
        [Enum.KeyCode.KeypadFour] = "Num4",
        [Enum.KeyCode.KeypadFive] = "Num5",
        [Enum.KeyCode.KeypadSix] = "Num6",
        [Enum.KeyCode.KeypadSeven] = "Num7",
        [Enum.KeyCode.KeypadEight] = "Num8",
        [Enum.KeyCode.KeypadNine] = "Num9",
        [Enum.KeyCode.KeypadZero] = "Num0",
        [Enum.KeyCode.Minus] = "-",
        [Enum.KeyCode.Equals] = "=",
        [Enum.KeyCode.Tilde] = "~",
        [Enum.KeyCode.LeftBracket] = "[",
        [Enum.KeyCode.RightBracket] = "]",
        [Enum.KeyCode.RightParenthesis] = ")",
        [Enum.KeyCode.LeftParenthesis] = "(",
        [Enum.KeyCode.Semicolon] = ",",
        [Enum.KeyCode.Quote] = "'",
        [Enum.KeyCode.BackSlash] = "\\",
        [Enum.KeyCode.Comma] = ",",
        [Enum.KeyCode.Period] = ".",
        [Enum.KeyCode.Slash] = "/",
        [Enum.KeyCode.Asterisk] = "*",
        [Enum.KeyCode.Plus] = "+",
        [Enum.KeyCode.Period] = ".",
        [Enum.KeyCode.Backquote] = "`",
        [Enum.UserInputType.MouseButton1] = "MB1",
        [Enum.UserInputType.MouseButton2] = "MB2",
        [Enum.UserInputType.MouseButton3] = "MB3",
        [Enum.KeyCode.Escape] = "ESC",
        [Enum.KeyCode.Space] = "SPC",
    }
        
    library.__index = library

    for _, path in next, library.folders do 
        makefolder(library.directory .. path)
    end 

    if setreadonly then 
        if not isfile(library.directory .. "/fonts/main.ttf") then 
            --writefile(library.directory .. "/fonts/main.ttf", game:HttpGet("https://github.com/f1nobe7650/other/raw/main/uis/font.ttf"))
        end 
        
        local tahoma = {
            name = "SmallestPixel7",
            faces = {
                {
                    name = "Regular",
                    weight = 400,
                    style = "normal",
                    assetId = getcustomasset(library.directory .. "/fonts/main.ttf")
                }
            }
        }
        
        if not isfile(library.directory .. "/fonts/main_encoded.ttf") then 
            writefile(library.directory .. "/fonts/main_encoded.ttf", http_service:JSONEncode(tahoma))
        end 
        
        library.font = Font.new(getcustomasset(library.directory .. "/fonts/main_encoded.ttf"), Enum.FontWeight.Regular)
    else 
        library.font = Font.new("rbxasset://fonts/families/Zekton.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    end 

    local config_holder 
-- 

-- library functions 
    -- misc functions
        function library:make_resizable(frame) 
            local Frame = Instance.new("TextButton")
            Frame.Position = dim2(1, -10, 1, -10)
            Frame.BorderColor3 = rgb(0, 0, 0)
            Frame.Size = dim2(0, 10, 0, 10)
            Frame.BorderSizePixel = 0
            Frame.BackgroundColor3 = rgb(255, 255, 255)
            Frame.Parent = frame
            Frame.BackgroundTransparency = 1 
            Frame.Text = ""

            local resizing = false 
            local start_size 
            local start 
            local og_size = frame.Size  

            Frame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    resizing = true
                    start = input.Position
                    start_size = frame.Size
                end
            end)

            Frame.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    resizing = false
                end
            end)

            library:connection(uis.InputChanged, function(input, game_event) 
                if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local viewport_x = camera.ViewportSize.X
                    local viewport_y = camera.ViewportSize.Y

                    local current_size = dim2(
                        start_size.X.Scale,
                        math.clamp(
                            start_size.X.Offset + (input.Position.X - start.X),
                            og_size.X.Offset,
                            viewport_x
                        ),
                        start_size.Y.Scale,
                        math.clamp(
                            start_size.Y.Offset + (input.Position.Y - start.Y),
                            og_size.Y.Offset,
                            viewport_y
                        )
                    )
                    frame.Size = current_size
                end
            end)
        end

        function library:new_drawing(class, properties)
            local ins = Drawing.new(class)

            for _, v in next, properties do 
                ins[_] = v
            end 

            table.insert(nebula.drawings, ins)

            return ins 
        end 

        function library:new_item(class, properties) 
            local ins = Instance.new(class)

            for _, v in next, properties do 
                ins[_] = v
            end 

            table.insert(nebula.instances, ins)

            return ins 
        end 

        function library:convert_enum(enum)
            local enum_parts = {}
        
            for part in string.gmatch(enum, "[%w_]+") do
                table.insert(enum_parts, part)
            end
        
            local enum_table = Enum
            for i = 2, #enum_parts do
                local enum_item = enum_table[enum_parts[i]]
        
                enum_table = enum_item
            end
        
            return enum_table
        end

        function library:config_list_update() 
            if not config_holder then return end 
        
            local list = {}
        
            for idx, file in next, listfiles(library.directory .. "/configs") do
                local name = file:match("([^\\/]+)%.cfg$")
                if name then
                    list[#list + 1] = name
                end
            end
            
            config_holder.refresh_options(list)
        end 

        function library:get_config()
            local Config = {}
        
            for _, v in flags do
                if type(v) == "table" and v.key then
                    Config[_] = {active = v.active, mode = v.mode, key = tostring(v.key)}
                elseif type(v) == "table" and v["Transparency"] and v["Color"] then
                    Config[_] = {Transparency = v["Transparency"], Color = v["Color"]:ToHex()}
                else
                    Config[_] = v
                end
            end 
            
            return http_service:JSONEncode(Config)
        end

        function library:load_config(config_json) 
            local config = http_service:JSONDecode(config_json)
        
            for _, v in next, config do 
                local function_set = library.config_flags[_]
        
                if function_set then 
                    if type(v) == "table" and v["Transparency"] and v["Color"] then
                        function_set(hex(v["Color"]), v["Transparency"])
                    elseif type(v) == "table" and v["active"] then 
                        function_set(v)
                    else 
                        function_set(v)
                    end
                end 
            end 
        end 
        
        function library:round(number, float) 
            local multiplier = 1 / (float or 1)
            return math.floor(number * multiplier + 0.5) / multiplier
        end 

        function library:apply_theme(instance, theme, property) 
            table.insert(themes.utility[theme][property], instance)
        end

        function library:update_theme(theme, color)
            for _, property in next, themes.utility[theme] do 

                for m, object in next, property do 
                    if object[_] == themes.preset[theme] or object.ClassName == "UIGradient" then 
                        object[_] = color 
                    end 
                end 
            end 

            themes.preset[theme] = color 
        end 

        function library:connection(signal, callback)
            local connection = signal:Connect(callback)
            
            table.insert(library.connections, connection)

            return connection 
        end

        function library:apply_stroke(parent) 
            local stroke = library:create("UIStroke", {
                Parent = parent,
                Color = themes.preset.text_outline, 
                LineJoinMode = Enum.LineJoinMode.Miter
            }) 
            
            library:apply_theme(stroke, "text_outline", "Color")
        end

        function library:create(instance, options)
            local ins = Instance.new(instance) 
            
            for prop, value in next, options do 
                ins[prop] = value
            end
            
            if instance == "TextLabel" or instance == "TextButton" or instance == "TextBox" then 	
                library:apply_theme(ins, "text", "TextColor3")
                library:apply_stroke(ins)
            elseif instance == "ScreenGui" then 
                table.insert(library.guis, ins)
            end 
            
            return ins 
        end
    -- 

    -- elements 
        function library:panel(options) 
            local cfg = {
                name = options.text or options.name or "Window", 
                size = options.size or dim2(0, 530, 0, 590),
                position = options.position or dim2(0, 500, 0, 500),
                anchor_point = options.anchor_point or vec2(0, 0)
            }

            local sgui = library:create("ScreenGui", {
                Enabled = true,
                Parent = coregui,
                Name = "" 
            })

            local main_holder = library:create("Frame", {
                Parent = sgui,
                Name = "",
                AnchorPoint = vec2(cfg.anchor_point.X, cfg.anchor_point.Y),
                Position = cfg.position,
                Active = true, 
                Draggable = true,
                BorderColor3 = rgb(0, 0, 0),
                Size = cfg.size,
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(32, 32, 38)
            })
            
            library:apply_theme(main_holder, "outline", "BackgroundColor3") 
            
            local window_inline = library:create("Frame", {
                Parent = main_holder,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = themes.preset.accent
            })
            
            library:apply_theme(window_inline, "accent", "BackgroundColor3") 
            
            local window_holder = library:create("Frame", {
                Parent = window_inline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(32, 32, 38),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            library:apply_theme(window_holder, "outline", "BackgroundColor3") 
            
            local UIGradient = library:create("UIGradient", {
                Parent = window_holder,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                rgbkey(0, rgb(41, 41, 55)),
                rgbkey(1, rgb(35, 35, 47))
            }
            })
            
            library:apply_theme(UIGradient, "contrast", "Color") 
            
            local text = library:create("TextLabel", {
                Parent = window_holder,
                Name = "",
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = cfg.name,
                BackgroundTransparency = 1,
                Position = dim2(0, 2, 0, 4),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.XY,
                TextSize = 12,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIStroke = library:create("UIStroke", {
                Parent = text,
                Name = "",
                LineJoinMode = Enum.LineJoinMode.Miter
            })
            
            local UIPadding = library:create("UIPadding", {
                Parent = window_holder,
                Name = "",
                PaddingBottom = dim(0, 4),
                PaddingRight = dim(0, 4),
                PaddingLeft = dim(0, 4)
            })
            
            local outline = library:create("Frame", {
                Parent = window_holder,
                Name = "",
                Position = dim2(0, 0, 0, 18),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 0, 1, -18),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(60, 55, 75)
            })
            
            library:apply_theme(outline, "inline", "BackgroundColor3") 
            
            local inline = library:create("Frame", {
                Parent = outline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(32, 32, 38)
            })
            
            library:apply_theme(inline, "outline", "BackgroundColor3") 
            
            local holder = library:create("Frame", {
                Parent = inline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIGradient = library:create("UIGradient", {
                Parent = holder,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                    rgbkey(0, rgb(41, 41, 55)),
                    rgbkey(1, rgb(35, 35, 47))
                }
            })
            
            library:apply_theme(UIGradient, "contrast", "Color") 
            
            local UIPadding = library:create("UIPadding", {
                Parent = holder,
                Name = "",
                PaddingTop = dim(0, 5),
                PaddingBottom = dim(0, 5),
                PaddingRight = dim(0, 5),
                PaddingLeft = dim(0, 5)
            })
            
            local glow = library:create("ImageLabel", {
                Parent = main_holder,
                Name = "",
                ImageColor3 = themes.preset.accent,
                ScaleType = Enum.ScaleType.Slice,
                BorderColor3 = rgb(0, 0, 0),
                BackgroundColor3 = rgb(255, 255, 255),
                Visible = true,
                Image = "http://www.roblox.com/asset/?id=18245826428",
                BackgroundTransparency = 1,
                ImageTransparency = 0.8, 
                Position = dim2(0, -20, 0, -20),
                Size = dim2(1, 40, 1, 40),
                ZIndex = 2,
                BorderSizePixel = 0,
                SliceCenter = rect(vec2(21, 21), vec2(79, 79))
            })library:apply_theme(glow, "glow", "ImageColor3") 
            
            return holder, sgui      
        end 

        local sgui = library:create("ScreenGui", {
            Enabled = true,
            Parent = game.CoreGui,
            Name = "",
            DisplayOrder = 2, 
        })

        function library:window(properties)
            local window = {}
            -- local button_holder  
            
            --[[local function create_dock_button(options) 
                local cfg = {
                    image = options.image or "rbxassetid://79856374238119",
                    open = options.open or true 
                    callback = options.callback or function() end
                }
        
                local button = library:create("TextButton", {
                    Parent = button_holder,
                    Name = "",
                    FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                    TextColor3 = rgb(0, 0, 0),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "",
                    Size = dim2(0, 25, 0, 25),
                    BorderSizePixel = 0,
                    TextSize = 14,
                    BackgroundColor3 = rgb(60, 55, 75)
                })
                
                local button_inline = library:create("Frame", {
                    Parent = button,
                    Name = "",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(button_inline, "outline", "BackgroundColor3") 
                
                local button_inline = library:create("Frame", {
                    Parent = button_inline,
                    Name = "",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })library:apply_theme(button_inline, "inline", "BackgroundColor3")
                
                local UIGradient = library:create("UIGradient", {
                    Parent = button_inline,
                    Name = "",
                    Rotation = 90,
                    Color = rgbseq{
                    rgbkey(0, rgb(35, 35, 47)),
                    rgbkey(1, rgb(41, 41, 55))
                }
                })library:apply_theme(UIGradient, "contrast", "Color") 
                
                local ImageLabel = library:create("ImageLabel", {
                    Parent = button_inline,
                    Name = "",
                    ImageColor3 = themes.preset.accent,
                    Image = "rbxassetid://79856374238119",
                    BackgroundTransparency = 1,
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })library:apply_theme(ImageLabel, "accent", "ImageColor3") 
                
                local UIPadding = library:create("UIPadding", {
                    Parent = button_inline,
                    Name = "",
                    PaddingTop = dim(0, 4),
                    PaddingBottom = dim(0, 4),
                    PaddingRight = dim(0, 4),
                    PaddingLeft = dim(0, 4)
                })
        
                button.MouseButton1Click:Connect(function()
                    cfg.open = not cfg.open 
        
                    cfg.callback(cfg.open) 
                end)
            end ]]

            -- main window
                local holder, path = library:panel({
                    name = properties and properties.name or "primordial", 
                    size = dim2(0, 500, 0, 500),
                    position = dim2(0, (camera.ViewportSize.X / 2) - 250, 0, (camera.ViewportSize.Y / 2) - 250),
                }) 

                library.frame = path

                -- create_dock_button({
                --     image = "rbxassetid://100959383267514",
                --     callback = function(open)
                --         path.Enabled = open 
                --     end 
                -- })

                window["tab_holder"] = library:create("Frame", {
                    Parent = holder,
                    Name = " ",
                    BackgroundTransparency = 1,
                    Size = dim2(1, 0, 0, 22),
                    BorderColor3 = rgb(0, 0, 0),
                    ZIndex = 5,
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })

                library:create("UIListLayout", {
                    Parent = window["tab_holder"],
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = dim(0, 2),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

                local section_holder = library:create("Frame", {
                    Parent = holder,
                    Name = " ",
                    BackgroundTransparency = 1,
                    Position = dim2(0, -1, 0, 19),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 1, -22),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                window["section_holder"] = section_holder

                local outline = library:create("Frame", {
                    Parent = section_holder,
                    Name = "\0",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 1, 2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })
                
                library:apply_theme(outline, "outline", "BackgroundColor3") 

                local inline = library:create("Frame", {
                    Parent = outline,
                    Name = "\0",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })
                
                library:apply_theme(inline, "inline", "BackgroundColor3") 

                local background = library:create("Frame", {
                    Parent = inline,
                    Name = "\0",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })

                library.section_holder = background

                library:create("UIPadding", {
                    Parent = background,
                    PaddingTop = dim(0, 4),
                    PaddingBottom = dim(0, 4),
                    PaddingRight = dim(0, 4),
                    PaddingLeft = dim(0, 4)
                })

                local UIGradient = library:create("UIGradient", {
                    Parent = background,
                    Rotation = 90,
                    Color = rgbseq{
                        rgbkey(0, rgb(41, 41, 55)),
                        rgbkey(1, rgb(35, 35, 47))
                    }
                })
                
                library:apply_theme(UIGradient, "contrast", "Color") 

                library:make_resizable(path:FindFirstChildOfClass("Frame"))
                --
                
                -- keybind list
                local outline =
                    library:create(
                    "Frame",
                    {
                        Parent = sgui,
                        Name = "",
                        Visible = false,
                        Draggable = true, -- already present
                        Position = UDim2.new(0.04290718212723732, 0, 0.4762658178806305, 0),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        Size = UDim2.new(0, 182, 0, 25),
                        BorderSizePixel = 0,
                        BackgroundColor3 = themes.preset.outline
                    }
                )
                library:apply_theme(outline, "outline", "BackgroundColor3")
                library.keybind_list_frame = outline
                
                local inline =
                    library:create(
                    "Frame",
                    {
                        Parent = outline,
                        Name = "",
                        Position = UDim2.new(0, 1, 0, 1),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        Size = UDim2.new(1, -2, 1, -2),
                        BorderSizePixel = 0,
                        BackgroundColor3 = themes.preset.inline,
                        Draggable = true -- added
                    }
                )
                library:apply_theme(inline, "inline", "BackgroundColor3")
                
                local background =
                    library:create(
                    "Frame",
                    {
                        Parent = inline,
                        Name = "",
                        Position = UDim2.new(0, 1, 0, 1),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        Size = UDim2.new(1, -2, 1, -2),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        Draggable = true -- added
                    }
                )
                
                local UIGradient =
                    library:create(
                    "UIGradient",
                    {
                        Parent = background,
                        Name = "",
                        Rotation = 90,
                        Color = ColorSequence.new {
                            ColorSequenceKeypoint.new(0, themes.preset.high_contrast),
                            ColorSequenceKeypoint.new(1, themes.preset.low_contrast)
                        }
                    }
                )
                library:apply_theme(UIGradient, "contrast", "Color")
                
                local bg =
                    library:create(
                    "Frame",
                    {
                        Parent = background,
                        Name = "a",
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        Size = UDim2.new(1, 0, 0, 2),
                        BorderSizePixel = 0,
                        BackgroundColor3 = themes.preset.accent,
                        Draggable = true -- added
                    }
                )
                library:apply_theme(bg, "accent", "BackgroundColor3")
                
                library:create(
                    "UIGradient",
                    {
                        Parent = bg,
                        Name = "",
                        Enabled = true,
                        Rotation = 90,
                        Color = ColorSequence.new {
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(167, 167, 167))
                        }
                    }
                )
                
                local text =
                    library:create(
                    "TextLabel",
                    {
                        Parent = background,
                        Name = "",
                        FontFace = library.font,
                        TextColor3 = themes.preset.text,
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        Text = "Keybinds",
                        BackgroundTransparency = 1,
                        TextTruncate = Enum.TextTruncate.AtEnd,
                        Size = UDim2.new(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        TextSize = 12,
                        BackgroundColor3 = themes.preset.text
                    },
                    "text"
                )
                
                local UIStroke =
                    library:create(
                    "UIStroke",
                    {
                        Parent = text,
                        Name = "",
                        LineJoinMode = Enum.LineJoinMode.Miter
                    }
                )
                
                local text_holder =
                    library:create(
                    "Frame",
                    {
                        Parent = background,
                        Name = "",
                        Size = UDim2.new(0, 182, 0, 22),
                        Position = UDim2.new(0, -2, 1, 1),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = themes.preset.outline,
                        Draggable = true -- added
                    }
                )
                library:apply_theme(text_holder, "outline", "BackgroundColor3")
                
                local inline =
                    library:create(
                    "Frame",
                    {
                        Parent = text_holder,
                        Name = "",
                        Size = UDim2.new(1, -2, 1, -2),
                        Position = UDim2.new(0, 1, 0, 1),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        --AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = themes.preset.inline,
                        Draggable = true -- added
                    }
                )
                library:apply_theme(inline, "inline", "BackgroundColor3")
                
                local background =
                    library:create(
                    "Frame",
                    {
                        Parent = inline,
                        Name = "",
                        Size = UDim2.new(1, -2, 1, -2),
                        Position = UDim2.new(0, 1, 0, 1),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        --AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        Draggable = true -- added
                    }
                )
                library.keybind_list = background
                
                local UIGradient =
                    library:create(
                    "UIGradient",
                    {
                        Parent = background,
                        Name = "",
                        Rotation = 90,
                        Color = ColorSequence.new {
                            ColorSequenceKeypoint.new(0, themes.preset.high_contrast),
                            ColorSequenceKeypoint.new(1, themes.preset.low_contrast)
                        }
                    }
                )
                library:apply_theme(UIGradient, "contrast", "Color")
                
                library:create(
                    "UIListLayout",
                    {
                        Parent = background,
                        Name = "",
                        Padding = UDim.new(0, -1),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }
                )
                
                library:create(
                    "UIPadding",
                    {
                        Parent = background,
                        Name = "",
                        PaddingBottom = UDim.new(0, 4),
                        PaddingLeft = UDim.new(0, 5)
                    }
                )
                
                
            
            -- 

            -- -- dock innit
            --     local dock_outline = library:create("Frame", {
            --         Parent = sgui,
            --         Name = "",
            --         Visible = true,
            --         BorderColor3 = rgb(0, 0, 0),
            --         AnchorPoint = vec2(0.5, 0),
            --         Position = dim2(0.5, 0, 0, 20),
            --         Size = dim2(0, 127, 0, 39),
            --         BorderSizePixel = 0,
            --         BackgroundColor3 = rgb(32, 32, 38)
            --     })library:apply_theme(dock_outline, "outline", "BackgroundColor3") 
                
            --     local dock_inline = library:create("Frame", {
            --         Parent = dock_outline,
            --         Name = "",
            --         Position = dim2(0, 1, 0, 1),
            --         BorderColor3 = rgb(0, 0, 0),
            --         Size = dim2(1, -2, 1, -2),
            --         BorderSizePixel = 0,
            --         BackgroundColor3 = rgb(60, 55, 75)
            --     })library:apply_theme(dock_inline, "inline", "BackgroundColor3") 
                
            --     local dock_holder = library:create("Frame", {
            --         Parent = dock_inline,
            --         Name = "",
            --         Size = dim2(1, -2, 1, -2),
            --         Position = dim2(0, 1, 0, 1),
            --         BorderColor3 = rgb(32, 32, 38),
            --         BorderSizePixel = 0,
            --         BackgroundColor3 = rgb(255, 255, 255)
            --     })library:apply_theme(dock_holder, "outline", "BackgroundColor3") 
                
            --     local accent = library:create("Frame", {
            --         Parent = dock_holder,
            --         Name = "",
            --         Size = dim2(1, 0, 0, 2),
            --         BorderColor3 = rgb(0, 0, 0),
            --         BorderSizePixel = 0,
            --         BackgroundColor3 = themes.preset.accent
            --     })library:apply_theme(accent, "accent", "BackgroundColor3") 
                
            --     local UIGradient = library:create("UIGradient", {
            --         Parent = accent,
            --         Name = "",
            --         Rotation = 90,
            --         Color = rgbseq{
            --         rgbkey(0, rgb(255, 255, 255)),
            --         rgbkey(1, rgb(167, 167, 167))
            --     }
            --     })
                
            --     button_holder = library:create("Frame", {
            --         Parent = dock_holder,
            --         Name = "",
            --         BackgroundTransparency = 1,
            --         Size = dim2(1, 0, 1, 0),
            --         BorderColor3 = rgb(0, 0, 0),
            --         BorderSizePixel = 0,
            --         BackgroundColor3 = rgb(255, 255, 255)
            --     })
                
            --     local UIListLayout = library:create("UIListLayout", {
            --         Parent = button_holder,
            --         Name = "",
            --         Padding = dim(0, 5),
            --         FillDirection = Enum.FillDirection.Horizontal,
            --         SortOrder = Enum.SortOrder.LayoutOrder
            --     })
                
            --     local UIPadding = library:create("UIPadding", {
            --         Parent = button_holder,
            --         Name = "",
            --         PaddingTop = dim(0, 6),
            --         PaddingBottom = dim(0, 4),
            --         PaddingRight = dim(0, 4),
            --         PaddingLeft = dim(0, 4)
            --     })
                        
            --     local UIGradient = library:create("UIGradient", {
            --         Parent = dock_holder,
            --         Name = "",
            --         Rotation = 90,
            --         Color = rgbseq{
            --         rgbkey(0, rgb(41, 41, 55)),
            --         rgbkey(1, rgb(35, 35, 47))
            --     }
            --     })library:apply_theme(UIGradient, "contrast", "Color") 
            -- -- 

            -- -- cfg holder
                
            --     window["configs"], config_path = library:panel({
            --         name = "Configurations", 
            --         anchor_point = vec2(-1, 0),
            --         size = dim2(0, 322, 0, 391),
            --         position = dim2(0, holder.AbsolutePosition.X + holder.AbsoluteSize.X + 10, 0, holder.AbsolutePosition.Y - 22)
            --     }) 

            --     create_dock_button({
            --         image = "rbxassetid://79856374238119",
            --         callback = function(open)
            --             config_path.Enabled = open 
            --         end 
            --     })

            --     local UIGradient = library:create("UIGradient", {
            --         Parent = holder,
            --         Name = "",
            --         Rotation = 90,
            --         Color = rgbseq{
            --             rgbkey(0, rgb(41, 41, 55)),
            --             rgbkey(1, rgb(35, 35, 47))
            --         }
            --     })library:apply_theme(UIGradient, "contrast", "Color") 
                
            --     local UIPadding = library:create("UIPadding", {
            --         Parent = holder,
            --         Name = "",
            --         PaddingTop = dim(0, 5),
            --         PaddingBottom = dim(0, 5),
            --         PaddingRight = dim(0, 5),
            --         PaddingLeft = dim(0, 5)
            --     })
                
            --     local glow = library:create("ImageLabel", {
            --         Parent = config_outline,
            --         Name = "",
            --         ImageColor3 = themes.preset.accent,
            --         ScaleType = Enum.ScaleType.Slice,
            --         BorderColor3 = rgb(0, 0, 0),
            --         BackgroundColor3 = rgb(255, 255, 255),
            --         Visible = true,
            --         Image = "http://www.roblox.com/asset/?id=18245826428",
            --         BackgroundTransparency = 1,
            --         ImageTransparency = 0.8, 
            --         Position = dim2(0, -20, 0, -20),
            --         Size = dim2(1, 40, 1, 40),
            --         ZIndex = 2,
            --         BorderSizePixel = 0,
            --         SliceCenter = rect(vec2(21, 21), vec2(79, 79))
            --     })library:apply_theme(glow, "glow", "ImageColor3") 
                
            -- -- 

            -- -- playerlist 
            --     window["playerlist"], playerlist_gui = library:panel({
            --         name = "Playerlist", 
            --         anchor_point = vec2(-1, 0),
            --         size = dim2(0, 385, 0, 399),
            --         position = dim2(0, holder.AbsolutePosition.X - 395, 0, holder.AbsolutePosition.Y - 22)
            --     })    
                
            --     create_dock_button({
            --         image = "rbxassetid://115194686863276",
            --         callback = function(open)
            --             playerlist_gui.Enabled = open 
            --         end 
            --     })
            -- -- 
            
            -- -- theming 
            --     window["themes"], themes_gui = library:panel({
            --         name = "Style", 
            --         anchor_point = vec2(-1, 0),
            --         size = dim2(0, 322, 0, 391),
            --         position = dim2(0, window["configs"].AbsolutePosition.X + window["configs"].AbsoluteSize.X + 10, 0, window["configs"].AbsolutePosition.Y - 22)
            --     })   

            --     create_dock_button({
            --         image = "rbxassetid://115194686863276",
            --         callback = function(open)
            --             themes_gui.Enabled = open 
            --         end 
            --     })
            -- -- 
             

            return setmetatable(window, library)
        end

        function library:watermark(options) 
            local cfg = {
                default = options.text or options.default or os.date('drain.lol | %b %d %Y | %H:%M')
            }

            local watermark_outline = library:create("Frame", {
                Parent = sgui,
                Name = "",
                BorderColor3 = rgb(0, 0, 0),
                AnchorPoint = vec2(0.5, 0.5),
                Position = dim2(1, -100, 0, 20),
                Size = dim2(0, 0, 0, 24),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = rgb(32, 32, 38)
            })library:apply_theme(watermark_outline, "outline", "BackgroundColor3") 
            
            local watermark_inline = library:create("Frame", {
                Parent = watermark_outline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(60, 55, 75)
            })library:apply_theme(watermark_inline, "inline", "BackgroundColor3") 
            
            local watermark_background = library:create("Frame", {
                Parent = watermark_inline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIGradient = library:create("UIGradient", {
                Parent = watermark_background,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                    rgbkey(0, rgb(41, 41, 55)),
                    rgbkey(1, rgb(35, 35, 47))
                }
            })library:apply_theme(UIGradient, "contrast", "Color") 
            
            local text = library:create("TextLabel", {
                Parent = watermark_background,
                Name = "",
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = "  drain.lol | Beta | Aug 29 2024 | 07:29:00  ",
                Size = dim2(0, 0, 1, 0),
                BackgroundTransparency = 1,
                Position = dim2(0, -1, 0, 1),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.X,
                TextSize = 12,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            library:create("UIStroke", {
                Parent = text,
                Name = "",
                LineJoinMode = Enum.LineJoinMode.Miter
            })
            
            local accent = library:create("Frame", {
                Parent = watermark_outline,
                Name = "",
                Position = dim2(0, 2, 0, 2),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -4, 0, 2),
                BorderSizePixel = 0,
                BackgroundColor3 = themes.preset.accent
            })library:apply_theme(accent, "accent", "BackgroundColor3") 
            
            local UIGradient = library:create("UIGradient", {
                Parent = accent,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                    rgbkey(0, rgb(255, 255, 255)),
                    rgbkey(1, rgb(167, 167, 167))
                }
            })
            
            function cfg.change_text(input)
                text.Text = "  ".. input .."  "
            end 

            cfg.change_text(cfg.default)

            return cfg 
        end 

        function library:tab(options)	
            local cfg = {
                name = options.name or "tab", 
                enabled = false, 
            }
            
            -- button instances
                local tab_holder = library:create("TextButton", {
                    Parent = self.tab_holder,
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "",
                    Name = "\0",
                    BorderSizePixel = 0,
                    Size = dim2(0, 0, 1, -2),
                    ZIndex = 5,
                    TextSize = 12,
                    BackgroundColor3 = rgb(32, 32, 38),
                    AutoButtonColor = false
                })library:apply_theme(tab_holder, "outline", "BackgroundColor3") 

                local inline = library:create("Frame", {
                    Parent = tab_holder,
                    Size = dim2(1, -2, 1, 0),
                    Name = "\0",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    ZIndex = 5,
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })library:apply_theme(inline, "inline", "BackgroundColor3") 

                local background = library:create("Frame", {
                    Parent = inline,
                    Size = dim2(1, -2, 1, -1),
                    Name = "\0",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    ZIndex = 5,
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })

                local UIGradient = library:create("UIGradient", {
                    Parent = background,
                    Rotation = 90,
                    Color = rgbseq{rgbkey(0, rgb(41, 41, 55)), rgbkey(1, rgb(35, 35, 47))}
                })library:apply_theme(UIGradient, "contrast", "Color") 

                local text = library:create("TextLabel", {
                    Parent = background,
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = cfg.name,
                    Name = "\0",
                    BackgroundTransparency = 1,
                    Size = dim2(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 12,
                    ZIndex = 5,
                    BackgroundColor3 = rgb(255, 255, 255)
                }, "text")
                library:apply_theme(text, "accent", "TextColor3")
            
            -- section instances 
                local section_holder = library:create("Frame", {
                    Parent = library.section_holder,
                    BackgroundTransparency = 1,
                    Name = "\0",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    Visible = false,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
            
                cfg["holder"] = section_holder

                library:create("UIListLayout", {
                    Parent = section_holder,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = dim(0, 4),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })

            function cfg.open_tab()
                if library.current_tab and library.current_tab[1] ~= background then 
                    local button = library.current_tab[1]
                    button.Size = dim2(1, -2, 1, -1)
                    button:FindFirstChildOfClass("UIGradient").Rotation = 90
                    button:FindFirstChildOfClass("TextLabel").TextColor3 = themes.preset.text
                        
                    library.current_tab[2].Visible = false
                    
                    library.current_tab = nil
                end
                
                library.current_tab = {
                    background, section_holder
                }
                
                local button = library.current_tab[1] 
                button.Size = dim2(1, -2, 1, 0)
                button:FindFirstChildOfClass("UIGradient").Rotation = -90
                button:FindFirstChildOfClass("TextLabel").TextColor3 = themes.preset.accent 

                library.current_tab[2].Visible = true 

                if library.current_element_open and library.current_element_open ~= cfg then 
                    library.current_element_open.set_visible(false)
                    library.current_element_open.open = false 
                    library.current_element_open = nil 
                end
            end
            
            tab_holder.MouseButton1Click:Connect(cfg.open_tab)
            
            return setmetatable(cfg, library) 
        end

        function library:column(path) 
            local cfg = {}
            
            local holder = path and self[path] or self.holder
            
            local column = library:create("Frame", {
                Parent = holder,
                BackgroundTransparency = 1,
                Name = "\0",
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(60, 55, 75)
            })library:apply_theme(column, "inline", "BackgroundColor3") 
            
            library:create("UIListLayout", {
                Parent = column,
                Padding = dim(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalFlex = Enum.UIFlexAlignment.Fill
            })
            
            cfg["holder"] = column

            return setmetatable(cfg, library) 
        end

        function library:section(options)
            local cfg = {
                name = options.name or "Section", 
            }
            
            local section = library:create("Frame", {
                Parent = self.holder,
                Name = "\0",
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(60, 55, 75)
            })library:apply_theme(section, "inline", "BackgroundColor3") 

            local inline = library:create("Frame", {
                Parent = section,
                Name = "\0",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(32, 32, 38)
            })library:apply_theme(inline, "outline", "BackgroundColor3") 

            local background = library:create("Frame", {
                Parent = inline,
                Name = "\0",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })

            local text = library:create("TextLabel", {
                Parent = background,
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = cfg.name,
                Name = "\0",
                BackgroundTransparency = 1,
                Position = dim2(0, 6, 0, 4),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.XY,
                TextSize = 12,
                BackgroundColor3 = rgb(255, 255, 255)
            })

            library:create("UIStroke", {
                Parent = text,
                LineJoinMode = Enum.LineJoinMode.Miter
            })

            local accent = library:create("Frame", {
                Parent = background,
                Name = "\0",
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 0, 0, 2),
                BorderSizePixel = 0,
                BackgroundColor3 = themes.preset.accent
            })library:apply_theme(accent, "accent", "BackgroundColor3") 

            local UIGradient = library:create("UIGradient", {
                Parent = accent,
                Rotation = 90,
                Color = rgbseq{
                    rgbkey(0, rgb(255, 255, 255)),
                    rgbkey(1, rgb(167, 167, 167))
                }
            })

            local UIGradient = library:create("UIGradient", {
                Parent = background,
                Rotation = 90,
                Color = rgbseq{
                    rgbkey(0, rgb(41, 41, 55)),
                    rgbkey(1, rgb(35, 35, 47))
                }
            })library:apply_theme(UIGradient, "contrast", "Color") 

            local ScrollingFrame = library:create("ScrollingFrame", {
                Parent = background,
                ScrollBarImageColor3 = themes.preset.accent,
                Active = true,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollBarThickness = 2,
                Size = dim2(1, 0, 1, -20),
                BackgroundTransparency = 1,
                Position = dim2(0, 0, 0, 20),
                BackgroundColor3 = rgb(255, 255, 255),
                BorderColor3 = rgb(0, 0, 0),
                BorderSizePixel = 0,
                CanvasSize = dim2(0, 0, 0, 0)
            })library:apply_theme(ScrollingFrame, "accent", "ScrollBarImageColor3") 

            local elements = library:create("Frame", {
                Parent = ScrollingFrame,
                Name = "\0",
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 0, 0, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            cfg.holder = elements 

            library:create("UIListLayout", {
                Parent = elements,
                Padding = dim(0, 4),
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            })

            library:create("UIPadding", {
                Parent = ScrollingFrame,
                PaddingBottom = dim(0, 10)
            })

            return setmetatable(cfg, library)
        end

        function library:slider(options)
            local cfg = {
                name = options.name or nil,
                suffix = options.suffix or "",
                flag = options.flag or tostring(2^789),
                callback = options.callback or function() end, 

                min = options.min or options.minimum or 0,
                max = options.max or options.maximum or 100,
                intervals = options.interval or options.decimal or 1,
                default = options.default or 10,

                dragging = false,
                value = options.default or 10, 

                previous_holder = self
            } 

            local slider = library:create("TextLabel", {
                Parent = self.holder, 
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = "",
                Name = "slider",
                ZIndex = 2,
                Size = dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            if cfg.name then 
                local left_components = library:create("Frame", {
                    Parent = slider,
                    Name = "left_components",
                    BackgroundTransparency = 1,
                    Position = dim2(0, 2, 0, -1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 0, 0, 14),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local text = library:create("TextLabel", {
                    Parent = left_components,
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = cfg.name,
                    Name = "text",
                    BackgroundTransparency = 1,
                    Size = dim2(0, 0, 1, -1),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                }, "text")

                library:create("UIListLayout", {
                    Parent = left_components,
                    Padding = dim(0, 5),
                    Name = "_",
                    FillDirection = Enum.FillDirection.Horizontal
                })
            end 
            
            local bottom_components = library:create("Frame", {
                Parent = slider,
                Name = "bottom_components",
                Position = dim2(0, 0, 0, cfg.name and 15 or 0),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 26, 0, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local slider = library:create("TextButton", {
                Parent = bottom_components,
                Name = "slider",
                Position = dim2(0, 0, 0, 2),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -27, 1, 12),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(32, 32, 38),
                Text = "",
                AutoButtonColor = false,
            })library:apply_theme(slider, "outline", "BackgroundColor3") 
            
            local inline = library:create("Frame", {
                Parent = slider,
                Name = "inline",
                Position = dim2(0, 0, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -1, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(60, 55, 75)
            })library:apply_theme(inline, "inline", "BackgroundColor3") 
            
            local background = library:create("Frame", {
                Parent = inline,
                Name = "background",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = themes.preset.accent
            })library:apply_theme(background, "accent", "BackgroundColor3") 
            
            local contrast = library:create("Frame", {
                Parent = background,
                Name = "contrast",
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local slidertext = library:create("TextLabel", {
                Parent = contrast,
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = "12.50/100.00",
                Name = "text",
                BackgroundTransparency = 1,
                Position = dim2(0, 0, 0, -1),
                Size = dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                TextSize = 12,
                ZIndex = 2,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local fill = library:create("Frame", {
                Parent = contrast,
                Name = "fill",
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(0.75, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = themes.preset.accent
            })library:apply_theme(fill, "accent", "BackgroundColor3") 
            
            local UIGradient = library:create("UIGradient", {
                Parent = fill,
                Rotation = 90,
                Color = rgbseq{
                rgbkey(0, rgb(255, 255, 255)),
                rgbkey(1, rgb(167, 167, 167))
            }
            })
            
            local UIGradient = library:create("UIGradient", {
                Parent = contrast,
                Rotation = 90,
                Color = rgbseq{
                rgbkey(0, rgb(41, 41, 55)),
                rgbkey(1, rgb(35, 35, 47))
            }
            })
            
            local UIGradient = library:create("UIGradient", {
                Parent = background,
                Rotation = 90,
                Color = rgbseq{
                rgbkey(0, rgb(255, 255, 255)),
                rgbkey(1, rgb(167, 167, 167))
            }
            }) 
            
            library:create("UIListLayout", {
                Parent = bottom_components,
                Padding = dim(0, 10),
                Name = "_",
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            library:create("UIPadding", {
                Parent = slider,
                PaddingLeft = dim(0, 1)
            })

            function cfg.set(value)
                cfg.value = math.clamp(library:round(value, cfg.intervals), cfg.min, cfg.max)

                fill.Size = dim2((cfg.value - cfg.min) / (cfg.max - cfg.min), 0, 1, 0)
                slidertext.Text = tostring(cfg.value) .. cfg.suffix .. "/" .. tostring(cfg.max) .. cfg.suffix
                flags[cfg.flag] = cfg.value

                cfg.callback(flags[cfg.flag])
            end

            library:connection(uis.InputChanged, function(input)
                if cfg.dragging and input.UserInputType == Enum.UserInputType.MouseMovement then 
                    local size_x = (input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X
                    local value = ((cfg.max - cfg.min) * size_x) + cfg.min
                    cfg.set(value)
                end
            end)

            library:connection(uis.InputEnded, function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    cfg.dragging = false 
                end 
            end)

            slider.MouseButton1Down:Connect(function()
                cfg.dragging = true
            end)

            cfg.set(cfg.default)
            
            config_flags[cfg.flag] = cfg.set

            library.config_flags[cfg.flag] = cfg.set

            return self 
        end 

        function library:toggle(options)
            local cfg = {
                enabled = options.enabled or nil,
                name = options.name or "Toggle",
                flag = options.flag or tostring(math.random(1,9999999)),
                callback = options.callback or function() end,
                default = options.default or false,
                colorpicker = options.color or nil,
                previous_holder = self
            }
            
            -- instances
                local toggle_holder = library:create("TextButton", {
                    Parent = self.holder,
                    FontFace = library.font,
                    TextColor3 = rgb(151, 151, 151),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "",
                    Name = "toggle",
                    ZIndex = 1,
                    Size = dim2(1, -8, 0, 12),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextSize = 11,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
            
                local right_components = library:create("Frame", {
                    Parent = toggle_holder,
                    Name = "right_components",
                    Position = dim2(1, -1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 0, 0, 12),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                cfg["right_holder"] = right_components
            
                local list = library:create("UIListLayout", {
                    Parent = right_components,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    Padding = dim(0, 4),
                    Name = "list",
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            
                library:create("UIPadding", {
                    Parent = toggle_holder
                })
            
                local left_components = library:create("Frame", {
                    Parent = toggle_holder,
                    Name = "left_components",
                    BackgroundTransparency = 1,
                    Position = dim2(0, 0, 0, 0),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 0, 0, 14),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
            
                local text = library:create("TextLabel", {
                    Parent = left_components,
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = cfg.name,
                    Name = "text",
                    BackgroundTransparency = 1,
                    Size = dim2(0, 0, 1, -1),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
            
                library:create("UIStroke", {
                    Parent = text,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })
            
                library:create("UIListLayout", {
                    Parent = left_components,
                    Padding = dim(0, 5),
                    Name = "_",
                    FillDirection = Enum.FillDirection.Horizontal
                })
            
                local toggle = library:create("TextButton", {
                    Parent = left_components,
                    Name = "!toggle",
                    Text = "",
                    AutoButtonColor = false,
                    Position = dim2(0, 0, 0, 2),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 15, 0, 15),
                    BorderSizePixel = 0,
                    ZIndex = 1, 
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(toggle, "outline", "BackgroundColor3") 
            
                local inline = library:create("Frame", {
                    Parent = toggle,
                    Name = "inline",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })library:apply_theme(inline, "inline", "BackgroundColor3") 
            
                local background = library:create("Frame", {
                    Parent = inline,
                    Name = "background",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = themes.preset.accent
                })library:apply_theme(background, "accent", "BackgroundColor3") 
            
                local UIGradient = library:create("UIGradient", {
                    Parent = background,
                    Rotation = 90,
                    Color = rgbseq{
                        rgbkey(0, rgb(255, 255, 255)),
                        rgbkey(1, rgb(167, 167, 167))
                    }
                })
            -- 
        
            function cfg.set(bool)
                background.BackgroundColor3 = bool and themes.preset.accent or themes.preset.inline
        
                flags[cfg.flag] = bool
                
                cfg.callback(bool)
            end
        
            library:connection(toggle_holder.MouseButton1Click, function()
                cfg.enabled = not cfg.enabled
        
                cfg.set(cfg.enabled)
            end)

            library:connection(toggle.MouseButton1Click, function()
                cfg.enabled = not cfg.enabled
        
                cfg.set(cfg.enabled)
            end)

            cfg.set(cfg.default)
        
            self.previous_holder = left_components
            self.right_holder = right_components
            
            library.config_flags[cfg.flag] = cfg.set

            return self
        end
        
        function library:colorpicker(options)
            local parent = self.right_holder
            
            local cfg = {
                name = options.name or "Color", 
                flag = options.flag or tostring(2^789),
                color = options.color or Color3.new(1, 1, 1), -- Default to white color if not provided
                alpha = options.alpha or 1,
                callback = options.callback or function() end,
                holder = self.previous_holder
            }

            local dragging_sat = false 
            local dragging_hue = false 
            local dragging_alpha = false 

            local h, s, v = cfg.color:ToHSV() 
            local a = cfg.alpha 
            
            -- colorpicker button 
                local colorpicker_button = library:create("TextButton", {
                    Parent = parent,
                    Name = "outline",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 24, 0, 14),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38),
                    Text = "",
                    AutoButtonColor = false,
                })library:apply_theme(colorpicker_button, "outline", "BackgroundColor3") 
            
                local inline = library:create("Frame", {
                    Parent = colorpicker_button,
                    Name = "inline",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })library:apply_theme(inline, "inline", "BackgroundColor3") 
            
                local handler = library:create("Frame", {
                    Parent = inline,
                    Name = "handler",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(250, 165, 27)
                })
            
                local UIGradient = library:create("UIGradient", {
                    Parent = handler,
                    Rotation = 90,
                    Color = rgbseq{
                        rgbkey(0, rgb(255, 255, 255)),
                        rgbkey(1, rgb(167, 167, 167))
                    }
                })
            -- 

            -- colorpicker instances
                local colorpicker_holder = library:create("Frame", {
                    Parent = sgui,
                    Name = "colorpicker",
                    Position = dim2(0, colorpicker_button.AbsolutePosition.X + 1, 0, colorpicker_button.AbsolutePosition.Y + 17),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 190, 0, 190),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38),
                    Visible = false,
                    ZIndex = 1
                })library:apply_theme(colorpicker_holder, "outline", "BackgroundColor3") 

                library:make_resizable(colorpicker_holder)
                
                local window_inline = library:create("Frame", {
                    Parent = colorpicker_holder,
                    Name = "window_inline",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = themes.preset.accent
                })library:apply_theme(window_inline, "accent", "BackgroundColor3") 
                
                local window_holder = library:create("Frame", {
                    Parent = window_inline,
                    Name = "window_holder",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(32, 32, 38),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })library:apply_theme(window_holder, "outline", "BackgroundColor3") 
                
                local UIGradient = library:create("UIGradient", {
                    Parent = window_holder,
                    Rotation = 90,
                    Name = "_",
                    Color = rgbseq{
                    rgbkey(0, rgb(41, 41, 55)),
                    rgbkey(1, rgb(35, 35, 47))
                }
                })library:apply_theme(UIGradient, "contrast", "Color") 
                
                local text = library:create("TextLabel", {
                    Parent = window_holder,
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = cfg.name,
                    Name = "text",
                    BackgroundTransparency = 1,
                    Position = dim2(0, 2, 0, 4),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                library:create("UIStroke", {
                    Parent = text,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })
                
                library:create("UIPadding", {
                    Parent = window_holder,
                    Name = "_",
                    PaddingBottom = dim(0, 4),
                    PaddingRight = dim(0, 4),
                    PaddingLeft = dim(0, 4)
                })
                
                local main_holder = library:create("Frame", {
                    Parent = window_holder,
                    Name = "main_holder",
                    Position = dim2(0, 0, 0, 20),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 1, -20),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })library:apply_theme(main_holder, "inline", "BackgroundColor3") 
                
                local main_holder_inline = library:create("Frame", {
                    Parent = main_holder,
                    Name = "main_holder_inline",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(main_holder_inline, "outline", "BackgroundColor3") 
                
                local main_holder_background = library:create("Frame", {
                    Parent = main_holder_inline,
                    Name = "main_holder_background",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = main_holder_background,
                    Rotation = 90,
                    Name = "_",
                    Color = rgbseq{
                    rgbkey(0, rgb(41, 41, 55)),
                    rgbkey(1, rgb(35, 35, 47))
                }
                })library:apply_theme(UIGradient, "contrast", "Color") 
                
                library:create("UIPadding", {
                    Parent = main_holder_background,
                    PaddingTop = dim(0, 4),
                    Name = "_",
                    PaddingBottom = dim(0, 4),
                    PaddingRight = dim(0, 4),
                    PaddingLeft = dim(0, 4)
                })
                
                local alpha = library:create("TextButton", {
                    Parent = main_holder_background,
                    AnchorPoint = vec2(0, 0.5),
                    Name = "alpha",
                    Position = dim2(0, 0, 1, -8),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -20, 0, 14),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75),
                    Text = "",
                    AutoButtonColor = false,
                })library:apply_theme(alpha, "inline", "BackgroundColor3") 
                
                local outline = library:create("Frame", {
                    Parent = alpha,
                    Name = "outline",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(outline, "outline", "BackgroundColor3") 
                
                local alpha_drag = library:create("Frame", {
                    Parent = outline,
                    Name = "alpha_drag",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(0, 221, 255)
                })
                
                local alphaind = library:create("ImageLabel", {
                    Parent = alpha_drag,
                    ScaleType = Enum.ScaleType.Tile,
                    BorderColor3 = rgb(0, 0, 0),
                    Image = "rbxassetid://18274452449",
                    BackgroundTransparency = 1,
                    Name = "alphaind",
                    Size = dim2(1, 0, 1, 0),
                    TileSize = dim2(0, 6, 0, 6),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = alphaind,
                    Transparency = numseq{
                        numkey(0, 0),
                        numkey(1, 1)
                    }
                })
                
                local alpha_picker = library:create("Frame", {
                    Parent = alpha_drag,
                    Name = "alpha_picker",
                    BorderMode = Enum.BorderMode.Inset,
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 4, 1, 0),
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local hue = library:create("TextButton", {
                    Parent = main_holder_background,
                    AnchorPoint = vec2(1, 0),
                    Name = "hue",
                    Position = dim2(1, -1, 0, 0),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 14, 1, -20),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75),
                    Text = "",
                    AutoButtonColor = false
                })
                
                local outline = library:create("Frame", {
                    Parent = hue,
                    Name = "outline",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })
                
                local Frame = library:create("Frame", {
                    Parent = outline,
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = Frame,
                    Rotation = 270,
                    Color = rgbseq{
                    rgbkey(0, rgb(255, 0, 0)),
                    rgbkey(0.17000000178813934, rgb(255, 255, 0)),
                    rgbkey(0.33000001311302185, rgb(0, 255, 0)),
                    rgbkey(0.5, rgb(0, 255, 255)),
                    rgbkey(0.6700000166893005, rgb(0, 0, 255)),
                    rgbkey(0.8299999833106995, rgb(255, 0, 255)),
                    rgbkey(1, rgb(255, 0, 0))
                }
                }) 
                
                local hue_picker = library:create("Frame", {
                    Parent = Frame,
                    Name = "hue_picker",
                    BorderMode = Enum.BorderMode.Inset,
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 0, 4),
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local visualize = library:create("Frame", {
                    Parent = main_holder_background,
                    AnchorPoint = vec2(1, 1),
                    Name = "visualize",
                    Position = dim2(1, -1, 1, -1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 14, 0, 14),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })library:apply_theme(visualize, "inline", "BackgroundColor3") 
                
                local outline = library:create("Frame", {
                    Parent = visualize,
                    Size = dim2(1, -2, 1, -2),
                    Name = "outline",
                    Active = true,
                    BorderColor3 = rgb(0, 0, 0),
                    Position = dim2(0, 1, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(outline, "outline", "BackgroundColor3") 
                
                local visualize = library:create("Frame", {
                    Parent = outline,
                    Size = dim2(1, -2, 1, -2),
                    Name = "visualize",
                    Active = true,
                    BorderColor3 = rgb(0, 0, 0),
                    Position = dim2(0, 1, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(0, 221, 255)
                })
                
                local satval_picker = library:create("Frame", {
                    Parent = main_holder_background,
                    Name = "satval_picker",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -20, 1, -20),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })library:apply_theme(satval_picker, "inline", "BackgroundColor3") 
                
                local outline = library:create("Frame", {
                    Parent = satval_picker,
                    Name = "outline",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(outline, "outline", "BackgroundColor3") 
                
                local colorpicker = library:create("Frame", {
                    Parent = outline,
                    Name = "colorpicker",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(0, 221, 255)
                })
                
                local sat = library:create("TextButton", {
                    Parent = colorpicker,
                    Name = "sat",
                    Size = dim2(1, 0, 1, 0),
                    BorderColor3 = rgb(0, 0, 0),
                    ZIndex = 2,
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255),
                    Text = "",
                    AutoButtonColor = false,
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = sat,
                    Rotation = 270,
                    Transparency = numseq{
                        numkey(0, 0),
                        numkey(1, 1)
                    },
                    Color = rgbseq{
                        rgbkey(0, rgb(0, 0, 0)),
                        rgbkey(1, rgb(0, 0, 0))
                    }
                })
                
                local val = library:create("TextButton", {
                    Parent = colorpicker,
                    Name = "val",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255),
                    Text = "",
                    AutoButtonColor = false,
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = val,
                    Transparency = numseq{
                        numkey(0, 0),
                        numkey(1, 1)
                    }
                })
                
                local satval_picker_REAL = library:create("Frame", {
                    Parent = colorpicker,
                    Name = "satval_picker_REAL",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 2, 0, 2),
                    BorderSizePixel = 1,
                    BackgroundColor3 = rgb(255, 255, 255),
                    ZIndex = 3, 
                })
            -- 
                
            function cfg.set_visible(bool)
                colorpicker_holder.Visible = bool

                if bool then 
                    if library.current_element_open and library.current_element_open ~= cfg then 
                        library.current_element_open.set_visible(false)
                        library.current_element_open.open = false 
                    end

                    library.current_element_open = cfg 
                end
            end 

            colorpicker_button.MouseButton1Click:Connect(function()		
                cfg.open = not cfg.open

                cfg.set_visible(cfg.open) 
            end)

            colorpicker_button:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
                colorpicker_holder.Position = dim2(0, colorpicker_button.AbsolutePosition.X + 1, 0, colorpicker_button.AbsolutePosition.Y + 17)
            end)

            function cfg.set(color, alpha)
                if color then 
                    h, s, v = color:ToHSV()
                end 
            
                if alpha then 
                    a = alpha
                end 
            
                local hsv_position = Color3.fromHSV(h, s, v)
                local Color = Color3.fromHSV(h, s, v)
                
                local value = 1 - h
                local offset = (value < 1) and 0 or -4
                hue_picker.Position = dim2(0, 0, value, offset)

                local offset = (a < 1) and 0 or -4
                alpha_picker.Position = dim2(a, offset, 0, 0)

                alpha_drag.BackgroundColor3 = Color3.fromHSV(h, s, v)
                
                visualize.BackgroundColor3 = Color
                handler.BackgroundColor3 = Color 

                colorpicker.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                
                cfg.color = Color
                cfg.alpha = a
                
                local s_offset = (s < 1) and 0 or -3
                local v_offset = (1 - v < 1) and 0 or -3
                satval_picker_REAL.Position = dim2(s, s_offset, 1 - v, v_offset)

                flags[cfg.flag] = {} 
                flags[cfg.flag]["Color"] = Color
                flags[cfg.flag]["Transparency"] = a
            
                cfg.callback(Color, a)
            end

            function cfg.update_color() 
                local mouse = uis:GetMouseLocation() 

                if dragging_sat then	
                    s = math.clamp((vec2(mouse.X, mouse.Y - gui_offset) - val.AbsolutePosition).X / val.AbsoluteSize.X, 0, 1)
                    v = 1 - math.clamp((vec2(mouse.X, mouse.Y - gui_offset) - sat.AbsolutePosition).Y / sat.AbsoluteSize.Y, 0, 1)
                elseif dragging_hue then 
                    h = math.clamp(1 - (vec2(mouse.X, mouse.Y - gui_offset) - hue.AbsolutePosition).Y / hue.AbsoluteSize.Y, 0, 1)
                elseif dragging_alpha then 
                    a = math.clamp((vec2(mouse.X, mouse.Y - gui_offset) - alpha.AbsolutePosition).X / alpha.AbsoluteSize.X, 0, 1)
                end

                cfg.set(nil, nil)
            end

            alpha.MouseButton1Down:Connect(function()
                dragging_alpha = true 
            end)

            hue.MouseButton1Down:Connect(function()
                dragging_hue = true 
            end)

            sat.MouseButton1Down:Connect(function()
                dragging_sat = true  
            end)

            uis.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging_sat = false
                    dragging_hue = false
                    dragging_alpha = false 
                end
            end)

            uis.InputChanged:Connect(function(input)
                if (dragging_sat or dragging_hue or dragging_alpha) and input.UserInputType == Enum.UserInputType.MouseMovement then
                    cfg.update_color() 
                end
            end)	

            cfg.set(cfg.color, cfg.alpha)

            self.previous_holder = parent

            library.config_flags[cfg.flag] = cfg.set
            
            return self 
        end

        function library:keybind(options)
            local parent = self.right_holder

            local cfg = {
                flag = options.flag or "SET ME A FLAG NOWWW!!!!",
                callback = options.callback or function() end,
                open = false,
                binding = nil, 
                name = options.name or nil, 
                ignore_key = options.ignore or false, 

                key = options.key or nil, 
                mode = options.mode or "toggle",
                active = options.default or false, 

                hold_instances = {},
            }

            flags[cfg.flag] = {} 
            
            local KEYBIND_ELEMENT;
            if cfg.name then 
                KEYBIND_ELEMENT = library:create("TextLabel", {
                    Parent = library.keybind_list,
                    Name = "",
                    FontFace = library.font,
                    TextColor3 = Color3.fromRGB(180, 180, 180),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Text = "[ Hold ]  Fly - X",
                    Size = UDim2.new(1, -5, 0, 18),
                    Visible = false, 
                    Position = UDim2.new(0, 5, 0, -1),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextSize = 12,
                    BackgroundColor3 = themes.preset.text
                }, "text")
            end 

            local element_outline = library:create("TextButton", {
                Parent = parent,
                Name = "",
                BorderColor3 = rgb(0, 0, 0),
                Text = "", 
                Size = dim2(0, 24, 0, 14),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(32, 32, 38)
            })library:apply_theme(element_outline, "outline", "BackgroundColor3") 
            
            local inline = library:create("Frame", {
                Parent = element_outline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(60, 55, 75)
            })library:apply_theme(inline, "inline", "BackgroundColor3") 
            
            local handler = library:create("Frame", {
                Parent = inline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIGradient = library:create("UIGradient", {
                Parent = handler,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                    rgbkey(0, rgb(41, 41, 55)),
                    rgbkey(1, rgb(35, 35, 47))
                }
            })library:apply_theme(UIGradient, "contrast", "Color") 
            
            local key_text = library:create("TextLabel", {
                Parent = handler,
                Name = "",
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = "b",
                Size = dim2(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Position = dim2(0, 0, 0, -2),
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.XY,
                TextSize = 12,
                BackgroundColor3 = rgb(255, 255, 255)
            })
                
            -- mode selector
                local keybind_selector = library:create("Frame", {
                    Parent = sgui,
                    Name = "",
                    Position = dim2(0, element_outline.AbsolutePosition.X + 1, 0, element_outline.AbsolutePosition.Y + 17),
                    BorderColor3 = rgb(255, 255, 255),
                    BorderSizePixel = 2,
                    Visible = false, 
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                library:create("UIListLayout", {
                    Parent = keybind_selector,
                    Name = "",
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    Padding = dim(0, 2)
                })
                
                local hold_button = library:create("TextButton", {
                    Parent = keybind_selector,
                    Name = "",
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "hold",
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                library:create("UIStroke", {
                    Parent = hold_button,
                    Name = "",
                    LineJoinMode = Enum.LineJoinMode.Miter
                })
                
                library:create("UIPadding", {
                    Parent = keybind_selector,
                    Name = "",
                    PaddingTop = dim(0, 3),
                    PaddingBottom = dim(0, 5),
                    PaddingRight = dim(0, 5),
                    PaddingLeft = dim(0, 5)
                })
                
                local toggle_button = library:create("TextButton", {
                    Parent = keybind_selector,
                    Name = "",
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "toggle",
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                library:create("UIStroke", {
                    Parent = toggle_button,
                    Name = "",
                    LineJoinMode = Enum.LineJoinMode.Miter
                })
                
                local always_button = library:create("TextButton", {
                    Parent = keybind_selector,
                    Name = "",
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "always",
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                library:create("UIStroke", {
                    Parent = always_button,
                    Name = "",
                    LineJoinMode = Enum.LineJoinMode.Miter
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = keybind_selector,
                    Name = "",
                    Rotation = 90,
                    Color = rgbseq{
                    rgbkey(0, rgb(41, 41, 55)),
                    rgbkey(1, rgb(35, 35, 47))
                }
                })
                
                local UIStroke = library:create("UIStroke", {
                    Parent = keybind_selector,
                    Name = "",
                    Color = rgb(60, 55, 75),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                })
            -- 

            -- init 
                element_outline:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
                    keybind_selector.Position = dim2(0, element_outline.AbsolutePosition.X + 1, 0, element_outline.AbsolutePosition.Y + 17)
                end)

                function cfg.set_visible(bool)
                    keybind_selector.Visible = bool

                    if bool then 
                        if library.current_element_open and library.current_element_open ~= cfg then 
                            library.current_element_open.set_visible(false)
                            library.current_element_open.open = false 
                        end

                        library.current_element_open = cfg 
                    end
                end 

                function cfg.set_mode(mode) 
                    cfg.mode = mode 

                    if mode == "always" then
                        cfg.set(true)
                    elseif mode == "hold" then
                        cfg.set(false)
                    end

                    flags[cfg.flag]["mode"] = mode
                end 

                function cfg.set(input)
                    if type(input) == "boolean" then 
                        local __cached = input 

                        if cfg.mode == "always" then 
                            __cached = true 
                        end 

                        cfg.active = __cached 
                        flags[cfg.flag]["active"] = __cached 
                        cfg.callback(__cached)
                    elseif tostring(input):find("Enum") then 
                        input = input.Name == "Escape" and "..." or input

                        cfg.key = input or "..."	

                        local _text = keys[cfg.key] or tostring(cfg.key):gsub("Enum.", "")
                        local _text2 = (tostring(_text):gsub("KeyCode.", ""):gsub("UserInputType.", "")) or "..."
                        cfg.key_name = _text2

                        flags[cfg.flag]["mode"] = cfg.mode 
                        flags[cfg.flag]["key"] = cfg.key 

                        key_text.Text = string.lower(_text2)

                        cfg.callback(cfg.active or false)
                    elseif table.find({"toggle", "hold", "always"}, input) then 
                        cfg.set_mode(input)

                        if input == "always" then 
                            cfg.active = true 
                        end 

                        cfg.callback(cfg.active or false)
                    elseif type(input) == "table" then 
                        input.key = type(input.key) == "string" and input.key ~= "..." and library:convert_enum(input.key) or input.key

                        input.key = input.key == Enum.KeyCode.Escape and "..." or input.key
                        cfg.key = input.key or "..."
                        
                        cfg.mode = input.mode or "toggle"

                        if input.active then
                            cfg.active = input.active
                        end

                        local text = tostring(cfg.key) ~= "Enums" and (keys[cfg.key] or tostring(cfg.key):gsub("Enum.", "")) or nil
                        local __text = text and (tostring(text):gsub("KeyCode.", ""):gsub("UserInputType.", ""))
                        
                        key_text.Text = string.lower(__text) or "..."
                        cfg.key_name = __text
                    end 

                    flags[cfg.flag] = {
                        mode = cfg.mode,
                        key = cfg.key, 
                        active = cfg.active
                    }
                    
                    if cfg.name then 
                        KEYBIND_ELEMENT.Visible = cfg.active
                    end 

                    local text = tostring(cfg.key) ~= "Enums" and (keys[cfg.key] or tostring(cfg.key):gsub("Enum.", "")) or nil
                    local __text = text and (tostring(text):gsub("KeyCode.", ""):gsub("UserInputType.", ""))

                    if cfg.name then 
                        KEYBIND_ELEMENT.Text = "[ " .. string.upper(string.sub(cfg.mode, 1, 1)) .. string.sub(cfg.mode, 2) .. " ] " .. cfg.name .. " - " .. __text
                    end 
                end

                hold_button.MouseButton1Click:Connect(function()
                    cfg.set_mode("hold") 
                    cfg.set_visible(false)
                    cfg.open = false 
                end) 

                toggle_button.MouseButton1Click:Connect(function()
                    cfg.set_mode("toggle") 
                    cfg.set_visible(false)
                    cfg.open = false 
                end) 

                always_button.MouseButton1Click:Connect(function()
                    cfg.set_mode("always") 
                    cfg.set_visible(false)
                    cfg.open = false 
                end) 

                element_outline.MouseButton2Click:Connect(function()
                    cfg.open = not cfg.open 

                    cfg.set_visible(cfg.open)
                end)

                element_outline.MouseButton1Down:Connect(function()
                    task.wait()
                    key_text.Text = "..."	

                    cfg.binding = library:connection(uis.InputBegan, function(keycode, game_event)  
                        cfg.set(keycode.KeyCode)
                        
                        cfg.binding:Disconnect() 
                        cfg.binding = nil
                    end)
                end)

                library:connection(uis.InputBegan, function(input, game_event) 
                    if not game_event then 
                        if input.KeyCode == cfg.key then 
                            if cfg.mode == "toggle" then 
                                cfg.active = not cfg.active
                                cfg.set(cfg.active)
                            elseif cfg.mode == "hold" then 
                                cfg.set(true)
                            end
                        end
                    end
                end)

                library:connection(uis.InputEnded, function(input, game_event) 
                    if game_event then 
                        return 
                    end 

                    local selected_key = input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode or input.UserInputType
        
                    if selected_key == cfg.key then
                        if cfg.mode == "hold" then 
                            cfg.set(false)
                        end
                    end
                end)
        
                cfg.set({mode = cfg.mode, active = cfg.active, key = cfg.key})
        
                library.config_flags[cfg.flag] = cfg.set
            -- 
            
            self.previous_holder = parent

            library.config_flags[cfg.flag] = cfg.set

            return self 
        end 

        function library:dropdown(options) 
            local parent = self.holder 

            local cfg = {
                name = options.name or nil,
                flag = options.flag or tostring(math.random(1,9999999)),

                items = options.items or {"1", "2", "3"},
                callback = options.callback or function() end,
                multi = options.multi or false, 

                previous_holder = self, 
                open = false, 
                option_instances = {}, 
                multi_items = {}, 
                scrolling = options.scrolling or false, 

                previous_holder = self
            }
            cfg.default = options.default or (cfg.multi and {cfg.items[1]}) or cfg.items[1] or nil

            -- dropdown elements
                local dropdown = library:create("TextLabel", {
                    Parent = parent,
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "",
                    Name = "dropdown",
                    ZIndex = 2,
                    Size = dim2(1, -8, 0, 12),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextSize = 11,
                    BackgroundColor3 = rgb(255, 255, 255)
                })

                local main_text      
                if cfg.name then 
                    local left_components = library:create("Frame", {
                        Parent = dropdown,
                        Name = "left_components",
                        BackgroundTransparency = 1,
                        Position = dim2(0, 2, 0, -1),
                        BorderColor3 = rgb(0, 0, 0),
                        Size = dim2(0, 0, 0, 14),
                        BorderSizePixel = 0,
                        BackgroundColor3 = rgb(255, 255, 255)
                    })

                    main_text = library:create("TextLabel", {
                        Parent = left_components,
                        FontFace = library.font,
                        TextColor3 = rgb(180, 180, 180),
                        BorderColor3 = rgb(0, 0, 0),
                        Text = cfg.name,
                        Name = "text",
                        BackgroundTransparency = 1,
                        Size = dim2(0, 0, 1, -1),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 12,
                        BackgroundColor3 = rgb(255, 255, 255)
                    })
                    
                    library:create("UIStroke", {
                        Parent = main_text,
                        LineJoinMode = Enum.LineJoinMode.Miter
                    })
                    
                    library:create("UIListLayout", {
                        Parent = left_components,
                        Padding = dim(0, 5),
                        Name = "_",
                        FillDirection = Enum.FillDirection.Horizontal
                    })

                    local right_components = library:create("Frame", {
                        Parent = dropdown,
                        Name = "right_components",
                        Position = dim2(1, -1, 0, 1),
                        BorderColor3 = rgb(0, 0, 0),
                        Size = dim2(0, 0, 0, 12),
                        BorderSizePixel = 0,
                        BackgroundColor3 = rgb(255, 255, 255)
                    })
                    cfg["right_holder"] = right_components
        
                    local list = library:create("UIListLayout", {
                        Parent = right_components,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        Padding = dim(0, 4),
                        Name = "list",
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    self.previous_holder = left_components
                    self.right_holder = right_components
                end 

                local bottom_components = library:create("Frame", {
                    Parent = dropdown,
                    Name = "bottom_components",
                    Position = dim2(0, 0, 0, cfg.name and 15 or 0),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 26, 0, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local dropdown = library:create("TextButton", {
                    Parent = bottom_components,
                    Name = "dropdown",
                    Position = dim2(0, 0, 0, 2),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -27, 1, 18),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38),
                    Text = "",
                    AutoButtonColor = false, 
                })library:apply_theme(dropdown, "outline", "BackgroundColor3") 
                
                local inline = library:create("Frame", {
                    Parent = dropdown,
                    Name = "inline",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })library:apply_theme(inline, "inline", "BackgroundColor3") 
                
                local background = library:create("Frame", {
                    Parent = inline,
                    Name = "background",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = themes.preset.accent
                })library:apply_theme(background, "accent", "BackgroundColor3") 
                
                local contrast = library:create("Frame", {
                    Parent = background,
                    Name = "contrast",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })

                local plus = library:create("TextLabel", {
                    Parent = contrast,
                    TextWrapped = true,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "+",
                    Name = "plus",
                    Size = dim2(1, -4, 1, 0),
                    Position = dim2(0, 0, 0, -1),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    FontFace = library.font,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                library:create("UIStroke", {
                    Parent = plus,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })
                
                local text = library:create("TextLabel", {
                    Parent = contrast,
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "aa",
                    Name = "text",
                    Size = dim2(1, -4, 1, 0),
                    Position = dim2(0, 4, 0, -1),
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                library:create("UIStroke", {
                    Parent = text,
                    LineJoinMode = Enum.LineJoinMode.Miter
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = contrast,
                    Rotation = 90,
                    Color = rgbseq{
                        rgbkey(0, rgb(41, 41, 55)),
                        rgbkey(1, rgb(35, 35, 47))
                    }
                })library:apply_theme(UIGradient, "contrast", "Color") 
                
                local UIGradient = library:create("UIGradient", {
                    Parent = background,
                    Rotation = 90,
                    Color = rgbseq{
                        rgbkey(0, rgb(255, 255, 255)),
                        rgbkey(1, rgb(167, 167, 167))
                    }
                })library:apply_theme(UIGradient, "contrast", "Color") 
                
                library:create("UIListLayout", {
                    Parent = bottom_components,
                    Padding = dim(0, 10),
                    Name = "_",
                    SortOrder = Enum.SortOrder.LayoutOrder
                })     
            --

            -- dropdown holder
                local dropdown_holder = library:create("Frame", {
                    Parent = sgui,
                    BorderColor3 = rgb(0, 0, 0),
                    Name = "dropdown_holder",
                    BackgroundTransparency = 1,
                    Position = dim2(0, dropdown.AbsolutePosition.X + 1, 0, dropdown.AbsolutePosition.Y + 22),
                    Size = dim2(0, dropdown.AbsoluteSize.X, 0, cfg.scrolling and 180 or 0),
                    BorderSizePixel = 0,
                    AutomaticSize = cfg.scrolling and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
                    BackgroundColor3 = rgb(32, 32, 38),
                    Visible = false
                })
                
                local inline = library:create("Frame", {
                    Parent = dropdown_holder,
                    Size = dim2(1, -2, 1, 2),
                    Name = "inline",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    ZIndex = 2,
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })library:apply_theme(inline, "inline", "BackgroundColor3") 
                
                local background; 
                if not cfg.scrolling then 
                    background = library:create("Frame", {
                        Parent = inline,
                        BorderColor3 = rgb(0, 0, 0),
                        Name = "background",
                        BackgroundTransparency = 1,
                        Position = dim2(0, 1, 0, 1),
                        Size = dim2(1, -2, 1, 1),
                        ZIndex = 2,
                        BorderSizePixel = 0,
                        BackgroundColor3 = themes.preset.accent
                    })
                    library:apply_theme(background, "accent", "BackgroundColor3") 
                else 
                    background = library:create("ScrollingFrame", {
                        Parent = inline,
                        BorderColor3 = rgb(0, 0, 0),
                        Name = "background",
                        BackgroundTransparency = 1,
                        Position = dim2(0, 1, 0, 1),
                        Size = dim2(1, -2, 1, 1),
                        ZIndex = 2,
                        BorderSizePixel = 0,
                        BackgroundColor3 = themes.preset.accent,
                        CanvasSize = dim2(0, 0, 0, 0),
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        ScrollBarThickness = 2,
                        ScrollBarImageColor3 = themes.preset.accent
                    })
                    library:apply_theme(background, "accent", "BackgroundColor3") 
                end 
                
                local contrast = library:create("Frame", {
                    Parent = background,
                    Name = "contrast",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 1, -3),
                    BorderSizePixel = 0,
                    ZIndex = 2, 
                    BackgroundColor3 = rgb(255, 255, 255),
                    AutomaticSize = cfg.scrolling and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
                }); 

                library:create("UIPadding", {
                    Parent = contrast,
                    PaddingTop = dim(0, 2),
                    PaddingBottom = dim(0, 2),
                    PaddingRight = dim(0, 0),
                    PaddingLeft = dim(0, 4)
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = contrast,
                    Rotation = 90,
                    Color = rgbseq{
                        rgbkey(0, rgb(41, 41, 55)),
                        rgbkey(1, rgb(35, 35, 47))
                    }
                })library:apply_theme(UIGradient, "contrast", "Color") 
            
                library:create("UIListLayout", {
                    Parent = contrast,
                    Padding = dim(0, 5),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })library:apply_theme(UIGradient, "contrast", "Color") 
                
                local UIGradient = library:create("UIGradient", {
                    Parent = background,
                    Rotation = 90,
                    Color = rgbseq{
                        rgbkey(0, rgb(255, 255, 255)),
                        rgbkey(1, rgb(167, 167, 167))
                    }
                })library:apply_theme(UIGradient, "contrast", "Color") 
                
                local stroke = library:create("UIStroke", {
                    Parent = inline,
                    Color = rgb(32, 32, 38),
                    LineJoinMode = Enum.LineJoinMode.Miter
                })library:apply_theme(stroke, "outline", "Color") 

                dropdown:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    dropdown_holder.Size = dim2(0, dropdown.AbsoluteSize.X, 0, 0)
                end)

                dropdown:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
                    dropdown_holder.Position = dim2(0, dropdown.AbsolutePosition.X + 1, 0, dropdown.AbsolutePosition.Y + 22)
                end)
            -- 
            
            function cfg.set_visible(bool) 
                dropdown_holder.Visible = bool

                plus.Text = bool and "-" or "+"
                plus.TextSize = bool and 12 or 8

                if bool then 
                    if library.current_element_open and library.current_element_open ~= cfg then 
                        library.current_element_open.set_visible(false)
                        library.current_element_open.open = false 
                    end

                    library.current_element_open = cfg 
                end
            end

            function cfg.set(value) 
                local selected = {}

                local is_table = type(value) == "table"

                for _,v in next, cfg.option_instances do 
                    if v.Text == value or (is_table and table.find(value, v.Text)) then 
                        table.insert(selected, v.Text)
                        cfg.multi_items = selected
                        v.TextColor3 = themes.preset.accent
                    else 
                        v.TextColor3 = themes.preset.text
                    end

                end

                text.Text = is_table and table.concat(selected, ", ") or selected[1] or "nun"
                flags[cfg.flag] = is_table and selected or selected[1]
                cfg.callback(flags[cfg.flag]) 
            end

            function cfg:refresh_options(refreshed_list) 
                for _, v in next, cfg.option_instances do 
                    v:Destroy() 
                end

                cfg.option_instances = {} 

                for i,v in next, refreshed_list do 
                    local TextButton = library:create("TextButton", {
                        Parent = contrast,
                        FontFace = library.font,
                        TextColor3 = themes.preset.text,
                        BorderColor3 = rgb(0, 0, 0),
                        Size = dim2(1, 0, 0, 0),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        TextSize = 12,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 2, 
                        Text = v,
                        BackgroundColor3 = rgb(255, 255, 255)
                    })library:apply_theme(TextButton, "accent", "TextColor3") 
                    
                    library:create("UIStroke", {
                        Parent = TextButton,
                        LineJoinMode = Enum.LineJoinMode.Miter
                    })

                    table.insert(cfg.option_instances, TextButton)

                    TextButton.MouseButton1Down:Connect(function()
                        if cfg.multi then 
                            local selected_index = table.find(cfg.multi_items, TextButton.Text)

                            if selected_index then 
                                table.remove(cfg.multi_items, selected_index)
                            else
                                table.insert(cfg.multi_items, TextButton.Text)
                            end

                            cfg.set(cfg.multi_items) 				
                        else 
                            cfg.set_visible(false)
                            cfg.open = false 

                            cfg.set(TextButton.Text)
                        end
                    end)
                end
            end

            dropdown.MouseButton1Click:Connect(function()
                cfg.open = not cfg.open 

                cfg.set_visible(cfg.open)
            end)

            cfg:refresh_options(cfg.items) 

            cfg.set(cfg.default)

            library.config_flags[cfg.flag] = cfg.set

            return self
        end 

        function library:list(options)
            local cfg = {
                callback = options and options.callback or function() end, 

                scale = options.size or 100, 
                items = options.items or {"1", "2", "3"}, 
                -- order = options.order or 1, 
                placeholdertext = options.placeholder or options.placeholdertext or "search here...",

                option_instances = {}, 
                current_instance = nil, 
                flag = options.flag or "SET A FLAG U NIGGER", 

                previous_holder = self
            } 

            local list_holder = library:create("TextLabel", {
                Parent = self.holder,
                Name = "",
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = "",
                ZIndex = 2,
                Size = dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIPadding = library:create("UIPadding", {
                Parent = list_holder,
                Name = "",
                PaddingLeft = dim(0, 1)
            })
            
            local UIStroke = library:create("UIStroke", {
                Parent = list_holder,
                Name = ""
            })
            
            local bottom_components = library:create("Frame", {
                Parent = list_holder,
                Name = "",
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 26, 0, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            library:create("UIListLayout", {
                Parent = bottom_components,
                Name = "",
                Padding = dim(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            local list = library:create("Frame", {
                Parent = bottom_components,
                Name = "",
                Position = dim2(0, 0, 0, 2),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -27, 1, 232),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(32, 32, 38)
            })library:apply_theme(main_holder, "outline", "BackgroundColor3") 
            
            local inline = library:create("Frame", {
                Parent = list,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(60, 55, 75)
            })library:apply_theme(inline, "inline", "BackgroundColor3") 
            
            local background = library:create("Frame", {
                Parent = inline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = themes.preset.accent
            })library:apply_theme(background, "accent", "BackgroundColor3") 
            
            local UIGradient = library:create("UIGradient", {
                Parent = background,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                rgbkey(0, rgb(255, 255, 255)),
                rgbkey(1, rgb(167, 167, 167))
            }
            })library:apply_theme(UIGradient, "contrast", "Color") 
            
            local contrast = library:create("Frame", {
                Parent = background,
                Name = "",
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIGradient = library:create("UIGradient", {
                Parent = contrast,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                rgbkey(0, rgb(41, 41, 55)),
                rgbkey(1, rgb(35, 35, 47))
            }
            })library:apply_theme(UIGradient, "contrast", "Color") 
            
            local ScrollingFrame = library:create("ScrollingFrame", {
                Parent = contrast,
                Name = "",
                ScrollBarImageColor3 = themes.preset.accent,
                Active = true,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollBarThickness = 3,
                BackgroundTransparency = 1,
                Size = dim2(1, 0, 1, 0),
                BackgroundColor3 = rgb(255, 255, 255),
                BorderColor3 = rgb(0, 0, 0),
                BorderSizePixel = 0,
                CanvasSize = dim2(0, 0, 0, 0)
            })library:apply_theme(ScrollingFrame, "accent", "ScrollBarImageColor3") 
            
            local UIPadding = library:create("UIPadding", {
                Parent = ScrollingFrame,
                Name = "",
                PaddingBottom = dim(0, 4),
                PaddingTop = dim(0, 4)
            })
            
            local UIListLayout = library:create("UIListLayout", {
                Parent = ScrollingFrame,
                Name = "",
                Padding = dim(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder
            })

            function cfg.render_option(text) 
                local TextButton = library:create("TextButton", {
                    Parent = ScrollingFrame,
                    Name = "",
                    Text = tostring(text),
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    BackgroundTransparency = 1,
                    Size = dim2(1, 0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local UIStroke = library:create("UIStroke", {
                    Parent = TextButton,
                    Name = ""
                })

                return TextButton 
            end 

            function cfg.refresh_options(options) 
                if type(options) == "function" then return end 
                for _, v in next, cfg.option_instances do 
                    v:Destroy() 
                end 

                for _, option in next, options do 
                    local button = cfg.render_option(option) 

                    table.insert(cfg.option_instances, button)

                    button.MouseButton1Click:Connect(function()
                        if cfg.current_instance and cfg.current_instance ~= button then 
                            cfg.current_instance.TextColor3 = themes.preset.text 
                        end 

                        cfg.current_instance = button 
                        button.TextColor3 = themes.preset.accent 

                        flags[cfg.flag] = button.text
                        
                        cfg.callback(button.text)
                    end)
                end 
            end     

            function cfg.filter_options(text)
                for _, v in next, cfg.option_instances do 
                    if string.find(v.Text, text) then 
                        v.Visible = true 
                    else 
                        v.Visible = false
                    end
                end
            end 

            cfg.refresh_options(cfg.items) 
            
            return self, cfg
        end 

        function library:textbox(options)
            local cfg = {
                placeholder = options.placeholder or options.placeholdertext or options.holder or options.holdertext or "type here...",
                default = options.default,
                flag = options.flag or "SET ME NIGGA",
                callback = options.callback or function() end 
            }

            local textbox_holder = library:create("TextLabel", {
                Parent = self.holder,
                Name = "",
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = "",
                ZIndex = 2,
                Size = dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            library:create("UIPadding", {
                Parent = textbox_holder,
                Name = "",
                PaddingLeft = dim(0, 1)
            })
            
            library:create("UIStroke", {
                Parent = textbox_holder,
                Name = ""
            })
            
            local button = library:create("Frame", {
                Parent = textbox_holder,
                Name = "",
                Position = dim2(0, 0, 0, 2),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -27, 0, 18),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(32, 32, 38)
            })
            
            library:apply_theme(button, "outline", "BackgroundColor3") 
            
            local inline = library:create("Frame", {
                Parent = button,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(60, 55, 75)
            })
            
            library:apply_theme(inline, "inline", "BackgroundColor3") 
            
            local background = library:create("Frame", {
                Parent = inline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = themes.preset.accent
            })
            
            library:apply_theme(background, "accent", "BackgroundColor3") 
            
            local TextBox = library:create("TextBox", {
                Parent = background,
                Name = "",
                CursorPosition = -1,
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                ZIndex = 2,
                Text = "", 
                Size = dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                TextWrapped = true,
                BackgroundTransparency = 1,
                TextTruncate = Enum.TextTruncate.SplitWord,
                PlaceholderText = "Type here...",
                ClearTextOnFocus = false,
                TextSize = 12,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            library:create("UIStroke", {
                Parent = TextBox,
                Name = ""
            })
            
            local TextButton = library:create("TextButton", {
                Parent = background,
                Name = "",
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
                TextColor3 = rgb(0, 0, 0),
                BorderColor3 = rgb(0, 0, 0),
                Text = "",
                AutoButtonColor = false,
                Size = dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                TextSize = 14,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIGradient = library:create("UIGradient", {
                Parent = TextButton,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                rgbkey(0, rgb(41, 41, 55)),
                rgbkey(1, rgb(35, 35, 47))
            }
            })
            
            library:apply_theme(UIGradient, "contrast", "Color") 
            
            library:create("UIListLayout", {
                Parent = textbox_holder,
                Name = "",
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Padding = dim(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            TextBox:GetPropertyChangedSignal("Text"):Connect(function()
                flags[cfg.flag] = TextBox.text
                cfg.callback(TextBox.text)
            end)

            function cfg.set(text) 
                flags[cfg.flag] = text
                TextBox.Text = text
                cfg.callback(text)
            end 

            if cfg.default then 
                cfg.set(cfg.default) 
            end 

            library.config_flags[cfg.flag] = cfg.set

            return self 
        end 

        function library:button_holder(options) 
            local button_holder = library:create("TextLabel", {
                Parent = self.holder,
                Name = "",
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = "",
                ZIndex = 2,
                Size = dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = rgb(255, 255, 255), 
            })

            self.current_holder = button_holder
            
            library:create("UIStroke", {
                Parent = button_holder,
                Name = ""
            })
            
            library:create("UIListLayout", {
                Parent = button_holder,
                Name = "",
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Padding = dim(0, 4),
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        
            return self
        end 

        function library:button(options)
            local cfg = {
                callback = options.callback or function() end, 
                name = options.text or options.name or "Button",
            }   

            local button = library:create("TextButton", {
                Parent = self.current_holder,
                Name = "",
                Position = dim2(0, 0, 0, 2),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -27, 0, 18),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(32, 32, 38),
                Text = ""
            })
            
            library:apply_theme(button, "outline", "BackgroundColor3") 
            
            local inline = library:create("Frame", {
                Parent = button,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(60, 55, 75)
            })
            
            library:apply_theme(inline, "inline", "BackgroundColor3") 
            
            local background = library:create("Frame", {
                Parent = inline,
                Name = "",
                Position = dim2(0, 1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, -2, 1, -2),
                BorderSizePixel = 0,
                BackgroundColor3 = themes.preset.accent
            })
            
            library:apply_theme(background, "accent", "BackgroundColor3") 
            
            local _UIGradient = library:create("UIGradient", {
                Parent = background,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                rgbkey(0, rgb(255, 255, 255)),
                rgbkey(1, rgb(167, 167, 167))
            }
            })
            
            library:apply_theme(_UIGradient, "contrast", "Color") 
            
            local contrast = library:create("Frame", {
                Parent = background,
                Name = "",
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIGradient = library:create("UIGradient", {
                Parent = contrast,
                Name = "",
                Rotation = 90,
                Color = rgbseq{
                rgbkey(0, rgb(41, 41, 55)),
                rgbkey(1, rgb(35, 35, 47))
            }
            })
            
            library:apply_theme(UIGradient, "contrast", "Color") 
            
            local text = library:create("TextLabel", {
                Parent = contrast,
                Name = "",
                TextWrapped = true,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = cfg.name,
                Size = dim2(1, -4, 1, 0),
                Position = dim2(0, 4, 0, -1),
                BackgroundTransparency = 1,
                TextTruncate = Enum.TextTruncate.AtEnd,
                BorderSizePixel = 0,
                FontFace = library.font,
                TextSize = 12,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIStroke = library:create("UIStroke", {
                Parent = text,
                Name = "",
                LineJoinMode = Enum.LineJoinMode.Miter
            })

            button.MouseButton1Click:Connect(function()
                cfg.callback() 
            end)

            return self
        end 

        function library:label(options)
            local cfg = {name = options.text or options.name or "Label", previous_holder = self}

            local dropdown = library:create("TextLabel", {
                Parent = self.holder,
                Name = "",
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = "",
                ZIndex = 2,
                Size = dim2(1, -8, 0, 12),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextSize = 11,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local UIStroke = library:create("UIStroke", {
                Parent = dropdown,
                Name = ""
            })
            
            local left_components = library:create("Frame", {
                Parent = dropdown,
                Name = "",
                BackgroundTransparency = 1,
                Position = dim2(0, 2, 0, -1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(0, 0, 0, 14),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })
            
            local TextLabel = library:create("TextLabel", {
                Parent = left_components,
                Name = "",
                FontFace = library.font,
                TextColor3 = rgb(180, 180, 180),
                BorderColor3 = rgb(0, 0, 0),
                Text = cfg.name,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                TextSize = 12,
                BackgroundColor3 = rgb(255, 255, 255)
            })

            local right_components = library:create("Frame", {
                Parent = dropdown,
                Name = "right_components",
                Position = dim2(1, -1, 0, 1),
                BorderColor3 = rgb(0, 0, 0),
                Size = dim2(0, 0, 0, 12),
                BorderSizePixel = 0,
                BackgroundColor3 = rgb(255, 255, 255)
            })

            local list = library:create("UIListLayout", {
                Parent = right_components,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                Padding = dim(0, 4),
                Name = "list",
                SortOrder = Enum.SortOrder.LayoutOrder
            })
            
            local UIStroke = library:create("UIStroke", {
                Parent = TextLabel,
                Name = ""
            })

            function cfg.change_text(text) 
                TextLabel.Text = text 
            end 

            self.previous_holder = left_components
            self.right_holder = right_components
            
            return self, cfg       
        end 

        function library:playerlist(options) 
            local cfg = {
                players = {}, 
                callback = options.callback or function() end, 
                selected_player, 

                labels = {
                    name,
                    display, 
                    uid, 
                }
            }

            local patterns = {
                ["Priority"] = Color3.fromRGB(255, 255, 0),
                ["Enemy"] = Color3.fromRGB(255, 0, 0),
                ["Neutral"] = themes.preset.text,
                ["Friendly"] = Color3.fromRGB(0, 255, 255)
            }

            -- elements 
                local playerlist_holder = library:create("TextLabel", {
                    Parent = self.holder,
                    Name = "",
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "",
                    ZIndex = 2,
                    Size = dim2(1, -8, 0, 12),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    TextSize = 11,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local UIPadding = library:create("UIPadding", {
                    Parent = playerlist_holder,
                    Name = "",
                    PaddingBottom = dim(0, -2),
                    PaddingLeft = dim(0, 1)
                })
                
                local UIStroke = library:create("UIStroke", {
                    Parent = playerlist_holder,
                    Name = ""
                })
                
                local bottom_components = library:create("Frame", {
                    Parent = playerlist_holder,
                    Name = "",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 26, 0, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                library:create("UIListLayout", {
                    Parent = bottom_components,
                    Name = "",
                    Padding = dim(0, 10),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
                
                local list = library:create("Frame", {
                    Parent = bottom_components,
                    Name = "",
                    Position = dim2(0, 0, 0, 2),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -27, 1, 232),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(list, "outline", "BackgroundColor3") 
                
                local inline = library:create("Frame", {
                    Parent = list,
                    Name = "",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(60, 55, 75)
                })library:apply_theme(inline, "inline", "BackgroundColor3") 
                
                local background = library:create("Frame", {
                    Parent = inline,
                    Name = "",
                    Position = dim2(0, 1, 0, 1),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, -2, 1, -2),
                    BorderSizePixel = 0,
                    BackgroundColor3 = themes.preset.accent
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = background,
                    Name = "",
                    Rotation = 90,
                    Color = rgbseq{
                    rgbkey(0, rgb(255, 255, 255)),
                    rgbkey(1, rgb(167, 167, 167))
                }
                })library:apply_theme(UIGradient, "contrast", "Color") 
                
                local contrast = library:create("Frame", {
                    Parent = background,
                    Name = "",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 1, 0),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local UIGradient = library:create("UIGradient", {
                    Parent = contrast,
                    Name = "",
                    Rotation = 90,
                    Color = rgbseq{
                    rgbkey(0, rgb(41, 41, 55)),
                    rgbkey(1, rgb(35, 35, 47))
                }
                })library:apply_theme(UIGradient, "contrast", "Color") 
                
                local ScrollingFrame = library:create("ScrollingFrame", {
                    Parent = contrast,
                    Name = "",
                    ScrollBarImageColor3 = themes.preset.accent,
                    Active = true,
                    AutomaticCanvasSize = Enum.AutomaticSize.Y,
                    ScrollBarThickness = 3,
                    BackgroundTransparency = 1,
                    Size = dim2(1, 0, 1, 0),
                    BackgroundColor3 = rgb(255, 255, 255),
                    BorderColor3 = rgb(0, 0, 0),
                    BorderSizePixel = 0,
                    CanvasSize = dim2(0, 0, 0, 0)
                })library:apply_theme(ScrollingFrame, "accent", "ScrollBarImageColor3") 
                
                local UIPadding = library:create("UIPadding", {
                    Parent = ScrollingFrame,
                    Name = "",
                    PaddingTop = dim(0, 4),
                    PaddingBottom = dim(0, 4),
                    PaddingRight = dim(0, 4),
                    PaddingLeft = dim(0, 4)
                })
                
                local UIListLayout = library:create("UIListLayout", {
                    Parent = ScrollingFrame,
                    Name = "",
                    Padding = dim(0, 4),
                    SortOrder = Enum.SortOrder.LayoutOrder
                })
            -- 

            function cfg.create_player(player) 
                cfg.players[tostring(player)] = {}
                local path = cfg.players[tostring(player)]
                
                local TextButton = library:create("TextButton", {
                    Parent = ScrollingFrame,
                    Name = "",
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "",
                    BackgroundTransparency = 1,
                    Size = dim2(1, 0, 0, 0),
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })

                path.instance = TextButton

                local player_name = library:create("TextLabel", {
                    Parent = TextButton,
                    Name = "",
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = tostring(player),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                library:apply_theme(player_name, "text", "TextColor3") 
                library:apply_theme(player_name, "accent", "TextColor3") 
                                
                local TextLabel = library:create("TextLabel", {
                    Parent = TextButton,
                    Name = "",
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = tostring(players[tostring(player)].Team) or "None",
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                                
                local Frame = library:create("Frame", {
                    Parent = TextLabel,
                    Name = "",
                    Position = dim2(0, -10, 0, 0),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 1, 0, 12),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(main_holder, "outline", "BackgroundColor3") 
                
                local priority_text = library:create("TextLabel", {
                    Parent = TextButton,
                    Name = "",
                    FontFace = library.font,
                    TextColor3 = rgb(180, 180, 180),
                    BorderColor3 = rgb(0, 0, 0),
                    Text = "Neutral",
                    BackgroundTransparency = 1,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    TextSize = 12,
                    BackgroundColor3 = rgb(255, 255, 255)
                })
                
                local Frame = library:create("Frame", {
                    Parent = priority_text,
                    Name = "",
                    Position = dim2(0, -10, 0, 0),
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(0, 1, 0, 12),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(main_holder, "outline", "BackgroundColor3") 
                
                local UIListLayout = library:create("UIListLayout", {
                    Parent = TextButton,
                    Name = "",
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalFlex = Enum.UIFlexAlignment.Fill,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalFlex = Enum.UIFlexAlignment.Fill
                })
                
                local UIPadding = library:create("UIPadding", {
                    Parent = TextButton,
                    Name = "",
                    PaddingRight = dim(0, 2),
                    PaddingLeft = dim(0, 2)
                })

                local line = library:create("Frame", {
                    Parent = ScrollingFrame,
                    Name = "",
                    BorderColor3 = rgb(0, 0, 0),
                    Size = dim2(1, 0, 0, 1),
                    BorderSizePixel = 0,
                    BackgroundColor3 = rgb(32, 32, 38)
                })library:apply_theme(main_holder, "outline", "BackgroundColor3") 

                path.line = line

                function path.set_priority(text) 
                    priority_text.Text = text
                    priority_text.TextColor3 = patterns[text]
                end 

                TextButton.MouseButton1Click:Connect(function()
                    if cfg.selected_player then 
                        cfg.selected_player.TextColor3 = themes.preset.text 
                    end     

                    cfg.selected_player = player_name 
                    player_name.TextColor3 = themes.preset.accent 

                    cfg.callback(players[tostring(player)]) 

                    if cfg.labels.name then 
                        cfg.labels.name.change_text("User: " .. tostring(player))
                        cfg.labels.display.change_text("DisplayName: " .. players[tostring(player)].DisplayName)
                        cfg.labels.uid.change_text("User Id: " .. players[tostring(player)].UserId)
                    end     
                end)

                return path 
            end 

            function cfg.remove_player(player) 
                cfg.players[tostring(player)].instance:Destroy() 
                cfg.players[tostring(player)].line:Destroy() 
                cfg.players[tostring(player)] = nil 
            end 

            players.PlayerAdded:Connect(cfg.create_player)
            players.PlayerRemoving:Connect(cfg.remove_player)
            
            for _, player in next, players:GetPlayers() do 
                local player_object = cfg.create_player(player.Name)
                table.insert(cfg.players, player_object)
            end 

            _, cfg.labels.name = self:label({name = "Name: ??"})
            _, cfg.labels.display = self:label({name = "Display Name: ??"})
            _, cfg.labels.uid = self:label({name = "User Id: ??"})

            return self
        end 
    -- 
-- 

local function ClosestPlr(Part)
    local Distance, Closest = math.huge, nil
    for I, Target in pairs(Players:GetPlayers()) do
        if Target ~= LocalPlr and Target.Character and Target.Character:FindFirstChild(Part) then
            local Position = Workspace.CurrentCamera:WorldToViewportPoint(Target.Character[Part].Position)
            local Magnitude = (Vector2.new(Position.X, Position.Y) - UserInputService:GetMouseLocation()).Magnitude
            if Magnitude < Distance then
                Closest = Target
                Distance = Magnitude
            end
        end
    end
    return Closest
end

-- documentation 
    local window = library:window({name = os.date('primordial - Beta - %b %d %Y'), size = dim2(0, 614, 0, 639)})
    local watermark = library:watermark({default = os.date('primordial - Beta - %b %d %Y - %H:%M:%S')})  

    local Aiming = window:tab({name = "Aiming"})
    local Rage = window:tab({name = "Rage"})
    local Visuals = window:tab({name = "Visuals"})
    local Misc = window:tab({name = "Misc"})
    --local Players = window:tab({name = "Players"})
    local Settings = window:tab({name = "Settings"})

-- Aiming
local column =  Aiming:column() 
column:section({name = "Target Selection"})
    :toggle({name = "Enabled", flag = "enabled"})
    :keybind({name = "Target Bind", flag = "aimbotbind"})
    :toggle({name = "Sticky Aim", flag = "aimbot_sticky"})
    :dropdown({name = "Method", flag = "method", items = {"Camera", "Mouse"}})
    :toggle({name = "Prediction", flag = "prediction"})
    :slider({name = "Prediction X", flag = "predx", min = 0, max = 1, default = 0, interval = 0.00001})
    :slider({name = "Prediction Y", flag = "predy", min = 0, max = 1, default = 0, interval = 0.00001})     
    :dropdown({name = "Hitpart", flag = "hitpart", items = {"Head", "UpperTorso", "HumanoidRootPart"}}) 
    :slider({name = "Smoothness", flag = "smooth", min = -1, max = 1, default = 0, interval = 0.01})
    :dropdown({name = "Target", flag = "target", items = {"Player", "Dummy"}})
    
    :toggle({name = "FOV Enabled", flag = "aimbot_fovenabled"}):colorpicker({flag = "aimbot_fovcolor", color = Color3.new(1, 1, 1)})
    :toggle({name = "Show FOV", flag = "aimbot_showfov"})
    :slider({name = "FOV", flag = "aimbot_fov", min = 0, max = 800, default = 100})
local column = Aiming:column()
column:section({name = "Silent Aim"})  
    :toggle({name = "Enabled", flag = "silentaim_enabled"})
    :keybind({name = "Target Bind", flag = "silentaim_bind"})
    :toggle({name = "Auto Switch Target", flag = "silentaim_autoswitch"})
    :slider({name = "Prediction", flag = "silentaim_prediction", min = 0, max = 1, default = 0, interval = 0.00001})
    :dropdown({name = "Hitpart", flag = "silentaim_hitpart", items = {"Head", "UpperTorso", "HumanoidRootPart"}})
    :toggle({name = "Visible Check", flag = "silentaim_vischeck"})
    :dropdown({name = "Target", flag = "starget", items = {"Player", "Dummy"}})
    :toggle({name = "Rapid Fire", flag = "rapidfire"})
    :toggle({name = "Show FOV", flag = "silentaim_showfov"})
    :slider({name = "FOV", flag = "silentaim_fov", min = 0, max = 800, default = 100})
    :colorpicker({name = "FOV Color", flag = "silentaim_fovcolor", color = Color3.new(1, 1, 1)})
column:section({name = "Triggerbot"})  
    :toggle({name = "Enabled", flag = "triggerbot_enabled"})
    :keybind({name = "Bind", flag = "triggerbot_bind"})
    :toggle({name = "Visible Check", flag = "triggerbot_vischeck"})
    :dropdown({name = "Hitpart", flag = "triggerbot_part", items = {"Head", "UpperTorso", "HumanoidRootPart"}})
    :slider({name = "Delay", flag = "triggerbot_delay", min = 0, max = 1000, default = 0, interval = 1})
    :slider({name = "Hit Chance", flag = "triggerbot_hitchance", min = 0, max = 100, default = 100, interval = 1})
    :toggle({name = "Show Fov", flag = "triggerbot_showfov"})
    :slider({name = "FOV", flag = "triggerbot_fov", min = 0, max = 800, default = 100})
    :dropdown({name = "Target", flag = "triggerbot_target", items = {"Player", "Dummy"}})
-- 

-- Rage
local column =  Rage:column() 
column:section({name = "Target Aim"})
    :toggle({name = "Enabled", flag = "targenabled"})
    :keybind({name = "Target Bind", flag = "targbind"})
    :slider({name = "Prediction", flag = "targpred", min = 0, max = 1, default = 0, interval = 0.00001})
    :dropdown({name = "Hitpart", flag = "targpart", items = {"Head", "UpperTorso", "HumanoidRootPart"}})
    -- ill continue ts later idc


local column =  Rage:column() 
    column:section({name = "Other"})
        :toggle({name = "Visualize Hrp Spoofer", flag = "desync_visualize", default = true})
        :colorpicker({name = "Visualizer Color", flag = "desync_part_color", color = rgb(255, 0, 0)})
        :toggle({name = "Highlight", flag = "desync_cham_highlight", default = true})
        :colorpicker({name = "Fill Color", flag = "desync_visualizer_fill", color = rgb(0, 255, 255), alpha = 0.5})
        :colorpicker({name = "Outline Color", flag = "desync_visualizer_outline", color = rgb(0, 0, 0)})
        :dropdown({name = "Material", flag = "desync_cham_material", items = {"ForceField", "Neon", "Plastic", "Glass"}, default = "ForceField"})
        :slider({name = "Reflectance", flag = 'desync_cham_reflectance', min = 0, max = 1, Default = 0, interval = 0.01, Suffix = ""})
        :dropdown({name = "Texture", flag = "desync_material_texture", items = {"Web", "Swirl", "Checkers", "CandyCane", "Dots", "Scanning", "Bubbles", "Normal", "Shield", "Water", "None"}, default = "None"})
        :toggle({name = "Destroy Cheaters", flag = "destroy_cheaters"})
        :keybind({name = "Destroy Cheaters", flag = "destroy_cheaters_bind"})
        :slider({name = "Interval", min = 1, max = 200, default = 0, interval = 1, suffix = "ms", flag = "destroy_cheaters_interval"})
        :dropdown({name = "Type", items = {"Nan", "High Magnitude", "On Connection", "Randomize"}, default = "Randomize", flag = "destroy_cheaters_type"})
        :slider({name = "Minimum Health", min = 0, max = 100, default = 0, interval = 1, flag = "destroy_cheaters_min_health"})
-- 

-- Misc
local column = Misc:column()
column:section({name = "Combat"})
    :toggle({name = "Speed", flag = "cfspd"})
    :keybind({name = "Speed", flag = "spdbind", mode = "toggle"})
    :slider({name = "Amount", flag = 'speed', min = 0, max = 10, default = 2, interval = 0.1})
    :toggle({name = "Auto Jump", flag = "auto_jump"})
    :toggle({name = "Fly", flag = "fly"})
    :keybind({name = "Fly", flag = "fly_bind", mode = "toggle"})
    :slider({name = "Amount", flag = 'fly_increments', min = 0, max = 100, default = 20, interval = 1})
    :toggle({name = "No Slow", flag = "no_slow"})
    :toggle({name = "No Jump Cooldown", flag = "no_jump_cooldown"})
    :toggle({name = "Auto Reload", flag = "auto_reload"})
    :toggle({name = "Auto Shoot", flag = "auto_shoot"})
    :slider({name = "Delay", flag = 'auto_shoot_delay', min = 0, max = 1000, default = 50, interval = 1, suffix = "ms"})
    :toggle({name = "Auto Armor", flag = "auto_armor"})
    :toggle({name = "Anti Void Kill", flag = "anti_void_kill"})
    -- :toggle({name = "Anti Stomp", flag = "anti_stomp"})
    :toggle({name = "Infinite Zoom", flag = "infinite_zoom"})
    :toggle({name = "Show Chat", flag = "show_chat"})
local column = Misc:column()    
column:section({name = "Other"})
    :toggle({name = "Hit Detection", flag = "hit_detection"})
    :toggle({name = "Hit Chams", flag = "hit_cham"})
    :colorpicker({color = rgb(255, 255, 255), flag = "hit_chams"})
    :toggle({name = "Highlight", flag = "hit_cham_highlight"})
    :colorpicker({name = "fill", color = rgb(255, 255, 255), flag = "hit_chams_fill"})
    :colorpicker({name = "outline", color = rgb(255, 255, 255), flag = "hit_chams_outline"})
    :dropdown({name = "Material", flag = "hit_material", items = {"ForceField", "Neon", "Plastic"}, default = "ForceField"})
    :slider({name = "Reflectance", flag = 'hit_reflectance', min = 0, max = 1, default = 0, interval = 0.01})
    :dropdown({name = "Texture", flag = "hit_texture", items = {"Web", "Swirl", "Checkers", "CandyCane", "Dots", "Scanning", "Bubbles", "Normal", "Shield", "Water", "None"}, default = "None", })
    :dropdown({name = "Hit Effect", flag = "hit_effect", items = {"None", "Detailed Slash", "Electric", "Electric 2", "Nova", "Slash", "Sparkle", "Splash"}, default = "None"})
    :colorpicker({color = rgb(255, 255, 255), flag = "hit_effect_settings"})
    -- :toggle({name = "Hit Logs", flag = "hit_logs"})
    :colorpicker({color = rgb(255, 255, 255), flag = "hit_logs_color"})
    --:toggle({name = "Hit Marker", flag = "hit_marker", })
    --:colorpicker({color = rgb(255, 255, 255), flag = "hit_marker_color"})
    :toggle({name = "3D Hit Marker", flag = "3d_hit_marker"})
    :colorpicker({color = rgb(255, 255, 255), flag = "3d_hit_markers"})
    :toggle({name = "Health Marker", flag = "health_indicator", })
    :colorpicker({color = rgb(255, 255, 255), flag = "health_indicator_color"})
    :slider({name = "Lifetime", flag = 'on_hit_lifetime', min = 0, max = 10, default = 2, interval = 0.05, suffix = "s"})
    :toggle({name = "Hit Sound", flag = "hit_sound"})
    :slider({name = "Volume", flag = 'hit_sound_volume', min = 0, max = 10, default = 1, interval = 0.05})
    :slider({name = "Pitch", flag = 'hit_sound_pitch', min = 0, max = 10, default = 1, interval = 0.05})
    :dropdown({name = "Hit Sound", flag = "Hit Sound", items = sounds, scrolling = true, default = "1nn.mp3"})
    -- :toggle({name = "Shit Talk", flag = "shit_talk"})
    -- :slider({name = "Delay", flag = 'shit_talk_delay', min = 0, max = 1, default = 0, interval = 0.01, suffix = "s"})
    -- :label({name = "GOTO NEBULA DIRECTORY TO EDIT"})
    :toggle({name = "Aspect Ratio", flag = "aspect_ratio"})
    :slider({name = "Horizontal", flag = 'horizontal_aspect_ratio', min = 0, max = 1, default = 1, interval = 0.01})
    :slider({name = "Vertical", flag = 'vertical_aspect_ratio', min = 0, max = 1, default = 1, interval = 0.01})  
--  

-- Visuals
local column =  Visuals:column() 
column:section({name = "Esp"})
    :toggle({name = "Enabled", flag = "ESPEnabled"})
    :toggle({name = "Bounding Boxes", flag = "BoxESP"})
    :toggle({name = "Box Outline", flag = "BoxOutline"})
    :toggle({name = "Names", flag = "BoxName"})
    :toggle({name = "Distance", flag = "BoxDistance"})
    :toggle({name = "Healthbar", flag = "BoxHealthBar"})
    :toggle({name = "Health Number", flag = "BoxHealth"})               
    :toggle({name = "Highlight", flag = "HighlightESP"})
    :slider({name = "Max Distance", flag = "ESPMaxDist", min = 0, max = 4000, default = 3000, interval = 1})
    :toggle({name = "Highlight Always On Top", flag = "HighlightAlwaysOnTop"})
    :slider({name = "Highlight Fill Transparency", flag = 'HighlightFillTrans', min = 0, max = 1, default = 0.5, interval = 0.01})
    :slider({name = "Highlight Outline Transparency", flag = 'HighlightOutlineTrans', min = 0, max = 1, default = 0.5, interval = 0.01})
column:section({name = "Colours"})
    :label({name = "Box Color"})
    :colorpicker({name = "Box Color", color = rgb(255, 255, 255), flag = "BoxColor", callback = function(color)
        colorsets.boxcolor = color
    end})
    :label({name = "Box Outline Color"})
    :colorpicker({name = "Box Outline Color", color = rgb(0, 0, 0), flag = "BoxOutlineColor", callback = function(color)
        colorsets.boxoutlinecolor = color
    end})
    :label({name = "Highlight Fill Color"})
    :colorpicker({name = "Highlight Fill Color", color = Color3.fromRGB(50, 110, 170), flag = "HighlightFillColor", callback = function(color)
        colorsets.highlightfillcolor = color
    end})
    :label({name = "Highlight Outline Color"})
    :colorpicker({name = "Highlight Outline Color", color = Color3.fromRGB(50, 110, 170), flag = "HighlightOutlineColor", callback = function(color)
        colorsets.highlightoutlinecolor = color
    end})
local column =  Visuals:column() 
column:section({name = "Target Visuals"})
    :toggle({name = "Highlight Target", flag = "HighlightTarget"})
    :toggle({name = "Flashing Highlight", flag = "Flash"})
    :colorpicker({name = "Highlight Color", flag = "HighlightTargetColor", color = Color3.fromRGB(50, 110, 170), callback = function(color)
        colorsets.highlighttargetcolor = color
    end})
    :colorpicker({name = "Highlight Outline Color", flag = "HighlightTargetOutlineColor", color = Color3.fromRGB(50, 110, 170), callback = function(color)
        colorsets.highlighttargetoutlinecolor = color
    end})
    :toggle({name = "Target Aura", flag = "targetaura"})
    :colorpicker({name = "Target Aura Color", flag = "targetauracolor", color = Color3.fromRGB(50, 110, 170), callback = function(color)
        colorsets.targetauracolor = color
    end})
column:section({name = "World"})
    :toggle({name = "Master Switch", flag = "Master Switch", callback = function()
        for i,v in pairs(Lighting_Save) do
            Lighting[i] = v
        end
    end})
    :toggle({name = "Clock Time", flag = "Clock Time Enabled"})
    :slider({name = "Clock Time", flag = "Clock Time", min = 0, max = 24, default = 12, interval = 1})
    :toggle({name = "Color Shift Bottom", flag = "Color Shift Bottom"})
    :colorpicker({name = "Color Shift Bottom", flag = "Color Shift Bottom Color", color = Color3.fromRGB(50, 110, 170)})
    :toggle({name = "Color Shift Top", flag = "Color Shift Top"})
    :colorpicker({name = "Color Shift Top", flag = "Color Shift Top Color", color = Color3.fromRGB(50, 110, 170)})
    :toggle({name = "Ambient", flag = "Ambient"})
    :colorpicker({name = "Ambient", flag = "Ambient Color", color = Color3.fromRGB(50, 110, 170)})
    :toggle({name = "Outdoor Ambience", flag = "Outdoor Ambience"})
    :colorpicker({name = "Outdoor Ambience", flag = "Outdoor Ambience Color", color = Color3.fromRGB(50, 110, 170)})
    :toggle({name = "Brightness", flag = "Brightness Enabled"})
    :slider({name = "Brightness", flag = "Brightness", min = 0, max = 20, default = 1, interval = 0.1})
    :toggle({name = "Fog", flag = "Fog"})
    :colorpicker({name = "Fog", flag = "Fog Color", color = Color3.fromRGB(50, 110, 170)})


    --

    -- -- Players
    --     local column = Players:column()
    --         column:section({name = "Options"})
    --             :playerlist({})
    --             :toggle({name = "Auto Stomp"})
    --             :toggle({name = "Auto Grab"})
    --             :button_holder()
    --             :button({name = "Set Priority"})
    --             :button({name = "Set Friendly"})
    --             :button_holder()
    --             :button({name = "Set Friend"})
    --             :button({name = "Set Enemy"})
    -- -- 

    -- Settings
        local column = Settings:column()
            local section = column:section({name = "Options"})
                local old_config = library:get_config()
                _, config_holder = section:list({flag = "config_name_list"})
                section:textbox({flag = "config_name_text_box"})
                section:button_holder({})
                section:button({name = "Create", callback = function()
                    writefile(library.directory .. "/configs/" .. flags["config_name_text_box"] .. ".cfg", library:get_config())
                    library:config_list_update()
                end})
                section:button({name = "Delete", callback = function()
                    delfile(library.directory .. "/configs/" .. flags["config_name_list"] .. ".cfg")
                    library:config_list_update()
                end})
                section:button_holder({})
                section:button({name = "Load", callback = function()
                    library:load_config(readfile(library.directory .. "/configs/" .. flags["config_name_list"] .. ".cfg"))
                end})
                section:button({name = "Save", callback = function()
                    writefile(library.directory .. "/configs/" .. flags["config_name_text_box"] .. ".cfg", library:get_config())
                    library:config_list_update()
                end})
                section:button_holder({})
                section:button({name = "Unload Config", callback = function()
                    library:load_config(old_config)
                end})
                section:button({name = "Unload Menu", callback = function()
                    for _, gui in next, library.guis do 
                        gui:Destroy() 
                    end 

                    for _, connection in next, library.connections do 
                        connection:Disconnect() 
                    end     

                    for _, instance in next, nebula.instances do 
                        instance:Destroy() 
                    end 

                    for _, drawing in next, nebula.drawings do 
                        drawing:Remove()
                    end 
                end})
        local column = Settings:column()
            column:section({name = "Theme"})
                :label({name = "Accent"})
                :colorpicker({name = "Accent", color = themes.preset.accent, flag = "accent", callback = function(color, alpha)
                    library:update_theme("accent", color)
                end})
                :label({name = "Contrast"})
                :colorpicker({name = "Low", color = themes.preset.low_contrast, flag = "low_contrast", callback = function(color)
                    if (flags["high_contrast"] and flags["low_contrast"]) then 
                        library:update_theme("contrast", rgbseq{
                            rgbkey(0, flags["low_contrast"].Color),
                            rgbkey(1, flags["high_contrast"].Color)
                        })
                    end 
                end})
                :colorpicker({name = "High", color = themes.preset.high_contrast, flag = "high_contrast", callback = function(color)
                    library:update_theme("contrast", rgbseq{
                        rgbkey(0, flags["low_contrast"].Color),
                        rgbkey(1, flags["high_contrast"].Color)
                    })
                end})
                :label({name = "Inline"})
                :colorpicker({name = "Inline", color = themes.preset.inline, callback = function(color, alpha)
                    library:update_theme("inline", color)
                end})
                :label({name = "Outline"})
                :colorpicker({name = "Outline", color = themes.preset.outline, callback = function(color, alpha)
                    library:update_theme("outline", color)
                end})
                :label({name = "Text Color"})
                :colorpicker({name = "Main", color = themes.preset.text, callback = function(color, alpha)
                    library:update_theme("text", color)
                end})
                :colorpicker({name = "Outline", color = themes.preset.text_outline, callback = function(color, alpha)
                    library:update_theme("text_outline", color)
                end})
                :label({name = "Glow"})
                :colorpicker({name = "Glow", color = themes.preset.glow, callback = function(color, alpha)
                    library:update_theme("glow", color)
                end})
                :label({name = "UI Bind"})
                :keybind({callback = function(bool)
                    library.frame.Enabled = bool
                end})
                :toggle({name = "Keybind List", flag = "keybind_list", callback = function(bool)
                    library.keybind_list_frame.Visible = bool
                end})
                
                
    -- 

    Aiming.open_tab() 

    task.spawn(function()
        while task.wait(1) do 
            watermark.change_text(os.date('primordial - Beta - %b %d %Y - %H:%M:%S'))
        end 
    end) 
-- 

-- functionality

local function getgun()
    local player = game.Players.LocalPlayer
    for _, tool in ipairs(player.Character:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("GunScript") then
            print("tool in hand i think".. tool.Name)
            return tool
        end
    end
    return nil
end


local function GetTargetDummy()
    local BotsFolder = Workspace:FindFirstChild("Bots")
    if BotsFolder then
        local Dummy = BotsFolder:FindFirstChild("Dummy")
        if Dummy and Dummy:FindFirstChild("HumanoidRootPart") then
            return Dummy
        end
    end
    return nil
end

local function ClosestPlr(Part)
    local Distance, Closest = math.huge, nil

    for I, Target in pairs(Players:GetPlayers()) do
        if Target ~= LocalPlr and Target.Character and Target.Character:FindFirstChild(Part) then
            local Position = Workspace.CurrentCamera:WorldToViewportPoint(Target.Character[Part].Position)
            local Magnitude = (Vector2.new(Position.X, Position.Y) - UserInputService:GetMouseLocation()).Magnitude

            if Magnitude < Distance then
                Closest = Target
                Distance = Magnitude
            end
        end
    end

    return Closest
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    local flags = library.flags
    if flags["silentaim_enabled"] and input.KeyCode == (flags["silentaim_bind"] or Enum.KeyCode.E) then
        local hitpart = flags["silentaim_hitpart"] or "Head"
        SilentAimTarget = ClosestPlr(hitpart)
        SilentAimLocked = SilentAimTarget ~= nil
    end
end)

local function playHitsound()
    if not library.flags["hitsound"] then return end
    local id = getgenv().hitsounds[library.flags["hitsoundid"] or "Rust"]
    if not id then return end
    local sound = Instance.new("Sound")
    sound.SoundId = id
    sound.Volume = 1
    sound.Parent = game:GetService("SoundService")
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 2)
end

local HitEffectModule = {
    Locals = {
        HitEffect = {
            Type = {}
        }
    }
}

function HitEffectModule:UpdateColors(newColor)
    local attachment = self.Locals.HitEffect.Type["Skibidi RedRizz"]
    if not attachment then return end
    
    -- Update color for all particle emitters
    for _, particleEmitter in ipairs(attachment:GetChildren()) do
        if particleEmitter:IsA("ParticleEmitter") then
            particleEmitter.Color = ColorSequence.new(newColor)
        end
    end
end

local Attachment = Instance.new("Attachment")
HitEffectModule.Locals.HitEffect.Type["Skibidi RedRizz"] = Attachment

local MainColor = colorsets.targetauracolor

local HealingWave1 = Instance.new("ParticleEmitter")
HealingWave1.Name = "Healing Wave 1"
HealingWave1.Lifetime = NumberRange.new(1.5, 1.5)
HealingWave1.SpreadAngle = Vector2.new(10, -10)
HealingWave1.LockedToPart = true
HealingWave1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1702454, 0.7, 0.014881), NumberSequenceKeypoint.new(0.2254601, 0.03125, 0.03125), NumberSequenceKeypoint.new(0.2852761, 0), NumberSequenceKeypoint.new(0.702454, 0), NumberSequenceKeypoint.new(0.8374233, 0.9125, 0.0601461), NumberSequenceKeypoint.new(1, 1)})
HealingWave1.LightEmission = 0.4
HealingWave1.Color = ColorSequence.new(colorsets.targetauracolor)
HealingWave1.VelocitySpread = 10
HealingWave1.Speed = NumberRange.new(3, 6)
HealingWave1.Brightness = 10
HealingWave1.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3.0624998, 1.8805969), NumberSequenceKeypoint.new(0.6420546, 1.9999999, 1.7619393), NumberSequenceKeypoint.new(1, 0.7499999, 0.7499999)})
HealingWave1.Rate = 20
HealingWave1.Texture = "rbxassetid://8047533775"
HealingWave1.RotSpeed = NumberRange.new(200, 400)
HealingWave1.Rotation = NumberRange.new(-180, 180)
HealingWave1.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
HealingWave1.Parent = Attachment

local HealingWave2 = Instance.new("ParticleEmitter")
HealingWave2.Name = "Healing Wave 2"
HealingWave2.Lifetime = NumberRange.new(1.5, 1.5)
HealingWave2.SpreadAngle = Vector2.new(10, -10)
HealingWave2.LockedToPart = true
HealingWave2.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.2254601, 0.03125, 0.03125), NumberSequenceKeypoint.new(0.6288344, 0.25625, 0.0593491), NumberSequenceKeypoint.new(0.8374233, 0.9125, 0.0601461), NumberSequenceKeypoint.new(1, 1)})
HealingWave2.LightEmission = 1
HealingWave2.Color = ColorSequence.new(colorsets.targetauracolor)
HealingWave2.VelocitySpread = 10
HealingWave2.Speed = NumberRange.new(3, 5)
HealingWave2.Brightness = 10
HealingWave2.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3.125), NumberSequenceKeypoint.new(0.4165329, 1.3749999, 1.3749999), NumberSequenceKeypoint.new(1, 0.9375, 0.9375)})
HealingWave2.Rate = 20
HealingWave2.Texture = "rbxassetid://8047796070"
HealingWave2.RotSpeed = NumberRange.new(100, 300)
HealingWave2.Rotation = NumberRange.new(-180, 180)
HealingWave2.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
HealingWave2.Parent = Attachment

local Sparks = Instance.new("ParticleEmitter")
Sparks.Name = "Sparks"
Sparks.Lifetime = NumberRange.new(0.5, 2)
Sparks.SpreadAngle = Vector2.new(180, -180)
Sparks.LightEmission = 1
Sparks.Color = ColorSequence.new(colorsets.targetauracolor)
Sparks.Drag = 3
Sparks.VelocitySpread = 180
Sparks.Speed = NumberRange.new(5, 15)
Sparks.Brightness = 10
Sparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.14687, 0.4374999, 0.1875001), NumberSequenceKeypoint.new(1, 0)})
Sparks.Acceleration = Vector3.new(0, 3, 0)
Sparks.ZOffset = -1
Sparks.Rate = 40
Sparks.Texture = "rbxassetid://8611887361"
Sparks.RotSpeed = NumberRange.new(-30, 30)
Sparks.Orientation = Enum.ParticleOrientation.VelocityParallel
Sparks.Parent = Attachment

local StarSparks = Instance.new("ParticleEmitter")
StarSparks.Name = "Star Sparks"
StarSparks.Lifetime = NumberRange.new(1.5, 1.5)
StarSparks.SpreadAngle = Vector2.new(180, -180)
StarSparks.LightEmission = 1
StarSparks.Color = ColorSequence.new(colorsets.targetauracolor)
StarSparks.Drag = 3
StarSparks.VelocitySpread = 180
StarSparks.Speed = NumberRange.new(5, 10)
StarSparks.Brightness = 10
StarSparks.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.1492777, 0.6874996, 0.6874996), NumberSequenceKeypoint.new(1, 0)})
StarSparks.Acceleration = Vector3.new(0, 3, 0)
StarSparks.ZOffset = 2
StarSparks.Texture = "rbxassetid://8611887703"
StarSparks.RotSpeed = NumberRange.new(-30, 30)
StarSparks.Rotation = NumberRange.new(-30, 30)
StarSparks.Parent = Attachment



local function HitEffect(Player, Type)
    local Character = Player.Character
    local RootPart  = Character and Character:FindFirstChild('HumanoidRootPart')
    local flags = library.flags

    if Character and RootPart then
        if Type == 'Clone' then
            Character.Archivable  = true

            local Clone = Character:Clone()
            Clone.Parent = EtherealParts
            Clone.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

            for _, v in pairs(Clone:GetDescendants()) do
                if v:IsA('BasePart') then
                    v.Material = Enum.Material.ForceField -- or Enum.Material.Neon
                    v.Color = flags["hitchamscolor"] or Color3.fromRGB(255, 0, 0)
                    v.CanCollide = false
                    v.Anchored = true
                    v.CanQuery = false
                    v.CanTouch = false
                end
                if v:IsA('Accessory') or v:IsA('Tool') then
                    v:Destroy()
                end
            end

            for _, v in pairs(Character:GetDescendants()) do
                if v:IsA('BasePart') then
                    local ClonePart = Clone:FindFirstChild(v.Name)
                    if ClonePart then
                        ClonePart.CFrame = v.CFrame
                    end
                end
            end

            Clone:PivotTo(Character.PrimaryPart.CFrame + Vector3.new(1.5, 0, 1.5))
            Character.Archivable = false
            game:GetService('Debris'):AddItem(Clone, 2)
        end
    end
end

getgenv().lastHealth = getgenv().lastHealth or {}

RunService.RenderStepped:Connect(function(dt)
    local flags = library.flags
    if flags and flags["HighlightTarget"] and flags["Flash"] then
        flashTime = flashTime + dt
        local speed = 0.35
        local sine = math.sin(flashTime * math.pi / speed)
        local t = (sine + 1) / 2
        t = t^2
        -- Lower min/max for more transparency and faster fade
        flashValue = 0.12 + t * (0.9 - 0.1)
    else
        flashTime = 0
        flashValue = 0.18
    end
end)

-- esp (AWFUL HOLY FUCK)

local function IsAlive(Player)
    return Player and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0
end

local function loadesp(Player)
    local flags = library.flags
    local PlayerESP = Instance.new("Folder", ESPHolder)
    PlayerESP.Name = Player.Name .. "ESP"

    local BoxHolder = Instance.new("ScreenGui", game:GetService("CoreGui"))
    BoxHolder.Name = "Box"
    BoxHolder.DisplayOrder = 2

    local TracerHolder = Instance.new("ScreenGui", game:GetService("CoreGui"))
    TracerHolder.Name = "Tracer"

    local HilightHolder = Instance.new("Folder", PlayerESP)
    HilightHolder.Name = "Hilight"

    local LeftOutline = Instance.new("Frame", BoxHolder)
    local RightOutline = Instance.new("Frame", BoxHolder)
    local TopOutline = Instance.new("Frame", BoxHolder)
    local BottomOutline = Instance.new("Frame", BoxHolder)
    for _, f in ipairs({LeftOutline, RightOutline, TopOutline, BottomOutline}) do
        f.BackgroundColor3 = colorsets.boxoutlinecolor or Color3.new(0, 0, 0)
        f.Visible = false
        f.BorderSizePixel = 1
    end

    local Left = Instance.new("Frame", BoxHolder)
    local Right = Instance.new("Frame", BoxHolder)
    local Top = Instance.new("Frame", BoxHolder)
    local Bottom = Instance.new("Frame", BoxHolder)
    for _, f in ipairs({Left, Right, Top, Bottom}) do
        f.BackgroundColor3 = colorsets.boxcolor or Color3.new(1, 1, 1)
        f.Visible = false
        f.BorderSizePixel = 0
    end

    local Name = Instance.new("TextLabel", BoxHolder)
    Name.BackgroundTransparency = 1
    Name.Text = Player.Name
    Name.Visible = false
    Name.AnchorPoint = Vector2.new(0.5, 0.5)
    Name.TextSize = 12
    Name.Font = Enum.Font.Gotham
    Name.TextColor3 = Color3.fromRGB(255,255,255)
    Name.TextStrokeTransparency = 0

    local Distance = Instance.new("TextLabel", BoxHolder)
    Distance.BackgroundTransparency = 1
    Distance.Visible = false
    Distance.AnchorPoint = Vector2.new(0.5, 0.5)
    Distance.TextSize = 12
    Distance.Font = Enum.Font.Gotham
    Distance.TextColor3 = Color3.fromRGB(255,255,255)
    Distance.TextStrokeTransparency = 0

    local HealthBackground = Instance.new("Frame", BoxHolder)
    HealthBackground.Visible = false
    HealthBackground.BorderSizePixel = 1
    HealthBackground.BorderColor3 = colorsets.boxoutlinecolor or Color3.new(0, 0, 0)

    local HealthBar = Instance.new("Frame", BoxHolder)
    HealthBar.Visible = false
    HealthBar.BorderSizePixel = 0
    HealthBar.BackgroundColor3 = Color3.fromRGB(0,255,0)

    local Health = Instance.new("TextLabel", BoxHolder)
    Health.BackgroundTransparency = 1
    Health.Visible = false
    Health.AnchorPoint = Vector2.new(0.5, 0.5)
    Health.TextSize = 12
    Health.Font = Enum.Font.Gotham
    Health.TextColor3 = Color3.fromRGB(255,255,255)
    Health.TextStrokeTransparency = 0


    local Hilight = Instance.new("Highlight", HilightHolder)
    Hilight.Enabled = false

    RunService.RenderStepped:Connect(function()
        if not IsAlive(Player) then
            for _, f in ipairs({Left, Right, Top, Bottom, LeftOutline, RightOutline, TopOutline, BottomOutline}) do f.Visible = false end
            Name.Visible = false
            Distance.Visible = false
            HealthBackground.Visible = false
            HealthBar.Visible = false
            Health.Visible = false
            Hilight.Enabled = false
            Hilight.Adornee = nil
            return
        end

        local screen, onScreen = Camera:WorldToScreenPoint(Player.Character.HumanoidRootPart.Position)
        local frustumHeight = math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2 * screen.Z
        local size = Camera.ViewportSize.Y / frustumHeight * Vector2.new(3,6)
        local position = Vector2.new(screen.X, screen.Y) - (size / 2 - Vector2.new(0, size.Y) / 20)
        local dist = (Camera.CFrame.Position - Player.Character.HumanoidRootPart.Position).Magnitude

        if onScreen and flags["ESPEnabled"] and dist < flags["ESPMaxDist"] then
            
            if flags["BoxESP"] then
                LeftOutline.Visible = flags["BoxESP"] and flags["BoxOutline"]
                RightOutline.Visible = flags["BoxESP"] and flags["BoxOutline"]
                TopOutline.Visible = flags["BoxESP"] and flags["BoxOutline"]
                BottomOutline.Visible = flags["BoxESP"] and flags["BoxOutline"]


                Left.Visible = flags["BoxESP"]
                Right.Visible = flags["BoxESP"]
                Top.Visible = flags["BoxESP"]
                Bottom.Visible = flags["BoxESP"]


                Left.Position = UDim2.fromOffset(position.X, position.Y)
                Right.Position = UDim2.fromOffset(position.X, position.Y + size.Y - 1)
                Top.Position = UDim2.fromOffset(position.X, position.Y)
                Bottom.Position = UDim2.fromOffset(position.X + size.X - 1, position.Y)

                Left.Size = UDim2.fromOffset(size.X, 1)
                Right.Size = UDim2.fromOffset(size.X, 1)
                Top.Size = UDim2.fromOffset(1, size.Y)
                Bottom.Size = UDim2.fromOffset(1, size.Y)

                LeftOutline.Position = Left.Position
                RightOutline.Position = Right.Position
                TopOutline.Position = Top.Position
                BottomOutline.Position = Bottom.Position

                LeftOutline.Size = Left.Size
                RightOutline.Size = Right.Size
                TopOutline.Size = Top.Size
                BottomOutline.Size = Bottom.Size

                Left.BackgroundColor3 = colorsets.boxcolor or Color3.new(1, 1, 1)
                Right.BackgroundColor3 = colorsets.boxcolor or Color3.new(1, 1, 1)
                Top.BackgroundColor3 = colorsets.boxcolor or Color3.new(1, 1, 1)
                Bottom.BackgroundColor3 = colorsets.boxcolor or Color3.new(1, 1, 1)

                LeftOutline.BackgroundColor3 = colorsets.boxoutlinecolor or Color3.new(0, 0, 0)
                RightOutline.BackgroundColor3 = colorsets.boxoutlinecolor or Color3.new(0, 0, 0)
                TopOutline.BackgroundColor3 = colorsets.boxoutlinecolor or Color3.new(0, 0, 0)
                BottomOutline.BackgroundColor3 = colorsets.boxoutlinecolor or Color3.new(0, 0, 0)
            else
                for _, f in ipairs({Left, Right, Top, Bottom, LeftOutline, RightOutline, TopOutline, BottomOutline}) do f.Visible = false end
            end

            if flags["BoxHealthBar"] then
                local humanoid = Player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    local health = humanoid.Health
                    local maxHealth = humanoid.MaxHealth
                    local healthScale = health / maxHealth
                    local healthSizeY = size.Y * healthScale

                    HealthBackground.Visible = true
                    HealthBar.Visible = true

                    HealthBackground.Size = UDim2.fromOffset(4, size.Y)
                    HealthBar.Size = UDim2.fromOffset(2, -healthSizeY)

                    HealthBackground.Position = UDim2.fromOffset(position.X - 8, position.Y)
                    HealthBar.Position = UDim2.fromOffset(position.X - 7, position.Y + size.Y)

                    HealthBackground.BackgroundColor3 = colorsets.boxoutlinecolor or Color3.new(0, 0, 0)
                    HealthBackground.BorderColor3 = colorsets.boxoutlinecolor or Color3.new(0, 0, 0)
                end
            else
                HealthBackground.Visible = false
                HealthBar.Visible = false
            end
            if flags["BoxHealth"] then
                local humanoid = Player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    local health = humanoid.Health
                    local healthScale = health / humanoid.MaxHealth
                    local healthSizeY = size.Y * healthScale

                    Health.Visible = true
                    Health.Position = UDim2.fromOffset(position.X - 25, position.Y + size.Y - healthSizeY)
                    Health.Text = tostring(math.floor(health))
                end
            else
                Health.Visible = false
            end
            if flags["BoxName"] or flags["ESPMaxDist"] then
                Name.Visible = flags["BoxName"]
                Distance.Visible = flags["BoxDistance"] and not flags["BoxName"]

                Name.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 14) / 2)
                Distance.Position = UDim2.fromOffset(screen.X, screen.Y - (size.Y + Name.TextBounds.Y + 14) / 2)

                Distance.Text = tostring(math.floor(dist))
                Name.Text = (flags["BoxName"] and flags["ESPMaxDist"] and Player.Name .. " [" .. math.floor(dist) .. "]" or Player.Name)
            else
                Name.Visible = false
                Distance.Visible = false
            end
            if flags["HighlightESP"] then
                Hilight.Enabled = true
                Hilight.Adornee = Player.Character
                Hilight.OutlineColor = colorsets.highlightoutlinecolor or Color3.fromRGB(50, 110, 170)
                Hilight.FillColor = colorsets.highlightfillcolor or Color3.fromRGB(50, 110, 170)
                Hilight.FillTransparency = 0.5 or flags["HighlightFillTrans"]
                Hilight.OutlineTransparency = 0.5 or flags["HighlightOutlineTrans"]
                Hilight.DepthMode = flags["HighlightAlwaysOnTop"] and "AlwaysOnTop" or "Occluded"
            else
                Hilight.Enabled = false
                Hilight.Adornee = nil
            end
        else
            for _, f in ipairs({Left, Right, Top, Bottom, LeftOutline, RightOutline, TopOutline, BottomOutline}) do f.Visible = false end
            Name.Visible = false
            Distance.Visible = false
            HealthBackground.Visible = false
            HealthBar.Visible = false
            Health.Visible = false
            Hilight.Enabled = false
            Hilight.Adornee = nil
        end
    end)
end

for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlr then
        loadesp(plr)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr ~= LocalPlr then
        loadesp(plr)
    end
end)

Players.PlayerRemoving:Connect(function(plr)
    local esp = ESPHolder:FindFirstChild(plr.Name.."ESP")
    if esp then esp:Destroy() end
end)




RunService.heartbeat:Connect(function()
    for _, func in pairs(framework) do
        if type(func) == "function" then
            func(framework)
        end
    end
end)

do -- framework
    function framework:aimbot()
        local flags = library.flags
        local userinputservice = game:GetService("UserInputService")

        local isenabled = flags["enabled"] or false
        local keybind = flags["aimbotbind"]
        local keypressed = false
        if keybind then
            if keybind.mode == "always" then
                keypressed = true
            elseif keybind.mode == "hold" and UserInputService:IsKeyDown(keybind.key) then
                keypressed = true
            elseif keybind.mode == "toggle" and keybind.active then
                keypressed = true
            end
        end

        if not self.aimbot_fov_circle then
            self.aimbot_fov_circle = Drawing.new("Circle")
            self.aimbot_fov_circle.Thickness = 1
            self.aimbot_fov_circle.NumSides = 100
            self.aimbot_fov_circle.Filled = false
        end
        local show_fov = flags["aimbot_showfov"]
        self.aimbot_fov_circle.Visible = show_fov and isenabled
        self.aimbot_fov_circle.Radius = flags["aimbot_fov"] or 100
        self.aimbot_fov_circle.Color = Color3.new(1,1,1) or flags["aimbot_fovcolor"]
        self.aimbot_fov_circle.Position = UserInputService:GetMouseLocation()

        self._aimbot_last_enabled = self._aimbot_last_enabled or false
        self._aimbot_sticky_target = self._aimbot_sticky_target or nil
        local sticky = flags["aimbot_sticky"]

        if not isenabled or not keypressed then
            self._aimbot_sticky_target = nil
            self._aimbot_last_enabled = false
            return
        end

        if not self._aimbot_last_enabled then
            self._aimbot_sticky_target = nil
        end
        self._aimbot_last_enabled = true

        local function closest_plr(part)
            local dist, closest = math.huge, nil
            local mousepos = UserInputService:GetMouseLocation()
            local fov_enabled = flags["aimbot_fovenabled"]
            local fov = flags["aimbot_fov"] or 100
            for _, target in pairs(Players:GetPlayers()) do
                if target ~= LocalPlr and target.Character and target.Character:FindFirstChild(part) then
                    local pos, onscreen = Camera:WorldToViewportPoint(target.Character[part].Position)
                    if onscreen then
                        local mag = (Vector2.new(pos.X, pos.Y) - mousepos).Magnitude
                        if (not fov_enabled or mag <= fov) and mag < dist then
                            closest = target
                            dist = mag
                        end
                    end
                end
            end
            return closest
        end

        local target = nil
        if sticky and self._aimbot_sticky_target then
            local t = self._aimbot_sticky_target
            if t and t.Character and t.Character:FindFirstChild(flags["hitpart"]) then
                local pos, onscreen = Camera:WorldToViewportPoint(t.Character[flags["hitpart"]].Position)
                if onscreen then
                    target = t.Character
                end
            end
        end
        if not target then
            if flags["target"] == "Player" then
                local closest = closest_plr(flags["hitpart"])
                if closest and sticky then
                    self._aimbot_sticky_target = closest
                end
                if closest and closest.Character then
                    target = closest.Character
                end
            else
                target = GetTargetDummy()
                if sticky then
                    self._aimbot_sticky_target = target
                end
            end
        end


        if not target then return end

        local targetpart = target[flags["hitpart"]]
        if not targetpart then return end

        local predictedposition = targetpart.Position
        if flags["prediction"] then
            local velocity = targetpart.AssemblyLinearVelocity
            predictedposition = targetpart.Position + Vector3.new(
                velocity.X * flags["predx"],
                velocity.Y * flags["predy"],
                velocity.Z * flags["predx"]
            )
        end

        local smoothness = flags["smooth"] or 1
        smoothness = 1 - smoothness

        if flags["method"] == "Mouse" then
            local position, onscreen = Camera:WorldToViewportPoint(predictedposition)
            if onscreen then
                local mousepos = userinputservice:GetMouseLocation()
                local targetpos = Vector2.new(position.X, position.Y)
                local mousedelta = (targetpos - mousepos) * smoothness
                mousemoverel(mousedelta.X, mousedelta.Y)
            end
        else
            local currentcframe = Camera.CFrame
            local targetcframe = CFrame.new(currentcframe.Position, predictedposition)
            local newcframe = currentcframe:Lerp(targetcframe, smoothness)
            Camera.CFrame = newcframe
        end
    end

    function framework:triggerbot()
        local flags = library.flags
        local enabled = flags["triggerbot_enabled"]
        local keybind = flags["triggerbot_bind"]
        local keypressed = false
        if keybind then
            if keybind.mode == "always" then
                keypressed = true
            elseif keybind.mode == "hold" and UserInputService:IsKeyDown(keybind.key) then
                keypressed = true
            elseif keybind.mode == "toggle" and keybind.active then
                keypressed = true
            end
        end

        if not self.triggerbot_fov_circle then
            self.triggerbot_fov_circle = Drawing.new("Circle")
            self.triggerbot_fov_circle.Thickness = 1
            self.triggerbot_fov_circle.NumSides = 100
            self.triggerbot_fov_circle.Filled = false
        end
        local show_fov = flags["triggerbot_showfov"]
        self.triggerbot_fov_circle.Visible = show_fov and enabled
        self.triggerbot_fov_circle.Radius = flags["triggerbot_fov"] or 100
        self.triggerbot_fov_circle.Color = flags["triggerbot_fovcolor"] or Color3.new(1,1,1)
        self.triggerbot_fov_circle.Position = UserInputService:GetMouseLocation()

        if not (enabled and key_active) then return end

        local function valid_target(plr)
            if not plr or plr == LocalPlr then return false end
            local char = plr.Character
            if not char or not char:FindFirstChild("Humanoid") or char.Humanoid.Health <= 0 then return false end
            if flags["triggerbot_teamcheck"] and plr.Team == LocalPlr.Team then return false end
            if flags["triggerbot_vischeck"] then
                local part = char:FindFirstChild(flags["triggerbot_part"])
                if part then
                    local ray = Ray.new(Camera.CFrame.Position, (part.Position - Camera.CFrame.Position).Unit * 1000)
                    local hit = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlr.Character, Camera})
                    if not hit or not hit:IsDescendantOf(char) then
                        return false
                    end
                end
            end
            return true
        end

		local function get_target()
			local closest, dist = nil, math.huge
			local target_type = flags["ttarget"]
			local part = flags["triggerbot_part"]
		
			if target_type == "Dummy" then
				local dummy = GetTargetDummy()
				if dummy and dummy:FindFirstChild(part) then
					local pos, onscreen = Camera:WorldToViewportPoint(dummy[part].Position)
					if onscreen then
						local mag = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
						if mag <= (flags["triggerbot_fov"] or 100) and mag < dist then
							closest, dist = {Character = dummy}, mag
						end
					end
				end
			else
				for _, plr in ipairs(Players:GetPlayers()) do
					if valid_target(plr) then
						local char = plr.Character
						local partObj = char and char:FindFirstChild(part)
						if partObj then
							local pos, onscreen = Camera:WorldToViewportPoint(partObj.Position)
							if onscreen then
								local mag = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
								if mag <= (flags["triggerbot_fov"] or 100) and mag < dist then
									closest, dist = plr, mag
								end
							end
						end
					end
				end
			end
			return closest
		end
		

        local tgt = get_target()
		if tgt and math.random(1, 100) <= (flags["triggerbot_hitchance"] or 100) then
			if flags["hitsound"] then playHitsound() end
			if flags["hitchams"] then HitEffect(tgt, "Clone") end
			task.wait(flags["triggerbot_delay"] or 0)
			mouse1press()
			task.wait(0.05)
			mouse1release()
		end
    end

    function framework:silentaim()
        local self = self or framework
        local flags = library.flags
        local enabled = flags["silentaim_enabled"]
        local keybind = flags["silentaim_bind"]
        local keypressed = false
        if keybind then
            if keybind.mode == "always" then
                keypressed = true
            elseif keybind.mode == "hold" and UserInputService:IsKeyDown(keybind.key) then
                keypressed = true
            elseif keybind.mode == "toggle" and keybind.active then
                keypressed = true
            end
        end

        if not self.silentaim_fov_circle then
            self.silentaim_fov_circle = Drawing.new("Circle")
            self.silentaim_fov_circle.Thickness = 1
            self.silentaim_fov_circle.NumSides = 100
            self.silentaim_fov_circle.Filled = false
        end
        local show_fov = flags["silentaim_showfov"]
        self.silentaim_fov_circle.Visible = show_fov and enabled
        self.silentaim_fov_circle.Radius = flags["silentaim_fov"] or 100
        self.silentaim_fov_circle.Color = Color3.new(1,1,1) or flags["silentaim_fovcolor"]
        self.silentaim_fov_circle.Position = UserInputService:GetMouseLocation()

        if not enabled or not key_active then
            SilentAimLocked = false
            SilentAimTarget = nil
        end

        local function is_visible(target, part)
            if not flags["silentaim_vischeck"] then
                return true
            end
            local char = target.Character
            if not char or not char:FindFirstChild(part) then return false end
            local hitpart = char:FindFirstChild(part)
            if hitpart then
                local ray = Ray.new(Camera.CFrame.Position, (hitpart.Position - Camera.CFrame.Position).Unit * 1000)
                local hit = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlr.Character, Camera})
                if not hit or not hit:IsDescendantOf(char) then
                    return false
                end
            end
            return true
        end

        local function closest_plr_in_fov(part)
            local dist, closest = math.huge, nil
            local mousepos = UserInputService:GetMouseLocation()
            local fov = flags["silentaim_fov"] or 100

            if flags["starget"] == "Dummy" then
                local dummy = GetTargetDummy()
                if dummy and dummy:FindFirstChild(part) then
                    local pos, onscreen = Camera:WorldToViewportPoint(dummy[part].Position)
                    if onscreen then
                        local mag = (Vector2.new(pos.X, pos.Y) - mousepos).Magnitude
                        if mag <= fov and mag < dist and is_visible({Character = dummy}, part) then
                            closest = {Character = dummy}
                            dist = mag
                        end
                    end
                end
            else
                for _, target in pairs(Players:GetPlayers()) do
                    if target ~= LocalPlr and target.Character and target.Character:FindFirstChild(part) then
                        local pos, onscreen = Camera:WorldToViewportPoint(target.Character[part].Position)
                        if onscreen then
                            local mag = (Vector2.new(pos.X, pos.Y) - mousepos).Magnitude
                            if mag <= fov and mag < dist and is_visible(target, part) then
                                closest = target
                                dist = mag
                            end
                        end
                    end
                end
            end
            return closest
        end

        if flags["view"] and SilentAimTarget and SilentAimTarget.Character then
            Camera.CameraSubject = SilentAimTarget.Character.Humanoid
        else
            Camera.CameraSubject = LocalPlayer.Character.Humanoid;
        end

        local autoswitch = flags["silentaim_autoswitch"]
        local hitpart = flags["silentaim_hitpart"] or "Head"

        if SilentAimLocked and (not SilentAimTarget or not SilentAimTarget.Character or not SilentAimTarget.Character:FindFirstChild(hitpart)) then
            SilentAimLocked = false
            SilentAimTarget = nil
        end

        if (not SilentAimLocked or autoswitch) then
            SilentAimTarget = closest_plr_in_fov(hitpart)
            SilentAimLocked = SilentAimTarget ~= nil
        end

        if flags["rapidfire"] then
            local player = LocalPlr
            local tool = nil
            if LocalPlr and LocalPlr.Character and LocalPlr.Character:FindFirstChildOfClass("Tool") then
                for _, item in pairs(player.Character:GetChildren()) do
                    if item:IsA("Tool") and item:FindFirstChild("GunScript") then
                        tool = item
                        break
                    end
                end
            end
            if not SilentAimTarget or not tool then return end
            rs.MainEvent:FireServer(
                "ShootGun", -- remote
                tool.Handle, -- gun
                LocalPlr.Character.HumanoidRootPart.Position, -- localplr pos
                SilentAimTarget.Character.HumanoidRootPart.Position, -- target pos
                SilentAimTarget.Character.Head, -- instance hit (force hit ?)
                Vector3.new(0, 0, -1) -- fuck you
            )
        end

        if not self._silentaim_hooked then
            self._silentaim_hooked = true
            local oldIndex
            oldIndex = hookmetamethod(game, "__index", function(obj, key, ...)
                if obj:IsA("Mouse") and key == "Hit" and SilentAimLocked and SilentAimTarget and SilentAimTarget.Character then
                    local hitpart = flags["silentaim_hitpart"] or "Head"
                    local prediction = flags["silentaim_prediction"] or 135
                    local char = SilentAimTarget.Character
                    if char:FindFirstChild(hitpart) then
                        local part = char[hitpart]
                        local velocity = part.Velocity or Vector3.new()
                        local predictionTime = math.clamp(prediction, 0, 1)
                        local predictedPosition = part.Position + (velocity * predictionTime)
                        return CFrame.new(predictedPosition)
                    end
                end
                return oldIndex(obj, key, ...)
            end)
        end
    end

    function framework:highlight_target()
        local flags = library.flags
        if not flags["HighlightTarget"] then
            if self._target_highlight then
                self._target_highlight.Enabled = false
                self._target_highlight.Adornee = nil
            end
            return
        end
    
        local target = nil
        if self._aimbot_sticky_target and self._aimbot_last_enabled then
            target = self._aimbot_sticky_target.Character
        elseif SilentAimTarget and SilentAimLocked then
            target = SilentAimTarget.Character
        end
    
        if not target then
            if self._target_highlight then
                self._target_highlight.Enabled = false
                self._target_highlight.Adornee = nil
            end
            return
        end
    
        if not self._target_highlight then
            self._target_highlight = Instance.new("Highlight")
            self._target_highlight.Parent = game:GetService("CoreGui")
            self._target_highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
    
        local fillTrans = flags["HighlightFillTrans"] or 0.5
        if flags["Flash"] then
            fillTrans = flashValue
        end
    
        self._target_highlight.Adornee = target
        self._target_highlight.Enabled = true
        self._target_highlight.FillColor = colorsets.highlighttargetcolor or Color3.fromRGB(255,0,0)
        self._target_highlight.OutlineColor = colorsets.highlighttargetoutlinecolor or Color3.fromRGB(0,0,0)
        self._target_highlight.FillTransparency = fillTrans
        self._target_highlight.OutlineTransparency = 0.5
    end


	function framework:cfspd()
		local flags = library.flags
		local enabled = flags["cfspd"] or false
        local keybind = flags["spdbind"]
        local keypressed = false
        if keybind then
            if keybind.mode == "always" then
                keypressed = true
            elseif keybind.mode == "hold" and UserInputService:IsKeyDown(keybind.key) then
                keypressed = true
            elseif keybind.mode == "toggle" and keybind.active then
                keypressed = true
            end
        end

		if not enabled or not keypressed then return end

		local speed = flags["speed"] or 3
		LocalPlr.Character.HumanoidRootPart.CFrame = LocalPlr.Character.HumanoidRootPart.CFrame + LocalPlr.Character.Humanoid.MoveDirection * speed
	end
    function framework:worldVisuals() 
        local flags = library.flags
        if not flags then return end
        if flags["Master Switch"] then
            if flags["Clock Time Enabled"] and Lighting.ClockTime ~= flags["Clock Time"] then 
                Lighting.ClockTime = flags["Clock Time"]
            end 
            if flags["Color Shift Bottom"] and Lighting.ColorShift_Bottom ~= flags["Color Shift Bottom Color"] then 
                Lighting.ColorShift_Bottom = flags["Color Shift Bottom Color"]
            end 

            if flags["Ambient"] and Lighting.Ambient ~= flags["Ambience Color"] then 
                Lighting.Ambient = flags["Ambience Color"]
            end 
            -- 
            if flags["Outdoor Ambience"] and Lighting.OutdoorAmbient ~= flags["Outdoor Ambience color"] then 
                Lighting.OutdoorAmbient = flags["Outdoor Ambience color"]
            end 
            -- 
            if flags["Brightness Enabled"] and Lighting.Brightness ~= flags["Brightness"] then 
                Lighting.Brightness = flags["Brightness"]
            end 
            -- 
            if flags["Color Shift Top"] and Lighting.ColorShift_Top ~= flags["Color Shift Top Color"]  then 
                Lighting.ColorShift_Top = flags["Color Shift Top Color"]
            end 
            -- 
            if flags["Fog"] and Lighting.FogColor ~= flags["Fog Color"] then 
                Lighting.FogColor = flags["Fog Color"]
            end 
        end 
    end 
    
    function framework:noslow()
        local flags = library.flags
        if flags["No Slow"] then 
            if LocalPlayer.Character.BodyEffects.Reload.Value then
                LocalPlayer.Character.BodyEffects.Reload.Value = false
            end
            --
            local Slowdowns = LocalPlayer.Character.BodyEffects.Movement:FindFirstChild('NoWalkSpeed') or LocalPlayer.Character.BodyEffects.Movement:FindFirstChild('ReduceWalk')
            if Slowdowns then
                Slowdowns:Destroy()
            end
        end 
    end
    function framework:nojump()
        local flags = library.flags
        if flags["No Jump Cooldown"] and not nojump_hooked then
            nojump_hooked = true
            local IsA = game.IsA
            nojump_oldhook = hookmetamethod(game, "__newindex", function(self, Index, Value)
                if not checkcaller() and IsA(self, "Humanoid") and Index == "JumpPower" then 
                    return
                end
                return nojump_oldhook(self, Index, Value)
            end)
        end
    end
    function framework:advertise()
        local flags = library.flags
        if not flags["ad"] then return end
    
        local LocalPlayer = game.Players.LocalPlayer
    
        local function setname(player)
            if player == LocalPlayer then return end
            local function tryset()
                local character = player.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid and humanoid.DisplayName ~= "vanity.club" then
                        pcall(function()
                            humanoid.DisplayName = "vanity.club"
                        end)
                    end
                end
            end
            tryset()
            player.CharacterAdded:Connect(function(char)
                char.ChildAdded:Connect(function(child)
                    if child:IsA("Humanoid") then
                        tryset()
                    end
                end)
                tryset()
            end)
        end
    
        if not self._advertise_connected then
            self._advertise_connected = true
            for _, player in ipairs(game.Players:GetPlayers()) do
                setname(player)
            end
            game.Players.PlayerAdded:Connect(setname)
        end
    end
    function framework:targetaura()
        HitEffectModule:UpdateColors(colorsets.targetauracolor)
        if flags["targetaura"] then
            if SilentAimTarget and SilentAimTarget.Character then
                Attachment.Parent = SilentAimTarget.Character.LowerTorso

                StarSparks.Enabled = true
                Sparks.Enabled = true
                HealingWave1.Enabled = true
                HealingWave2.Enabled = true
            else
                Attachment.Parent = nil

                StarSparks.Enabled = false
                Sparks.Enabled = false
                HealingWave1.Enabled = false
                HealingWave2.Enabled = false
            end
        end
    end
end














library:config_list_update()
