-- mr robot Polsec max level I deobf luraph 15 leaked by xx alt

-- Xeno compatibility layer
-- Keeps the original Chilli behavior while preferring Xeno's documented APIs.
do
    local env = (typeof(getgenv) == "function" and getgenv()) or _G

    -- Xeno exposes request/readfile/writefile/isfile through its runtime.
    -- Mirror them into the shared environment only when the normal globals are absent.
    if type(env.request) ~= "function" and type(request) == "function" then
        env.request = request
    end

    if type(env.readfile) ~= "function" and type(readfile) == "function" then
        env.readfile = readfile
    end

    if type(env.writefile) ~= "function" and type(writefile) == "function" then
        env.writefile = writefile
    end

    if type(env.isfile) ~= "function" and type(isfile) == "function" then
        env.isfile = isfile
    end
end

local fn

fn = function(arg)
    local genv = typeof(getgenv) == "function" and getgenv() or _G

    if type(genv.ChilliDebugPrint) == "function" then
        pcall(genv.ChilliDebugPrint, arg)
    end
end

task.spawn(pcall, function()
    loadstring(
        game:HttpGet(
            "https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/DiscordLink"
        )
    )()
end)

local v

local function fn2()
    local response = nil

    local function fn2()
        if type(response) == "string" and #response > 0 then
            return response
        end
        response =
            game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli%20Library")
        return response
    end

    local function fn3()
        local chilliHubSaeCleanup = (typeof(getgenv) == "function" and getgenv() or _G).ChilliHubSaeCleanup

        if type(chilliHubSaeCleanup) == "function" then
            pcall(chilliHubSaeCleanup)
        end

        local tbl = { game:GetService("CoreGui") }

        if typeof(gethui) == "function" then
            local ok, result = pcall(gethui)
            ok = ok and typeof(result) == "Instance"

            if ok then
                table.insert(tbl, result)
            end
        end

        local tbl2 = {
            Settings = true,
            ChilliLeftCenter = true,
            ChilliLibrarySettings = true,
            ChilliLibraryLauncher = true,
        }
        local n = 0

        for _, v2 in ipairs(tbl) do
            for _, child in ipairs(v2:GetChildren()) do
                if
                    child:IsA("ScreenGui")
                    and (child:GetAttribute("ChilliLibraryOwned") == true or tbl2[child.Name])
                then
                    pcall(function()
                        child:Destroy()
                    end)

                    n = n + 1
                end
            end
        end

        if n > 0 then
            fn("cleared " .. n .. " leftover Chilli UI screens")
        end
    end

    local function fn4()
        local chunk, v2 = loadstring((fn2()))
        assert(chunk, v2)
        local v3 = chunk()
        assert(type(v3) == "function", "Chilli Library bootstrap is invalid.")
        local v4 = table.create(45)
        local n = 1

        for i = 1, 90, 2 do
            v4[n] = string.char(
                bit32.bxor(
                    tonumber(
                        string.sub(
                            "306908100841206d474f00185f26635b2101387507010810127d7d477a473b6f435a0916573165562900226c00",
                            i,
                            i + 1
                        ),
                        16
                    ),
                    string.byte("s9K!2vQ#", (n - 1) % 8 + 1)
                )
            )
            n = n + 1
        end

        return v3(table.concat(v4))
    end

    local str = "unknown"

    for i = 1, 6 do
        task.wait()
        pcall(fn3)
        local ok, result = pcall(fn4)
        ok = ok and type(result) == "table"
        if ok then
            return result
        end
        str = tostring(result)

        if type(str) == "string" and string.find(str, "HttpGet", 1, true) then
            response = nil
        end

        fn("library load attempt " .. i .. " failed: " .. str)
        task.wait(1 + i * 0.5)
    end

    error("Chilli Library failed to load: " .. str, 0)
end

v = fn2()
assert(
    type(v) == "table" and type(v.CreateWindow) == "function" and type(v.Finalize) == "function",
    "Chilli Library returned an invalid API."
)
v.ManualQuickDefaults = {
    PinnedFeatures = { "Player > Movement > Speed Boost", "Player > Movement > Boost Speed" },
    Keybinds = { ["Player > Movement > Speed Boost"] = "Q" },
    PinGroups = {},
    LeftCenterHidden = true,
}
local v2
v2 = v:CreateWindow({ Name = "Chilli Hub - Steal An Egg", DefaultTab = "Farm" })
local defaultTab
defaultTab = v2:GetDefaultTab()
local Players
Players = game:GetService("Players")
local RunService
RunService = game:GetService("RunService")
local ReplicatedStorage
ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui
CoreGui = game:GetService("CoreGui")
local UserInputService
UserInputService = game:GetService("UserInputService")
local CollectionService
CollectionService = game:GetService("CollectionService")
game:GetService("LocalizationService")
local ProximityPromptService
ProximityPromptService = game:GetService("ProximityPromptService")
local localPlayer
localPlayer = Players.LocalPlayer
local networking
networking = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Networking")
local fn3

fn3 = function(arg)
    local ok, result = pcall(function()
        return require(arg())
    end)

    if not ok then
        result = ok
    end

    local v3 = result or nil
    return v3
end

local tbl

tbl = {
    EggState = fn3(function()
        return ReplicatedStorage.Client.EggState
    end),
    AreaEggs = fn3(function()
        return ReplicatedStorage.Shared.Types.AreaEggs
    end),
    ToolGameplayGuard = fn3(function()
        return ReplicatedStorage.Client.ToolGameplayGuard
    end),
    Assets = fn3(function()
        return ReplicatedStorage.Data.Assets
    end),
    Guards = fn3(function()
        return ReplicatedStorage.Data.Guards
    end),
    EggRecords = fn3(function()
        return ReplicatedStorage.Shared.Util.EggRecords
    end),
    Mutations = fn3(function()
        return ReplicatedStorage.Shared.Modules.Mutations
    end),
    Save = fn3(function()
        return ReplicatedStorage.Shared.Save
    end),
    FuseKernel = fn3(function()
        return ReplicatedStorage.Shared.Util.FuseKernel
    end),
    AreaEggCycle = fn3(function()
        return ReplicatedStorage.Shared.Util.AreaEggCycle
    end),
    AreaEggResetWall = fn3(function()
        return ReplicatedStorage.Client.AreaEggResetWall
    end),
    AreaEggResetCycle = fn3(function()
        return ReplicatedStorage.Data.AreaEggResetCycle
    end),
    Gears = fn3(function()
        return ReplicatedStorage.Data.Gears
    end),
    Areas = fn3(function()
        return ReplicatedStorage.Data.Areas
    end),
    LimitedEgg = fn3(function()
        return ReplicatedStorage.Data.LimitedEgg
    end),
    BrainrotEgg = fn3(function()
        return ReplicatedStorage.Data.BrainrotEgg
    end),
    MonsterEgg = fn3(function()
        return ReplicatedStorage.Data.MonsterEgg
    end),
}

local v3

local function fn4()
    if typeof(gethui) == "function" then
        local ok, result = pcall(gethui)
        ok = ok and typeof(result) == "Instance"
        if ok then
            return result
        end
    end

    return CoreGui
end

v3 = fn4()
local fn5

do
    local v4 = Random.new()
    local str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    fn5 = function()
        local v5 = v4:NextInteger(12, 20)
        local v6 = table.create(v5)

        for i = 1, v5 do
            local v7 = v4:NextInteger(1, #str)
            v6[i] =
                string.sub("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", v7, v7)
        end

        return table.concat(v6)
    end
end

local fn6, fn7

do
    local tbl2 = {}

    fn6 = function(arg)
        table.insert(tbl2, arg)
    end

    local str = "All"

    fn7 = function(arg)
        if type(arg) ~= "table" then
            return arg
        end
        local value = rawget(arg, "Instance")
        if typeof(value) ~= "Instance" then
            return arg
        end
        local flag = false

        local function fn8(arg2)
            if flag then
                return
            end

            if arg2.Text == "None" then
                flag = true
                arg2.Text = str
                flag = false
            end
        end

        local function fn9(arg2)
            if not arg2:IsA("TextLabel") or arg2.Name ~= "Value" then
                return
            end
            fn8(arg2)

            local connection = arg2:GetPropertyChangedSignal("Text"):Connect(function()
                fn8(arg2)
            end)

            fn6(function()
                pcall(function()
                    connection:Disconnect()
                end)
            end)
        end

        for _, descendant in ipairs(value:GetDescendants()) do
            fn9(descendant)
        end

        local connection = value.DescendantAdded:Connect(fn9)

        fn6(function()
            pcall(function()
                connection:Disconnect()
            end)
        end)

        return arg
    end

    local genv = typeof(getgenv) == "function" and getgenv() or _G
    local chilliHubSaeCleanup = genv.ChilliHubSaeCleanup

    if type(chilliHubSaeCleanup) == "function" then
        pcall(chilliHubSaeCleanup)
    end

    genv.ChilliHubSaeCleanup = function()
        for i = #tbl2, 1, -1 do
            pcall(tbl2[i])
        end

        table.clear(tbl2)
    end
end

do
    local n = 0
    local fn8 = nil

    fn8 = function(arg, arg2)
        local n2 = arg2 or 0

        if type(arg) == "table" then
            if 3 < n2 then
                return
            end
            local n3 = 0

            for k, v4 in pairs(arg) do
                n3 = n3 + 1

                if not (n3 > 20) then
                    fn8(k, n2 + 1)
                    fn8(v4, n2 + 1)
                    continue
                end

                break
            end
        elseif typeof(arg) == "Instance" then
            pcall(arg.GetFullName, arg)
        else
            n = n + #tostring(arg)
        end
    end

    local tbl2 = {}

    local function fn9(arg)
        local n2 = #tbl2 + 1
        tbl2[n2] = arg
    end

    local function fn10()
        for _, v4 in ipairs(tbl2) do
            pcall(function()
                v4:Disconnect()
            end)
        end

        table.clear(tbl2)
    end

    local function fn11()
        fn10()

        for _, v4 in ipairs({
            "RE/GearSatchel/Lost",
            "RE/GearSatchel/Gained",
            "RE/RigSync/ProbeSatchel",
            "RE/RigSync/SeedSatchel",
            "RE/RigSync/CorrectionBegan",
            "RE/RigSync/Refresh",
            "RE/ToolTrigger/Trigger",
            "RE/BatSwing/Trigger",
        }) do
            local v5 = networking:FindFirstChild(v4)

            if v5 and v5:IsA("RemoteEvent") then
                fn9(v5.OnClientEvent:Connect(function(...)
                    fn8({ ... })
                end))
            end
        end

        local function fn11(arg)
            if not arg then
                return
            end

            fn9(arg.ChildRemoved:Connect(function(arg2)
                if arg2:IsA("Tool") then
                    fn8({ arg2.Name, arg2.Parent })
                end
            end))

            fn9(arg.ChildAdded:Connect(function(arg2)
                if arg2:IsA("Tool") then
                    fn8({ arg2.Name })
                end
            end))
        end

        fn11(localPlayer:FindFirstChildOfClass("Backpack"))

        fn9(localPlayer.ChildAdded:Connect(function(arg)
            if arg:IsA("Backpack") then
                fn11(arg)
            end
        end))

        task.spawn(function()
            pcall(function()
                local v4 = require(ReplicatedStorage.Shared.Save).Get()
                fn8({ v4.GearInventory, v4.Inventory }, 2)
            end)

            if type(getgc) == "function" then
                pcall(function()
                    for _, v4 in ipairs(getgc(false)) do
                        if type(v4) == "function" and islclosure(v4) then
                            pcall(debug.info, v4, "n")
                        end
                    end
                end)
            end
        end)
    end

    local genv = typeof(getgenv) == "function" and getgenv() or _G
    genv.ChilliToolKeeper = fn11
    task.defer(fn11)
    fn6(fn10)
end

local tbl2

do
    local n = 0.35
    local n2 = 5
    local tbl3 = {}
    local flag = true

    tbl2 = {
        Add = function(arg)
            local tbl4 = { Run = arg, Gap = n, Idle = n2, Repeat = false, Hold = 0 }
            table.insert(tbl3, tbl4)
            return tbl4
        end,
        Wake = function()
            flag = true
        end,
        Backoff = function(arg, arg2)
            if arg then
                arg.Hold = tonumber(arg2) or 6
            end
        end,
    }

    local connection = RunService.Heartbeat:Connect(function(arg)
        local v4 = flag
        flag = false

        for _, v5 in ipairs(tbl3) do
            v5.Gap = v5.Gap + arg
            v5.Idle = v5.Idle + arg

            if 0 < v5.Hold then
                v5.Hold = v5.Hold - arg
            elseif v5.Gap >= n and (v4 or v5.Repeat or v5.Idle >= n2) then
                v5.Gap = 0
                v5.Idle = 0
                local ok, result = pcall(v5.Run, v5)
                ok = ok and result == true
                v5.Repeat = ok
            end
        end
    end)

    fn6(function()
        connection:Disconnect()
    end)
end

local v4
v4 = defaultTab:CreateSection({ Name = "Dr Scramble Event", Expanded = false })
local v5
v5 = defaultTab:CreateSection({ Name = "Auto Steal", Expanded = true })
local v6
v6 = defaultTab:CreateSection({ Name = "Auto Place Egg", Expanded = false })
local v7
v7 = defaultTab:CreateSection({ Name = "Auto Treadmill", Expanded = false })
local v8
v8 = defaultTab:CreateSection({ Name = "Auto Hatch & Equip", Expanded = false })
local v9
v9 = defaultTab:CreateSection({ Name = "Auto Sell", Expanded = false })
local v10
v10 = defaultTab:CreateSection({ Name = "Auto Fuse Machine", Expanded = false })
local v11
v11 = defaultTab:CreateSection({ Name = "Auto Favorite", Expanded = false })
local v12
v12 = defaultTab:CreateSection({ Name = "Auto Rift & Boss", Expanded = false })
local tbl3
tbl3 = { Paused = false }

do
    local n = 0.5
    local v13 = nil
    local tbl4 = nil
    local tbl5 = {}
    local flag = false
    local n2 = 0

    local function fn8()
        for i = #tbl5, 1, -1 do
            local v14 = tbl5[i]

            if v14 and v14.Connected then
                v14:Disconnect()
            end

            tbl5[i] = nil
        end
    end

    local function fn9()
        fn8()
        local v14 = v13
        local v15 = tbl4
        v13 = nil
        tbl4 = nil
        if not v14 or not v14.Parent or not v15 then
            return
        end

        pcall(function()
            v14.BreakJointsOnDeath = v15.BreakJointsOnDeath
            v14.RequiresNeck = v15.RequiresNeck
            v14:SetStateEnabled(Enum.HumanoidStateType.Dead, v15.DeadEnabled)
        end)
    end

    local function fn10(arg)
        if not arg or not arg.Parent then
            return false
        end

        local flag2 = pcall(function()
            arg.BreakJointsOnDeath = false
            arg.RequiresNeck = false
            arg:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end) and arg.BreakJointsOnDeath == false and arg.RequiresNeck == false and arg:GetStateEnabled(
            Enum.HumanoidStateType.Dead
        ) == false

        return flag2
    end

    local function fn11(arg)
        if tbl3.Paused or arg ~= v13 or not arg or not arg.Parent or flag then
            return false
        end
        local maxHealth = arg.MaxHealth
        if maxHealth <= 0 then
            return false
        end

        if maxHealth == math.huge or arg.Health >= maxHealth then
            return true
        end
        flag = true

        local ok = pcall(function()
            arg.Health = maxHealth
        end)

        flag = false
        ok = ok and arg.Health >= maxHealth
        return ok
    end

    local function fn12(arg)
        if arg == v13 and arg and arg.Parent then
            return true
        end
        fn9()
        if not arg or not arg:IsA("Humanoid") or not arg.Parent then
            return false
        end
        v13 = arg
        tbl4 = {
            BreakJointsOnDeath = arg.BreakJointsOnDeath,
            RequiresNeck = arg.RequiresNeck,
            DeadEnabled = arg:GetStateEnabled(Enum.HumanoidStateType.Dead),
        }
        if not fn10(arg) then
            fn9()
            return false
        end
        fn11(arg)
        local n3 = #tbl5 + 1

        tbl5[n3] = arg.HealthChanged:Connect(function()
            fn11(arg)
        end)

        local n4 = #tbl5 + 1

        tbl5[n4] = arg:GetPropertyChangedSignal("MaxHealth"):Connect(function()
            fn11(arg)
        end)

        local n5 = #tbl5 + 1

        tbl5[n5] = arg.StateChanged:Connect(function(arg2, arg3)
            if arg3 == Enum.HumanoidStateType.Dead and not tbl3.Paused then
                fn10(arg)
                fn11(arg)
            end
        end)

        n2 = os.clock()
        return true
    end

    local function fn13()
        local character = localPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid") or nil
        return humanoid
    end

    local connection = localPlayer.CharacterAdded:Connect(function()
        task.defer(function()
            fn12(fn13())
        end)
    end)

    local connection2 = RunService.Heartbeat:Connect(function()
        local now = os.clock()
        if tbl3.Paused or now - n2 < n then
            return
        end
        n2 = now
        local v14 = fn13()
        if v14 ~= v13 then
            fn12(v14)
            return
        end

        if v14 then
            fn10(v14)
            fn11(v14)
        end
    end)

    task.defer(function()
        fn12(fn13())
    end)

    fn6(function()
        if connection then
            connection:Disconnect()
        end

        if connection2 then
            connection2:Disconnect()
        end

        fn9()
    end)
end

local tbl4
local tbl5 = { "bat", "katana", "axe", "staff", "club", "hammer", "sword", "blade" }

tbl4 = {
    Steal = { Active = false, LastFinishedAt = 0, Carrying = false },
    Movement = {
        Owner = nil,
        PlaceWanted = false,
        StealFirst = false,
        MutationWanted = false,
        FracturedWanted = false,
    },
    AntiGuard = {
        Enabled = false,
        Busy = false,
        BusySince = 0,
        HitArms = 0,
        Handle = nil,
        Render = nil,
    },
    IsBatTool = function(arg)
        if typeof(arg) ~= "Instance" or not arg:IsA("Tool") then
            return false
        end

        if arg:GetAttribute("IsBat") == true then
            return true
        end
        local attribute = arg:GetAttribute("GearName")

        if type(attribute) == "string" then
            local gears = tbl.Gears
            local directory = type(gears) == "table" and gears.Directory or nil
            local flag = type(directory) == "table" and directory[attribute] or nil
            local flag2 = type(flag) == "table" and flag.BatControllerData ~= nil
            return flag2
        end

        if arg:GetAttribute("ItemType") ~= nil then
            return false
        end
     
