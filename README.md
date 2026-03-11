# RubySFML3

These are SFML 3 Bindings for Ruby. These use the Ruby Gem FFI. You will need to include the full path of where you have the DLLs/shared libraries under Windows. Same goes for assets such as images and audio. 

# EXAMPLE
```ruby
require 'ffi'
require_relative 'sfmlsys'
require_relative 'sfmlwin'
require_relative 'sfmlgfx'

include SFML_SYSTEM
include SFML_WIN
include SFML_GRAPHICS

# --- Create Video Mode ---
video_mode = SfVideoMode.new
video_mode[:size][:x] = 800
video_mode[:size][:y] = 600
video_mode[:bitsPerPixel] = 32

Black_Color = SfColor.new
Black_Color[:r] = 0
Black_Color[:g] = 0
Black_Color[:b] = 0
Black_Color[:a] = 255

win = sfRenderWindow_create(video_mode, "Logo Bounce Window", WindowStyle::DefaultStyle, 0, nil)
raise "Failed to create window" if win.null?

#Full path to image under Windows
tex = sfTexture_createFromFile("Ruby/sfml_logo.png",nil)
raise "Failed to load texture" if tex.null?

sprite = sfSprite_create(tex)
#sfSprite_setTexture(sprite,tex,null)

sprite_pos = FFI::MemoryPointer.new(:int,2)
sprite_pos.write_array_of_int([200,200])
sfSprite_setPosition(sprite,sprite_pos)

velocity = FFI::MemoryPointer.new(:int,2)
velocity.write_array_of_int([200,150])

clock = sfClock_create()

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

  delta_time = sfTime_asSeconds(sfClock_restart(clock))

  # Get the current sprite position
  sprite_pos = sfSprite_getPosition(sprite)
  
  # Move sprite based on velocity
  sprite_pos[:x] += velocity.read_array_of_int(2)[0] * delta_time
  sprite_pos[:y] += velocity.read_array_of_int(2)[1] * delta_time

  # Get texture size (width, height)
  tex_size = sfTexture_getSize(tex)

  # Bounce Left/Right
  if sprite_pos[:x] <= 0 || sprite_pos[:x] + tex_size[:x] >= 800
    velocity.write_array_of_int([-velocity.read_array_of_int(2)[0], velocity.read_array_of_int(2)[1]])
  end

  # Bounce Top/Bottom
  if sprite_pos[:y] <= 0 || sprite_pos[:y] + tex_size[:y] >= 600
    velocity.write_array_of_int([velocity.read_array_of_int(2)[0], -velocity.read_array_of_int(2)[1]])
  end

  # Update sprite position
  sfSprite_setPosition(sprite, sprite_pos)

  # Example: you could update/draw here
  sfSprite_setPosition(sprite,sprite_pos)
  sfRenderWindow_clear(win,Black_Color)
  sfRenderWindow_drawSprite(win,sprite,nil)
  sfRenderWindow_display(win)
end

sfTexture_destroy(tex)
sfSprite_destroy(sprite)
sfRenderWindow_destroy(win)
```

# LICENSE
Copyright (c) <2026> Andy P.

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.
