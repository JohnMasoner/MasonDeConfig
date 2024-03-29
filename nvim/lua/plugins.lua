-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


vim.cmd([[
  augroup auto_cmd_to_autoopen
    autocmd!
    autocmd VimEnter * nested :call tagbar#autoopen(1) | wincmd p
    autocmd VimEnter * NERDTree | wincmd p
  augroup end
]])

-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
        -- Packer can manage itself

        use 'wbthomason/packer.nvim'
        use 'tanvirtin/monokai.nvim'

        -- Tarbar ctags
        use 'preservim/tagbar'

        -- NerdTree
        use 'preservim/nerdtree'
        use 'ryanoasis/vim-devicons'
        use 'tiagofumo/vim-nerdtree-syntax-highlight'

        -- use { "ibhagwan/fzf-lua",
        --   -- optional for icon support
        --   requires = { "nvim-tree/nvim-web-devicons" }
        -- }

        -- auto pairs
        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }

        ---------------------------------------
        -- NOTE: PUT YOUR THIRD PLUGIN HERE --
        ---------------------------------------
        use {
              "loctvl842/monokai-pro.nvim",
              config = function()
                require("monokai-pro").setup()
              end
            }
        use (
                {
                    "akinsho/bufferline.nvim",
                    requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}
                }
            )

        -- surround 1
        use("ur4ltz/surround.nvim")
        -- Comment 注释
        -- use("numToStr/Comment.nvim")
        use {
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }        

        -- telescope
        use(
            {
                "nvim-telescope/telescope.nvim",
                requires = {"nvim-lua/plenary.nvim"}
            }
        )
        -- telescope extensions
        use("LinArcX/telescope-env.nvim")
        use("nvim-telescope/telescope-ui-select.nvim")
        -- dashboard-nvim
        -- use("glepnir/dashboard-nvim")
        --欢迎页
        use {
            "goolord/alpha-nvim"
        }
        use("folke/which-key.nvim")
        -- project
        use("ahmedkhalf/project.nvim")
        -- treesitter
        use(
            {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate"
            }
        )


        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)
