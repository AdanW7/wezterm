return {
  label = "HIL Firmware Tests",
  setup = function(tab, pane, window)
    -- Set the working directory for the first pane
    pane:send_text("cd C:\\MTRepos\\hil_firmware_tests\r\n")
    
    -- Activate Python virtual environment
    pane:send_text(".venv\\Scripts\\Activate.ps1\r\n")
    
    -- Clear the screen
    pane:send_text("clear\r\n")
    
    -- Set tab title
    tab:set_title("HIL Firmware Tests")
  end,
}
