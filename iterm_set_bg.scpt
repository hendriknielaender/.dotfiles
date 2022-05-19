on run image_path
  tell application "iTerm2"
    tell current session of current window
      set background image to image_path
    end tell
  end tell
end run
