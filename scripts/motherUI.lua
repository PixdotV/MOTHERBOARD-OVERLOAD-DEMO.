-- coded by scenophon 
function onCreate()
	makeLuaText('text_songLabel', songName, 1000, 225, 650)
	setTextSize('text_songLabel', 52)
    setTextFont('text_songLabel', 'mother.ttf')
    setTextAlignment('text_songLabel', 'left')
	setTextBorder('text_songLabel', 0)
	setObjectCamera('text_songLabel', 'hud')
	addLuaText('text_songLabel', true)
	
	makeLuaText('text_timeLabel', 'TIME:', 1000)
	setTextSize('text_timeLabel', 52)
    setTextFont('text_timeLabel', 'mother.ttf')
    setTextAlignment('text_timeLabel', 'center')
	setTextBorder('text_timeLabel', 0)
	setObjectCamera('text_timeLabel', 'hud')
	addLuaText('text_timeLabel', true)
	screenCenter('text_timeLabel')
	
	makeLuaText('text_healthLabel', 'HP%', 1000, 965, 600)
	setTextSize('text_healthLabel', 52)
    setTextFont('text_healthLabel', 'mother.ttf')
    setTextAlignment('text_healthLabel', 'left')
	setTextBorder('text_healthLabel', 0)
	setObjectCamera('text_healthLabel', 'hud')
	addLuaText('text_healthLabel', true)
	
	makeLuaText('text_timeValue', '0:00', 1000)
	setTextSize('text_timeValue', 52)
    setTextFont('text_timeValue', 'mother.ttf')
    setTextAlignment('text_timeValue', 'center')
	setTextBorder('text_timeValue', 0)
	setObjectCamera('text_timeValue', 'hud')
	addLuaText('text_timeValue', true)
	screenCenter('text_timeValue')
	
	makeLuaText('text_healthValue', getProperty('healthBar.percent'), 1000, 505, 635)
	setTextSize('text_healthValue', 52)
    setTextFont('text_healthValue', 'mother.ttf')
    setTextAlignment('text_healthValue', 'center')
	setTextBorder('text_healthValue', 0)
	setObjectCamera('text_healthValue', 'hud')
	addLuaText('text_healthValue', true)
	
	makeLuaSprite('opponentIconCircle', 'ui/opponentIcon')
	setGraphicSize('opponentIconCircle', getProperty('opponentIconCircle.width') * 0.7)
	setObjectCamera('opponentIconCircle', 'hud')
	setProperty('opponentIconCircle.antialiasing', true);
	addLuaSprite('opponentIconCircle', true)
	screenCenter('opponentIconCircle')
	
	makeLuaSprite('playerIconCircle', 'ui/playerIcon')
	setGraphicSize('playerIconCircle', getProperty('playerIconCircle.width') * 0.7)
	setObjectCamera('playerIconCircle', 'hud')
	setProperty('playerIconCircle.antialiasing', true);
	addLuaSprite('playerIconCircle', true)
	screenCenter('playerIconCircle')
	
	setTextColor('text_songLabel', 'FFFFFF')
	setTextColor('text_timeLabel', 'FFFFFF')
	setTextColor('text_healthLabel', 'FFFFFF')
	
	setTextColor('text_timeValue', 'FFFFFF')
	setTextColor('text_healthValue', 'FFFFFF')

	Movement = true
	MValueX = 0
	MValueY = 0
	PValueX = 0
	PValueY = 0
end

function onCreatePost()
	setProperty('opponentIconCircle.x', getProperty('opponentIconCircle.x') - 140)
	setProperty('playerIconCircle.x', getProperty('playerIconCircle.x') + 140)
	
	setProperty('opponentIconCircle.y', getProperty('opponentIconCircle.y') + 30)
	setProperty('playerIconCircle.y', getProperty('playerIconCircle.y') + 30)
	
	setProperty('text_timeLabel.y', getProperty('text_timeLabel.y') - 175)
	setProperty('text_timeValue.y', getProperty('text_timeValue.y') - 140)
end

function onUpdatePost()
	setProperty('iconP1.x', getProperty('playerIconCircle.x') + 750)
	setProperty('iconP2.x', getProperty('opponentIconCircle.x') + 50 )
	
	setProperty('iconP1.y', getProperty('playerIconCircle.y') + 585 )
	setProperty('iconP2.y', getProperty('opponentIconCircle.y') + 585 )

	setProperty('healthBar.alpha', 0)
	setProperty('scoreTxt.alpha', 0)
	
	setProperty('timeBar.alpha', 0)
	setProperty('timeBarBG.alpha', 0)
	setProperty('timeTxt.alpha', 0)
	if songName == 'Countdown' then
		if getVar('RandomTimeInt') == true then
			setTextString('text_timeValue', getRandomInt((0), (99)) .. ':' ..  getRandomInt((0), (9)) ..getRandomInt((0), (9)))	
		else
			setTextString('text_timeValue', math.floor(getSongPosition() / 60000) .. ':' ..  math.floor((getSongPosition() / 10000) % 6) ..math.floor(getSongPosition() / 1000) % 10)	
		end
	else
		setTextString('text_timeValue', math.floor(getSongPosition() / 60000) .. ':' ..  math.floor((getSongPosition() / 10000) % 6) ..math.floor(getSongPosition() / 1000) % 10)	
	end
	
	for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
		
        setPropertyFromGroup("playerStrums", i, "x", (i == 0) and 420 or (getPropertyFromGroup("playerStrums", i - 1, "x") + 110))
    end

	setTextString('text_songLabel', songName)
	setTextString('text_healthValue', math.floor(getProperty('healthBar.percent')))
end