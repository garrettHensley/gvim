return {
--	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
		require("which-key").show({ global = false })
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
		indent = { enable = true },  
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "c_sharp", "lua", "vim", "vimdoc", "query", "razor", "javascript", "html", "scss", "svelte" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
			end
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
{
        'nvim-lualine/lualine.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
        }
    }
}
