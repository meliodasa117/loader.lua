--[[ 
    SHELDON HUB - LOADER OFICIAL
    Sistema de Key Dinâmica via GitHub
]]

-- CONFIGURAÇÃO DE LINKS (OS QUE VOCÊ ENVIOU)
local LINK_DA_KEY = "https://raw.githubusercontent.com/meliodasa117/keyy.text/refs/heads/main/key%20sheldon%20hub%20pro"
local LINK_DO_SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/refs/heads/main/SheldonHub%20aimbot.lua"
local LINK_LINKVERTISE = "https://link-hub.net/4087696/tMviw0oOY4RC"

-- Função para baixar a Key com segurança
local function obterKeyServidor()
    local sucesso, conteudo = pcall(function() 
        return game:HttpGet(LINK_DA_KEY) 
    end)
    if sucesso and conteudo then
        return conteudo:gsub("%s+", "") -- Remove espaços e quebras de linha
    end
    return nil
end

local CHAVE_SERVIDOR = obterKeyServidor()

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
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Size = UDim2.new(0, 260, 0, 160)
Frame.Position = UDim2.new(0.5, -130, 0.5, -80)
Frame.Active = true
Frame.Draggable = true

local FrameCorner = UICorner:Clone()
FrameCorner.Parent = Frame

-- Campo de Texto (Onde o usuário cola a key)
TextBox.Parent = Frame
TextBox.Size = UDim2.new(0, 220, 0, 35)
TextBox.Position = UDim2.new(0, 20, 0, 20)
TextBox.PlaceholderText = "Cole a Key aqui..."
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UICorner:Clone().Parent = TextBox

-- Botão Verificar
VerifyBtn.Parent = Frame
VerifyBtn.Text = "VERIFICAR"
VerifyBtn.Size = UDim2.new(0, 220, 0, 35)
VerifyBtn.Position = UDim2.new(0, 20, 0, 65)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 160, 0)
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UICorner:Clone().Parent = VerifyBtn

-- Botão Get Key
GetKeyBtn.Parent = Frame
GetKeyBtn.Text = "PEGAR KEY"
GetKeyBtn.Size = UDim2.new(0, 220, 0, 35)
GetKeyBtn.Position = UDim2.new(0, 20, 0, 110)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UICorner:Clone().Parent = GetKeyBtn

-- LÓGICA DOS BOTÕES
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(LINK_LINKVERTISE)
        print("Link copiado!")
    else
        warn("Executor não suporta setclipboard.")
    end
end)

VerifyBtn.MouseButton1Click:Connect(function()
    local key_digitada = TextBox.Text:gsub("%s+", "")
    
    if key_digitada == CHAVE_SERVIDOR then
        print("Acesso Liberado!")
        ScreenGui:Destroy()
        -- Carrega o Script de Aimbot Mobile/PC
        loadstring(game:HttpGet(LINK_DO_SCRIPT_PRINCIPAL))()
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "KEY INCORRETA!"
        TextBox.PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
