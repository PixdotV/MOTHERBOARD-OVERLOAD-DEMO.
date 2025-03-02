function onCreate()

    precacheImage('stages/computer/farcompSCREEN')
	precacheImage('stages/computer/farcompROOM')
	precacheImage('stages/computer/farcompBG')
	precacheImage('stages/computer/farcompFG')
	precacheImage('stages/computer/finaleBG')
	precacheImage('stages/computer/insidecompFG')
	precacheImage('stages/computer/computerROOM')
	precacheImage('stages/computer/computerBG')
	precacheImage('stages/computer/computerFG')

	addCharacterToList('MobianRose', 'dad')
	addCharacterToList('MOTHER', 'dad')
	addCharacterToList('emo', 'dad')
	addCharacterToList('POVMother', 'dad')

	-- phase 1
	makeLuaSprite('farcompSCREEN', 'stages/computer/farcompSCREEN')
	setGraphicSize('farcompSCREEN', getProperty('farcompSCREEN.width') * 1.25)
	setScrollFactor('farcompSCREEN', 1, 1)
	addLuaSprite('farcompSCREEN', false)
	setProperty('farcompSCREEN.alpha', 0.25)
	screenCenter('farcompSCREEN')
	
	makeLuaSprite('farcompROOM', 'stages/computer/farcompROOM')
	setGraphicSize('farcompROOM', getProperty('farcompROOM.width') * 1.25)
	setScrollFactor('farcompROOM', 1, 1)
	addLuaSprite('farcompROOM', true)
	screenCenter('farcompROOM')
	
	makeLuaSprite('farcompBG', 'stages/computer/farcompBG')
	setGraphicSize('farcompBG', getProperty('farcompBG.width') * 1.25)
	setScrollFactor('farcompBG', 1, 1)
	addLuaSprite('farcompBG', true)
	screenCenter('farcompBG')

	makeLuaSprite('farcompFG', 'stages/computer/farcompFG')
	setGraphicSize('farcompFG', getProperty('farcompFG.width') * 1.25)
	setScrollFactor('farcompFG', 1, 1)
	addLuaSprite('farcompFG', true)
	setProperty('farcompFG.alpha', 0.4)
	screenCenter('farcompFG')
	
	makeLuaSprite('blackScreen', 'stages/computer/black')
	scaleObject('blackScreen', 5, 5)
	addLuaSprite('blackScreen', true)
	setProperty('blackScreen.alpha', 0)
	screenCenter('blackScreen')
	canBlackFade = false

	-- phase 2

	makeLuaSprite('insideCompBG', 'stages/computer/finaleBG', -360, -800);
	setScrollFactor('insideCompBG', 1, 1);
	scaleObject('insideCompBG', 0.6, 0.6)
	setProperty('insideCompBG.alpha', 0.59)
	addLuaSprite('insideCompBG', false);

	-- phase 3

	createInstance('computerSCREEN', 'flixel.addons.display.FlxBackdrop', {nil, 0x11, 0, 0})
	loadGraphic('computerSCREEN', 'stages/computer/finaleBG')
	setScrollFactor('computerSCREEN', 1, 1);
	setGraphicSize('computerSCREEN', getProperty('computerSCREEN.width') * 0.7)
	setProperty('computerSCREEN.velocity.x', -100)
	setProperty('computerSCREEN.velocity.y', -100)
	setProperty('computerSCREEN.alpha', 0.25)
	addLuaSprite('computerSCREEN', false);
	setProperty('computerSCREEN.visible', false)
	screenCenter('computerSCREEN')
	
	makeLuaSprite('computerROOM', 'stages/computer/computerROOM')
	setGraphicSize('computerROOM', getProperty('computerROOM.width') * 0.7)
	setScrollFactor('computerROOM', 1, 1)
	addLuaSprite('computerROOM', true)
	setProperty('computerROOM.visible', false)
	screenCenter('computerROOM')
	
	makeLuaSprite('computerBG', 'stages/computer/computerBG')
	setGraphicSize('computerBG', getProperty('computerBG.width') * 0.7)
	setScrollFactor('computerBG', 1, 1)
	addLuaSprite('computerBG', true)
	setProperty('computerBG.visible', false)
	screenCenter('computerBG')

	makeLuaSprite('computerFG', 'stages/computer/computerFG')
	setGraphicSize('computerFG', getProperty('computerFG.width') * 0.7)
	setScrollFactor('computerFG', 1, 1)
	addLuaSprite('computerFG', true)
	setProperty('computerFG.visible', false)
	screenCenter('computerFG')
	--phase 4

	makeLuaSprite('wirlyBG', 'stages/computer/wirlyBG', -900, -500);
	setScrollFactor('wirlyBG', 1, 1);
	scaleObject('wirlyBG', 0.5, 0.5)
	addLuaSprite('wirlyBG', false);
	screenCenter('wirlyBG', "X")

	--gameoverstage
	makeLuaSprite('gameoverScreen', 'stages/computer/gameoverScreen', -155, -450);
	setScrollFactor('gameoverScreen', 1, 1);
	addLuaSprite('gameoverScreen', false);
	setProperty('gameoverScreen.visible', false)
	scaleObject('gameoverScreen', 0.6, 0.6)


	ActualStage = 'phase1'
	canOpponentHurt = false
	healt = getProperty('health')
	setVar('RandomTimeInt', false)
end

function onCreatePost()
	setProperty('gf.visible', false)
	setProperty('boyfriend.visible', false)
	
	setProperty('isCameraOnForcedPos', true)
	doTweenX('camTweeeenX', 'camFollow', 655, 0.01, 'cubeInOut')
	doTweenY('camTweeeenY', 'camFollow', 0, 0.01, 'cubeInOut')
	
	runTimer('redsmokethinghigh', 0.01);
	runTimer('computerwoooooohigh', 0.01);
	
	setProperty('computerSCREEN.y', -715)
	setProperty('computerROOM.y', -715)
	setProperty('computerBG.y', -715)
	setProperty('computerFG.y', -715)

	setProperty('insidecompFG.y', -715)
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if canOpponentHurt == true then
		setProperty('health', getProperty('health') - 0.005)
	end
end

function onUpdate()
	if canBlackFade == false then
		setProperty('blackScreen.alpha', getProperty('blackScreen.alpha') - 0.015)
	elseif canBlackFade == true then
		setProperty('blackScreen.alpha', getProperty('blackScreen.alpha') + 0.015)
	elseif canBlackFade == 'slowFadeout' then
		setProperty('blackScreen.alpha', getProperty('blackScreen.alpha') - 0.009)
	elseif canBlackFade == 'slowFadeIn' then
		setProperty('blackScreen.alpha', getProperty('blackScreen.alpha') + 0.009)
	elseif canBlackFade == 'instant' then
		setProperty('blackScreen.alpha', 0)
	else
		setProperty('blackScreen.alpha', 1)
	end

	if ActualStage == 'phase1' then	
		setProperty('farcompSCREEN.visible', true)
		setProperty('farcompROOM.visible', true)
		setProperty('farcompBG.visible', true)
		setProperty('farcompFG.visible', true)
	else
		setProperty('farcompSCREEN.visible', false)
		setProperty('farcompROOM.visible', false)
		setProperty('farcompBG.visible', false)
		setProperty('farcompFG.visible', false)
	end
	if ActualStage == 'phase2' then	
		setProperty('insideCompBG.visible', true)
	else
		setProperty('insideCompBG.visible', false)
	end
	if ActualStage == 'phase3' then
		triggerEvent('Change Character', 'Dad', 'MOTHER')
		setProperty('computerSCREEN.visible', true)
		setProperty('computerROOM.visible', true)
		setProperty('computerBG.visible', true)
		setProperty('computerFG.visible', true)
	else
		setProperty('computerSCREEN.visible', false)
		setProperty('computerROOM.visible', false)
		setProperty('computerBG.visible', false)
		setProperty('computerFG.visible', false)
	end
	if ActualStage == 'phase4' then
		setProperty('wirlyBG.visible', true)
	else
		setProperty('wirlyBG.visible', false)
	end
	if ActualStage == 'gameoverScreen' then
		setProperty('gameoverScreen.visible', true)
	else
		setProperty('gameoverScreen.visible', false)
	end


end
function onStepHit()
	if curStep > 0 and curStep < 100 then
		setProperty('defaultCamZoom', 0.85)
	end
	if curStep == 448 then
		setProperty('defaultCamZoom', 0.65)
	end
	if curStep == 480 then
		setProperty('defaultCamZoom', 0.5)
	end
	if curStep > 512 and curStep < 536 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.03)
	end
	if curStep == 512 then
		canBlackFade = true
		doTweenAlpha('hudalpha', 'camHUD', 0, 2, 'linear');
	end
	if curStep == 535 then
		setProperty('defaultCamZoom', 0.8)
	end
	if curStep == 576 then
		setProperty('defaultCamZoom', 1.2)
		canBlackFade = "instant"
	end
	if curStep >= 576 and curStep < 700 then
		setProperty('camHUD.alpha', 1)
	end
	if curStep >= 710 and curStep < 1000 then
		canOpponentHurt = true
	end
	if curStep > 826 and curStep < 832 then
		setProperty('insideCompBG.alpha', getProperty('insideCompBG.alpha') - 0.05 )
	end
	if curStep == 831 then
		setProperty('defaultCamZoom', 0.8)
	end
	if curStep == 850 then
		setProperty('insideCompBG.alpha', 1)
	end	

	if curStep == 1599 then
		setProperty('health', getProperty('health') - 0.5)
	end	

	if curStep >= 1735 then
		setVar('RandomTimeInt', true)
	end
	if curStep == 2122 then
		canBlackFade = 'slowFadeIn'
		canOpponentHurt = false
		doTweenAlpha('hudalpha', 'camHUD', 0, 3, 'linear');
	end
	if curStep == 2187 then
		canBlackFade = 'slowFadeout'
	end
	if curStep == 2338 then
		canBlackFade = "instantout"
	end
	if curStep >= 1083 and curStep < 1088 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.06)
	end	
	
	if curStep == 1088 then
		setProperty('defaultCamZoom', 0.8)
	end	
	if curStep == 1224 or curStep == 1228 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	end	
	if curStep == 1240 or curStep == 1244 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	end	
	if curStep >= 1248 and curStep < 1256 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	end	
	if curStep == 1256 then
		setProperty('defaultCamZoom', 0.8)
	end	
	if curStep > 1264 and curStep < 1280 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.04)
	end	

	if curStep == 1280 then
		setProperty('defaultCamZoom', 0.8)
	end	
	if curStep == 1288 or curStep == 1292 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.1)
	end	
	if curStep == 1304 or curStep == 1308 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.1)
	end	
	if curStep >= 1320 and curStep < 1328 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.05)
	end	
	if curStep == 1328 then
		setProperty('defaultCamZoom', 0.8)
	end	
	if curStep > 1338 and curStep < 1344 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.08)
	end	
	if curStep > 1334 and curStep < 1350 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.04)
	end	
	if curStep > 1590 and curStep < 1600 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.07)
	end	
	if curStep == 1600 then
		setProperty('defaultCamZoom', 0.8)
	end	
	if curStep > 1824 and curStep < 1856 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.04)
	end	
	if curStep == 1855 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') - 0.4)
	end	
	if curStep == 1856 then
		setProperty('defaultCamZoom', 0.85)
	end	
	if curStep > 2112 and curStep < 2143 then
		setProperty('defaultCamZoom', getProperty('defaultCamZoom') + 0.06)
	end	
	if curStep == 2166 then
		setProperty('defaultCamZoom', 0.85)
	end	

	--phase

	if curStep >= 535 and curStep < 832 then
		ActualStage = 'phase2'
		triggerEvent('Change Character', 'Dad', 'MobianRose')
	end
	if curStep >= 832 and curStep < 1088 then
		ActualStage = 'phase3'
		triggerEvent('Change Character', 'Dad', 'MOTHER')
	end	
	if curStep >= 1088 and curStep < 1344 then
		ActualStage = 'phase4'
		triggerEvent('Change Character', 'Dad', 'emo')
	end	
	if curStep >= 1344 and curStep < 1600 then
		ActualStage = 'phase3'
		triggerEvent('Change Character', 'Dad', 'MOTHER')
	end	
	if curStep >= 1600 and curStep < 1856 then
		ActualStage = 'phase4'
		triggerEvent('Change Character', 'Dad', 'EVIL')
	end	
	if curStep >= 1856 and curStep < 2180 then
		ActualStage = 'phase1'
		triggerEvent('Change Character', 'Dad', 'EVILtv')
	end
	if curStep >= 2186 then
		setProperty('dadGroup.visible', false);
		ActualStage = 'gameoverScreen'
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'redsmokethinghigh' then
		doTweenAlpha('farcompFGhigh', 'farcompFG', 0.7, 4, 'linear')
		runTimer('redsmokethinglow', 4);
	end
	if tag == 'redsmokethinglow' then
		doTweenAlpha('farcompFGlow', 'farcompFG', 0.4, 4, 'linear')
		runTimer('redsmokethinghigh', 4);
	end
	if tag == 'computerwoooooohigh' then
		doTweenAlpha('computerSCREENhigh', 'computerSCREEN', 0.5, 4, 'linear')
		doTweenAlpha('farcompSCREENhigh', 'farcompSCREEN', 0.5, 4, 'linear')
		runTimer('computerwoooooolow', 4);
	end
	if tag == 'computerwoooooolow' then
		doTweenAlpha('computerSCREENlow', 'computerSCREEN', 0.25, 4, 'linear')
		doTweenAlpha('farcompSCREENlow', 'farcompSCREEN', 0.25, 4, 'linear')
		runTimer('computerwoooooohigh', 4);
	end
end