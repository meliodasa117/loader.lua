local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local f = Instance.new("Frame", sg)
f.Size = UDim2.new(0, 280, 0, 180)
f.Position = UDim2.new(0.5, -140, 0.5, -90)
f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
f.Active = true
f.Draggable = true

local t = Instance.new("TextBox", f)
t.Size = UDim2.new(0, 240, 0, 35)
t.Position = UDim2.new(0, 20, 0, 20)
t.PlaceholderText = "Cole a Key aqui..."
t.Text = ""

local b1 = Instance.new("TextButton", f)
b1.Size = UDim2.new(0, 240, 0, 35)
b1.Position = UDim2.new(0, 20, 0, 60)
b1.Text = "VERIFICAR"
b1.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

local b2 = Instance.new("TextButton", f)
b2.Size = UDim2.new(0, 240, 0, 35)
b2.Position = UDim2.new(0, 20, 0, 100)
b2.Text = "COPIAR LINK DA KEY"
b2.BackgroundColor3 = Color3.fromRGB(0, 100, 200)

-- NOVO: Mostra o link caso o "Copiar" falhe
local label = Instance.new("TextBox", f)
label.Size = UDim2.new(0, 240, 0, 25)
label.Position = UDim2.new(0, 20, 0, 140)
label.Text = "Link aparecera aqui"
label.TextScaled = true
label.ClearTextOnFocus = false
label.ReadOnly = true

b2.MouseButton1Click:Connect(function()
    local link = PandaAuth:GetLink(ServiceID)
    setclipboard(link)
    label.Text = link -- Mostra o link no visor
    b2.Text = "COPIADO!"
    task.wait(2)
    b2.Text = "COPIAR LINK DA KEY"
end)

b1.MouseButton1Click:Connect(function()
    if PandaAuth:ValidateKey(ServiceID, t.Text:gsub("%s+", "")) then
        sg:Destroy()
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        t.Text = "KEY INVALIDA"
    end
end)
﻿
Dyno 
APP
Dyno
#3861
 
The Discord bot to make server management and moderation easy. Follow your favorite streamers, run giveaways, and more!

https://dyno.gg/
