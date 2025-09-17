return {
--	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    --
    {
        "mason-org/mason.nvim",
        opts = {}
    },
	{ 
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  },
	  keys = {
	    {
	      "<leader>?",
	      function()
		require("which-key").show({ global = true })
	      end,
	      desc = "Buffer Local Keymaps (which-key)",
	    },
	  },
	},
	{ 
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate", 
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = false },  
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "c_sharp", "lua", "vim", "vimdoc", "query", "razor", "javascript", "html", "scss", "svelte" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = false },  
			})
			end
	}, 
-- LSP Config
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("lspconfig").rust_analyzer.setup({})
        end,
    },
           -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                }),
            })
        end,
    }, 
	{
		'nvimdev/dashboard-nvim',
		 event = 'VimEnter',
		 config = function()
			require('dashboard').setup {
		      -- config
		      		theme = 'doom',
				center = {
					desc = 'Gare VIM',
				}
		    	}
		  end,
		  dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},
-- {
--         'nvim-lualine/lualine.nvim',
--         dependencies = {
--             "nvim-tree/nvim-web-devicons",
--         },
--         opts = {
--         }
--     }
}
