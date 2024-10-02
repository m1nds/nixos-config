{config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-cmp
    ];
    extraConfig = ''
      filetype on
      syntax on
      set autoindent
      set tabstop=8
      set shiftwidth=4
      set expandtab
      set incsearch
      set ignorecase
      set smartcase
      set number
      set cc=80
      set wildmenu
      set scrolloff=3
      set autoread
      set autowrite
      set list
      set listchars=tab:»\ ,trail:·
      colorscheme slate
    '';
  };
}
