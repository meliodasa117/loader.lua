  SHELDON HUB - LOADER OFICIAL (VERSÃO CORRIGIDA)
    Sistema: Panda Auth + Aimbot
]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local KeyBox = Instance.new("TextBox")
local EntrarBtn = Instance.new("TextButton")
local GetKeyBtn = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

-- Configuração da GUI (Layout Simples e Funcional)
ScreenGui.Name = "SheldonHubKeySystem"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
MainFrame.Size = UDim2.new(0, 250, 0, 180)

Title.Parent = MainFrame
Title.Text = "SHELDON HUB | KEY SYSTEM"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1

KeyBox.Parent = MainFrame
KeyBox.PlaceholderText = "Cole sua key aqui..."
KeyBox.Position = UDim2.new(0.1, 0, 0.25, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0, 30)
KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Text = ""

EntrarBtn.Name = "Entrar"
EntrarBtn.Parent = MainFrame
EntrarBtn.Text = "ENTRAR"
EntrarBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
EntrarBtn.Size = UDim2.new(0.8, 0, 0, 30)
EntrarBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
EntrarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

GetKeyBtn.Name = "GetKey"
GetKeyBtn.Parent = MainFrame
GetKeyBtn.Text = "PEGAR KEY (LINKVERTISE)"
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.72, 0)
GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 30)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

Status.Parent = MainFrame
Status.Position = UDim2.new(0, 0, 0.9, 0)
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Text = "Aguardando..."
Status.TextColor3 = Color3.fromRGB(200, 200, 200)
Status.BackgroundTransparency = 1
Status.TextSize = 12

-- Lógica do Panda Auth
local PandaAuth = loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repository/Panda-Key-System/main/Panda_Key_System_API.lua"))()
local WorkSpaceName = "SheldonHub" -- Nome definido no seu painel Panda

-- Botão para Pegar Key
GetKeyBtn.MouseButton1Click:Connect(function()
    local link = PandaAuth:GetKey(WorkSpaceName)
    setclipboard(link)
    Status.Text = "Link copiado para a área de transferência!"
    Status.TextColor3 = Color3.fromRGB(0, 255, 255)
end)

-- Botão para Validar e Abrir Aimbot
EntrarBtn.MouseButton1Click:Connect(function()
    Status.Text = "Verificando..."
    Status.TextColor3 = Color3.fromRGB(255, 255, 0)

    local key = KeyBox.Text
    local is_valid = PandaAuth:ValidateKey(WorkSpaceName, key)

    if is_valid then
        Status.Text = "Sucesso! Carregando script..."
        Status.TextColor3 = Color3.fromRGB(0, 255, 0)

        -- Carregamento seguro do Aimbot
        local success, scriptContent = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/meliodasa117/Sheldon/refs/heads/main/SheldonHub%20aimbot.lua")
        end)

        if success and #scriptContent > 10 then
            ScreenGui:Destroy() -- Fecha o sistema de key
            local load = loadstring(scriptContent)
            task.spawn(load) -- Roda o script
        else
            Status.Text = "Erro ao baixar o Aimbot do GitHub!"
            Status.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    else
        Status.Text = "Key Inválida!"
        Status.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
--[[
    SHELDON HUB - LOADER OFICIAL (VERSÃO CORRIGIDA)
    Sistema: Panda Auth + Aimbot
]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local KeyBox = Instance.new("TextBox")
local EntrarBtn = Instance.new("TextButton")
local GetKeyBtn = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

-- Configuração da GUI (Layout Simples e Funcional)
ScreenGui.Name = "SheldonHubKeySystem"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
MainFrame.Size = UDim2.new(0, 250, 0, 180)

Title.Parent = MainFrame
Title.Text = "SHELDON HUB | KEY SYSTEM"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1

KeyBox.Parent = MainFrame
KeyBox.PlaceholderText = "Cole sua key aqui..."
KeyBox.Position = UDim2.new(0.1, 0, 0.25, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0, 30)
KeyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Text = ""

EntrarBtn.Name = "Entrar"
EntrarBtn.Parent = MainFrame
EntrarBtn.Text = "ENTRAR"
EntrarBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
EntrarBtn.Size = UDim2.new(0.8, 0, 0, 30)
EntrarBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
EntrarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

GetKeyBtn.Name = "GetKey"
GetKeyBtn.Parent = MainFrame
GetKeyBtn.Text = "PEGAR KEY (LINKVERTISE)"
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.72, 0)
GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 30)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

Status.Parent = MainFrame
Status.Position = UDim2.new(0, 0, 0.9, 0)
Status.Size = UDim2.new(1, 0, 0, 20)
Status.Text = "Aguardando..."
Status.TextColor3 = Color3.fromRGB(200, 200, 200)
Status.BackgroundTransparency = 1
Status.TextSize = 12

-- Lógica do Panda Auth
local PandaAuth = loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repository/Panda-Key-System/main/Panda_Key_System_API.lua"))()
local WorkSpaceName = "SheldonHub" -- Nome definido no seu painel Panda

-- Botão para Pegar Key
GetKeyBtn.MouseButton1Click:Connect(function()
    local link = PandaAuth:GetKey(WorkSpaceName)
    setclipboard(link)
    Status.Text = "Link copiado para a área de transferência!"
    Status.TextColor3 = Color3.fromRGB(0, 255, 255)
end)

-- Botão para Validar e Abrir Aimbot
EntrarBtn.MouseButton1Click:Connect(function()
    Status.Text = "Verificando..."
    Status.TextColor3 = Color3.fromRGB(255, 255, 0)

    local key = KeyBox.Text
    local is_valid = PandaAuth:ValidateKey(WorkSpaceName, key)

    if is_valid then
        Status.Text = "Sucesso! Carregando script..."
        Status.TextColor3 = Color3.fromRGB(0, 255, 0)

        -- Carregamento seguro do Aimbot
        local success, scriptContent = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/meliodasa117/Sheldon/refs/heads/main/SheldonHub%20aimbot.lua")
        end)

        if success and #scriptContent > 10 then
            ScreenGui:Destroy() -- Fecha o sistema de key
            local load = loadstring(scriptContent)
            task.spawn(load) -- Roda o script
        else
            Status.Text = "Erro ao baixar o Aimbot do GitHub!"
            Status.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    else
        Status.Text = "Key Inválida!"
        Status.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)
