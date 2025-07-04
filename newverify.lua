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

local scriptwin = Fluent:CreateWindow({
    Title = "Select Script",
    Subtitle = nil,
    TabWidth = 0,
    Size = UDim2.fromOffset(320, 240),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local scriptstab = scriptwin:AddTab({ Title = "scripts", Icon = "" })

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

scriptwin:SelectTab(1)