function onCreate()
	setProperty('skipCountdown', true)
end

function onSongStart()

	setPropertyFromClass("openfl.Lib", "application.window.title", ". . .")
end

function onUpdate()
end

function onStepHit()
    if curStep == 832 then
		setPropertyFromClass("openfl.Lib", "application.window.title", "The Clock is Ticking")
    end
	if curStep >= 1735 then
		setPropertyFromClass("openfl.Lib", "application.window.title",  getRandomInt((-999999), (999999)) .. "Countdown" ..  getRandomInt((-999999), (999999)))
	end
end