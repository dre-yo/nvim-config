return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim", -- Optional, helps display LSP progress
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",       -- Lua LSP
                "clangd",       -- C, C++, C LSP
                "jdtls",        -- Java LSP
                -- Add tsserver if you work with JavaScript/TypeScript:
                --"tsserver",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                -- Lua specific settings
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim" }, -- Add globals like 'vim'
                                }
                            }
                        }
                    }
                end,
            }
        })

        -- Autoformat C/C++ files with clang-format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.cc", ".hh" },
            callback = function()
                vim.cmd("%!clang-format")
            end,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.java",
          callback = function()
            vim.cmd("%!google-java-format -")
          end,
        })

                -- Autoformat Python files with autopep8 installed via Mason on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.py",
            callback = function()
                vim.cmd("%!~/.local/share/nvim/mason/bin/autopep8 -")
            end,
        })

        -- Manual command for clang-format
        vim.api.nvim_set_keymap('n', '<leader>cf', '<cmd>%!clang-format<CR>', { noremap = true, silent = true })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
