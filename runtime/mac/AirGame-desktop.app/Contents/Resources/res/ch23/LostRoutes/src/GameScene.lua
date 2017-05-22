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

local GameScene = class("GameScene",function()
    return cc.Scene:create()
end)

function GameScene.create()
    local scene = GameScene.new()
    scene:addChild(scene:createLayer())
    return scene
end


function GameScene:ctor()

end

-- 创建层
function GameScene:createLayer()
    cclog("GameScene init")
    local layer = cc.Layer:create()

    local bg = cc.LayerColor:create(cc.c3b(255, 255, 255))
    layer:addChild(bg)

    local map = cc.TMXTiledMap:create("orthogonal-test6.tmx")
    map:setAnchorPoint(cc.p(0.5, 0.5))
    map:setPosition(cc.p(size.width/2, size.height/2))
    layer:addChild(map)

    return layer
end

return GameScene