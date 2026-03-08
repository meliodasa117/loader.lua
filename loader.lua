-- CONFIGURACOES DE DIVULGACAO
local ServiceID = "ae49d069-3597-44ef-9e4e-26e87db30638" 
local SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/main/SheldonHub%20aimbot.lua"

-- BIBLIOTECA PANDA AUTH (COM TRATAMENTO DE ERRO)
local success, PandaAuth = pcall(function()
    return loadstring(game:HttpGet("https://api-v2.pandadevelopment.net/v2/lib/source.lua"))()
end)

-- INTERFACE DO LOADER
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local f = Instance.new("Frame", sg)
f.Size = UDim2.new(0, 300, 0, 180)
f.Position = UDim2.new(0.5, -150, 0.5, -90)
f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", f)

local title = Instance.new("TextLabel", f)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "SHELDON HUB | SISTEMA DE KEY"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

local b_copy = Instance.new("TextButton", f)
b_copy.Size = UDim2.new(0, 260, 0, 40)
b_copy.Position = UDim2.new(0, 20, 0, 50)
b_copy.Text = "PEGAR KEY (LINKVERTISE)"
b_copy.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
b_copy.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", b_copy)

local t = Instance.new("TextBox", f)
t.Size = UDim2.new(0, 170, 0, 40)
t.Position = UDim2.new(0, 20, 0, 110)
t.PlaceholderText = "Cole a Key..."
t.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
t.TextColor3 = Color3.new(1, 1, 1)

local b_verify = Instance.new("TextButton", f)
b_verify.Size = UDim2.new(0, 80, 0, 40)
b_verify.Position = UDim2.new(0, 200, 0, 110)
b_verify.Text = "ENTRAR"
b_verify.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
Instance.new("UICorner", b_verify)

-- LOGICA DO BOTAO COPIAR (USANDO O HWID DA FOTO DO PAINEL)
b_copy.MouseButton1Click:Connect(function()
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
    local linkFinal = "https://pandadevelopment.net/getkey/sheldonhub?hwid=" .. hwid
    setclipboard(linkFinal)
    b_copy.Text = "LINK COPIADO!"
    task.wait(2)
    b_copy.Text = "PEGAR KEY (LINKVERTISE)"
end)

-- VERIFICACAO E CARREGAMENTO DO SEU AIMBOT
b_verify.MouseButton1Click:Connect(function()
    if success and PandaAuth:ValidateKey(ServiceID, t.Text:gsub("%s+", "")) then
        sg:Destroy()
        -- Carrega o código de Aimbot que você postou
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        t.Text = ""
        t.PlaceholderText = "KEY INVALIDA!"
    end
end)
