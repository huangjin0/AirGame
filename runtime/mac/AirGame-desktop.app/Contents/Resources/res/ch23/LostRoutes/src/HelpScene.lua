-- 
-- Created by 关东升 on 2016-3-18.
-- 本书网站：http://www.51work6.com
-- 智捷课堂在线课堂：http://www.zhijieketang.com/
-- 智捷课堂微信公共号：zhijieketang
-- 作者微博：@tony_关东升
-- 作者微信：tony关东升
-- QQ：569418560 邮箱：eorient@sina.com
--  QQ交流群：162030268
-- 


local size = cc.Director:getInstance():getWinSize()
local defaults = cc.UserDefault:getInstance()

local HelpScene = class("HelpScene",function()
    return cc.Scene:create()
end)

function HelpScene.create()
    local scene = HelpScene.new()
    scene:addChild(scene:createLayer())
    return scene
end

function HelpScene:ctor()

end

-- 创建层
function HelpScene:createLayer()
    cclog("HelpScene init")
    local layer = cc.Layer:create()

    local bg = cc.TMXTiledMap:create("map/red_bg.tmx")
    layer:addChild(bg)

    local top = cc.Sprite:createWithSpriteFrameName("help.page.png")
    top:setPosition(cc.p(size.width/2, size.height - top:getContentSize().height /2))
    layer:addChild(top)

    --Ok菜单事件处理
    local function menuOkCallback(sender)
        --播放音效
        if defaults:getBoolForKey(SOUND_KEY) then
            AudioEngine.playEffect(sound_1)
        end
        cc.Director:getInstance():popScene()
    end

    --Ok菜单
    local okNormal = cc.Sprite:createWithSpriteFrameName("button.ok.png")
    local okSelected = cc.Sprite:createWithSpriteFrameName("button.ok-on.png")
    local okMenuItem = cc.MenuItemSprite:create(okNormal, okSelected)
    okMenuItem:registerScriptTapHandler(menuOkCallback)

    local okMenu = cc.Menu:create(okMenuItem)
    okMenu:setPosition(cc.p(190, 50))
    layer:addChild(okMenu)

    return layer
end

return HelpScene

