function showPic(winPtr, winRect, picName, time)

    if nargin < 4
        time = -1;
    end

    space = KbName('space'); % can be changed into other key

    intro = imread(picName);
    size = size(intro);
    introRect = CenterRect([0 0 size1(2) size1(1)], winRect);
    introTexture = Screen('MakeTexture', winPtr, intro);
    Screen('DrawTexture', winPtr, introTexture, [], introRect);
    Screen(winPtr, 'Flip');

    if time < 0
        KbWait([], 2, []);
        [~, ~, keycode] = KbCheck;

        while ~keycode(space)
            KbWait;
            [~, ~, keycode] = KbCheck;
            WaitSecs(0.001);
        end

    else
        WaitSecs(time);
    end

end
