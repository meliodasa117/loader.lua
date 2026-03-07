-- LINKS DO SEU GITHUB
local LINK_DA_KEY = "https://raw.githubusercontent.com/meliodasa117/key.text/refs/heads/main/key"
local LINK_DO_SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/refs/heads/main/SheldonHub%20aimbot.lua"
local LINK_LINKVERTISE = https://link-hub.net/4087696/JFueiutK4uI0

-- Busca a chave atualizada no seu arquivo do GitHub
local sucesso, CHAVE_ATUAL = pcall(function() return game:HttpGet(LINK_DA_KEY) end)

if not sucesso then
    warn("Erro ao carregar a Key. Verifique sua internet.")
    return
end

-- INTERFACE (GUI) - Otimizada para Celular e PC
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local VerifyBtn = Instance.new("TextButton")
local GetKeyBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Size = UDim2.new(0, 260, 0, 160)
Frame.Position = UDim2.new(0.5, -130, 0.5, -80)
Frame.Active = true
Frame.Draggable = true -- Permite arrastar no PC

-- Campo de Texto
TextBox.Parent = Frame
TextBox.Size = UDim2.new(0, 220, 0, 35)
TextBox.Position = UDim2.new(0, 20, 0, 20)
TextBox.PlaceholderText = "Digite a Key aqui..."
TextBox.Text = ""

-- Botão Verificar
VerifyBtn.Parent = Frame
VerifyBtn.Text = "VERIFICAR"
VerifyBtn.Size = UDim2.new(0, 220, 0, 35)
VerifyBtn.Position = UDim2.new(0, 20, 0, 65)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)

-- Botão Linkvertise
GetKeyBtn.Parent = Frame
GetKeyBtn.Text = "PEGAR KEY (LINKVERTISE)"
GetKeyBtn.Size = UDim2.new(0, 220, 0, 35)
GetKeyBtn.Position = UDim2.new(0, 20, 0, 110)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)

-- Lógica dos Botões
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(LINK_LINKVERTISE)
    print("Link copiado para a área de transferência!")
end)

VerifyBtn.MouseButton1Click:Connect(function()
    -- Compara e remove espaços/quebras de linha invisíveis
    local key_limpa = CHAVE_ATUAL:gsub("%s+", "")
    
    if TextBox.Text == key_limpa then
        print("Acesso Liberado! Carregando Sheldon Hub...")
        ScreenGui:Destroy()
        -- Executa o seu script principal que remove cliques de mouse para mobile
        loadstring(game:HttpGet(LINK_DO_SCRIPT_PRINCIPAL))()
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "KEY INCORRETA!"
    end
end)
