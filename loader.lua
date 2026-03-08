--[[
    SHELDON HUB - LOADER OFICIAL (VERSÃO FINAL CORRIGIDA)
    Sistema de Key: Panda Auth
    Alvo: SheldonHub Aimbot
]]

local function LoadScript()
    -- 1. Carregamento da API do Panda Auth
    local PandaAuthStatus, PandaAuth = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Panda-Repository/Panda-Key-System/main/Panda_Key_System_API.lua"))()
    end)

    if not PandaAuthStatus or not PandaAuth then
        warn("Erro crítico: Não foi possível carregar a API do Panda Auth.")
        return
    end

    -- 2. Configurações do seu Projeto
    local WorkSpaceName = "SheldonHub" 
    local AimbotURL = "https://raw.githubusercontent.com/meliodasa117/Sheldon/refs/heads/main/SheldonHub%20aimbot.lua"

    -- 3. Função Principal de Execução (Chame isso quando o usuário clicar em ENTRAR)
    local function ExecutarAimbot(userKey)
        -- Validação da Key no Panda
        local is_valid = PandaAuth:ValidateKey(WorkSpaceName, userKey)

        if is_valid then
            print("Key Validada! Baixando SheldonHub Aimbot...")

            -- 4. Download Seguro do Script (Evita o erro "Cannot find executable")
            local success, scriptContent = pcall(function()
                return game:HttpGet(AimbotURL)
            end)

            if success and scriptContent and #scriptContent > 50 then
                -- O loadstring só roda se o conteúdo baixado for válido
                local run, err = loadstring(scriptContent)
                if run then
                    task.spawn(run)
                    print("SheldonHub carregado com sucesso!")
                else
                    warn("Erro de sintaxe no script do Aimbot: " .. tostring(err))
                end
            else
                warn("Erro: O conteúdo do script veio vazio ou o GitHub bloqueou a conexão.")
            end
        else
            warn("Key Inválida fornecida pelo usuário.")
        end
    end

    -- Exemplo de uso: substitua 'SUA_KEY_AQUI' pela variável da sua TextBox
    -- ExecutarAimbot(_G.SuaVariavelDeKey)
end

-- Inicia o Loader
LoadScript()
