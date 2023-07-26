{ ... }: {

  programs.kitty = {
    enable = true;
    font.name = "jetbrains mono nerd font";
    font.size = 15;
    shellIntegration.enableZshIntegration = true;
    settings = {
      shell = "zsh";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      mouse_hide_wait = 2;
      cursor_shape = "block";
      url_color = "#0087bd";
      url_style = "dotted";
      confirm_os_window_close = 0;
      background_opacity = "0.95";
      linux_display_server = "wayland";
      enable_audio_bell = "no";
    };
    theme = "Catppuccin-Mocha";
  };
}
