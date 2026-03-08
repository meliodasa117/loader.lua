local ServiceID = "ae49d069-3597-44ef-9e4e-26e87db30638" 
local SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/main/SheldonHub%20aimbot.lua"

-- Função para garantir que a API carregue
local function CarregarAPI()
    local s, res = pcall(function()
        return loadstring(game:HttpGet("https://api-v2.pandadevelopment.net/v2/lib/source.lua"))()
    end)
    return s and res or nil
end

local PandaAuth = CarregarAPI()

-- Interface (Mantendo seu estilo aprovado)
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
title.Font = Enum.Font.GothamBold

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
t.PlaceholderText = "Cole a Key aqui..."
t.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
t.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", t)

local b_verify = Instance.new("TextButton", f)
b_verify.Size = UDim2.new(0, 80, 0, 40)
b_verify.Position = UDim2.new(0, 200, 0, 110)
b_verify.Text = "ENTRAR"
b_verify.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
b_verify.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", b_verify)

-- Logica do Botão Get Key
b_copy.MouseButton1Click:Connect(function()
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
    setclipboard("https://pandadevelopment.net/getkey/sheldonhub?hwid=" .. hwid)
    b_copy.Text = "LINK COPIADO!"
    task.wait(2)
    b_copy.Text = "PEGAR KEY (LINKVERTISE)"
end)

-- Verificação com Anti-Erro de API
b_verify.MouseButton1Click:Connect(function()
    -- Se falhou ao carregar no início, tenta carregar de novo agora
    if not PandaAuth then 
        PandaAuth = CarregarAPI() 
    end

    if not PandaAuth then
        t.Text = ""
        t.PlaceholderText = "ERRO DE CONEXÃO!"
        return
    end

    local cleanKey = t.Text:gsub("%s+", "")

    if PandaAuth:ValidateKey(ServiceID, cleanKey) then
        sg:Destroy()
        -- Carrega o seu Aimbot principal (TweenService)
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        t.Text = ""
        t.PlaceholderText = "KEY INVÁLIDA!"
        b_verify.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1)
        b_verify.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    end
end)
