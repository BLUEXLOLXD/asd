local SendRequest = http_request, request, HttpPost, syn.request

local WebhookURL = "https://discord.com/api/webhooks/1230481596289777676/ec-lqkBsKnhekixuLSwzpi64lOcWtnAeS4GfxrGO6f6bZnadvBmojf54GO0Q2JHIztF5"

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ServerPlayers = #Players:GetPlayers()
local MaxPlayers = 20

local Executor = identifyexecutor and identifyexecutor() or "Not Identify"

local midhumanoid = game.Workspace.NPCSpawns.GyakusatsuSpawn.Gyakusatsu:FindFirstChild("Statue")
local flhumanoid = game.Workspace.NPCSpawns.GyakusatsuSpawn.FL:FindFirstChild("Humanoid")
local blhumanoid = game.Workspace.NPCSpawns.GyakusatsuSpawn.BL:FindFirstChild("Humanoid")
local frhumanoid = game.Workspace.NPCSpawns.GyakusatsuSpawn.FR:FindFirstChild("Humanoid")
local brhumanoid = game.Workspace.NPCSpawns.GyakusatsuSpawn.BR:FindFirstChild("Humanoid")
local maxValue = 80400

local midhealthPercentage = (midhumanoid and midhumanoid.Health or 0) / maxValue * 100
local flhealthPercentage = (flhumanoid and flhumanoid.Health or 0) / maxValue * 100
local blhealthPercentage = (blhumanoid and blhumanoid.Health or 0) / maxValue * 100
local frhealthPercentage = (frhumanoid and frhumanoid.Health or 0) / maxValue * 100
local brhealthPercentage = (brhumanoid and brhumanoid.Health or 0) / maxValue * 100

local midhealth, flhealth, blhealth, frhealth, brhealth = midhumanoid and midhumanoid.Health, flhumanoid and flhumanoid.Health, blhumanoid and blhumanoid.Health, frhumanoid and frhumanoid.Health, brhumanoid and brhumanoid.Health

local Data = {
   ["content"] = "@everyone",
   ["embeds"] = {
      {
         ["title"] = "**Gyakusatsu Found**",
         ["color"] = 255,
         ["footer"] = {
            ["text"] = os.date("%X").." "..os.date("%x"),
         },
         ["fields"] = {
            {                  
               ["name"] = "MID",
               ["value"] = string.format("%.2f%%", midhealthPercentage),
               ["inline"] = true
            },           
            {                  
               ["name"] = "FL",
               ["value"] = string.format("%.2f%%", flhealthPercentage),
               ["inline"] = true
            },
            {                  
               ["name"] = "BL",
               ["value"] = string.format("%.2f%%", blhealthPercentage),
               ["inline"] = true
            },
            {                  
               ["name"] = "FR",
               ["value"] = string.format("%.2f%%", frhealthPercentage),
               ["inline"] = true
            },
            {                  
               ["name"] = "BR",
               ["value"] = string.format("%.2f%%", brhealthPercentage),
               ["inline"] = true
            },           
            {                  
               ["name"] = "Username",
               ["value"] = "```"..LocalPlayer.Name.."```",
               ["inline"] = true
            },
            {
               ["name"] = "Players",
               ["value"] = "```"..tostring(ServerPlayers).."/"..tostring(MaxPlayers).."```",
               ["inline"] = true
            },
            {
               ["name"] = "Executor Used:",
               ["value"] = "```"..Executor.."```",
               ["inline"] = true 
            }
         }   
      }
   }
}

if #WebhookURL ~= 0 then
   local success, response = pcall(function()
      return SendRequest({
         Url = WebhookURL,
         Body = game:GetService("HttpService"):JSONEncode(Data),
         Method = "POST",
         Headers = {
            ["content-type"] = "application/json"
         }
      })
   end)
end
