#Ruby SFML System Wrapper
#64 Bits SFML and Ruby
#Written by Andy P.
#Copyright 2026
require 'ffi'

module SFML_SYSTEM
	extend FFI::Library
	ffi_lib "C:/Users/g_and/OneDrive/Documents/Ruby/SFML3/csfml-system-3.dll"
	#Alloc
	attach_function :sfFree, [:pointer], :void
	#Buffer
	attach_function :sfBuffer_create, [], :pointer
	attach_function :sfBuffer_destroy, [:pointer], :void
	attach_function :sfBuffer_getSize, [:pointer], :size_t
	attach_function :sfBuffer_getData, [:pointer], :pointer
	#Time
	class SfTime < FFI::Struct
		layout :microseconds, :int64
	end
	attach_function :sfTime_asSeconds,[SfTime.by_value], :float
	attach_function :sfTime_asMilliseconds, [SfTime.by_value], :int32
	attach_function :sfTime_asMicroseconds, [SfTime.by_value], :int64
	attach_function :sfSeconds, [:float], SfTime.by_value
	attach_function :sfMilliseconds, [:int32], SfTime.by_value
	attach_function :sfMicroseconds, [:int64], SfTime.by_value
	#Clock
	attach_function :sfClock_create, [], :pointer
	attach_function :sfClock_copy, [:pointer], :pointer
	attach_function :sfClock_destroy, [:pointer], :void
	attach_function :sfClock_getElapsedTime, [:pointer], SfTime.by_value
	attach_function :sfClock_isRunning, [:pointer], :bool
	attach_function :sfClock_start, [:pointer], :void
	attach_function :sfClock_stop, [:pointer], :void
	attach_function :sfClock_restart, [:pointer], SfTime.by_value
	attach_function :sfClock_reset, [:pointer], SfTime.by_value
	#InputStream
	callback :read_func, [:pointer, :size_t, :pointer], :int64
	callback :seek_func, [:size_t,:pointer], :int64
	callback :tell_func, [:pointer], :int64
	callback :get_size_func, [:pointer], :int64
	class SfInputStream < FFI::Struct
		layout :read, :read_func,
			   :seek, :seek_func,
			   :tell, :tell_func,
			   :getSize, :get_size_func,
			   :userData, :pointer
	end
	#Vector2
	class SfVector2i < FFI::Struct
		layout :x, :int,
			   :y, :int
	end
	class SfVector2u < FFI::Struct
		layout :x, :uint,
			   :y, :uint
	end
	class SfVector2f < FFI::Struct
		layout :x, :float,
			   :y, :float
	end
	#Vector3
	class SfVector3f < FFI::Struct
		layout :x, :float,
		       :y, :float,
		       :z,  :float
	end
end