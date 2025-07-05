local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local function noti(title, content, duration)
    Fluent:Notify({
        Title = title,
        Content = content,
        Duration = duration
    })
end

local function load_comp_killer()
    print("loading main script...")
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FozzyHvH/testa/refs/heads/main/compkiller.lua"))()
    end)
end

local function load_primordial()
    print("loading main script...")
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FozzyHvH/testa/refs/heads/main/oldanduseless.lua"))()
    end)
end

local choice_file = "script_choice.txt"

local saved_choice = nil
if pcall(function() return readfile end) and isfile and isfile(choice_file) then
    saved_choice = readfile(choice_file)
end

local function save_choice(choice)
    if pcall(function() return writefile end) then
        writefile(choice_file, choice)
    end
end

if saved_choice and saved_choice ~= "" then
    if saved_choice == "Compkiller" then
        load_comp_killer()
        return
    elseif saved_choice == "Primordial" then
        load_primordial()
        return
    end
end

local remember_choice = false


local scriptwin = Fluent:CreateWindow({
    Title = "Select Script",
    Subtitle = nil,
    TabWidth = 0,
    Size = UDim2.fromOffset(320, 240),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local scriptstab = scriptwin:AddTab({ Title = "Scripts", Icon = "" })

scriptstab:AddButton({
    Title = "Compkiller",
    Callback = function()
        load_comp_killer()
        task.wait(1)
        scriptwin:Destroy()
    end
})
scriptstab:AddButton({
    Title = "Primordial",
    Callback = function()
        load_primordial()
        task.wait(1)
        scriptwin:Destroy()
    end
})
scriptstab:AddToggle({
    Title = "Remember Choice?",
    Default = false,
    Callback = function(v)
        remember_choice = v
    end
})

scriptwin:SelectTab(1)
