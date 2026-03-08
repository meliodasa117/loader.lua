-- SHELDON HUB | LOADER ESTÁVEL
local ServiceID = "ae49d069-3597-44ef-9e4e-26e87db30638" 
local SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/main/SheldonHub%20aimbot.lua"

print("Iniciando Sheldon Hub...")

-- Tenta carregar a biblioteca do Panda
local success, PandaAuth = pcall(function()
    return loadstring(game:HttpGet("https://api-v2.pandadevelopment.net/v2/lib/source.lua"))()
end)

if not success or not PandaAuth then
    warn("ERRO: Falha ao conectar com Panda Auth!")
end

-- INTERFACE
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 320, 0, 190)
main.Position = UDim2.new(0.5, -160, 0.5, -95)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", main)

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
btnGet.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
btnGet.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnGet)

local input = Instance.new("TextBox", main)
input.Size = UDim2.new(0, 185, 0, 40)
input.Position = UDim2.new(0, 20, 0, 115)
input.PlaceholderText = "Cole a Key aqui..."
input.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
input.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", input)

local btnVerify = Instance.new("TextButton", main)
btnVerify.Size = UDim2.new(0, 85, 0, 40)
btnVerify.Position = UDim2.new(0, 215, 0, 115)
btnVerify.Text = "ENTRAR"
btnVerify.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
btnVerify.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", btnVerify)

-- LOGICA BOTOES
btnGet.MouseButton1Click:Connect(function()
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
    setclipboard("https://pandadevelopment.net/getkey/sheldonhub?hwid=" .. hwid)
    btnGet.Text = "LINK COPIADO!"
    task.wait(2)
    btnGet.Text = "PEGAR KEY (LINKVERTISE)"
end)

btnVerify.MouseButton1Click:Connect(function()
    local cleanKey = input.Text:gsub("%s+", "")

    if PandaAuth:ValidateKey(ServiceID, cleanKey) then
        print("Key confirmada! Carregando Aimbot...")
        sg:Destroy()
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        input.Text = ""
        input.PlaceholderText = "KEY INVÁLIDA!"
        btnVerify.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1)
        btnVerify.BackgroundColor3 = Color3.fromRGB(0, 170, 80)
    end
end)
