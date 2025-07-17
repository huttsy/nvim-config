return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "InsertEnter",
    config = function()
      local ls     = require("luasnip")
      local s      = ls.snippet
      local t      = ls.text_node
      local i      = ls.insert_node
      local extras = require("luasnip.extras")
      local rep    = extras.rep

      -- load VSCode-format snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      ls.add_snippets("typescriptreact", {
        -- react useState
        s("rus", {
          t("const ["), i(1, "value"), t(", set"), rep(1), t("] = useState<"), i(2, "Type"), t(">("), i(3, "initial"), t(")")
        }),

        -- react useEffect
        s("ruf", {
          t("useEffect(() => {"), t({"", "\t"}), i(1, "// …"), t({"", "}, ["}), i(2, "deps"), t("])")
        }),

        -- react functional component
        s("rfc", {
          t("const "), i(1, "Component"), t(" = ("), i(2, "props"), t(") => {"),
          t({"", "\treturn ("}), i(3, "<div></div>"), t({");", "}" ,
          ""}),
          t("export default "), rep(1),
        }),
      })

      -- keymaps to expand/jump in snippets
      vim.keymap.set({ "i","s" }, "<C-l>", function() ls.expand_or_jump() end, { silent = true })
      vim.keymap.set({ "i","s" }, "<C-h>", function() ls.jump(-1)           end, { silent = true })
    end,
  },
}
