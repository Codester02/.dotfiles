local colors = {}
local conf_path = os.getenv("HOME") .. "/.config/hypr/noctalia/noctalia-colors.conf"

local file = io.open(conf_path, "r")
if file then
  for line in file:lines() do
    local key, value = line:match("^%$(%w+)%s*=%s*rgb%(([^)]+)%)")
    if key and value then
      colors[key] = value
    end
  end
  file:close()
end

hl.config({
  general = {
    col = {
      active_border   = "rgb(" .. (colors.primary or "ffffff") .. ")",
      inactive_border = "rgb(" .. (colors.surface or "000000") .. ")",
    },
  },
  group = {
    col = {
      border_active          = "rgb(" .. (colors.secondary or "ffffff") .. ")",
      border_inactive        = "rgb(" .. (colors.surface or "000000") .. ")",
      border_locked_active   = "rgb(" .. (colors.error or "ff0000") .. ")",
      border_locked_inactive = "rgb(" .. (colors.surface or "000000") .. ")",
    },
    groupbar = {
      col = {
        active          = "rgb(" .. (colors.secondary or "ffffff") .. ")",
        inactive        = "rgb(" .. (colors.surface or "000000") .. ")",
        locked_active   = "rgb(" .. (colors.error or "ff0000") .. ")",
        locked_inactive = "rgb(" .. (colors.surface or "000000") .. ")",
      },
    },
  },
})
