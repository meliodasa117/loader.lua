local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
local f = Instance.new("Frame", sg)
f.Size = UDim2.new(0, 250, 0, 150)
f.Position = UDim2.new(0.5, -125, 0.5, -75)
f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
f.Active = true
f.Draggable = true

local t = Instance.new("TextBox", f)
t.Size = UDim2.new(0, 210, 0, 35)
t.Position = UDim2.new(0, 20, 0, 20)
t.PlaceholderText = "Cole a Key aqui..."

local b1 = Instance.new("TextButton", f)
b1.Size = UDim2.new(0, 210, 0, 35)
b1.Position = UDim2.new(0, 20, 0, 60)
b1.Text = "VERIFICAR"
b1.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

local b2 = Instance.new("TextButton", f)
b2.Size = UDim2.new(0, 210, 0, 35)
b2.Position = UDim2.new(0, 20, 0, 100)
b2.Text = "PEGAR KEY"
b2.BackgroundColor3 = Color3.fromRGB(0, 100, 200)

b2.MouseButton1Click:Connect(function()
    setclipboard(PandaAuth:GetLink(ServiceID))
end)

b1.MouseButton1Click:Connect(function()
    if PandaAuth:ValidateKey(ServiceID, t.Text:gsub("%s+", "")) then
        sg:Destroy()
        loadstring(game:HttpGet(SCRIPT_PRINCIPAL))()
    else
        t.Text = "KEY INVALIDA"
    end
end)
