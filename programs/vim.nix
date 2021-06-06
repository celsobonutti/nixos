{ pkgs, ... }:

{
  programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      molokai
      lightline-vim
      vim-gitgutter
      vim-plug
      vim-javascript
      coc-nvim
      vim-closetag
      vim-jsx-pretty
      yats-vim
      vim-elixir
      fzfWrapper
      fzf-vim
      LanguageClient-neovim
      vim-nix
    ];

    extraConfig = ''
      set softtabstop=0
      set smarttab
      set autoindent
      set number
      set relativenumber
      set tabstop=8
      set expandtab
      set shiftwidth=2
      set ignorecase
      set smartcase

      let g:elm_format_autosave = 0 
      let g:vim_vue_plugin_use_typescript = 1
      let g:vim_vue_plugin_highlight_vue_keyword = 1
      let g:rust_recommended_style = 0 
      let mapleader = " "
      syntax on

      command Fmt :call CocAction('format')

      noremap <C-J> 20j
      noremap <C-K> 20k
      noremap <leader>wl <C-W>l
      noremap <leader>wh <C-W>h
      noremap <leader>wj <C-W>j
      noremap <leader>wk <C-W>k
      noremap x "_x
      noremap X "_dd
      noremap L :tabnext<CR>
      noremap H :tabprevious<CR>
      noremap q b
      inoremap jj <Esc>
      noremap T :tabnew<CR>
      noremap W :tabclose<CR>

      map <leader><leader> :GFiles --cached --others --exclude-standard<CR>
      map <leader>_ :Ag<CR>
      map <leader>op :CocCommand explorer<CR>

      noremap <nowait><expr> <PAGEDOWN> coc#float#has_scroll() ? coc#float#scroll(1) : "\<PAGEDOWN>"
      noremap <nowait><expr> <PAGEUP> coc#float#has_scroll() ? coc#float#scroll(0) : "\<PAGEUP>"

      let g:LanguageClient_serverCommands = { 'haskell': ['haskell-language-server-wrapper', '--lsp'] }

      let g:closetag_filenames = "*.html,*.jsx,*.tsx,*.vue,*.xhml,*.xml"
      let g:closetag_regions = {
        \ 'typescript.tsx': 'jsxRegion,tsxRegion',
        \ 'javascript.jsx': 'jsxRegion',
        \ }

      let g:closetag_emptyTags_caseSensitive = 1

      let g:closetag_shortcut = '>'

      let g:closetag_close_shortcut = '<leader>>'

      set dir=$HOME/.vim/tmp/swap
      if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

      call plug#begin('~/.vim/plugged')

        Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

        Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

        Plug 'AndrewRadev/tagalong.vim'

        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

        Plug 'dracula/vim', { 'as': 'dracula' }

        Plug 'rescript-lang/vim-rescript'

      call plug#end()

      colorscheme dracula 
    '';
  };
}
