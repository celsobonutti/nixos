{ pkgs, ... }:

{
  programs.vim = {
    enable = true;

    settings = {
      number = true;
      relativenumber = true;
      tabstop = 8;
      expandtab = true;
      shiftwidth = 2;
      ignorecase = true;
      smartcase = true;
    };

    plugins = with pkgs.vimPlugins; [
      molokai
      lightline-vim
      vim-gitgutter
      vim-plug
      vim-javascript
      coc-nvim
      nerdtree
      vim-closetag
      vim-jsx-pretty
      yats-vim
      vim-elixir
      fzfWrapper
      fzf-vim
    ];

    extraConfig = ''
      set softtabstop=0
      set smarttab
      set autoindent

      colorscheme molokai

      let g:elm_format_autosave = 0 
      let g:vim_vue_plugin_use_typescript = 1
      let g:vim_vue_plugin_highlight_vue_keyword = 1
      let NERDTreeShowLineNumbers=1

      autocmd FileType nerdtree setlocal relativenumber

      syntax on

      command Fmt :call CocAction('format')

      nnoremap <C-J> <C-W>j
      nnoremap <C-K> <C-W>k
      nnoremap <C-H> <C-W>h
      nnoremap <C-L> <C-W>l
      nnoremap <nowait><expr> <PAGEDOWN> coc#float#has_scroll() ? coc#float#scroll(1) : "\<PAGEDOWN>"
      nnoremap <nowait><expr> <PAGEUP> coc#float#has_scroll() ? coc#float#scroll(0) : "\<PAGEUP>"
      inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      nnoremap x "_x
      vnoremap x "_x
      noremap q b

      map <C-p> :GFiles --cached --others --exclude-standard<CR>
      map <C-_> :Ag<CR>
      map <C-n> :NERDTreeToggle<CR>

      let g:closetag_filenames = "*.html,*.jsx,*.tsx,*.vue,*.xhml,*.xml"
      let g:closetag_regions = {
        \ 'typescript.tsx': 'jsxRegion,tsxRegion',
        \ 'javascript.jsx': 'jsxRegion',
        \ }

      let g:closetag_emptyTags_caseSensitive = 1

      let g:closetag_shortcut = '>'

      let g:closetag_close_shortcut = '<leader>>'

      call plug#begin('~/.vim/plugged')

        Plug 'rescript-lang/vim-rescript', {'tag': 'v1.3.0'}

        Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

        Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

        Plug 'AndrewRadev/tagalong.vim'

        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

        Plug 'junegunn/fzf.vim'

      call plug#end()
    '';
  };
}
