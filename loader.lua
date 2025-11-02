-- Auto Update Loader Script
local url = "https://raw.githubusercontent.com/truongkhainguyeniuthanhlam-commits/denkaiautojoiner20/refs/heads/main/joiner"

local success, response = pcall(function()
    return game:HttpGet(url, true)
end)

if success and response then
    local func, loadError = loadstring(response)
    if func then
        func()
        warn("[AutoUpdater] Đã tải và chạy script mới nhất từ GitHub.")
    else
        warn("[AutoUpdater] Lỗi khi load script:", loadError)
    end
else
    warn("[AutoUpdater] Không thể kết nối tới GitHub hoặc URL lỗi.")
end
