local ServiceID = "ae49d069-3597-44ef-9e4e-26e87db30638" 
local SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/main/SheldonHub%20aimbot.lua"

local PandaAuth = loadstring(game:HttpGet("https://api-v2.pandadevelopment.net/v2/lib/source.lua"))()

local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local f = Instance.new("Frame", sg)
f.Size = UDim2.new(0, 280, 0, 200)
f.Position = UDim2.new(0.5, -140, 0.5, -100)
f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
f.Active = true
f.Draggable = true

local label = Instance.new("TextBox", f)
label.Size = UDim2.new(0, 240, 0, 60)
label.Position = UDim2.new(0, 20, 0, 20)
label.Text = "Carregando link..."
label.TextWrapped = true
label.ClearTextOnFocus = false
label.ReadOnly = true
label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
label.TextColor3 = Color3.new(1, 1, 1)

-- Tenta gerar o link imediatamente
task.spawn(function()
    local success, link = pcall(function() return PandaAuth:GetLink(ServiceID) end)
    if success then
        label.Text = link
    else
        label.Text = "Erro de Conexao. Clique no botao azul para tentar de novo."
    end
end)

local t = Instance.new("TextBox", f)
t.Size = UDim2.new(0, 240, 0, 35)
t.Position = UDim2.new(0, 20, 0, 90)
t.PlaceholderText = "Cole a Key aqui..."

local b1 = Instance.new("TextButton", f)
b1.Size = UDim2.new(0, 115, 0, 40)
b1.Position = UDim2.new(0, 20, 0, 140)
b1.Text = "VERIFICAR"
b1.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

local b2 = Instance.new("TextButton", f)
b2.Size = UDim2.new(0, 115, 0, 40)
b2.Position = UDim2.new(0, 145, 0, 140)
b2.Text = "COPIAR"
b2.BackgroundColor3 = Color3.fromRGB(0, 100, 200)

b2.MouseButton1Click:Connect(function()
    setclipboard(label.Text)
    b2.Text = "COPIADO!"
    task.wait(2)
    b2.Text = "COPIAR"
end)

b1.MouseButton1Click:Connect(function()
    if PandaAuth:ValidateKey(ServiceID, t.Text:gsub("%s+", "")) then
        sg:Destroy()
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        t.Text = "KEY INVALIDA"
    end
end)
