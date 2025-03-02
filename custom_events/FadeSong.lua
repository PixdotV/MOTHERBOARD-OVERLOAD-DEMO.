function onCreate()
    makeLuaSprite('blackscreen', '', 0, 0)
	makeGraphic('blackscreen', 1920, 1080, '000000')
	setScrollFactor('blackscreen', 0, 0);
	setObjectCamera('blackscreen', 'other')
	setProperty('blackscreen.alpha', 0)
	setObjectOrder('blackscreen', '7')
	addLuaSprite('blackscreen', true);
		
	makeLuaSprite('him', 'him', 300, 0);
	setScrollFactor('him', 1.2, 1.2);
	setProperty('him.scale.x', 8);
	setProperty('him.scale.y', 8);
	setProperty('him.antialiasing', false);
	setObjectCamera('him', 'other')
	updateHitbox('him');
	setProperty('him.alpha', 0);
	setObjectOrder('him', '12')
	addLuaSprite('him', true);
end

function onEvent(n, v1, v2)
	if n == 'FadeSong' then
		setProperty('flashSprite.alpha', 0.8)
		setProperty('blackscreen.alpha', 1)
		setProperty('him.alpha', 1);
	
		setProperty('camGame.zoom', (getProperty('camGame.zoom') + 0.015))
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03)
		doTweenAlpha('BleepGone', 'flashSprite', 0, 0.10, 'linear')
		doTweenAlpha('HimFade', 'him', 0, 1, 'linear')
	end
end