-- CONFIGURACOES
local ServiceID = "ae49d069-3597-44ef-9e4e-26e87db30638" 
local SCRIPT_PRINCIPAL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/main/SheldonHub%20aimbot.lua"

-- CARREGAMENTO SEGURO DA LIB
local success, PandaAuth = pcall(function()
    return loadstring(game:HttpGet("https://api-v2.pandadevelopment.net/v2/lib/source.lua"))()
end)

-- SE A LIB FALHAR, O USUARIO PRECISA SABER
if not success or not PandaAuth then
    warn("FALHA AO CONECTAR NA API PANDA AUTH")
end

-- [INTERFACE MANTIDA IGUAL A SUA]
local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local f = Instance.new("Frame", sg)
f.Size = UDim2.new(0, 300, 0, 180)
f.Position = UDim2.new(0.5, -150, 0.5, -90)
f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local t = Instance.new("TextBox", f)
t.Size = UDim2.new(0, 190, 0, 40)
t.Position = UDim2.new(0, 20, 0, 110)
t.PlaceholderText = "Cole a Key..."
t.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
t.TextColor3 = Color3.new(1, 1, 1)

local b_verify = Instance.new("TextButton", f)
b_verify.Size = UDim2.new(0, 80, 0, 40)
b_verify.Position = UDim2.new(0, 220, 0, 110)
b_verify.Text = "ENTRAR"
b_verify.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

-- LOGICA DE VALIDACAO CORRIGIDA
b_verify.MouseButton1Click:Connect(function()
    -- Limpa espaços, quebras de linha e caracteres invisíveis da Key
    local cleanKey = t.Text:gsub("%s+", ""):gsub("[%c%p%s]", "")

    print("Tentando validar Key: " .. cleanKey) -- Aparece no F9 para você conferir

    if PandaAuth:ValidateKey(ServiceID, cleanKey) then
        sg:Destroy()
        -- Executa o script principal
        local s, err = pcall(function()
            loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
        end)
        if not s then warn("Erro ao carregar script principal: " .. err) end
    else
        t.Text = ""
        t.PlaceholderText = "KEY INVALIDA OU EXPIRADA!"
        b_verify.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1)
        b_verify.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    end
end)
