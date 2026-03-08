-- SHELDON HUB | VERSÃO FINAL DE LANÇAMENTO
local ServiceID = "ae49d069-3597-44ef-9e4e-26e87db30638" 
local SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/main/SheldonHub%20aimbot.lua"

-- Carregamento da API com Pcall para não crashar se o site do Panda cair
local success, PandaAuth = pcall(function()
    return loadstring(game:HttpGet("https://api-v2.pandadevelopment.net/v2/lib/source.lua"))()
end)

if not success or not PandaAuth then
    warn("ERRO AO CARREGAR PANDA AUTH: Verifique sua conexão.")
end

-- INTERFACE
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 320, 0, 190)
main.Position = UDim2.new(0.5, -160, 0.5, -95)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Instance.new("UICorner", main)
Instance.new("UIStroke", main).Color = Color3.fromRGB(80, 100, 255)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "SHELDON HUB | SISTEMA DE KEY"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1

local btnGet = Instance.new("TextButton", main)
btnGet.Size = UDim2.new(0, 280, 0, 45)
btnGet.Position = UDim2.new(0, 20, 0, 55)
btnGet.Text = "PEGAR KEY (LINKVERTISE)"
btnGet.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
btnGet.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnGet)

local input = Instance.new("TextBox", main)
input.Size = UDim2.new(0, 185, 0, 40)
input.Position = UDim2.new(0, 20, 0, 115)
input.PlaceholderText = "Cole sua Key aqui..."
input.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
input.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", input)

local btnVerify = Instance.new("TextButton", main)
btnVerify.Size = UDim2.new(0, 85, 0, 40)
btnVerify.Position = UDim2.new(0, 215, 0, 115)
btnVerify.Text = "ENTRAR"
btnVerify.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
btnVerify.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnVerify)

-- LÓGICA DO BOTÃO PEGAR KEY
btnGet.MouseButton1Click:Connect(function()
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
    local link = "https://pandadevelopment.net/getkey/sheldonhub?hwid=" .. hwid
    setclipboard(link)
    btnGet.Text = "LINK COPIADO!"
    task.wait(2)
    btnGet.Text = "PEGAR KEY (LINKVERTISE)"
end)

-- LÓGICA DE VERIFICAÇÃO (CORREÇÃO DE ERRO)
btnVerify.MouseButton1Click:Connect(function()
    -- Remove apenas espaços extras, mantendo a integridade da Key
    local cleanKey = input.Text:gsub("%s+", "")

    -- Se estiver vazio, nem tenta validar
    if cleanKey == "" then 
        input.PlaceholderText = "CAMPO VAZIO!" 
        return 
    end

    -- Tenta validar. Se a Key estiver certa e der erro, o problema é o ServiceID
    if PandaAuth:ValidateKey(ServiceID, cleanKey) then
        sg:Destroy()
        -- Carrega o seu script de Aimbot TweenService
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        input.Text = ""
        input.PlaceholderText = "KEY INVÁLIDA!"
        btnVerify.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        task.wait(1)
        btnVerify.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    end
end)
