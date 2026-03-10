#Ruby SFML Window Wrapper
#64 Bits SFML and Ruby
#Written by Andy P.
#Copyright 2026
require 'ffi'
require_relative 'sfmlsys'

module SFML_WIN
	extend FFI::Library
	ffi_lib "C:/Users/g_and/OneDrive/Documents/Ruby/SFML3/csfml-window-3.dll"
	#VideoMode
	class SfVideoMode < FFI::Struct
		layout :size, SFML_SYSTEM::SfVector2u.by_value,
			   :bitsPerPixel, :uint
	end
	attach_function :sfVideoMode_getDesktopMode, [:void], SfVideoMode.by_value
	attach_function :sfVideoMode_getFullscreenModes, [:pointer], :pointer
	attach_function :sfVideoMode_isValid, [SfVideoMode.by_value], :bool
	#JoystickIdentification
	class SfJoystickIdentification < FFI::Struct
		layout :name, :string,
			   :vendorID, :uint,
			   :productID, :uint
	end
	#Joystick
	SFJOYSTICKCOUNT = 8
	SFJOYSTICKBUTTONCOUNT = 32
	SFJOYSTICKAXISCOUNT = 8
	module SfJoystickAxis
		sfJoystickX = 0,
		sfJoystickY = 1,
		sfJoystickZ = 2,
		sfJoystickR = 3,
		sfJoystickU = 4,
		sfJoystickV = 5,
		sfJoystickPovX = 6,
		sfJoystickPovY = 7
	end
	attach_function :sfJoystick_isConnected, [:uint], :bool
	attach_function :sfJoystick_getButtonCount, [:uint], :uint
	attach_function :sfJoystick_hasAxis, [:uint, :int], :bool
	attach_function :sfJoystick_isButtonPressed, [:uint,:uint], :bool
	attach_function :sfJoystick_getAxisPosition, [:uint, :int], :float
	attach_function :sfJoystick_getIdentification, [:uint], SfJoystickIdentification.by_value
	attach_function :sfJoystick_update, [], :void
	#Keyboard
	module SfKeyCode
		Unknown      = -1
    A            = 0
    B            = 1
    C            = 2
    D            = 3
    E            = 4
    F            = 5
    G            = 6
    H            = 7
    I            = 8
    J            = 9
    K            = 10
    L            = 11
    M            = 12
    N            = 13
    O            = 14
    P            = 15
    Q            = 16
    R            = 17
    S            = 18
    T            = 19
    U            = 20
    V            = 21
    W            = 22
    X            = 23
    Y            = 24
    Z            = 25

    Num0         = 26
    Num1         = 27
    Num2         = 28
    Num3         = 29
    Num4         = 30
    Num5         = 31
    Num6         = 32
    Num7         = 33
    Num8         = 34
    Num9         = 35

    Escape       = 36
    LControl     = 37
    LShift       = 38
    LAlt         = 39
    LSystem      = 40
    RControl     = 41
    RShift       = 42
    RAlt         = 43
    RSystem      = 44
    Menu         = 45
    LBracket     = 46
    RBracket     = 47
    Semicolon    = 48
    Comma        = 49
    Period       = 50
    Apostrophe   = 51
    Slash        = 52
    Backslash    = 53
    Grave        = 54
    Equal        = 55
    Hyphen       = 56
    Space        = 57
    Enter        = 58
    Backspace    = 59
    Tab          = 60
    PageUp       = 61
    PageDown     = 62
    End          = 63
    Home         = 64
    Insert       = 65
    Delete       = 66
    Add          = 67
    Subtract     = 68
    Multiply     = 69
    Divide       = 70
    Left         = 71
    Right        = 72
    Up           = 73
    Down         = 74

    Numpad0      = 75
    Numpad1      = 76
    Numpad2      = 77
    Numpad3      = 78
    Numpad4      = 79
    Numpad5      = 80
    Numpad6      = 81
    Numpad7      = 82
    Numpad8      = 83
    Numpad9      = 84

    F1           = 85
    F2           = 86
    F3           = 87
    F4           = 88
    F5           = 89
    F6           = 90
    F7           = 91
    F8           = 92
    F9           = 93
    F10          = 94
    F11          = 95
    F12          = 96
    F13          = 97
    F14          = 98
    F15          = 99

    Pause        = 100
	end
	module SfScanCode
    	Unknown                  = -1
    A                        = 0
    B                        = 1
    C                        = 2
    D                        = 3
    E                        = 4
    F                        = 5
    G                        = 6
    H                        = 7
    I                        = 8
    J                        = 9
    K                        = 10
    L                        = 11
    M                        = 12
    N                        = 13
    O                        = 14
    P                        = 15
    Q                        = 16
    R                        = 17
    S                        = 18
    T                        = 19
    U                        = 20
    V                        = 21
    W                        = 22
    X                        = 23
    Y                        = 24
    Z                        = 25

    Num1                     = 26
    Num2                     = 27
    Num3                     = 28
    Num4                     = 29
    Num5                     = 30
    Num6                     = 31
    Num7                     = 32
    Num8                     = 33
    Num9                     = 34
    Num0                     = 35

    Enter                    = 36
    Escape                   = 37
    Backspace                = 38
    Tab                      = 39
    Space                    = 40
    Hyphen                   = 41
    Equal                    = 42
    LBracket                 = 43
    RBracket                 = 44
    Backslash                = 45
    Semicolon                = 46
    Apostrophe               = 47
    Grave                    = 48
    Comma                    = 49
    Period                   = 50
    Slash                    = 51

    F1                       = 52
    F2                       = 53
    F3                       = 54
    F4                       = 55
    F5                       = 56
    F6                       = 57
    F7                       = 58
    F8                       = 59
    F9                       = 60
    F10                      = 61
    F11                      = 62
    F12                      = 63
    F13                      = 64
    F14                      = 65
    F15                      = 66
    F16                      = 67
    F17                      = 68
    F18                      = 69
    F19                      = 70
    F20                      = 71
    F21                      = 72
    F22                      = 73
    F23                      = 74
    F24                      = 75

    CapsLock                 = 76
    PrintScreen              = 77
    ScrollLock               = 78
    Pause                    = 79
    Insert                   = 80
    Home                     = 81
    PageUp                   = 82
    Delete                   = 83
    End                      = 84
    PageDown                 = 85
    Right                    = 86
    Left                     = 87
    Down                     = 88
    Up                       = 89

    NumLock                  = 90
    NumpadDivide             = 91
    NumpadMultiply           = 92
    NumpadMinus              = 93
    NumpadPlus               = 94
    NumpadEqual              = 95
    NumpadEnter              = 96
    NumpadDecimal            = 97
    Numpad1                  = 98
    Numpad2                  = 99
    Numpad3                  = 100
    Numpad4                  = 101
    Numpad5                  = 102
    Numpad6                  = 103
    Numpad7                  = 104
    Numpad8                  = 105
    Numpad9                  = 106
    Numpad0                  = 107

    NonUsBackslash           = 108
    Application              = 109
    Execute                  = 110
    ModeChange               = 111
    Help                     = 112
    Menu                     = 113
    Select                   = 114
    Redo                     = 115
    Undo                     = 116
    Cut                      = 117
    Copy                     = 118
    Paste                    = 119
    VolumeMute               = 120
    VolumeUp                 = 121
    VolumeDown               = 122
    MediaPlayPause           = 123
    MediaStop                = 124
    MediaNextTrack           = 125
    MediaPreviousTrack       = 126
    LControl                 = 127
    LShift                   = 128
    LAlt                     = 129
    LSystem                  = 130
    RControl                 = 131
    RShift                   = 132
    RAlt                     = 133
    RSystem                  = 134
    Back                     = 135
    Forward                  = 136
    Refresh                  = 137
    Stop                     = 138
    Search                   = 139
    Favorites                = 140
    HomePage                 = 141
    LaunchApplication1       = 142
    LaunchApplication2       = 143
    LaunchMail               = 144
    LaunchMediaSelect        = 145

    # Total number of scancodes
    SfScancodeCount          = LaunchMediaSelect + 1
  end
  attach_function :sfKeyboard_isKeyPressed,[:int],:bool #sfKeyCode
  attach_function :sfKeyboard_isScancodePressed,[:int],:bool #sfScancode
  attach_function :sfKeyboard_localize, [:int], :int #Scancode, #Keycode
  attach_function :sfKeyboard_delocalize, [:int], :int
  attach_function :sfKeyboard_getDescription, [:int], :string
  attach_function :sfKeyboard_setVirtualKeyboardVisible,[:bool],:void
  #Mouse
  module SfMouseButton
  	MouseLeft = 0
  	MouseRight = 1
  	MouseMiddle = 2
  	MouseButtonExtra1 = 3
  	MouseButtonExtra2 = 4
  	SfMouseButtonCount = MouseButtonExtra2 + 1
  end
  module SfMouseWheel
  	MouseVerticalWheel = 0
  	MouseHorizontalWheel = 1
  end
  attach_function :sfMouse_isButtonPressed,[:int],:bool
  attach_function :sfMouse_getPosition, [:pointer], SFML_SYSTEM::SfVector2i.by_value
  attach_function :sfMouse_setPosition,[SFML_SYSTEM::SfVector2i.by_value,:pointer],:void
  attach_function :sfMouse_getPositionWindowBase,[:pointer],SFML_SYSTEM::SfVector2i.by_value
  attach_function :sfMouse_setPositionWindowBase,[SFML_SYSTEM::SfVector2i.by_value,:pointer],:void
  #Sensor
  module SfSensorType
  	SensorAccelerometer = 0
  	SensorGyroscope = 1
  	SensorMagnetometer = 2
  	SensorGravity = 3
  	SensorUserAcceleration = 4
  	SensorOrientation = 5
  	SfSensorCount = SensorOrientation + 1
  end
  attach_function :sfSensor_isAvailable,[:int],:bool
  attach_function :sfSensor_setEnabled,[:int,:bool],:void
  attach_function :sfSensor_getValue,[:int],SFML_SYSTEM::SfVector3f.by_value
  #Event
  module SfEventType
  	EvtClosed = 0
  	EvtResized = 1
  	EvtFocusLost = 2
  	EvtFocusGained = 3
  	EvtTextEntered = 4
  	EvtKeyPressed = 5
  	EvtKeyReleased = 6
  	EvtMouseWheelScrolled = 7
  	EvtMouseButtonPressed = 8
  	EvtMouseButtonReleased = 9
  	EvtMouseMoved = 10
  	EvtMouseMovedRaw = 11
  	EvtMouseEntered = 12
  	EvtMouseLeft = 13
  	EvtJoystickButtonPressed = 14
  	EvtJoystickButtonReleased = 15
  	EvtJoystickMoved = 16
  	EvtJoystickConnected = 17
  	EvtJoystickDisconnected = 18
  	EvtTouchBegan = 19
  	EvtTouchMoved = 20
  	EvtTouchEnded = 21
  	EvtSensorChanged = 22
  	SfEvtCount = 23
  end
  class SfKeyEvent < FFI::Struct
  	layout :type, :int,
  		   :code, :int,
  		   :scancode, :int,
  		   :alt, :bool,
  		   :control, :bool,
  		   :shift, :bool,
  		   :system, :bool
  end
  class SfTextEvent < FFI::Struct
  	layout :type, :int,
  		   :unicode, :uint32
  end
  class SfMouseMoveEvent < FFI::Struct
  	layout :type, :int,
  	        :position, SFML_SYSTEM::SfVector2i.by_value
  end
  class SfMouseMoveRawEvent < FFI::Struct
  	layout :type, :int,
  		   :delta, SFML_SYSTEM::SfVector2i.by_value
  end
  class SfMouseButtonEvent < FFI::Struct
  	layout :type, :int,
  	       :button, :int,
  	       :position, SFML_SYSTEM::SfVector2i.by_value
  end
  class SfMouseWheelScrollEvent < FFI::Struct
  	layout :type, :int,
  		   :wheel, :int,
  		   :delta, :float,
  		   :position, SFML_SYSTEM::SfVector2i.by_value
  end
  class SfJoystickMoveEvent < FFI::Struct
  	layout :type, :int,
  		   :joystickID, :uint,
  		   :axis,  :int,
  		   :position, :float
  end
  class SfJoystickButtonEvent < FFI::Struct
  	layout :type, :int,
  		   :joystickId, :uint,
  		   :button, :uint
  end
  class SfJoystickConnectEvent < FFI::Struct
  	layout :type, :int,
  	      :joystickId, :uint
  end
  class SfSizeEvent < FFI::Struct
  	layout :type, :int,
  			:size, SFML_SYSTEM::SfVector2u.by_value
  end
  class SfTouchEvent < FFI::Struct
  	layout :type, :int,
  		:finger, :uint,
  		:position, SFML_SYSTEM::SfVector2i.by_value
  end
  class SfSensorEvent < FFI::Struct
  	layout :type, :int,
  		:sensorType, :int,
  		:value, SFML_SYSTEM::SfVector3f.by_value
  end
  class SfEvent < FFI::Union
  	layout :type, :int,
  		 :size, SfSizeEvent.by_value,
  		 :key, SfKeyEvent.by_value,
  		 :text, SfTextEvent.by_value,
  		 :mouseMove, SfMouseMoveEvent.by_value,
  		 :mouseMoveRaw, SfMouseMoveRawEvent.by_value,
  		 :mouseButton, SfMouseButtonEvent.by_value,
  		 :mouseWheelScroll, SfMouseWheelScrollEvent.by_value,
  		 :joystickMove, SfJoystickMoveEvent.by_value,
  		 :joystickButton, SfJoystickButtonEvent.by_value,
  		 :joystickConnect, SfJoystickConnectEvent.by_value,
  		 :touch, SfTouchEvent.by_value,
  		 :sensor, SfSensorEvent.by_value
  end
  #Vulkan
  attach_function :sfVulkan_isAvailable,[:bool],:bool
  attach_function :sfVulkan_getFunction,[:string],:pointer
  attach_function :sfVulkan_getGraphicsRequiredInstanceExtensions,[:pointer],:string
  #WindowBase
  module WindowStyle
  	None = 0
  	Titlebar = 1 << 0
  	Resize = 1 << 1
  	Close = 1 << 2
  	DefaultStyle = Titlebar | Resize | Close 
  end
  module WindowState
  	Windowed = 0
  	Fullscreen = 1
  end
  attach_function :sfWindowBase_create, [SfVideoMode.by_value, :string,:uint32,:int],:pointer
  attach_function :sfWindowBase_createUnicode, [SfVideoMode.by_value,:pointer,:uint32,:int],:pointer
  attach_function :sfWindowBase_createFromHandle,[:pointer],:pointer
  attach_function :sfWindowBase_destroy,[:pointer],:void
  attach_function :sfWindowBase_close,[:pointer],:void
  attach_function :sfWindowBase_isOpen,[:pointer],:bool
  attach_function :sfWindowBase_pollEvent,[:pointer,:pointer],:bool
  attach_function :sfWindowBase_waitEvent,[:pointer,SFML_SYSTEM::SfTime.by_value,:pointer],:bool
  attach_function :sfWindowBase_getPosition,[:pointer], SFML_SYSTEM::SfVector2i.by_value
  attach_function :sfWindowBase_setPosition,[:pointer,SFML_SYSTEM::SfVector2i.by_value],:void
  attach_function :sfWindowBase_getSize,[:pointer],SFML_SYSTEM::SfVector2u.by_value
  attach_function :sfWindowBase_setSize,[:pointer,SFML_SYSTEM::SfVector2u.by_value],:void
  attach_function :sfWindowBase_setMinimumSize,[:pointer,:pointer],:void
  attach_function :sfWindowBase_setMaximumSize,[:pointer,:pointer],:void
  attach_function :sfWindowBase_setTitle,[:pointer,:string],:void
  attach_function :sfWindowBase_setUnicodeTitle,[:pointer,:pointer],:void
  attach_function :sfWindowBase_setIcon,[:pointer,SFML_SYSTEM::SfVector2u.by_value,:pointer],:void
  attach_function :sfWindowBase_setVisible,[:pointer,:bool],:void
  attach_function :sfWindowBase_setMouseCursorVisible,[:pointer,:bool],:void
  attach_function :sfWindowBase_setMouseCursorGrabbed,[:pointer,:bool],:void
  attach_function :sfWindowBase_setMouseCursor,[:pointer,:pointer],:void
  attach_function :sfWindowBase_setKeyRepeatEnabled,[:pointer,:bool],:void
  attach_function :sfWindowBase_setJoystickThreshold,[:pointer,:float],:void
  attach_function :sfWindowBase_requestFocus,[:pointer],:void
  attach_function :sfWindowBase_hasFocus,[:pointer],:bool
  attach_function :sfWindowBase_getNativeHandle,[:pointer],:pointer
  attach_function :sfWindowBase_createVulkanSurface,[:pointer,:pointer,:pointer,:pointer],:bool
  #Window
  module SfContextAttribute
  	ContextDefault = 0
  	ContextCore = 1 << 0
  	ContextDebug = 1 << 2
  end
  class SfContextSettings < FFI::Struct
  	layout :depthBits, :uint,
  		    :stencilBits, :uint,
  		    :antiAliasingLevel, :uint,
  		    :majorVersion, :uint,
  		    :minorVersion, :uint,
  		    :attributeFlags, :uint32,
  		    :sRgbCapable, :bool
  end
  attach_function :sfWindow_create,[SfVideoMode.by_value,:string,:uint32,:int,:pointer],:pointer
  attach_function :sfWindow_createUnicode,[SfVideoMode.by_value,:pointer,:uint32,:int,:pointer],:pointer
  attach_function :sfWindow_createFromHandle,[:pointer,:pointer],:pointer
  attach_function :sfWindow_destroy,[:pointer],:void
  attach_function :sfWindow_close,[:pointer],:void
  attach_function :sfWindow_isOpen,[:pointer],:bool
  attach_function :sfWindow_getSettings,[:pointer], SfContextSettings.by_value
  attach_function :sfWindow_pollEvent,[:pointer,:pointer],:bool
  attach_function :sfWindow_waitEvent,[:pointer,SFML_SYSTEM::SfTime.by_value,:pointer],:bool
  attach_function :sfWindow_getPosition,[:pointer],SFML_SYSTEM::SfVector2i.by_value
  attach_function :sfWindow_setPosition,[:pointer,SFML_SYSTEM::SfVector2i.by_value],:void
  attach_function :sfWindow_getSize,[:pointer],SFML_SYSTEM::SfVector2u.by_value
  attach_function :sfWindow_setSize,[:pointer,SFML_SYSTEM::SfVector2u.by_value],:void
  attach_function :sfWindow_setMinimumSize,[:pointer,:pointer],:void
  attach_function :sfWindow_setMaximumSize,[:pointer,:pointer],:void
  attach_function :sfWindow_setTitle,[:pointer,:string],:void
  attach_function :sfWindow_setUnicodeTitle,[:pointer,:pointer],:void
  attach_function :sfWindow_setIcon,[:pointer,SFML_SYSTEM::SfVector2u.by_value,:pointer],:void
  attach_function :sfWindow_setVisible,[:pointer,:bool],:void
  attach_function :sfWindow_setVerticalSyncEnabled,[:pointer,:bool],:void
  attach_function :sfWindow_setMouseCursorVisible,[:pointer,:bool],:void
  attach_function :sfWindow_setMouseCursorGrabbed,[:pointer,:bool],:void
  attach_function :sfWindow_setMouseCursor,[:pointer,:pointer],:void
  attach_function :sfWindow_setKeyRepeatEnabled,[:pointer,:bool],:void
  attach_function :sfWindow_setFramerateLimit,[:pointer,:uint],:void
  attach_function :sfWindow_setJoystickThreshold,[:pointer,:float],:void
  attach_function :sfWindow_setActive,[:pointer,:bool],:bool
  attach_function :sfWindow_requestFocus,[:pointer],:void
  attach_function :sfWindow_hasFocus,[:pointer],:bool
  attach_function :sfWindow_display,[:pointer],:void
  attach_function :sfWindow_getNativeHandle,[:pointer],:pointer
  attach_function :sfWindow_createVulkanSurface,[:pointer,:pointer,:pointer,:pointer],:bool
  #Clipboard
  attach_function :sfClipboard_getString,[],:string
  attach_function :sfClipboard_getUnicodeString,[],:pointer
  attach_function :sfClipboard_setString,[:string],:void
  attach_function :sfClipboard_setUnicodeString,[:pointer],:void
  #Context
  attach_function :sfContext_create,[],:pointer
  attach_function :sfContext_destroy,[:pointer],:void
  attach_function :sfContext_isExtensionAvailable,[:string],:bool
  attach_function :sfContext_setActive,[:pointer,:bool],:bool
  attach_function :sfContext_getFunction,[:string],:pointer
  attach_function :sfContext_getSettings,[:pointer],SfContextSettings.by_value
  attach_function :sfContext_getActiveContextId,[],:uint64
end 