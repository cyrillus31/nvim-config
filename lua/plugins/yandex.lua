-- Conditional loading of Yandex-specific features
-- Only loads if the 'ya' command is available on the system
local ya_available = vim.fn.executable("ya") == 1

if ya_available then
    local yandex = require("yandex")
    return yandex
else
    return {}  -- Empty table when ya is not available, prevents errors
end