{ config, lib, ...}:

{

  environment.variables.DIRENV_LOG_FORMAT = "";

  environment.etc."xdg/gtk-2.0/gtkrc".text = ''
    gtk-theme-name = "Catppuccin-Frappe-Standard-Pink-Dark"
  '';

  environment.etc."xdg/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Catppuccin-Frappe-Standard-Pink-Dark
  '';

}
