#Ruby SFML Graphics Wrapper
#64 Bits SFML and Ruby
#Written by Andy P.
#Copyright 2026
require 'ffi'
require_relative 'sfmlsys'
require_relative 'sfmlwin'

module SFML_GRAPHICS
	extend FFI::Library
	ffi_lib "C:/Users/g_and/OneDrive/Documents/Ruby/SFML3/csfml-graphics-3.dll"
	#Blendmode
	module SfBlendFactor
		BlendFactorZero = 0
		BlendFactorOne = 1
		BlendFactorSrcColor = 2
		BlendFactorOneMinusSrcColor = 3
		BlendFactorDstColor = 4
		BlendFactorOneMinusDstColor = 5
		BlendFactorSrcAlpha = 6
		BlendFactorOneMinusSrcAlpha = 7
		BlendFactorDstAlpha = 8
		BlendFactorOneMinusDstAlpha = 9
	end
	module SfBlendEquation
		BlendEquationAdd = 0
		BlendEquationSubstract = 1
		BlendEquationReverseSubtract = 2
		BlendEquationMin = 3
		BlendEquationMax = 4
	end
	class SfBlendmode < FFI::Struct
		layout :colorSrcFactor, :int,
			   :colorDstFactor, :int,
			   :colorEquation, :int,
			   :alphaSrcFactor, :int,
			   :alphaDstFactor, :int,
			   :alphaEquation, :int
	end
	#Color
	class SfColor < FFI::Struct
		layout :r, :uint8,
			   :g, :uint8,
			   :b, :uint8,
			   :a, :uint8
	end
	attach_function :sfColor_fromRGB,[:uint8,:uint8,:uint8], SfColor.by_value
	attach_function :sfColor_fromRGBA,[:uint8,:uint8,:uint8,:uint8],SfColor.by_value
	attach_function :sfColor_fromInteger,[:uint32],SfColor.by_value
	attach_function :sfColor_fromInteger,[:uint32],SfColor.by_value
	attach_function :sfColor_toInteger,[SfColor.by_value],:uint32
	attach_function :sfColor_add,[SfColor.by_value,SfColor.by_value],SfColor.by_value
	attach_function :sfColor_subtract,[SfColor.by_value,SfColor.by_value],SfColor.by_value
	attach_function :sfColor_modulate,[SfColor.by_value,SfColor.by_value],SfColor.by_value
	#Rect
	class SfFloatRect < FFI::Struct
		layout :position, SFML_SYSTEM::SfVector2i.by_value,
			   :size, SFML_SYSTEM::SfVector2i.by_value
	end
	class SfIntRect < FFI::Struct
		layout :position, SFML_SYSTEM::SfVector2i.by_value,
			   :size, SFML_SYSTEM::SfVector2i.by_value
	end
	attach_function :sfFloatRect_contains,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:bool
	attach_function :sfIntRect_contains,[:pointer,SFML_SYSTEM::SfVector2i.by_value],:bool
	attach_function :sfFloatRect_intersects,[:pointer,:pointer,:pointer],:bool
	attach_function :sfIntRect_intersects,[:pointer,:pointer,:pointer],:bool
	#Transform
	class SfTransform < FFI::Struct
		layout :matrix, [:float,9]
	end
	attach_function :sfTransform_fromMatrix,[:float,:float,:float,:float,:float,:float,:float,:float,:float],SfTransform.by_value
	attach_function :sfTransform_getMatrix,[:pointer,:pointer],:void
	attach_function :sfTransform_getInverse,[:pointer],SfTransform.by_value
	attach_function :sfTransform_transformPoint,[:pointer,SFML_SYSTEM::SfVector2f.by_value],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfTransform_transformRect,[:pointer,SfFloatRect.by_value],SfFloatRect.by_value
	attach_function :sfTransform_combine,[:pointer,:pointer],:void
	attach_function :sfTransform_translate,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfTransform_rotate,[:pointer,:float],:void
	attach_function :sfTransform_rotateWithCenter,[:pointer,:float,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfTransform_scale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfTransform_scaleWithCenter,[:pointer,SFML_SYSTEM::SfVector2f.by_value,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfTransform_equal,[:pointer,:pointer],:bool
	#PrimitiveTypes
	module SFPrimitiveType
		sfPoints = 0
		sfLines = 1
		sfLineStrip = 2
		sfTriangles = 3
		sfTriangleStrip = 4
		sfTriangleFan = 5
	end
	#CoordinateType
	module SfCoordinateType
		sfCoordinateTypeNormalized = 0
		sfCoordinateTypePixels = 1
	end
	#StencilMode
	module SfStencilComparison
		sfStencilComparisonNever = 0
		sfStencilComparisonLess = 1
		sfStencilComparisonLessEqual = 2
		sfStencilComparisonGreater = 3
		sfStencilComparisonGreaterEqual = 4
		sfStencilComparisonEqual = 5
		sfStencilComparisonNotEqual = 6
		sfStencilComparisonAlways = 7
	end
	module SfStencilUpdateOperation
		sfStencilUpdateOperationKeep = 0
		sfStencilUpdateOperationZero = 1
		sfStencilUpdateOperationReplace = 2
		sfStencilUpdateOperationIncrement = 3
		sfStencilUpdateOperationDecrement = 4
		sfStencilUpdateOperationInvert = 5
	end
	class SfStencilValue < FFI::Struct
		layout :value, :uint
	end
	class SfStencilMode < FFI::Struct
		layout :stencilComparsion, :int,
			    :stencilUpdateOperation, :int,
			    :stencilReference, SfStencilValue.by_value,
			    :stencilMask, SfStencilValue.by_value,
			    :stencilOnly, :bool
	end
	#RenderStates
	class SfRenderStates < FFI::Struct
		layout :blendMode, :int,
			   :stencilMode, :int,
			   :transform, SfTransform.by_value,
			   :coordinateType, :int,
			   :texture, :pointer,
			   :shader, :pointer
	end
	#Vertex
	class SfVertex < FFI::Struct
		layout :position, SFML_SYSTEM::SfVector2f.by_value,
			   :color, SfColor.by_value,
			   :texCoords, SFML_SYSTEM::SfVector2f.by_value
	end
	#CircleShape
	attach_function :sfCircleShape_create,[],:pointer
	attach_function :sfCircleShape_copy,[:pointer],:pointer
	attach_function :sfCircleShape_destroy,[:pointer],:void
	attach_function :sfCircleShape_setPosition,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfCircleShape_setRotation,[:pointer,:float],:void
	attach_function :sfCircleShape_setScale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfCircleShape_setOrigin,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfCircleShape_getPosition,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfCircleShape_getRotation,[:pointer],:float
	attach_function :sfCircleShape_getScale,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfCircleShape_getOrigin,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfCircleShape_move,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfCircleShape_rotate,[:pointer,:float],:void
	attach_function :sfCircleShape_scale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfCircleShape_getTransform,[:pointer],SfTransform.by_value
	attach_function :sfCircleShape_getInverseTransform,[:pointer],SfTransform.by_value
	attach_function :sfCircleShape_setTexture,[:pointer,:pointer,:bool],:void
	attach_function :sfCircleShape_setTextureRect,[:pointer,SfIntRect.by_value],:void
	attach_function :sfCircleShape_setFillColor,[:pointer,SfColor.by_value],:void
	attach_function :sfCircleShape_setOutlineColor,[:pointer,SfColor.by_value],:void
	attach_function :sfCircleShape_setOutlineThickness,[:pointer,:float],:void
	attach_function :sfCircleShape_getTexture,[:pointer],:pointer
	attach_function :sfCircleShape_getTextureRect,[:pointer],SfIntRect.by_value
	attach_function :sfCircleShape_getFillColor,[:pointer],SfColor.by_value
	attach_function :sfCircleShape_getOutlineColor,[:pointer],SfColor.by_value
	attach_function :sfCircleShape_getOutlineThickness,[:pointer],:float
	attach_function :sfCircleShape_getPointCount,[:pointer],:size_t
	attach_function :sfCircleShape_getPoint,[:pointer,:size_t],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfCircleShape_getGeometricCenter,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfCircleShape_setRadius,[:pointer,:float],:void
	attach_function :sfCircleShape_getRadius,[:pointer],:float
	attach_function :sfCircleShape_setPointCount,[:pointer,:size_t],:void
	attach_function :sfCircleShape_getLocalBounds,[:pointer],SfFloatRect.by_value
	attach_function :sfCircleShape_getGlobalBounds,[:pointer],SfFloatRect.by_value
	#RenderWindow
	attach_function :sfRenderWindow_create,[SFML_WIN::SfVideoMode.by_value,:string,:uint32,:int,:pointer],:pointer
	attach_function :sfRenderWindow_createUnicode,[SFML_WIN::SfVideoMode.by_value,:pointer,:uint32,:int,:pointer],:pointer
	attach_function :sfRenderWindow_createFromHandle,[:pointer,:pointer],:pointer
	attach_function :sfRenderWindow_destroy,[:pointer],:void
	attach_function :sfRenderWindow_close,[:pointer],:void
	attach_function :sfRenderWindow_isOpen,[:pointer],:bool
	attach_function :sfRenderWindow_getSettings,[:pointer],SFML_WIN::SfContextSettings.by_value
	attach_function :sfRenderWindow_pollEvent,[:pointer,:pointer],:bool
	attach_function :sfRenderWindow_waitEvent,[:pointer,SFML_SYSTEM::SfTime.by_value,:pointer],:bool
	attach_function :sfRenderWindow_getPosition,[:pointer],SFML_SYSTEM::SfVector2i.by_value
	attach_function :sfRenderWindow_setPosition,[:pointer,SFML_SYSTEM::SfVector2i.by_value],:void
	attach_function :sfRenderWindow_getSize,[:pointer],SFML_SYSTEM::SfVector2u.by_value
	attach_function :sfRenderWindow_isSrgb,[:pointer],:bool
	attach_function :sfRenderWindow_setSize,[:pointer,SFML_SYSTEM::SfVector2u.by_value],:void
	attach_function :sfRenderWindow_setMinimumSize,[:pointer,:pointer],:void
	attach_function :sfRenderWindow_setMaximumSize,[:pointer,:pointer],:void
	attach_function :sfRenderWindow_setTitle,[:pointer,:string],:void
	attach_function :sfRenderWindow_setUnicodeTitle,[:pointer,:pointer],:void
	attach_function :sfRenderWindow_setIcon,[:pointer,SFML_SYSTEM::SfVector2u.by_value,:pointer],:void
	attach_function :sfRenderWindow_setVisible,[:pointer,:bool],:void
	attach_function :sfRenderWindow_setVerticalSyncEnabled,[:pointer,:bool],:void
	attach_function :sfRenderWindow_setMouseCursorVisible,[:pointer,:bool],:void
	attach_function :sfRenderWindow_setMouseCursorGrabbed,[:pointer,:bool],:void
	attach_function :sfRenderWindow_setMouseCursor,[:pointer,:pointer],:void
	attach_function :sfRenderWindow_setKeyRepeatEnabled,[:pointer,:bool],:void
	attach_function :sfRenderWindow_setFramerateLimit,[:pointer,:uint],:void
	attach_function :sfRenderWindow_setJoystickThreshold,[:pointer,:float],:void
	attach_function :sfRenderWindow_setActive,[:pointer,:bool],:bool
	attach_function :sfRenderWindow_requestFocus,[:pointer],:void
	attach_function :sfRenderWindow_hasFocus,[:pointer],:bool
	attach_function :sfRenderWindow_display,[:pointer],:void
	attach_function :sfRenderWindow_getNativeHandle,[:pointer],:pointer
	attach_function :sfRenderWindow_clear,[:pointer,SfColor.by_value],:void
	attach_function :sfRenderWindow_clearStencil,[:pointer,SfStencilValue.by_value],:void
	attach_function :sfRenderWindow_clearColorAndStencil,[:pointer,SfColor.by_value,SfStencilValue.by_value],:void
	attach_function :sfRenderWindow_setView,[:pointer,:pointer],:void
	attach_function :sfRenderWindow_getView,[:pointer],:pointer
	attach_function :sfRenderWindow_getDefaultView,[:pointer],:pointer
	attach_function :sfRenderWindow_getViewport,[:pointer,:pointer],SfIntRect.by_value
	attach_function :sfRenderWindow_getScissor,[:pointer,:pointer],SfIntRect.by_value
	attach_function :sfRenderWindow_mapPixelToCoords,[:pointer,SFML_SYSTEM::SfVector2i.by_value,:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfRenderWindow_mapCoordsToPixel,[:pointer,SFML_SYSTEM::SfVector2f.by_value,:pointer],SFML_SYSTEM::SfVector2i.by_value
	attach_function :sfRenderWindow_drawSprite,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderWindow_drawText,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderWindow_drawCircleShape,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderWindow_drawConvexShape,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderWindow_drawRectangleShape,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderWindow_drawVertexArray,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderWindow_drawVertexBuffer,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderWindow_drawVertexBufferRange,[:pointer,:pointer,:size_t,:size_t,:pointer],:void
	attach_function :sfRenderWindow_drawPrimitives,[:pointer,:pointer,:size_t,:int,:pointer],:void
	attach_function :sfRenderWindow_pushGLStates,[:pointer],:void
	attach_function :sfRenderWindow_popGLStates,[:pointer],:void
	attach_function :sfRenderWindow_resetGLStates,[:pointer],:void
	attach_function :sfMouse_getPositionRenderWindow,[:pointer],SFML_SYSTEM::SfVector2i.by_value
	attach_function :sfMouse_setPositionRenderWindow,[SFML_SYSTEM::SfVector2i.by_value,:pointer],:void
	attach_function :sfTouch_getPositionRenderWindow,[:uint,:pointer],SFML_SYSTEM::SfVector2i.by_value
	attach_function :sfRenderWindow_createVulkanSurface,[:pointer,:pointer,:pointer,:pointer],:bool
	#ConvexShape
	attach_function :sfConvexShape_create,[],:pointer
	attach_function :sfConvexShape_copy,[:pointer],:pointer
	attach_function :sfConvexShape_destroy,[:pointer],:void
	attach_function :sfConvexShape_setPosition,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfConvexShape_setRotation,[:pointer,:float],:void
	attach_function :sfConvexShape_setScale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfConvexShape_setOrigin,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfConvexShape_getPosition,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfConvexShape_getRotation,[:pointer],:float
	attach_function :sfConvexShape_getScale,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfConvexShape_getOrigin,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfConvexShape_move,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfConvexShape_rotate,[:pointer,:float],:void
	attach_function :sfConvexShape_scale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfConvexShape_getTransform,[:pointer],SfTransform.by_value
	attach_function :sfConvexShape_getInverseTransform,[:pointer],SfTransform.by_value
	attach_function :sfConvexShape_setTexture,[:pointer,:pointer,:bool],:void
	attach_function :sfConvexShape_setTextureRect,[:pointer,SfIntRect.by_value],:void
	attach_function :sfConvexShape_setFillColor,[:pointer,SfColor.by_value],:void
	attach_function :sfConvexShape_setOutlineColor,[:pointer,SfColor.by_value],:void
	attach_function :sfConvexShape_setOutlineThickness,[:pointer,:float],:void
	attach_function :sfConvexShape_getTexture,[:pointer],:pointer
	attach_function :sfConvexShape_getTextureRect,[:pointer],SfIntRect.by_value
	attach_function :sfConvexShape_getFillColor,[:pointer],SfColor.by_value
	attach_function :sfConvexShape_getOutlineColor,[:pointer],SfColor.by_value
	attach_function :sfConvexShape_getOutlineThickness,[:pointer],:float
	attach_function :sfConvexShape_getPointCount,[:pointer],:size_t
	attach_function :sfConvexShape_getPoint,[:pointer,:size_t],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfConvexShape_getGeometricCenter,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfConvexShape_setPointCount,[:pointer,:size_t],:void
	attach_function :sfConvexShape_setPoint,[:pointer,:size_t,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfConvexShape_getLocalBounds,[:pointer],SfFloatRect.by_value
	attach_function :sfConvexShape_getGlobalBounds,[:pointer],SfFloatRect.by_value
	#FontInfo
	class SfFontInfo < FFI::Struct
		layout :family, :string
	end
	#Glyph
	class SfGlyph < FFI::Struct
		layout :advance, :float,
			   :bounds, SfFloatRect.by_value,
			   :textureRect, SfIntRect.by_value
	end
	#Font
	attach_function :sfFont_createFromFile,[:string],:pointer
	attach_function :sfFont_createFromMemory,[:pointer,:size_t],:pointer
	attach_function :sfFont_createFromStream,[:pointer],:pointer
	attach_function :sfFont_copy,[:pointer],:pointer
	attach_function :sfFont_destroy,[:pointer],:void
	attach_function :sfFont_getGlyph,[:pointer,:uint32,:uint,:bool,:float],SfGlyph.by_value
	attach_function :sfFont_hasGlyph,[:pointer,:uint32],:bool
	attach_function :sfFont_getKerning,[:pointer,:uint32,:uint32,:uint],:float
	attach_function :sfFont_getBoldKerning,[:pointer,:uint32,:uint32,:uint],:float
	attach_function :sfFont_getLineSpacing,[:pointer,:uint],:float
	attach_function :sfFont_getUnderlinePosition,[:pointer,:uint],:float
	attach_function :sfFont_getUnderlineThickness,[:pointer,:uint],:float
	attach_function :sfFont_getTexture,[:pointer,:uint],:pointer
	attach_function :sfFont_setSmooth,[:pointer,:bool],:void
	attach_function :sfFont_isSmooth,[:pointer],:bool
	attach_function :sfFont_getInfo,[:pointer],SfFontInfo.by_value
	#Image
	attach_function :sfImage_create,[SFML_SYSTEM::SfVector2u.by_value],:pointer
	attach_function :sfImage_createFromColor,[SFML_SYSTEM::SfVector2u.by_value,SfColor.by_value],:pointer
	attach_function :sfImage_createFromPixels,[SFML_SYSTEM::SfVector2u.by_value,:pointer],:pointer
	attach_function :sfImage_createFromFile,[:string],:pointer
	attach_function :sfImage_createFromMemory,[:pointer,:size_t],:pointer
	attach_function :sfImage_createFromStream,[:pointer],:pointer
	attach_function :sfImage_copy,[:pointer],:pointer
	attach_function :sfImage_destroy,[:pointer],:void
	attach_function :sfImage_saveToFile,[:pointer,:string],:bool
	attach_function :sfImage_saveToMemory,[:pointer,:pointer,:string],:bool
	attach_function :sfImage_getSize,[:pointer],SFML_SYSTEM::SfVector2u.by_value
	attach_function :sfImage_createMaskFromColor,[:pointer,SfColor.by_value,:uint8],:void
	attach_function :sfImage_copyImage,[:pointer,:pointer,SFML_SYSTEM::SfVector2u.by_value,SfIntRect.by_value,:bool],:bool
	attach_function :sfImage_setPixel,[:pointer,SFML_SYSTEM::SfVector2u.by_value,SfColor.by_value],:void
	attach_function :sfImage_getPixel,[:pointer,SFML_SYSTEM::SfVector2u.by_value],SfColor.by_value
	attach_function :sfImage_getPixelsPtr,[:pointer],:pointer
	attach_function :sfImage_flipHorizontally,[:pointer],:void
	attach_function :sfImage_flipVertically,[:pointer],:void
	#RectangleShape
	attach_function :sfRectangleShape_create,[],:pointer
	attach_function :sfRectangleShape_copy,[:pointer],:pointer
	attach_function :sfRectangleShape_destroy,[:pointer],:void
	attach_function :sfRectangleShape_setPosition,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfRectangleShape_setRotation,[:pointer,:float],:void
	attach_function :sfRectangleShape_setScale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfRectangleShape_setOrigin,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfRectangleShape_getPosition,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfRectangleShape_getRotation,[:pointer],:float
	attach_function :sfRectangleShape_getScale,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfRectangleShape_getOrigin,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfRectangleShape_move,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfRectangleShape_rotate,[:pointer,:float],:void
	attach_function :sfRectangleShape_scale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfRectangleShape_getTransform,[:pointer],SfTransform.by_value
	attach_function :sfRectangleShape_getInverseTransform,[:pointer],SfTransform.by_value
	attach_function :sfRectangleShape_setTexture,[:pointer,:pointer,:bool],:void
	attach_function :sfRectangleShape_setTextureRect,[:pointer,SfIntRect.by_value],:void
	attach_function :sfRectangleShape_setFillColor,[:pointer,SfColor.by_value],:void
	attach_function :sfRectangleShape_setOutlineColor,[:pointer,SfColor.by_value],:void
	attach_function :sfRectangleShape_setOutlineThickness,[:pointer,:float],:void
	attach_function :sfRectangleShape_getTexture,[:pointer],:pointer
	attach_function :sfRectangleShape_getTextureRect,[:pointer],SfIntRect.by_value
	attach_function :sfRectangleShape_getFillColor,[:pointer],SfColor.by_value
	attach_function :sfRectangleShape_getOutlineColor,[:pointer],SfColor.by_value
	attach_function :sfRectangleShape_getOutlineThickness,[:pointer],:float
	attach_function :sfRectangleShape_getPointCount,[:pointer],:size_t
	attach_function :sfRectangleShape_getPoint,[:pointer,:size_t],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfRectangleShape_getGeometricCenter,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfRectangleShape_setSize,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfRectangleShape_getSize,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfRectangleShape_getLocalBounds,[:pointer],SfFloatRect.by_value
	attach_function :sfRectangleShape_getGlobalBounds,[:pointer],SfFloatRect.by_value
	#RenderTexture
	attach_function :sfRenderTexture_create,[SFML_SYSTEM::SfVector2u.by_value,:pointer],:pointer
	attach_function :sfRenderTexture_destroy,[:pointer],:void
	attach_function :sfRenderTexture_getSize,[:pointer],SFML_SYSTEM::SfVector2u.by_value
	attach_function :sfRenderTexture_isSrgb,[:pointer],:bool
	attach_function :sfRenderTexture_setActive,[:pointer,:bool],:bool
	attach_function :sfRenderTexture_display,[:pointer],:void
	attach_function :sfRenderTexture_display,[:pointer],:void
	attach_function :sfRenderTexture_clear,[:pointer,SfColor.by_value],:void
	attach_function :sfRenderTexture_clear,[:pointer,SfColor.by_value],:void
	attach_function :sfRenderTexture_clearStencil,[:pointer,SfStencilValue.by_value],:void
	attach_function :sfRenderTexture_clearColorAndStencil,[:pointer,SfColor.by_value,SfStencilValue.by_value],:void
	attach_function :sfRenderTexture_setView,[:pointer,:pointer],:void
	attach_function :sfRenderTexture_getView,[:pointer],:pointer
	attach_function :sfRenderTexture_getDefaultView,[:pointer],:pointer
	attach_function :sfRenderTexture_getViewport,[:pointer,:pointer],SfIntRect.by_value
	attach_function :sfRenderTexture_getScissor,[:pointer,:pointer],SfIntRect.by_value
	attach_function :sfRenderTexture_mapPixelToCoords,[:pointer,SFML_SYSTEM::SfVector2i.by_value,:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfRenderTexture_mapCoordsToPixel,[:pointer,SFML_SYSTEM::SfVector2f.by_value,:pointer],SFML_SYSTEM::SfVector2i.by_value
	attach_function :sfRenderTexture_drawSprite,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderTexture_drawText,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderTexture_drawShape,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderTexture_drawCircleShape,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderTexture_drawConvexShape,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderTexture_drawRectangleShape,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderTexture_drawVertexArray,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderTexture_drawVertexBuffer,[:pointer,:pointer,:pointer],:void
	attach_function :sfRenderTexture_drawVertexBufferRange,[:pointer,:pointer,:size_t,:size_t,:pointer],:void
	attach_function :sfRenderTexture_drawPrimitives,[:pointer,:pointer,:size_t,:int,:pointer],:void
	attach_function :sfRenderTexture_pushGLStates,[:pointer],:void
	attach_function :sfRenderTexture_popGLStates,[:pointer],:void
	attach_function :sfRenderTexture_resetGLStates,[:pointer],:void
	attach_function :sfRenderTexture_getTexture,[:pointer],:pointer
	attach_function :sfRenderTexture_getMaximumAntiAliasingLevel,[:void],:uint
	attach_function :sfRenderTexture_setSmooth,[:pointer,:bool],:void
	attach_function :sfRenderTexture_isSmooth,[:pointer],:bool
	attach_function :sfRenderTexture_setRepeated,[:pointer,:bool],:void
	attach_function :sfRenderTexture_isRepeated,[:pointer],:bool
	attach_function :sfRenderTexture_generateMipmap,[:pointer],:bool
	#Shader
	attach_function :sfShader_createFromFile,[:string,:string,:string],:pointer
	attach_function :sfShader_createFromMemory,[:string,:string,:string],:pointer
	attach_function :sfShader_createFromStream,[:pointer,:pointer,:pointer],:pointer
	attach_function :sfShader_destroy,[:pointer],:void
	attach_function :sfShader_setFloatUniform,[:pointer,:string,:float],:void
	attach_function :sfShader_setVec2Uniform,[:pointer,:string,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfShader_setVec3Uniform,[:pointer,:string,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfShader_setVec4Uniform,[:pointer,:string,SfColor.by_value],:void
	attach_function :sfShader_setColorUniform,[:pointer,:string,SfColor.by_value],:void
	attach_function :sfShader_setIntUniform,[:pointer,:string,:int],:void
	attach_function :sfShader_setIvec2Uniform,[:pointer,:string,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfShader_setIvec3Uniform,[:pointer,:string,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfShader_setIvec4Uniform,[:pointer,:string,SfColor.by_value],:void
	attach_function :sfShader_setIntColorUniform,[:pointer,:string,SfColor.by_value],:void
	attach_function :sfShader_setBoolUniform,[:pointer,:string,:bool],:void
	attach_function :sfShader_setBvec2Uniform,[:pointer,:string,SFML_SYSTEM::SfVector2i.by_value],:void
	attach_function :sfShader_setBvec3Uniform,[:pointer,:string,SFML_SYSTEM::SfVector3f.by_value],:void
	attach_function :sfShader_setBvec4Uniform,[:pointer,:string,SfColor.by_value],:void
	attach_function :sfShader_setMat3Uniform,[:pointer,:string,:pointer],:void
	attach_function :sfShader_setMat4Uniform,[:pointer,:string,:pointer],:void
	attach_function :sfShader_setTextureUniform,[:pointer,:string,:pointer],:void
	attach_function :sfShader_setCurrentTextureUniform,[:pointer,:string],:void
	attach_function :sfShader_setFloatUniformArray,[:pointer,:string,:pointer,:size_t],:void
	attach_function :sfShader_setVec2UniformArray,[:pointer,:string,:pointer,:size_t],:void
	attach_function :sfShader_setVec3UniformArray,[:pointer,:string,:pointer,:size_t],:void
	attach_function :sfShader_setVec4UniformArray,[:pointer,:string,:pointer,:size_t],:void
	attach_function :sfShader_setMat3UniformArray,[:pointer,:string,:pointer,:size_t],:void
	attach_function :sfShader_setMat4UniformArray,[:pointer,:string,:pointer,:size_t],:void
	attach_function :sfShader_getNativeHandle,[:pointer],:uint
	attach_function :sfShader_bind,[:pointer],:void
	attach_function :sfShader_isAvailable,[],:bool
	attach_function :sfShader_isGeometryAvailable,[:void],:bool
	#Shape
	callback :sfShapeGetPointCountCallback,[:pointer],:size_t
	callback :sfShapeGetPointCallback,[:size_t,:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfShape_create,[:sfShapeGetPointCountCallback,:sfShapeGetPointCallback,:pointer],:pointer
	attach_function :sfShape_destroy,[:pointer],:void
	attach_function :sfShape_setPosition,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfShape_setRotation,[:pointer,:float],:void
	attach_function :sfShape_setScale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfShape_setOrigin,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfShape_getPosition,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfShape_getRotation,[:pointer],:float
	attach_function :sfShape_getScale,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfShape_getOrigin,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfShape_move,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfShape_rotate,[:pointer,:float],:void
	attach_function :sfShape_scale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfShape_getTransform,[:pointer],SfTransform.by_value
	attach_function :sfShape_getInverseTransform,[:pointer],SfTransform.by_value
	attach_function :sfShape_setTexture,[:pointer,:pointer,:bool],:void
	attach_function :sfShape_setTextureRect,[:pointer,SfIntRect.by_value],:void
	attach_function :sfShape_setFillColor,[:pointer,SfColor.by_value],:void
	attach_function :sfShape_setOutlineColor,[:pointer,SfColor.by_value],:void
	attach_function :sfShape_setOutlineThickness,[:pointer,:float],:void
	attach_function :sfShape_getTexture,[:pointer],:pointer
	attach_function :sfShape_getTextureRect,[:pointer],SfIntRect.by_value
	attach_function :sfShape_getFillColor,[:pointer],SfColor.by_value
	attach_function :sfShape_getOutlineColor,[:pointer],SfColor.by_value
	attach_function :sfShape_getOutlineThickness,[:pointer],:float
	attach_function :sfShape_getPointCount,[:pointer],:size_t
	attach_function :sfShape_getPoint,[:pointer,:size_t],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfShape_getGeometricCenter,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfShape_getLocalBounds,[:pointer],SfFloatRect.by_value
	attach_function :sfShape_getGlobalBounds,[:pointer],SfFloatRect.by_value
	attach_function :sfShape_update,[:pointer],:void
	#Sprite
	attach_function :sfSprite_create,[:pointer],:pointer
	attach_function :sfSprite_copy,[:pointer],:pointer
	attach_function :sfSprite_destroy,[:pointer],:void
	attach_function :sfSprite_setPosition,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfSprite_setRotation,[:pointer,:float],:void
	attach_function :sfSprite_setScale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfSprite_setOrigin,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfSprite_getPosition,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfSprite_getRotation,[:pointer],:float
	attach_function :sfSprite_getScale,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfSprite_getOrigin,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfSprite_move,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfSprite_rotate,[:pointer,:float],:void
	attach_function :sfSprite_scale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfSprite_getTransform,[:pointer],SfTransform.by_value
	attach_function :sfSprite_getInverseTransform,[:pointer],SfTransform.by_value
	attach_function :sfSprite_setTexture,[:pointer,:pointer,:bool],:void
	attach_function :sfSprite_setTextureRect,[:pointer,SfIntRect.by_value],:void
	attach_function :sfSprite_setColor,[:pointer,SfColor.by_value],:void
	attach_function :sfSprite_getTexture,[:pointer],:pointer
	attach_function :sfSprite_getTextureRect,[:pointer],SfIntRect.by_value
	attach_function :sfSprite_getColor,[:pointer],SfColor.by_value
	attach_function :sfSprite_getLocalBounds,[:pointer],SfFloatRect.by_value
	attach_function :sfSprite_getGlobalBounds,[:pointer],SfFloatRect.by_value
	#Text
	module SfTextStyle
		sfTextRegular = 0
		sfTextBold = 1 << 0
		sfTextItalic = 1 << 1
		sfTextUnderlined = 1 << 2
		sfTextStrikeThrough = 1 << 3
	end
	attach_function :sfText_create,[:pointer],:pointer
	attach_function :sfText_copy,[:pointer],:pointer
	attach_function :sfText_destroy,[:pointer],:void
	attach_function :sfText_setPosition,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfText_setRotation,[:pointer,:float],:void
	attach_function :sfText_setScale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfText_setOrigin,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfText_getPosition,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfText_getRotation,[:pointer],:float
	attach_function :sfText_getScale,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfText_getOrigin,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfText_move,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfText_rotate,[:pointer,:float],:void
	attach_function :sfText_scale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfText_getTransform,[:pointer],SfTransform.by_value
	attach_function :sfText_getInverseTransform,[:pointer],SfTransform.by_value
	attach_function :sfText_setString,[:pointer,:string],:void
	attach_function :sfText_setUnicodeString,[:pointer,:pointer],:void
	attach_function :sfText_setFont,[:pointer,:pointer],:void
	attach_function :sfText_setCharacterSize,[:pointer,:uint],:void
	attach_function :sfText_setLineSpacing,[:pointer,:float],:void
	attach_function :sfText_setLetterSpacing,[:pointer,:float],:void
	attach_function :sfText_setStyle,[:pointer,:uint32],:void
	attach_function :sfText_setFillColor,[:pointer,SfColor.by_value],:void
	attach_function :sfText_setOutlineColor,[:pointer,SfColor.by_value],:void
	attach_function :sfText_setOutlineThickness,[:pointer,:float],:void
	attach_function :sfText_getString,[:pointer],:string
	attach_function :sfText_getUnicodeString,[:pointer],:pointer
	attach_function :sfText_getFont,[:pointer],:pointer
	attach_function :sfText_getCharacterSize,[:pointer],:uint
	attach_function :sfText_getLetterSpacing,[:pointer],:float
	attach_function :sfText_getLineSpacing,[:pointer],:float
	attach_function :sfText_getStyle,[:pointer],:uint32
	attach_function :sfText_getFillColor,[:pointer],SfColor.by_value
	attach_function :sfText_getOutlineColor,[:pointer],SfColor.by_value
	attach_function :sfText_getOutlineThickness,[:pointer],:float
	attach_function :sfText_findCharacterPos,[:pointer,:size_t],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfText_getLocalBounds,[:pointer],SfFloatRect.by_value
	attach_function :sfText_getGlobalBounds,[:pointer],SfFloatRect.by_value
	#Texture
	attach_function :sfTexture_create,[SFML_SYSTEM::SfVector2u.by_value],:pointer
	attach_function :sfTexture_createSrgb,[SFML_SYSTEM::SfVector2u.by_value],:pointer
	attach_function :sfTexture_createFromFile,[:string,:pointer],:pointer
	attach_function :sfTexture_createSrgbFromFile,[:string,:pointer],:pointer
	attach_function :sfTexture_createFromMemory,[:pointer,:size_t,:pointer],:pointer
	attach_function :sfTexture_createSrgbFromMemory,[:pointer,:size_t,:pointer],:pointer
	attach_function :sfTexture_createFromStream,[:pointer,:pointer],:pointer
	attach_function :sfTexture_createSrgbFromStream,[:pointer,:pointer],:pointer
	attach_function :sfTexture_createFromImage,[:pointer,:pointer],:pointer
	attach_function :sfTexture_createSrgbFromImage,[:pointer,:pointer],:pointer
	attach_function :sfTexture_copy,[:pointer],:pointer
	attach_function :sfTexture_destroy,[:pointer],:void
	attach_function :sfTexture_resize,[:pointer,SFML_SYSTEM::SfVector2u.by_value],:bool
	attach_function :sfTexture_resizeSrgb,[:pointer,SFML_SYSTEM::SfVector2u.by_value],:bool
	attach_function :sfTexture_getSize,[:pointer],SFML_SYSTEM::SfVector2u.by_value
	attach_function :sfTexture_copyToImage,[:pointer],:pointer
	attach_function :sfTexture_updateFromPixels,[:pointer,:pointer,SFML_SYSTEM::SfVector2u.by_value,SFML_SYSTEM::SfVector2u.by_value],:void
	attach_function :sfTexture_updateFromTexture,[:pointer,:pointer,SFML_SYSTEM::SfVector2u.by_value],:void
	attach_function :sfTexture_updateFromImage,[:pointer,:pointer,SFML_SYSTEM::SfVector2u.by_value],:void
	attach_function :sfTexture_updateFromWindow,[:pointer,:pointer,SFML_SYSTEM::SfVector2u.by_value],:void
	attach_function :sfTexture_updateFromRenderWindow,[:pointer,:pointer,SFML_SYSTEM::SfVector2u.by_value],:void
	attach_function :sfTexture_setSmooth,[:pointer,:bool],:void
	attach_function :sfTexture_isSmooth,[:pointer],:bool
	attach_function :sfTexture_isSrgb,[:pointer],:bool
	attach_function :sfTexture_setRepeated,[:pointer,:bool],:void
	attach_function :sfTexture_isRepeated,[:pointer],:bool
	attach_function :sfTexture_generateMipmap,[:pointer],:bool
	attach_function :sfTexture_swap,[:pointer,:pointer],:void
	attach_function :sfTexture_getNativeHandle,[:pointer],:uint
	attach_function :sfTexture_bind,[:pointer,:int],:void
	attach_function :sfTexture_getMaximumSize,[],:uint
	#Transformable
	attach_function :sfTransformable_create,[],:pointer
	attach_function :sfTransformable_copy,[:pointer],:pointer
	attach_function :sfTransformable_destroy,[:pointer],:void
	attach_function :sfTransformable_setPosition,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfTransformable_setRotation,[:pointer,:float],:void
	attach_function :sfTransformable_setScale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfTransformable_setOrigin,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfTransformable_getPosition,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfTransformable_getRotation,[:pointer],:float
	attach_function :sfTransformable_getScale,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfTransformable_getOrigin,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfTransformable_move,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfTransformable_rotate,[:pointer,:float],:void
	attach_function :sfTransformable_scale,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfTransformable_getTransform,[:pointer],SfTransform.by_value
	attach_function :sfTransformable_getInverseTransform,[:pointer],SfTransform.by_value
	#VertexArray
	attach_function :sfVertexArray_create,[],:pointer
	attach_function :sfVertexArray_copy,[:pointer],:pointer
	attach_function :sfVertexArray_destroy,[:pointer],:void
	attach_function :sfVertexArray_getVertexCount,[:pointer],:size_t
	attach_function :sfVertexArray_getVertex,[:pointer,:size_t],:pointer
	attach_function :sfVertexArray_clear,[:pointer],:void
	attach_function :sfVertexArray_resize,[:pointer,:size_t],:void
	attach_function :sfVertexArray_append,[:pointer,SfVertex.by_value],:void
	attach_function :sfVertexArray_setPrimitiveType,[:pointer,:int],:void
	attach_function :sfVertexArray_getPrimitiveType,[:pointer],:int
	attach_function :sfVertexArray_getBounds,[:pointer],SfFloatRect.by_value
	#VertexBuffer
	module SfVertexBufferUsage
		sfVertexBufferStream = 0
		sfVertexBufferDynamic = 1
		sfVertexBufferStatic = 2
	end
	attach_function :sfVertexBuffer_create,[:size_t,:int,:int],:pointer
	attach_function :sfVertexBuffer_copy,[:pointer],:pointer
	attach_function :sfVertexBuffer_destroy,[:pointer],:void
	attach_function :sfVertexBuffer_getVertexCount,[:pointer],:size_t
	attach_function :sfVertexBuffer_update,[:pointer,:pointer,:uint,:uint],:bool
	attach_function :sfVertexBuffer_updateFromVertexBuffer,[:pointer,:pointer],:bool
	attach_function :sfVertexBuffer_swap,[:pointer,:pointer],:void
	attach_function :sfVertexBuffer_getNativeHandle,[:pointer],:uint
	attach_function :sfVertexBuffer_setPrimitiveType,[:pointer,:int],:void
	attach_function :sfVertexBuffer_getPrimitiveType,[:pointer],:int
	attach_function :sfVertexBuffer_setUsage,[:pointer,:int],:void
	attach_function :sfVertexBuffer_getUsage,[:pointer],:int
	attach_function :sfVertexBuffer_bind,[:pointer],:void
	attach_function :sfVertexBuffer_isAvailable,[:void],:bool
	#View
	attach_function :sfView_create,[],:pointer
	attach_function :sfView_createFromRect,[SfFloatRect.by_value],:pointer
	attach_function :sfView_copy,[:pointer],:pointer
	attach_function :sfView_destroy,[:pointer],:void
	attach_function :sfView_setCenter,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfView_setSize,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfView_setRotation,[:pointer,:float],:void
	attach_function :sfView_setViewport,[:pointer,SfFloatRect.by_value],:void
	attach_function :sfView_setScissor,[:pointer,SfFloatRect.by_value],:void
	attach_function :sfView_getCenter,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfView_getSize,[:pointer],SFML_SYSTEM::SfVector2f.by_value
	attach_function :sfView_getRotation,[:pointer],:float
	attach_function :sfView_getViewport,[:pointer],SfFloatRect.by_value
	attach_function :sfView_getScissor,[:pointer],SfFloatRect.by_value
	attach_function :sfView_move,[:pointer,SFML_SYSTEM::SfVector2f.by_value],:void
	attach_function :sfView_rotate,[:pointer,:float],:void
	attach_function :sfView_zoom,[:pointer,:float],:void

end