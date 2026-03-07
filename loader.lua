--[[ 
    SHELDON HUB + PANDA AUTH (SISTEMA FINAL)
    ID: ae49d069-3597-44ef-9e4e-26e87db30638
]]

-- CONFIGURAÇÃO PRINCIPAL
local ServiceID = "ae49d069-3597-44ef-9e4e-26e87db30638" 
local SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/refs/heads/main/SheldonHub%20aimbot.lua"

-- Carrega a biblioteca do Panda
local PandaAuth = loadstring(game:HttpGet("https://api-v2.pandadevelopment.net/v2/lib/source.lua"))()

-- INTERFACE GRÁFICA (GUI)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local VerifyBtn = Instance.new("TextButton")
local GetKeyBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Configuração da Janela
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.DisplayOrder = 999

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.Size = UDim2.new(0, 260, 0, 170)
Frame.Position = UDim2.new(0.5, -130, 0.5, -85)
Frame.Active = true
Frame.Draggable = true
UICorner:Clone().Parent = Frame

-- Campo de Texto
TextBox.Parent = Frame
TextBox.Size = UDim2.new(0, 220, 0, 35)
TextBox.Position = UDim2.new(0, 20, 0, 25)
TextBox.PlaceholderText = "Insira a Key aqui..."
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Text = ""
UICorner:Clone().Parent = TextBox

-- Botão Verificar
VerifyBtn.Parent = Frame
VerifyBtn.Text = "VERIFICAR AGORA"
VerifyBtn.Size = UDim2.new(0, 220, 0, 35)
VerifyBtn.Position = UDim2.new(0, 20, 0, 70)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.GothamBold
UICorner:Clone().Parent = VerifyBtn

-- Botão Get Key
GetKeyBtn.Parent = Frame
GetKeyBtn.Text = "OBTER KEY (24 HORAS)"
GetKeyBtn.Size = UDim2.new(0, 220, 0, 35)
GetKeyBtn.Position = UDim2.new(0, 20, 0, 115)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.Font = Enum.Font.GothamBold
UICorner:Clone().Parent = GetKeyBtn

-- LÓGICA DE FUNCIONAMENTO
GetKeyBtn.MouseButton1Click:Connect(function()
    -- Panda gera o link de acesso automaticamente
    local link = PandaAuth:GetLink(ServiceID)
    if setclipboard then
        setclipboard(link)
        print("Link do Panda copiado com sucesso!")
    else
        warn("Seu executor não suporta copiar automaticamente.")
    end
end)

VerifyBtn.MouseButton1Click:Connect(function()
    local key_digitada = TextBox.Text:gsub("%s+", "")
    
    -- Validação profissional via Panda API
    if PandaAuth:ValidateKey(ServiceID, key_digitada) then
        print("Acesso Permitido! Carregando Sheldon Hub...")
        ScreenGui:Destroy()
        -- Carrega o seu Aimbot do GitHub
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "KEY INVÁLIDA!"
        TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

print("Sheldon Hub: Sistema Panda Auth Ativado.")
