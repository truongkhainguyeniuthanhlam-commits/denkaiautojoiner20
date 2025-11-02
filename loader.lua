-- 🔰 Denkai Auto Loader (v3 - chống cache hoàn toàn)
local baseURL = "https://raw.githubusercontent.com/truongkhainguyeniuthanhlam-commits/denkaiautojoiner20/main/"

local filesToLoad = {
    "joiner",
}

for _, fileName in ipairs(filesToLoad) do
    local url = baseURL .. fileName .. "?_=" .. tick() -- 💥 phá cache tuyệt đối
    print("🔗 Đang tải từ:", url)

    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)

    if success and response and response ~= "" then
        print("✅ Loader Script:", fileName) -- ✅ đổi chữ ở đây
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
