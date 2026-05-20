local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#282828", -- Default Background
    base01 = "#3c3836", -- Lighter Background
    base02 = "#474240", -- Selection
    base03 = "#786f6b", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#ebdbb2",
    base05 = "#fbf1c7",
    base06 = "#fbf1c7",
    base07 = "#fbf1c7",
    -- Accent colors
    base08 = "#fb4934", -- Variables, Errors
    base09 = "#83a598", -- Constants
    base0A = "#fabd2f", -- Classes
    base0B = "#b8bb26", -- Strings
    base0C = "#96e9c9", -- Regex
    base0D = "#e8e995", -- Functions
    base0E = "#fcd782", -- Keywords
    base0F = "#7d0d00", -- Deprecated
  })
end

-- Reload theme when signalled
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
