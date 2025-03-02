local BlackValue = 0
local BlackEnable = false
function onCreate()
    makeLuaSprite('BlackImage','BlackVG',0,0)
    setObjectCamera('BlackImage','other')
    setProperty('BlackImage.alpha',1)
    addLuaSprite('BlackImage',true)
end

function onEvent(name,v1)
    if name == 'BlackVG' then
        if v1 ~= false and v1 ~= 'False' and v1 ~= 'false' then
            BlackValue = -1
            BlackEnable = true
        else
            BlackEnable = false
            BlackValue = -1
        end
    end
end