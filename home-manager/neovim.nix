{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip
      conform-nvim
      telescope-nvim
      {
        plugin = neorg;
        type = "lua";
        config = ''
          require("neorg").setup {
            load = {
              ["core.defaults"] = {},
              ["core.concealer"] = {},
              ["core.dirman"] = {
                config = { workspaces = { notes = "~/notes" } },
              },
	      ["core.integrations.telescope"] = {
                config = {
                  insert_file_link = {
                    show_title_preview = true,
                  },
                },
              },
            },
          }
        '';
      }
      neorg-telescope
      (nvim-treesitter.withPlugins (p: [
        p.rust
        p.toml
        p.python
        p.lua
        p.vim
        p.vimdoc
      ]))
    ];

    initLua = ''
      vim.opt.number = true
      vim.opt.conceallevel = 3
      vim.g.mapleader = " "
      vim.g.maplocalleader = ","
      vim.lsp.inlay_hint.enable(true)

      -- Keybinds
      local tb = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", tb.find_files)
      vim.keymap.set("n", "<leader>fg", tb.live_grep)
      vim.keymap.set("n", "<leader>fb", tb.buffers)
      vim.keymap.set("n", "<leader>fh", tb.help_tags)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)

      vim.keymap.set("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggle inlay hints" })

    
      -- Completion
      local cmp = require("cmp")
    
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        }),
      })
    
      -- LSP
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })
      
      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })
      
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("pyright")
    
      -- Formatting
      require("conform").setup({
        formatters_by_ft = {
          rust = { "rustfmt" },
          python = { "ruff_format" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    '';
  };
}
