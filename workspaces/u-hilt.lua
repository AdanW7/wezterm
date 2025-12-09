return {
  label = "U-HILT",
  setup = function(tab, pane, window)
    -- Set the working directory
    pane:send_text("cd C:\\MTRepos\\U-HILT\r\n")
    
    -- Clear the screen
    pane:send_text("clear\r\n")
    
    -- Set tab title
    tab:set_title("U-HILT")
  end,
}
