function [rt, Ans] = getKey(time)
    Ans = 0;
    keyF = KbName('f');
    keyJ = KbName('j');
    keyQ = KbName('q');
    response = 0;
    secsBegin = GetSecs;
    time = time / 1000;

    while (response == 0) && (GetSecs - secsBegin < time)
        KbWait([], 2, secsBegin + time);
        [~, ~, keycode] = KbCheck;

        if GetSecs - secsBegin > time
            break;
        end

        if (keycode(keyF) || keycode(keyJ)) == 1
            response = 1;
        end

        if keycode(keyQ) == 1
            Screen('CloseAll');
            break;
        end

    end

    rt = GetSecs - secsBegin;

    if rt > time
        Ans = -1;
    elseif keycode(keyF) == 1
        Ans = 0;
    else
        Ans = 1;
    end

end
