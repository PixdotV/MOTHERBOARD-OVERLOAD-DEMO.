-- new and improved camscript made by scenophon
cameraMode = 'on'

function onUpdate()
	ofs = 15
	
	if getProperty('paused') == false then
		if cameraMode == 'on' then
			if mustHitSection then
				cancelTween('camGameTweenIdle1')
				cancelTween('camGameTween4')
				cancelTween('camGameTween5')
				cancelTween('camGameTween6')
				cancelTween('camGameTween7')
			
				if not (string.find(getProperty('boyfriend.animation.curAnim.name'), 'idle') == nil) then
					doTweenAngle('camGameTweenIdle1', 'camGame', 0, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0)
					setProperty('camGame.targetOffset.y', 0)
					
				elseif not (string.find(getProperty('boyfriend.animation.curAnim.name'), 'singLEFT') == nil) then
					doTweenAngle('camGameTween4', 'camGame', 0.5, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0 - ofs)
					setProperty('camGame.targetOffset.y', 0)
				
				elseif not (string.find(getProperty('boyfriend.animation.curAnim.name'), 'singDOWN') == nil) then
					doTweenAngle('camGameTween5', 'camGame', 0, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0)
					setProperty('camGame.targetOffset.y', 0 + ofs)
				
				elseif not (string.find(getProperty('boyfriend.animation.curAnim.name'), 'singUP') == nil) then
					doTweenAngle('camGameTween6', 'camGame', 0, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0)
					setProperty('camGame.targetOffset.y', 0 - ofs)
				
				elseif not (string.find(getProperty('boyfriend.animation.curAnim.name'), 'singRIGHT') == nil) then
					doTweenAngle('camGameTween7', 'camGame', -0.5, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0 + ofs)
					setProperty('camGame.targetOffset.y', 0)
				end
				
				cancelTween('camGameTweenIdle2')
				cancelTween('camGameTween8')
				cancelTween('camGameTween9')
				cancelTween('camGameTween10')
				cancelTween('camGameTween11')
				
				if not (string.find(getProperty('gf.animation.curAnim.name'), 'idle') == nil) then
					doTweenAngle('camGameTweenIdle2', 'camGame', 0, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0)
					setProperty('camGame.targetOffset.y', 0)
				
				elseif not (string.find(getProperty('gf.animation.curAnim.name'), 'singLEFT') == nil) then
					doTweenAngle('camGameTween8', 'camGame', 0.5, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0 - ofs)
					setProperty('camGame.targetOffset.y', 0)
					
				elseif not (string.find(getProperty('gf.animation.curAnim.name'), 'singDOWN') == nil) then
					doTweenAngle('camGameTween9', 'camGame', 0, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0)
					setProperty('camGame.targetOffset.y', 0 + ofs)
				
				elseif not (string.find(getProperty('gf.animation.curAnim.name'), 'singUP') == nil) then
					doTweenAngle('camGameTween10', 'camGame', 0, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0)
					setProperty('camGame.targetOffset.y', 0 - ofs)
				
				elseif not (string.find(getProperty('gf.animation.curAnim.name'), 'singRIGHT') == nil) then
					doTweenAngle('camGameTween11', 'camGame', -0.5, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0 + ofs)
					setProperty('camGame.targetOffset.y', 0)
				end
			else
				cancelTween('camGameTweenIdle3')
				cancelTween('camGameTween0')
				cancelTween('camGameTween1')
				cancelTween('camGameTween2')
				cancelTween('camGameTween3')
				
				if not (string.find(getProperty('dad.animation.curAnim.name'), 'idle') == nil) then
					doTweenAngle('camGameTweenIdle3', 'camGame', 0, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0)
					setProperty('camGame.targetOffset.y', 0)
					
				elseif not (string.find(getProperty('dad.animation.curAnim.name'), 'singLEFT') == nil) then
					doTweenAngle('camGameTween0', 'camGame', 0.5, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0 - ofs)
					setProperty('camGame.targetOffset.y', 0)
				
				elseif not (string.find(getProperty('dad.animation.curAnim.name'), 'singDOWN') == nil) then
					doTweenAngle('camGameTween1', 'camGame', 0, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0)
					setProperty('camGame.targetOffset.y', 0 + ofs)
				
				elseif not (string.find(getProperty('dad.animation.curAnim.name'), 'singUP') == nil) then
					doTweenAngle('camGameTween2', 'camGame', 0, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0)
					setProperty('camGame.targetOffset.y', 0 - ofs)
				
				elseif not (string.find(getProperty('dad.animation.curAnim.name'), 'singRIGHT') == nil) then
					doTweenAngle('camGameTween3', 'camGame', -0.5, 1, 'quartOut')
					setProperty('camGame.targetOffset.x', 0 + ofs)
					setProperty('camGame.targetOffset.y', 0)
				end
			end
		end
	end
end

function onEvent(name, value1, value2)
	if name == 'Camera Move Switch' then
		if value1 == 'on' then
			cameraMode = 'on'
		elseif value1 == 'off' then
			cameraMode = 'off'
		end
	end
end