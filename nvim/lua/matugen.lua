local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#131313", -- Default Background
    base01 = "#1f1f1f", -- Lighter Background
    base02 = "#2a2a2a", -- Selection
    base03 = "#919191", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#c6c6c6",
    base05 = "#e2e2e2",
    base06 = "#e2e2e2",
    base07 = "#e2e2e2",
    -- Accent colors
    base08 = "#ffb4ab", -- Variables, Errors
    base09 = "#dfc38c", -- Constants
    base0A = "#e7bdb7", -- Classes
    base0B = "#ffb4a9", -- Strings
    base0C = "#dfc38c", -- Regex
    base0D = "#ffb4a9", -- Functions
    base0E = "#e7bdb7", -- Keywords
    base0F = "#93000a", -- Deprecated
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
