-- OCaml formatting helper with basic parameters
local function ocamlformat()
  local file = vim.fn.expand('%')
  if file:match('%.ml$') or file:match('%.mli$') or file:match('%.re$') or file:match('%.rei$') then
    local cmd = {
      'ocamlformat',
      '--enable-outside-detected-project',
      '--margin=80',
      '--inplace',
      file,
    }

    vim.fn.jobstart(cmd, {
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          vim.cmd('edit') -- reload buffer
          print('OCamlFormat applied to ' .. file)
        else
          print('OCamlFormat failed on ' .. file)
        end
      end,
    })
  end
end


return {
  {
    {
      'williamboman/mason.nvim',
      lazy = false,
      opts = {},
    },
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = function()
        local cmp = require('cmp')

        cmp.setup({
          sources = {
            { name = 'nvim_lsp' },
          },
          mapping = cmp.mapping.preset.insert({
            ['<Tab>'] = cmp.mapping.confirm { select = true },
            ['<C-space>'] = cmp.mapping.complete(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
          }),
          snippet = {
            expand = function(args)
              vim.snippet.expand(args.body)
            end,
          },
        })
      end
    },

    {
      'neovim/nvim-lspconfig',
      cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
      event = { 'BufReadPre', 'BufNewFile' },
      dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
      },
      init = function()
        vim.opt.signcolumn = 'yes'
      end,
      config = function()
        local lsp_defaults = require('lspconfig').util.default_config

        lsp_defaults.capabilities = vim.tbl_deep_extend(
          'force',
          lsp_defaults.capabilities,
          require('cmp_nvim_lsp').default_capabilities()
        )

        vim.api.nvim_create_autocmd('LspAttach', {
          desc = 'LSP actions',
          callback = function(event)
            local opts = { buffer = event.buf }

            vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
            vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
            vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
            vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
              opts)
            vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
              opts)
            vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
            vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
              opts)
            vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
            vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>',
              opts)

            -- formatting
            vim.keymap.set('n', '<F3>', function()
              vim.lsp.buf.format()
              ocamlformat()
            end, opts)
          end,
        })

        require('mason-lspconfig').setup({
          ensure_installed = {},
          handlers = {
            function(server_name)
              require('lspconfig')[server_name].setup({})
            end,
          }
        })
      end
    },
    {
      'chomosuke/typst-preview.nvim',
      lazy = false, -- or ft = 'typst'
      version = '1.*',
      opts = {},    -- lazy.nvim will implicitly calls `setup {}`
    }
  }
}
