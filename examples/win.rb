require 'ffi'
require_relative 'sfmlsys'
require_relative 'sfmlwin'

include SFML_SYSTEM
include SFML_WIN

# --- Create Video Mode ---
video_mode = SfVideoMode.new
video_mode[:size][:x] = 800
video_mode[:size][:y] = 600
video_mode[:bitsPerPixel] = 32

# --- Create Window ---
win = sfWindow_create(video_mode, "Simple Window", WindowStyle::DefaultStyle, 0, nil)
raise "Failed to create window" if win.null?

# --- Event Union ---
event = SfEvent.new

# --- Main Loop ---
while sfWindow_isOpen(win)
  while sfWindow_pollEvent(win, event)
    case event[:type]
    when SfEventType::EvtClosed
      sfWindow_close(win)
    when SfEventType::EvtKeyPressed
      key = event[:key]  # access the key member of the union
      if key[:code] == SfKeyCode::Escape
        sfWindow_close(win)
      end
    end
  end

  # Example: you could update/draw here
end

# --- Cleanup ---
sfWindow_destroy(win)