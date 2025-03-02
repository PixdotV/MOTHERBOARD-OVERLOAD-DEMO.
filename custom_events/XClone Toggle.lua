function onEvent(n, v1, v2)
	if n == 'XClone Toggle' then
		v1 = tonumber(v1)
		if v1 == 1 then
			setProperty('dad.alpha', 0)
			setProperty('gf.alpha', 0.7)
			setProperty('camFollowPos.x', 1900)
			setProperty('boyfriend.scale.x', -1)
		end
		if v1 == 2 then
			setProperty('dad.alpha', 1)
			setProperty('gf.alpha', 0)
			setProperty('camFollowPos.x', 1200)
			setProperty('boyfriend.scale.x', 1)
		end
		if v1 == 3 then
			setProperty('dad.alpha', 1)
			setProperty('gf.alpha', 0.7)
			setProperty('camFollowPos.x', 1600)
			setProperty('boyfriend.scale.x', 1)
		end
		if v1 == 4 then
			setProperty('dad.alpha', 1)
			setProperty('gf.alpha', 0)
			setProperty('camFollowPos.x', 1600)
			setProperty('boyfriend.scale.x', 1)
		end
		setProperty('flashSprite.alpha', 0.8)
	
		setProperty('camGame.zoom', (getProperty('camGame.zoom') + 0.015))
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03)
		doTweenAlpha('BleepGone', 'flashSprite', 0, 0.10, 'linear')
	end
end