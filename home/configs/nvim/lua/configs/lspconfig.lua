-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "gopls", "marksman", "nil_ls", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"
local util = require "lspconfig.util"

local bin_name = "marksman"
local marksman_cmd = { bin_name, "server" }

-- lsps with default config

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.marksman.setup = {
  cmd = marksman_cmd,
  filetypes = { "markdown", "markdown.mdx" },
  root_dir = function(fname)
    local root_files = { ".marksman.toml" }
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
  end,
  single_file_support = true,
}
