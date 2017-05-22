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

local Bullet = class("Bullet",function()
    return cc.Sprite:create()
end)

function Bullet.create(spriteFrameName)
    local sprite = Bullet.new(spriteFrameName)
    return sprite
end

function Bullet:ctor(spriteFrameName)

    self:setSpriteFrame(spriteFrameName)
    self:setVisible(false)
    self.velocity = Sprite_Velocity.Bullet                           --速度

    local body = cc.PhysicsBody:createBox(self:getContentSize())
    body:setCategoryBitmask(0x01)           --0001
    body:setCollisionBitmask(0x02)          --0010
    body:setContactTestBitmask(0x01)        --0001
    self:setPhysicsBody(body)

    local function onNodeEvent(tag)
        if tag == "exit" then
            --开始游戏调度
            self:unscheduleUpdate()
        end
    end
    self:registerScriptHandler(onNodeEvent)

end

---
--  发生炮弹
-- @param  fighterPos 发射炮弹的飞机的位置
-- @return nil
function Bullet:shootBulletFromFighter(fighter)

    local  fighterPosX,fighterPosY = fighter:getPosition()

    self:setPosition(cc.p(fighterPosX,  fighterPosY + fighter:getContentSize().height/2))
    self:setVisible(true)

    --开始游戏调度
    local function update(delta)
    
        local x,y = self:getPosition()
        self:setPosition(cc.p(x + self.velocity.x *delta,  y + self.velocity.y *delta))
        x,y = self:getPosition()

        if  y > size.height then
            --log("isVisible = %d",self:isVisible())
            self:setVisible(false)
            self:unscheduleUpdate()
            --self:removeFromParent()
        end

    end
    self:scheduleUpdateWithPriorityLua(update, 0)

end

return Bullet

