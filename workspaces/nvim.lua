return {
  label = "Neovim Config",
  setup = function(tab, pane, window)
    -- Set the working directory
    pane:send_text("cd C:\\Users\\awodzins\\.config\\nvim\r\n")
    
    -- Clear the screen
    pane:send_text("clear\r\n")
    
    -- Open nvim
    pane:send_text("nvim\r\n")
    
    -- Set tab title
    tab:set_title("Neovim Config")
  end,
}
