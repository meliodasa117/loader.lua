-- CONFIGURACOES INICIAIS
local ServiceID = "ae49d069-3597-44ef-9e4e-26e87db30638" 
local SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/main/SheldonHub%20aimbot.lua"

-- FUNCAO PARA CARREGAR BIBLIOTECA COM REDIRECIONAMENTO (EVITA DNS ERROR)
local function SafeLoad()
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://api-v2.pandadevelopment.net/v2/lib/source.lua"))()
    end)
    if not success then
        -- Tenta um link alternativo ou avisa o usuario
        return nil
    end
    return result
end

local PandaAuth = SafeLoad()

-- INTERFACE GRAFICA (GUI)
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local f = Instance.new("Frame", sg)
f.Size = UDim2.new(0, 300, 0, 200)
f.Position = UDim2.new(0.5, -150, 0.5, -100)
f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
f.BorderSizePixel = 0

local title = Instance.new("TextLabel", f)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "SHELDON HUB - SISTEMA DE KEY"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

local label = Instance.new("TextBox", f)
label.Size = UDim2.new(0, 260, 0, 40)
label.Position = UDim2.new(0, 20, 0, 50)
label.Text = "Carregando Link..."
label.TextScaled = true
label.ReadOnly = true
label.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
label.TextColor3 = Color3.new(0.8, 0.8, 0.8)

local b2 = Instance.new("TextButton", f)
b2.Size = UDim2.new(0, 260, 0, 35)
b2.Position = UDim2.new(0, 20, 0, 100)
b2.Text = "COPIAR LINK DA KEY"
b2.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
b2.TextColor3 = Color3.new(1, 1, 1)

local t = Instance.new("TextBox", f)
t.Size = UDim2.new(0, 170, 0, 35)
t.Position = UDim2.new(0, 20, 0, 145)
t.PlaceholderText = "Cole a Key..."
t.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
t.TextColor3 = Color3.new(1, 1, 1)

local b1 = Instance.new("TextButton", f)
b1.Size = UDim2.new(0, 80, 0, 35)
b1.Position = UDim2.new(0, 200, 0, 145)
b1.Text = "ENTRAR"
b1.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
b1.TextColor3 = Color3.new(1, 1, 1)

-- LOGICA DE FUNCIONAMENTO
if PandaAuth then
    task.spawn(function()
        local keyLink = PandaAuth:GetLink(ServiceID)
        label.Text = keyLink
    end)
else
    label.Text = "ERRO DE CONEXAO (DNS)"
end

b2.MouseButton1Click:Connect(function()
    setclipboard(label.Text)
    b2.Text = "COPIADO COM SUCESSO!"
    task.wait(2)
    b2.Text = "COPIAR LINK DA KEY"
end)

b1.MouseButton1Click:Connect(function()
    if PandaAuth and PandaAuth:ValidateKey(ServiceID, t.Text:gsub("%s+", "")) then
        sg:Destroy()
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        t.Text = ""
        t.PlaceholderText = "KEY INVALIDA!"
    end
end)
