-- 🔰 DenKai Auto Loader (GitHub Version)
-- Tự động tải file joiner từ GitHub và chạy

local baseURL = "https://raw.githubusercontent.com/truongkhainguyeniuthanhlam-commits/denkaiautojoiner20/main/"
local filesToLoad = { "joiner" }

for _, fileName in ipairs(filesToLoad) do
    -- ép tải bản mới (chống cache)
    local url = baseURL .. fileName .. "?v=" .. tostring(os.time())
    print("🔗 Đang tải file:", fileName)

    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)

    if success and response and response ~= "" then
        print("✅ Loader Script:", fileName)
        local func, loadErr = loadstring(response)
        if func then
            task.spawn(func)
        else
            warn("⚠️ Lỗi load file:", fileName, loadErr)
        end
    else
        warn("❌ Không thể tải file:", fileName)
    end
end
