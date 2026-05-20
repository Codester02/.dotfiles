return {
  "RRethy/base16-nvim",
  config = function()
    if pcall(require, "matugen") then
      require("matugen").setup()
    end
  end,
}
