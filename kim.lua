--made in 2019, thx jude :)
--BAD BAD BAD
--i found this on jude bakup srvr so just its not med by me
--the gui button is not med by me also i only did some change :)

local lighting = game:GetService("Lighting")

--so like this play song from url but i recreate the url bcuz jude acc was deleted
local url = "https://raw.githubusercontent.com/UrexampleGD/Final/main/818027.mp3"
local file = "final.mp3"

if not isfile(file) then
    writefile(file, game:HttpGet(url))
end

local function stopsounds()
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("Sound") then
            obj:Stop()
            obj.Playing = false
        end
    end
end

local function play()
    stopsounds()
    local sound = Instance.new("Sound", workspace)
    sound.SoundId = getsynasset and getsynasset(file) or getcustomasset(file)
    sound.Volume = 10
    sound:Play()
    return sound
end

local meshes = false

local function startmeshes()
    if meshes then return end
    meshes = true

    task.spawn(function()
        local meshid = "rbxassetid://18730983304"
        local textureid = "rbxassetid://18730984922"

        while meshes do
            for i = 1, math.random(2,4) do
                local part = Instance.new("Part")
                part.Size = Vector3.new(150,150,150)
                part.Position = Vector3.new(
                    math.random(-3000,3000),
                    2500,
                    math.random(-3000,3000)
                )
                part.Anchored = false
                part.CanCollide = false
                part.Material = Enum.Material.Plastic
                part.Velocity = Vector3.new(
                    math.random(-50,50),
                    -100,
                    math.random(-50,50)
                )

                local mesh = Instance.new("SpecialMesh", part)
                mesh.MeshId = meshid
                mesh.TextureId = textureid
                mesh.Scale = Vector3.new(150,150,150)

                part.Parent = workspace

                task.spawn(function()
                    while part.Parent do
                        task.wait(0.5)
                        if part.Position.Y < -500 then
                            part:Destroy()
                            break
                        end
                    end
                end)
            end
            task.wait(0.3)
        end
    end)
end

local function stopmeshes()
    meshes = false
end

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,200,0,140)
frame.Position = UDim2.new(0.5,-100,0.5,-70)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BackgroundTransparency = 0.2
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0,0,0)
stroke.Transparency = 0.5

local function button(text, y)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1,-20,0.4,0)
    b.Position = UDim2.new(0,10,y,5)
    b.Text = text
    b.TextScaled = true
    b.Font = Enum.Font.GothamBold
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.BackgroundColor3 = Color3.fromRGB(200,50,50)
    b.BorderSizePixel = 0

    Instance.new("UICorner", b).CornerRadius = UDim.new(0,8)

    local s = Instance.new("UIStroke", b)
    s.Thickness = 2
    s.Color = Color3.fromRGB(255,150,150)
    s.Transparency = 0.3

    b.MouseEnter:Connect(function()
        b.BackgroundColor3 = Color3.fromRGB(255,80,80)
        s.Color = Color3.fromRGB(255,200,200)
    end)

    b.MouseLeave:Connect(function()
        b.BackgroundColor3 = Color3.fromRGB(200,50,50)
        s.Color = Color3.fromRGB(255,150,150)
    end)

    return b
end

local b1 = button("normal", 0)
local b2 = button("fog", 0.5)

local function hide()
    frame.Visible = false
end

local loopmsg = false

local function startmsg()
    if loopmsg then return end
    loopmsg = true

    task.spawn(function()
        while true do
            local msg = Instance.new("Message")
            msg.Text = "It's just 8 times of hell :) click."
            msg.Parent = workspace
            task.wait(1.5)
            msg:Destroy()
            task.wait(0.8)
        end
    end)
end

local function normal()
    play()
    while true do
        task.wait(17)

        startmeshes()

        local hint = Instance.new("Hint")
        hint.Text = (math.random(1,2)==1) and "Final Dance?" or "LOVE! GIVEUP!"
        hint.Parent = workspace

        startmsg()

        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                local d = Instance.new("Decal", v)
                d.Texture = "rbxassetid://132404642565085"
            end
        end

        local sky = Instance.new("Sky", lighting)
        for _, i in pairs({"Bk","Dn","Ft","Lf","Rt","Up"}) do
            sky["Skybox"..i] = "rbxassetid://132404642565085"
        end

        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                local p = Instance.new("ParticleEmitter", v)
                p.Texture = "rbxassetid://132404642565085"
                p.Rate = 50
            end
        end

        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "ITS THE FINAL DESTINATION BABEY!!",
            Color = Color3.fromRGB(255,0,0),
            TextSize = 40
        })

        task.wait(20)
    end
end

--10% chance only (1 in 10?)
local function scarey()
    if math.random(1,10) == 1 then
        local gui2 = Instance.new("ScreenGui", game.CoreGui)
        local img = Instance.new("ImageLabel", gui2)
        img.Size = UDim2.new(1,0,1,0)
        img.BackgroundColor3 = Color3.new(0,0,0)
        img.Image = "rbxassetid://132404642565085"

        for x = 1,40 do
            img.Position = UDim2.new(0,math.random(-20,20),0,math.random(-20,20))
            img.ImageTransparency = math.random()
            task.wait(0.03)
        end

        gui2:Destroy()
    end
end

local function fog()
    play()
    while true do
        task.wait(17)

        startmeshes()

        for _, v in pairs(lighting:GetChildren()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end

        local at = Instance.new("Atmosphere", lighting)
        at.Density = 1
        at.Offset = 0
        at.Color = Color3.fromRGB(255,0,255)
        at.Decay = Color3.fromRGB(0,0,0)
        at.Haze = 2

        lighting.FogStart = 0
        lighting.FogEnd = 8

        local sky = Instance.new("Sky", lighting)
        for _, i in pairs({"Bk","Dn","Ft","Lf","Rt","Up"}) do
            sky["Skybox"..i] = "rbxassetid://132404642565085"
        end

        task.spawn(function()
            while true do
                lighting.FogEnd = 8
                at.Color = Color3.fromRGB(255,0,255)
                task.wait(0.15)
                at.Color = Color3.fromRGB(0,0,0)
                task.wait(0.15)
            end
        end)

        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.Neon
                task.spawn(function()
                    while true do
                        v.Color = Color3.fromRGB(255,0,255)
                        task.wait(0.15)
                        v.Color = Color3.fromRGB(0,0,0)
                        task.wait(0.15)
                    end
                end)
            end
        end
        local gui2 = Instance.new("ScreenGui", game.CoreGui)
        local img = Instance.new("ImageLabel", gui2)
        img.Size = UDim2.new(1,0,1,0)
        img.BackgroundTransparency = 1
        img.Image = "rbxassetid://132404642565085"

        task.spawn(function()
            while true do
                img.ImageTransparency = 0.5 + math.random() * 0.5
                task.wait(0.05)
            end
        end)

        scarey()
        task.wait(20)
    end
end

b1.MouseButton1Click:Connect(function()
    hide()
    normal()
end)

b2.MouseButton1Click:Connect(function()
    hide()
    fog()
end)
