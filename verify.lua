if identifyexecutor() ~= "AWP" then
    game:GetService("Players").LocalPlayer:Kick()
    return
end


local local_plr = game.Players.LocalPlayer

local HttpService = game:GetService("HttpService")
local AnalyticsService = game:GetService("RbxAnalyticsService")

local msg = nil

local url = "https://discord.com/api/webhooks/1380227501229609012/c47Z1Y5O-RHiVhqz-Rwgb_bfPe6nZs1O0PHaG2QzG4-LLYHxcff6fp02fGpyGX5uGtXn"

local date = os.date("*t")

local month = date.month
local day = date.day
local year = date.year

local hour = (date.hour) % 24
local amorpm = hour < 12 and "AM" or "PM"

local time = string.format("%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, amorpm)
local dateandtime = day.."/"..month.."/"..year.."   "..time

local hwid = game:GetService("RbxAnalyticsService"):GetClientId()

local API_URL = "http://127.0.0.1:5000/api/validate"


local function get_system_hwid()
    return AnalyticsService:GetClientId()
end


local function send_http_post(url, data)
    local request = (syn and syn.request) or request
    if typeof(request) == "function" then
        local response = request({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = data
        })
        if response and response.Body then
            return true, response.Body
        elseif response and response.Success and response.ResponseBody then
            return true, response.ResponseBody
        end
        return false, "Exploit HTTP request failed"
    end
    return false, "No supported exploit HTTP request function found"
end


local function validate_key(key)
    local hwid = get_system_hwid()
    
    local executor = identifyexecutor()
    
    local request_data = {
        key = key,
        hwid = hwid,
        executor = executor
    }
    
    local json_data = HttpService:JSONEncode(request_data)
    
    local success, response = send_http_post(API_URL, json_data)
    
    if not success then
        return false, "Failed to connect to validation server: " .. tostring(response)
    end
    
    local decoded = HttpService:JSONDecode(response)
    
    if not decoded.valid then
        return false, "Invalid key"
    end
    
    if not decoded.hwid_match then
        return false, "HWID mismatch - key is bound to a different machine"
    end
    
    return true, "Key validated successfully"
end


local function main()
    local key = script_key
    if not key then
        error("No key found, wtf is going on")
    end
    
    local success, message = validate_key(key)
    if success then
        print("Authentication successful:", message)
        msg = message
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FozzyHvH/testa/refs/heads/main/oldanduseless.lua"))()
        end)
    else
        msg = message
        print("Authentication failed:", message)
        game.Players.LocalPlayer:Kick("This key is blacklisted or doesn't exist. Please contact @pharanoh if you believe this is a mistake")
    end
end

main()

function send_message_embed(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

local embed = {
    ["title"] = "Script executed",
    ["description"] = ""..msg,
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = "Username",
            ["value"] = local_plr.Name
        },
        {
            ["name"] = "HWID",
            ["value"] = hwid
        },
        {
            ["name"] = "Key Used",
            ["value"] = script_key
        },
        {
            ["name"] = "Executor",
            ["value"] = identifyexecutor()
        }
    },
    ["footer"] = {
        ["text"] = dateandtime
    }
}

send_message_embed(url, embed)
