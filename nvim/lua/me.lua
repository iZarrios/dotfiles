--vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]] 
--:vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.code_action(1)]]
--vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '|', right = '|'},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding' }, 
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}


vim.api.nvim_set_keymap('n','<leader>u',':UndotreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n','<leader>g',':Neogit<CR>', {noremap = true})

-- vim.cmd [[autocmd BufWritePre * Neoformat]]

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client,bufnr)

	local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", opts)
	buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    vim.keymap.set("n","K",vim.lsp.buf.hover,{buffer=0})  
    -- vim.keymap.set("n","gd",vim.lsp.buf.definition,{buffer=0})
    vim.keymap.set("n","<leader>r",vim.lsp.buf.rename,{buffer=0})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})

--	if client.server_capabilities.document_formatting 
--	then
--		print("available")
--		vim.cmd([[
--			augroup formatting
--				autocmd! * <buffer>
--				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
--				autocmd BufWritePre <buffer> lua OrganizeImports(1000)
--			augroup END
--		]])
--	else
--		print("not available")
--	end

end




local servers = {'pyright', 'clangd', 'bashls', 'gopls','tsserver'}

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end




require("prettier").setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "cpp",
  },
})





 -- Using Lua functions
vim.cmd [[ nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<CR> ]]
vim.cmd [[ nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr> ]]
vim.cmd [[ nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr> ]]
vim.cmd [[ nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr> ]]
vim.cmd [[ nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr> ]]







-- IGNORE? XD

-- set completeopt=menu,menuone,noselect
vim.opt.completeopt={"menu","menuone","noselect"}

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })
