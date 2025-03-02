zoom = 0

nozoom = 0

function onUpdate()

if zoom == 1 then

local HUDBounce = true
    function onStepHit()
        if HUDBounce == true then 
            if curStep % 4 == 0 then
                doTweenY('ri', 'camHUD', -8, stepCrochet*0.002, 'circOut')
                
            end
            if curStep % 4 == 2 then
                doTweenY('rir', 'camHUD', 8, stepCrochet*0.002, 'sineIn')
end
end
end
end

if nozoom == 2 then
local HUDBounce = false
local HUDBounce2 = true
    function onStepHit()
        if HUDBounce2 == true then 
            if curStep % 4 == 0 then
                doTweenY('ri', 'camHUD', -14, stepCrochet*0.002, 'circOut')
                
            end
            if curStep % 4 == 2 then
                doTweenY('rir', 'camHUD', 8, stepCrochet*0.002, 'sineIn')
end
end
end
end
end

function onEvent(name,value1,value2)
	if name == 'BounceHUD' then
		zoom = tonumber(value1)
		nozoom = tonumber(value2)
			end
	
		end
