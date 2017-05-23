require"cocos2d"
require "cocos2dConstants"
require "AudioEngine"
require "SystemConst"

local size = cc.Director:getInstance():getSize()
local  frameCache = cc.SpriteFrame:getInstance()
local  textureCache = cc.cc.Director:getInstance():getTextureCache()
local loadingScene = class("LoadingScene", function()
return cc.Scene:create()
end)

function loadingScene:create()
local scene = LoadingScene.new()
scene:addChild(scene:createLayer())
return scene
end

function LoadingScene:ctor()
	local function onNodeEvent(event)

    if event == "enter" then
	    
	    self:onEnter()
	
	elseif event == "enterTransitionFinish" then
		
		self:onEnterTransitionFinish()

	elseif event == "OnExit" then
		
		self:onExit()
		
	elseif event == "exitTransitionStart" then
		
		self:exitTransitionStart()
		
	elseif event == "cleanup" then
		
		self:cleanup()
		
    end
	
	end 

 self:registerScriptHandler(onNodeEvent)

end
--
function LoadingScene :createLayer()

print("loading screne init")

local layer = cc.Layer:create()
frameCache:addSpriteFrame(loa)
end
	