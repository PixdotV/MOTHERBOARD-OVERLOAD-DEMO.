function onCreate()
	--right = screenWidth+(screenWidth-screenWidth/4)
	gege = screenWidth-screenWidth/4-screenWidth/25
	low = screenHeight-screenHeight/4
	halfie = screenHeight/2

	if getPropertyFromClass('ClientPrefs','middleScroll') then
		--makeLuaText('bflyric','',right, 0, screenHeight/2);
		makeLuaText('bflyric','',300, gege, halfie);
	else
		makeLuaText('bflyric','',screenWidth, 0, low);
	end

	setTextSize('bflyric',30);
	setTextAlignment('bflyric','center');
	setObjectCamera('bflyric', 'other')
	addLuaText('bflyric');
end

-- passing a table like {255, 100, 20}

-- assumes decimal values of r, g and b but can be easily retrofitted
function rgbToHex(r, g, b)
    --%02x: 0 means replace " "s with "0"s, 2 is width, x means hex
	return string.format("%02x%02x%02x", 
		math.floor(r),
		math.floor(g),
		math.floor(b))
end

function onEvent(name, value1, value2)
	if name == 'lyricsPlayer' then
		bfColor = getProperty("boyfriend.healthColorArray")
		rapping = rgbToHex(bfColor[1], bfColor[2], bfColor[3])
		setTextString('bflyric', value1)
		if value2 == "" then
			setTextColor('bflyric', rapping)
			--setTextColor('bflyric', "ffffff")
		else
			setTextColor('bflyric', value2)
		end
	end
end