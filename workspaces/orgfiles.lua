return {
  label = "Org Files",
  setup = function(tab, pane, window)
    -- Set the working directory
    pane:send_text("cd C:\\Users\\awodzins\\orgfiles\r\n")
    
    -- Clear the screen
    pane:send_text("clear\r\n")
    
    -- Open nvim
    pane:send_text("nvim\r\n")
    
    -- Set tab title
    tab:set_title("Org Files")
  end,
}
