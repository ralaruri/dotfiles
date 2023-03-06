-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")
	use("tanvirtin/monokai.nvim")
	use("numToStr/comment.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-tree.lua")

	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers

	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use({ "neoclide/coc.nvim", branch = "release" })
	use("jose-elias-alvarez/null-ls.nvim")
	-- Using packer.nvim
	use({
		"johnfrankmorgan/whitespace.nvim",
		config = function()
			require("whitespace-nvim").setup({
				-- configuration options and their defaults

				-- `highlight` configures which highlight is used to display
				-- trailing whitespace
				highlight = "DiffDelete",

				ignored_filetypes = { "TelescopePrompt", "Trouble", "help" },
			})

			-- remove trailing whitespace with a keybinding
			vim.keymap.set("n", "<Leader>t", require("whitespace-nvim").trim)
		end,
	})

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use("sbdchd/neoformat")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
