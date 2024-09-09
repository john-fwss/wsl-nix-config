{ pkgs, ... }: {

  environment.shellAliases = {
    c = "clear";
    cat = "bat";
    g = "git";
    kys = "exit";
    ls = "eza --tree --long --level 1 --git --no-user --time-style long-iso --group-directories-first --icons=always --header --smart-group";
  };

  environment.systemPackages = with pkgs; [
    bat
    buf
    buf-language-server
    eza
    fastfetch
    git
    gnumake
    gnupg
    go
    gofumpt
    golangci-lint
    gopls
    go-migrate
    grpcurl
    lua-language-server
    mkdocs
    neovim
    ngrok
    nixd
    ollama
    postgres-lsp
    protoc-gen-go
    protoc-gen-connect-go
    ripgrep
    stylua
    sqlc
    taplo
    temporal-cli
  ];

  programs = {
    git = {
      enable = true;
      config = [
        {user.name = "john";}
        {user.email = "john@fwss.us";}
        {init.defaultBranch = "main";}
        {alias.a = "add";}
        {alias.cm = "commit";}
        {alias.co = "checkout";}
        {alias.cp = "cherry-pick";}
        {alias.d = "diff";}
        {alias.f = "fetch";}
        {alias.l = "log";}
        {alias.pl = "pull";}
        {alias.ps = "push";}
        {alias.r = "rebase";}
        {alias.s = "status";}
        {alias.last = "log -1 HEAD";}
      ];
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
