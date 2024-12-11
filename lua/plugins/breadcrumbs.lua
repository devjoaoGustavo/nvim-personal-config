local M = {
  "LunarVim/breadcrumbs.nvim",
  dependencies = {
    { "SmiteshP/nvim-navic" },
  },
}

function M.config()
  -- vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicText", { default = true, bg = "#FFFF00", fg = "#000000" })
  -- vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, bg = "#FFFF00", fg = "#000000" })

  require("nvim-navic").setup {
    icons = {
      File = ' ',
      Module = ' ',
      Namespace = ' ',
      Package = ' ',
      Class = ' ',
      Method = ' ',
      Property = ' ',
      Field = ' ',
      Constructor = ' ',
      Enum = ' ',
      Interface = ' ',
      Function = ' ',
      Variable = ' ',
      Constant = ' ',
      String = ' ',
      Number = ' ',
      Boolean = ' ',
      Array = ' ',
      Object = ' ',
      Key = ' ',
      Null = ' ',
      EnumMember = ' ',
      Struct = ' ',
      Event = ' ',
      Operator = ' ',
      TypeParameter = ' '
    },

    lsp = {
      auto_attach = true,
    },
    highlight = true,
    -- separator = " > ",
    depth_limit = 100,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = false,
    click = true,
    -- format_text = function(text)
    --   return text
    -- end,

  }
  -- require("breadcrumbs").setup()
end

return M
