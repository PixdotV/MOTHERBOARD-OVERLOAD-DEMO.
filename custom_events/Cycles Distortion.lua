---@funkinScript

local doTweenShaderFloat = function(tag, floatName, newFloat, duration, ease)
  local tag = tostring(tag) or 'tag'
  local floatName = tostring(floatName) or 'amount'
  local newFloat = tonumber(newFloat) or 1
  local duration = tonumber(duration) or newFloat
  local ease = tostring(ease) or 'linear'
  runHaxeCode([[
    game.modchartTweens.set(
      ']]..tag..[[',
      FlxTween.num(
        getVar(']]..floatName..[['),
        ]]..newFloat..[[,
        ]]..duration..[[,
        {
          ease: FlxEase.]]..ease..[[,
          onComplete: function(twn:FlxTween) {
            //game.modchartTweens.remove(']]..tag..[[');
            game.callOnLuas('onTweenCompleted', [']]..tag..[[']);
          }
        },
        function(num) {
          shader0.setFloat(']]..floatName..[[', num);
          setVar(']]..floatName..[[', num);
        }
      )
    )
  ]]);
end

function onCreate()
  luaDebugMode = true
  runHaxeCode([[
    game.initLuaShader('cyclesd');
    shader0 = game.createRuntimeShader('cyclesd');
    game.camGame.setFilters([new ShaderFilter(shader0)]);
    resetCamCache = function(?spr) {
      if (spr == null || spr.filters == null) return;
      spr.__cacheBitmap = null;
      spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
      spr.__cacheBitmapColorTransform = null;
    }
    fixShaderCoordFix = function(?_) {resetCamCache(game.camGame.flashSprite);}
    FlxG.signals.gameResized.add(fixShaderCoordFix);
    fixShaderCoordFix();
  ]]);
  precacheImage('static/Static');
  makeAnimatedLuaSprite('staticD', 'static/Static', 0, 0);
  addAnimationByPrefix('staticD', 'idle', 'Static', 24);
  scaleObject('staticD', 2.41, 2.4);
  setObjectCamera('staticD', 'camHUD');
  setProperty('staticD.alpha', 0);
  setProperty('staticD.antialiasing', false);
  addLuaSprite('staticD', false);
end

function onEvent(eventName, value1, value2)
  if eventName:find('Cycles Distortion') then
    local value1, value2 = tostring(value1) or 'amount,quadInOut', tostring(value2) or '-1.25,0.5'
    value1, value2 = stringSplit(value1, ','), stringSplit(value2, ',');
    for index = 1, 2 do
      value1[index], value2[index] = stringTrim(value1[index]), stringTrim(value2[index]);
      value2[index] = tonumber(value2[index]);
    end
    if value1[1]:find('static') then
      setProperty('staticD.alpha', 1);
      playAnim('staticD', 'idle', true);
      doTweenAlpha(
        value1[1],
        'staticD',
        value2[1] or 0,
        (value2[2] or 0.3) / playbackRate,
        value1[2] or 'linear'
      );
    elseif value1[1]:find('amount') or value1[1]:find('pixel') then
      doTweenShaderFloat(
        'tag_'..value1[1],
        value1[1],
        value2[1] or 1,
        (value2[2] or 0.5) / playbackRate,
        value1[2] or 'quadInOut'
      );
    end
  end
end

function onDestroy()
  runHaxeCode([[
    FlxG.signals.gameResized.remove(fixShaderCoordFix);
    return;
  ]]);
end