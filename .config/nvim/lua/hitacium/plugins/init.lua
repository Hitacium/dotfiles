local modules = {
  "ui", "utilities",
}

local plugins = {}
for i, module in ipairs(modules) do
  plugins[i] = require("hitacium.plugins." .. module)
end

require("lazy").setup(plugins)
