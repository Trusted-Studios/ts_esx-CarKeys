-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Debug Logs
-- ════════════════════════════════════════════════════════════════════════════════════ --

local filename = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("^.*/(.*).lua$") or str
end
print("[SHARED - DEBUG] : " .. filename() .. ".lua started");

-- ════════════════════════════════════════════════════════════════════════════════════ --
-- Code
-- ════════════════════════════════════════════════════════════════════════════════════ --

--- @class Async 
Async = {}

---@param func function
function Async.Task(func)
    if func ~= nil then
        CreateThread(function()
            func()
        end)
    end
end

---@param errorHandle string
function Async.RaiseError(errorHandle)
    CreateThread(function()
        if errorHandle ~= nil then
            print("^2[DEBUG]^0 : Error ->^1" .. errorHandle)
        end
    end)
end

---@param func function 
---@return promise | nil
function Async.Await(func)
    if not func then 
        return
    end
    local promise = promise.new()
    func(promise)
    return Citizen.Await(promise)
end