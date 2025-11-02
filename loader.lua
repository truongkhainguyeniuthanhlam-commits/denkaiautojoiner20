local url = "https://raw.githubusercontent.com/<username>/<repo>/main/joiner.lua"
local lastResponse = nil

-- Hàm load script
local function loadScript()
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    if success and response then
        if response ~= lastResponse then
            lastResponse = response
            loadstring(response)()
            print("[AutoLoader] Script đã được tải/ cập nhật.")
        end
    else
        warn("[AutoLoader] Lỗi khi tải script từ GitHub")
    end
end

-- Chạy lần đầu
loadScript()

-- Kiểm tra định kỳ (mỗi 5 phút)
task.spawn(function()
    while task.wait(1) do
        loadScript()
    end
end)
