-- Event notes hooks
function onEvent(name, value1, value2)
    local Up = tonumber(value1)
    local Down = tonumber(value2)
    if name == "Force Up or Down Better" then
        if Up == 1 then
            setPropertyFromClass('ClientPrefs', 'downScroll', false)
            noteTweenY("upoppx1", 0, 50, 0.6, "quartInOut");
            noteTweenY("upoppx2", 1, 50, 0.6, "quartInOut");
            noteTweenY("upoppx3", 2, 50, 0.6, "quartInOut");
            noteTweenY("upoppx4", 3, 50, 0.6, "quartInOut");
            noteTweenY("upx5", 4, 50, 0.6, "quartInOut");
            noteTweenY("upx6", 5, 50, 0.6, "quartInOut");
            noteTweenY("upx7", 6, 50, 0.6, "quartInOut");
            noteTweenY("upx8", 7, 50, 0.6, "quartInOut");
            doTweenY('hpdown', 'healthBar', 645, 0.6, 'quartInOut')
            doTweenY('hpicon1down', 'iconP1', 570, 0.6, 'quartInOut')
            doTweenY('hpicon2down', 'iconP2', 570, 0.6, 'quartInOut')
            doTweenY('scoredown', 'scoreTxt', 677, 0.6, 'quartInOut')
            doTweenY('timeBarUp', 'timeBar', 31, 0.6, 'quartInOut')
            doTweenY('timeBarTxtUp', 'timeTxt', 20, 0.6, 'quartInOut')
            -- botplay text
            doTweenY('botplytxtUp', 'botplayTxt', 80, 0.6, 'quartInOut')
        end
        if Down == 1 then 
            setPropertyFromClass('ClientPrefs', 'downScroll', true)
            noteTweenY("downoppx1", 0, 568, 0.6, "quartInOut");
            noteTweenY("downoppx2", 1, 568, 0.6, "quartInOut");
            noteTweenY("downoppx3", 2, 568, 0.6, "quartInOut");
            noteTweenY("downoppx4", 3, 568, 0.6, "quartInOut");
            noteTweenY("downx5", 4, 568, 0.6, "quartInOut");
            noteTweenY("downx6", 5, 568, 0.6, "quartInOut");
            noteTweenY("downx7", 6, 568, 0.6, "quartInOut");
            noteTweenY("downx8", 7, 568, 0.6, "quartInOut");
            doTweenY('hpup', 'healthBar', 83, 0.6, 'quartInOut')
            doTweenY('hpicon1up', 'iconP1', 10, 0.6, 'quartInOut')
            doTweenY('hpicon2up', 'iconP2', 10, 0.6, 'quartInOut')
            doTweenY('scoreup', 'scoreTxt', 115, 0.6, 'quartInOut')
            doTweenY('timeBarDown', 'timeBar', 688, 0.6, 'quartInOut')
            doTweenY('timeBarTxtDown', 'timeTxt', 675, 0.6, 'quartInOut')
            -- botplay text
            doTweenY('botplytxtDown', 'botplayTxt', 603, 0.6, 'quartInOut')
        end
    end
end