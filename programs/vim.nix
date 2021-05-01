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
      syntax on

      command Fmt :call CocAction('format')

      noremap J 20j
      noremap K 20k
      noremap <C-L> <C-W>l
      noremap <C-H> <C-W>h
      noremap <C-J> <C-W>j
      noremap <C-K> <C-W>k
      noremap x "_x
      noremap X "_dd
      noremap L :tabnext<CR>
      noremap H :tabprevious<CR>
      noremap q b
      tnoremap <C-L> <C-W>l
      tnoremap <C-H> <C-W>h
      tnoremap <C-J> <C-W>j
      tnoremap <C-K> <C-W>k
      inoremap jj <Esc>
      noremap T :tabnew<CR>
      noremap W :tabclose<CR>

      map <C-p> :GFiles --cached --others --exclude-standard<CR>
      map <C-_> :Ag<CR>
      map <C-n> :CocCommand explorer<CR>
      map <Leader>] :CocCommand explorer<CR>

      nnoremap <F5> :call LanguageClient_contextMenu()<CR>
      map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
      map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
      map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
      map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
      map <Leader>lb :call LanguageClient#textDocument_references()<CR>
      map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
      map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

      noremap <nowait><expr> <PAGEDOWN> coc#float#has_scroll() ? coc#float#scroll(1) : "\<PAGEDOWN>"
      noremap <nowait><expr> <PAGEUP> coc#float#has_scroll() ? coc#float#scroll(0) : "\<PAGEUP>"
      noremap <nowait><expr> <C-J> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<C-W>j"
      noremap <nowait><expr> <C-K> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<C-W>k"

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

        Plug 'rescript-lang/vim-rescript', {'tag': 'v1.3.0'}

        Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

        Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

        Plug 'AndrewRadev/tagalong.vim'

        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

        Plug 'dracula/vim', { 'as': 'dracula' }

      call plug#end()

      colorscheme dracula 
    '';
  };
}
