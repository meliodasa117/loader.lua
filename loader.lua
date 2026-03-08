-- CONFIGURAÇÕES PRINCIPAIS
local ServiceID = "ae49d069-3597-44ef-9e4e-26e87db30638" 
local SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/main/SheldonHub%20aimbot.lua"

-- CARREGAMENTO DA BIBLIOTECA PANDA AUTH
local PandaAuth = loadstring(game:HttpGet("https://api-v2.pandadevelopment.net/v2/lib/source.lua"))()

-- CRIAÇÃO DA INTERFACE (SCREEN GUI)
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
sg.Name = "SheldonLoader"

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 320, 0, 190)
main.Position = UDim2.new(0.5, -160, 0.5, -95)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

-- TÍTULO
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "SHELDON HUB | SISTEMA DE KEY"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.BackgroundTransparency = 1

-- BOTÃO PARA PEGAR KEY
local btnGet = Instance.new("TextButton", main)
btnGet.Size = UDim2.new(0, 280, 0, 45)
btnGet.Position = UDim2.new(0, 20, 0, 55)
btnGet.Text = "PEGAR KEY (LINKVERTISE)"
btnGet.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
btnGet.TextColor3 = Color3.new(1, 1, 1)
btnGet.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnGet)

-- CAIXA DE TEXTO PARA A KEY
local input = Instance.new("TextBox", main)
input.Size = UDim2.new(0, 190, 0, 40)
input.Position = UDim2.new(0, 20, 0, 115)
input.PlaceholderText = "Cole a Key aqui..."
input.Text = ""
input.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
input.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", input)

-- BOTÃO PARA ENTRAR/VERIFICAR
local btnEnter = Instance.new("TextButton", main)
btnEnter.Size = UDim2.new(0, 80, 0, 40)
btnEnter.Position = UDim2.new(0, 220, 0, 115)
btnEnter.Text = "ENTRAR"
btnEnter.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
btnEnter.TextColor3 = Color3.new(1, 1, 1)
btnEnter.Font = Enum.Font.GothamBold
Instance.new("UICorner", btnEnter)

-- LOGICA DO BOTÃO "PEGAR KEY" (USANDO O HWID DO SEU PAINEL)
btnGet.MouseButton1Click:Connect(function()
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
    local link = "https://pandadevelopment.net/getkey/sheldonhub?hwid=" .. hwid
    setclipboard(link)
    btnGet.Text = "LINK COPIADO!"
    task.wait(2)
    btnGet.Text = "PEGAR KEY (LINKVERTISE)"
end)

-- LOGICA DO BOTÃO "ENTRAR" (VALIDAÇÃO E CARREGAMENTO)
btnEnter.MouseButton1Click:Connect(function()
    -- Limpa espaços e caracteres especiais para evitar erro de "Key Inválida"
    local cleanKey = input.Text:gsub("%s+", ""):gsub("[%c%p%s]", "")

    if PandaAuth:ValidateKey(ServiceID, cleanKey) then
        sg:Destroy()
        -- Carrega o seu Aimbot Universal com 6 abas
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        input.Text = ""
        input.PlaceholderText = "KEY INVÁLIDA!"
        btnEnter.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1)
        btnEnter.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
    end
end)
