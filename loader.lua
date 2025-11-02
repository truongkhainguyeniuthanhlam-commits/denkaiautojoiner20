-- 🔰 Denkai Auto Loader (v4 - ép tải bản mới tuyệt đối)
local baseURL = "https://raw.githubusercontent.com/truongkhainguyeniuthanhlam-commits/denkaiautojoiner20/main/"

local filesToLoad = {
    "joiner",
}

for _, fileName in ipairs(filesToLoad) do
    local url = baseURL .. fileName .. "?update=" .. tostring(os.time()) .. "&r=" .. math.random(1,9999999)
    print("🔗 Đang tải từ:", url)

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
