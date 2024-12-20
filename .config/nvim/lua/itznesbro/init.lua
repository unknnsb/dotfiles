require('itznesbro.options')
require('itznesbro.maps')
require('itznesbro.lazy')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local Group = augroup("Group", {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = Group,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
  group = Group,
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", "<cmd>Lspsaga code_action<CR>", opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>n", ":Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "<leader>p", ":Lspsaga diagnostic_jump_prev<CR>", opts)

    local bufnr = e.buf
    local client = vim.lsp.get_client_by_id(e.data.client_id)
    if vim.tbl_contains({ 'null-ls' }, client.name) then
      return
    end
    require("lsp_signature").on_attach({
    }, bufnr)
  end
})
