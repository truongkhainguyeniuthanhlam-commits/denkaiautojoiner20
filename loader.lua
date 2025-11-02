local baseURL = "https://raw.githubusercontent.com/truongkhainguyeniuthanhlam-commits/denkaiautojoiner20/main/"

local filesToLoad = {
    "joiner",
}

for _, fileName in ipairs(filesToLoad) do
    local url = baseURL .. fileName .. "?_=" .. tostring(os.time()) -- 💡 phá cache
    print("🔗 Đang tải từ:", url)

    local success, response = pcall(function()
        return game:HttpGet(url)
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
