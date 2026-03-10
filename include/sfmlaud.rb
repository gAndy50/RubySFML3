#Ruby SFML Audio Wrapper
#64 Bits SFML and Ruby
#Written by Andy P.
#Copyright 2026
require 'ffi'

require_relative 'sfmlsys'

module SFML_AUDIO
	extend FFI::Library
	ffi_lib "csfml-audio-3.dll"
	#Listener
	class SfListenerCone < FFI::Struct
		layout  :innerAngle, :float,
			    :outerAngle, :float,
			    :outerGain,  :float
	end
	module SfSoundStatus
		sfStopped = 0
		sfPaused = 1
		sfPlaying = 2
	end
	module SfSoundChannel
		sfSoundChannelUnspecified = 0
		 sfSoundChannelMono = 1
 	sfSoundChannelFrontLeft = 2
 	sfSoundChannelFrontRight = 3
 	sfSoundChannelFrontCenter = 4
 	sfSoundChannelFrontLeftOfCenter = 5
 	sfSoundChannelFrontRightOfCenter = 6
 	sfSoundChannelLowFrequencyEffects = 7
	 sfSoundChannelBackLeft = 8
 	sfSoundChannelBackRight = 9
 	sfSoundChannelBackCenter = 10
 	sfSoundChannelSideLeft = 11
 	sfSoundChannelSideRight = 12
 	sfSoundChannelTopCenter = 13
 	sfSoundChannelTopFrontLeft = 14
 	sfSoundChannelTopFrontRight = 15
 	sfSoundChannelTopFrontCenter = 16
 	sfSoundChannelTopBackLeft = 17
 	sfSoundChannelTopBackRight = 18
 	sfSoundChannelTopBackCenter = 19
	end
	attach_function :sfListener_setGlobalVolume,[:float],:void
	attach_function :sfListener_getGlobalVolume,[],:float
	attach_function :sfListener_setPosition,[SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfListener_getPosition,[],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfListener_setDirection,[SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfListener_getDirection,[],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfListener_setVelocity,[SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfListener_getVelocity,[],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfListener_setCone,[:int],:void
	attach_function :sfListener_getCone,[],:int
	attach_function :sfListener_setUpVector,[SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfListener_getUpVector,[],SFML_SYSTEM::SfVector3f.by_value
	#Sound
	attach_function :sfSound_create,[:pointer], :pointer
	attach_function :sfSound_copy,[:pointer],:pointer
	attach_function :sfSound_destroy,[:pointer], :void
	attach_function :sfSound_play,[:pointer],:void
	attach_function :sfSound_pause,[:pointer],:void
	attach_function :sfSound_stop,[:pointer],:void
	attach_function :sfSound_setBuffer,[:pointer,:pointer],:void
	attach_function :sfSound_getBuffer,[:pointer],:pointer
	attach_function :sfSound_setLooping,[:pointer,:bool],:void
	attach_function :sfSound_isLooping,[:pointer],:bool
	attach_function :sfSound_getStatus,[:pointer],:int
	attach_function :sfSound_setPitch,[:pointer,:float],:void
	attach_function :sfSound_setPan,[:pointer,:float],:void
	attach_function :sfSound_setVolume,[:pointer,:float],:void
	attach_function :sfSound_setSpatializationEnabled,[:pointer,:bool],:void
	attach_function :sfSound_setPosition,[:pointer,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfSound_setDirection,[:pointer,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfSound_setCone,[:pointer,:int],:void
	attach_function :sfSound_setVelocity,[:pointer,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfSound_setDopplerFactor,[:pointer,:float],:void
	attach_function :sfSound_setDirectionalAttenuationFactor,[:pointer,:float],:void
	attach_function :sfSound_setRelativeToListener,[:pointer,:bool],:void
	attach_function :sfSound_setMinDistance,[:pointer,:float],:void
	attach_function :sfSound_setMaxDistance,[:pointer,:float],:void
	attach_function :sfSound_setMinGain,[:pointer,:float],:void
	attach_function :sfSound_setMaxGain,[:pointer,:float],:void
	attach_function :sfSound_setAttenuation,[:pointer,:float],:void
	attach_function :sfSound_setPlayingOffset,[:pointer,SFML_SYSTEM::SfTime.by_value],:void
	attach_function :sfSound_setEffectProcessor,[:pointer,:pointer],:void
	attach_function :sfSound_getPitch,[:pointer],:float
	attach_function :sfSound_getPan,[:pointer],:float
	attach_function :sfSound_getVolume,[:pointer],:float
	attach_function :sfSound_isSpatializationEnabled,[:pointer],:bool
	attach_function :sfSound_getPosition,[:pointer],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfSound_getDirection,[:pointer],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfSound_getCone,[:pointer],:int
	attach_function :sfSound_getVelocity,[:pointer],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfSound_getDopplerFactor,[:pointer],:float
	attach_function :sfSound_getDirectionalAttenuationFactor,[:pointer],:float
	attach_function :sfSound_isRelativeToListener,[:pointer],:bool
	attach_function :sfSound_getMinDistance,[:pointer],:float
	attach_function :sfSound_getMaxDistance,[:pointer],:float	
	attach_function :sfSound_getMinGain,[:pointer],:float
	attach_function :sfSound_getMaxGain,[:pointer],:float
	attach_function :sfSound_getAttenuation,[:pointer],:float
	attach_function :sfSound_getPlayingOffset,[:pointer],SFML_SYSTEM::SfTime.by_value	
	#Music
	class SfTimeSpan < FFI::Struct
		layout :offset, SFML_SYSTEM::SfTime.by_value,
		       :length, SFML_SYSTEM::SfTime.by_value
	end
	attach_function :sfMusic_createFromFile,[:string],:pointer
	attach_function :sfMusic_createFromMemory,[:pointer,:size_t],:pointer
	attach_function :sfMusic_createFromStream,[:pointer],:pointer
	attach_function :sfMusic_destroy,[:pointer],:void
	attach_function :sfMusic_setLooping,[:pointer,:bool],:void
	attach_function :sfMusic_isLooping,[:pointer],:bool
	attach_function :sfMusic_setEffectProcessor,[:pointer,:pointer],:void
	attach_function :sfMusic_getDuration,[:pointer],SFML_SYSTEM::SfTime.by_value
	attach_function :sfMusic_getLoopPoints,[:pointer],SFML_SYSTEM::SfTime.by_value
	attach_function :sfMusic_setLoopPoints,[:pointer,SFML_SYSTEM::SfTime.by_value],:void
	attach_function :sfMusic_play,[:pointer],:void
	attach_function :sfMusic_pause,[:pointer],:void
	attach_function :sfMusic_stop,[:pointer],:void
	attach_function :sfMusic_getChannelCount,[:pointer],:uint
	attach_function :sfMusic_getSampleRate,[:pointer],:uint
	attach_function :sfMusic_getChannelMap,[:pointer,:pointer],:pointer
	attach_function :sfMusic_getStatus,[:pointer],:int
	attach_function :sfMusic_getPlayingOffset,[:pointer],SFML_SYSTEM::SfTime.by_value
	attach_function :sfMusic_setPitch,[:pointer,:float],:void
	attach_function :sfMusic_setPan,[:pointer,:float],:void
	attach_function :sfMusic_setVolume,[:pointer,:float],:void
	attach_function :sfMusic_setSpatializationEnabled,[:pointer,:bool],:void
	attach_function :sfMusic_setPosition,[:pointer,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfMusic_setDirection,[:pointer,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfMusic_setCone,[:pointer,:int],:void
	attach_function :sfMusic_setVelocity,[:pointer,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfMusic_setDopplerFactor,[:pointer,:float],:void
	attach_function :sfMusic_setDirectionalAttenuationFactor,[:pointer,:float],:void
	attach_function :sfMusic_setRelativeToListener,[:pointer,:bool],:void
	attach_function :sfMusic_setMinDistance,[:pointer,:float],:void
	attach_function :sfMusic_setMaxDistance,[:pointer,:float],:void
	attach_function :sfMusic_setMinGain,[:pointer,:float],:void
	attach_function :sfMusic_setMaxGain,[:pointer,:float],:void
	attach_function :sfMusic_setAttenuation,[:pointer,:float],:void
	attach_function :sfMusic_setPlayingOffset,[:pointer,SFML_SYSTEM::SfTime.by_value],:void
	attach_function :sfMusic_getPitch,[:pointer],:float
	attach_function :sfMusic_getPan,[:pointer],:float
	attach_function :sfMusic_isSpatializationEnabled,[:pointer],:bool
	attach_function :sfMusic_getVolume,[:pointer],:float
	attach_function :sfMusic_getPosition,[:pointer],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfMusic_getDirection,[:pointer],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfMusic_getCone,[:pointer],:int
	attach_function :sfMusic_getVelocity,[:pointer],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfMusic_getDopplerFactor,[:pointer],:float
	attach_function :sfMusic_getDirectionalAttenuationFactor,[:pointer],:float
	attach_function :sfMusic_isRelativeToListener,[:pointer],:bool
	attach_function :sfMusic_getMinDistance,[:pointer],:float
	attach_function :sfMusic_getMaxDistance,[:pointer],:float
	attach_function :sfMusic_getMinGain,[:pointer],:float
	attach_function :sfMusic_getMaxGain,[:pointer],:float
	attach_function :sfMusic_getAttenuation,[:pointer],:float
	#SoundBuffer
	attach_function :sfSoundBuffer_createFromFile,[:string],:pointer
	attach_function :sfSoundBuffer_createFromMemory,[:pointer,:size_t],:pointer
	attach_function :sfSoundBuffer_createFromStream,[:pointer],:pointer
	attach_function :sfSoundBuffer_createFromSamples,[:pointer,:uint64,:uint,:uint,:pointer,:size_t],:pointer
	attach_function :sfSoundBuffer_copy,[:pointer],:pointer
	attach_function :sfSoundBuffer_destroy,[:pointer],:void
	attach_function :sfSoundBuffer_saveToFile,[:pointer,:string],:bool
	attach_function :sfSoundBuffer_getSamples,[:pointer],:pointer
	attach_function :sfSoundBuffer_getSampleCount,[:pointer],:uint64
	attach_function :sfSoundBuffer_getSampleRate,[:pointer],:uint
	attach_function :sfSoundBuffer_getChannelCount,[:pointer],:uint
	attach_function :sfSoundBuffer_getChannelMap,[:pointer,:pointer],:pointer
	attach_function :sfSoundBuffer_getDuration,[:pointer],SFML_SYSTEM::SfTime.by_value
	#SoundBufferRecorder
	attach_function :sfSoundBufferRecorder_create,[],:pointer
	attach_function :sfSoundBufferRecorder_destroy,[:pointer],:void
	attach_function :sfSoundBufferRecorder_start,[:pointer,:uint],:bool
	attach_function :sfSoundBufferRecorder_stop,[:pointer],:void
	attach_function :sfSoundBufferRecorder_getSampleRate,[:pointer],:uint
	attach_function :sfSoundBufferRecorder_getBuffer,[:pointer],:pointer
	attach_function :sfSoundBufferRecorder_setDevice,[:pointer,:string],:bool
	attach_function :sfSoundBufferRecorder_getDevice,[:pointer],:string
	attach_function :sfSoundBufferRecorder_setChannelCount,[:pointer,:uint],:void
	attach_function :sfSoundBufferRecorder_getChannelCount,[:pointer],:uint
	#SoundRecorder
	callback :sfSoundRecorderStartCallback,[:pointer],:bool
	callback :sfSoundRecorderProcessCallback,[:pointer,:size_t,:pointer],:bool
	callback :sfSoundRecorderStopCallback,[:pointer],:void
	attach_function :sfSoundRecorder_create,[:pointer,:pointer,:pointer],:pointer
	attach_function :sfSoundRecorder_destroy,[:pointer],:void
	attach_function :sfSoundRecorder_start,[:pointer,:uint],:bool
	attach_function :sfSoundRecorder_stop,[:pointer],:void
	attach_function :sfSoundRecorder_getSampleRate,[:pointer],:uint
	attach_function :sfSoundRecorder_isAvailable,[],:bool
	attach_function :sfSoundRecorder_getAvailableDevices,[:pointer],:pointer
	attach_function :sfSoundRecorder_getDefaultDevice,[],:string
	attach_function :sfSoundRecorder_setDevice,[:pointer,:string],:bool
	attach_function :sfSoundRecorder_getDevice,[:pointer],:string
	attach_function :sfSoundRecorder_setChannelCount,[:pointer,:uint],:void
	attach_function :sfSoundRecorder_getChannelCount,[:pointer],:uint
	attach_function :sfSoundRecorder_getChannelMap,[:pointer,:pointer],:pointer
	#SoundStream
	class SfSoundStreamChunk < FFI::Struct
		layout :samples, :pointer,
		       :sampleCount, :uint
	end
	callback :sfSoundStreamGetDataCallback,[SfSoundStreamChunk.by_ref,:pointer],:bool
	callback :sfSoundStreamSeekCallback,[:int64,:pointer],:void
	attach_function :sfSoundStream_create,[:sfSoundStreamGetDataCallback,:sfSoundStreamSeekCallback,:uint,:uint,:pointer,:size_t,:pointer],:pointer
	attach_function :sfSoundStream_destroy,[:pointer],:void
	attach_function :sfSoundStream_play,[:pointer],:void
	attach_function :sfSoundStream_pause,[:pointer],:void
	attach_function :sfSoundStream_stop,[:pointer],:void
	attach_function :sfSoundStream_getStatus,[:pointer],:int
	attach_function :sfSoundStream_getChannelCount,[:pointer],:uint
	attach_function :sfSoundStream_getSampleRate,[:pointer],:uint
	attach_function :sfSoundStream_getChannelMap,[:pointer,:pointer],:pointer
	attach_function :sfSoundStream_setPitch,[:pointer,:float],:void
	attach_function :sfSoundStream_setPan,[:pointer,:float],:void
	attach_function :sfSoundStream_setVolume,[:pointer,:float],:void
	attach_function :sfSoundStream_setSpatializationEnabled,[:pointer,:bool],:void
	attach_function :sfSoundStream_setPosition,[:pointer,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfSoundStream_setDirection,[:pointer,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfSoundStream_setCone,[:pointer,:int],:void
	attach_function :sfSoundStream_setVelocity,[:pointer,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfSoundStream_setDopplerFactor,[:pointer,:float],:void
	attach_function :sfSoundStream_setDirectionalAttenuationFactor,[:pointer,:float],:void
	attach_function :sfSoundStream_setRelativeToListener,[:pointer,:bool],:void
	attach_function :sfSoundStream_setMinDistance,[:pointer,:float],:void
	attach_function :sfSoundStream_setMaxDistance,[:pointer,:float],:void
	attach_function :sfSoundStream_setMinGain,[:pointer,:float],:void
	attach_function :sfSoundStream_setMaxGain,[:pointer,:float],:void
	attach_function :sfSoundStream_setAttenuation,[:pointer,:float],:void
	attach_function :sfSoundStream_setPlayingOffset,[:pointer,SFML_SYSTEM::SfTime.by_value],:void
	attach_function :sfSoundStream_setLooping,[:pointer,:bool],:void
	attach_function :sfSoundStream_getPitch,[:pointer],:float
	attach_function :sfSoundStream_getPan,[:pointer],:float
	attach_function :sfSoundStream_getVolume,[:pointer],:float
	attach_function :sfSoundStream_isSpatializationEnabled,[:pointer],:bool
	attach_function :sfSoundStream_getPosition,[:pointer],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfSoundStream_getDirection,[:pointer],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfSoundStream_getCone,[:pointer],:int
	attach_function :sfSoundStream_getVelocity,[:pointer],SFML_SYSTEM::SfVector3f.by_value
	attach_function :sfSoundStream_getDopplerFactor,[:pointer],:float
	attach_function :sfSoundStream_getDirectionalAttenuationFactor,[:pointer],:float
	attach_function :sfSoundStream_isRelativeToListener,[:pointer],:bool
	attach_function :sfSoundStream_getMinDistance,[:pointer],:float
	attach_function :sfSoundStream_getMaxDistance,[:pointer],:float
	attach_function :sfSoundStream_getMinGain,[:pointer],:float
	attach_function :sfSoundStream_getMaxGain,[:pointer],:float
	attach_function :sfSoundStream_getAttenuation,[:pointer],:float
	attach_function :sfSoundStream_isLooping,[:pointer],:bool
	attach_function :sfSoundStream_setEffectProcessor,[:pointer,:pointer],:void
	attach_function :sfSoundStream_getPlayingOffset,[:pointer],SFML_SYSTEM::SfTime.by_value

end
