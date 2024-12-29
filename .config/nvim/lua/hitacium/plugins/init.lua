-- Define modules you want to load
local modules = {
	"ui", "utilities",
}

-- Dynamically require plugin modules
local plugins = {}
for i, module in ipairs(modules) do plugins[i] = require("hitacium.plugins." .. module)
end

require("lazy").setup(plugins)
