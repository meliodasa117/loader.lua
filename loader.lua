--[[
    SHELDON HUB - LOADER CORRIGIDO
    Sistema de Key: Panda Auth
]]

local PandaAuth = loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repository/Panda-Key-System/main/Panda_Key_System_API.lua"))()
local ScriptName = "SheldonHub"

-- Função Robusta de Requisição
local function GetRawContent(url)
    local success, content = pcall(function()
        local request = (syn and syn.request) or (http and http.request) or http_request or request
        if request then
            local response = request({
                Url = url,
                Method = "GET"
            })
            return response.Body
        else
            return game:HttpGet(url)
        end
    end)

    if success and content and #content > 0 then
        return content
    end
    return nil
end

-- Link do seu Aimbot
local AimbotURL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/refs/heads/main/SheldonHub%20aimbot.lua"

-- Interface Simples de Validação
local function Main()
    -- Se o Panda Auth validar a Key
    if PandaAuth:ValidateKey(ScriptName, _G.KeyInput) then
        print("Acesso Concedido! Carregando SheldonHub...")

        local scriptRaw = GetRawContent(AimbotURL)

        if scriptRaw then
            local load, err = loadstring(scriptRaw)
            if load then
                pcall(load)
            else
                warn("Erro de sintaxe no Aimbot: " .. tostring(err))
            end
        else
            warn("Erro: Não foi possível baixar o script principal. Verifique sua conexão.")
        end
    else
        warn("Key Inválida ou Expirada!")
    end
end

-- Exemplo de execução (Adapte para o seu botão 'ENTRAR')
-- No seu botão 'ENTRAR', você deve definir _G.KeyInput com o texto da TextBox e chamar Main()
Main()
