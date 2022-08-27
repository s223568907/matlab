function [defAnswer] = initSubject()
    prompt = {'编号', '性别（1=男性，2=女性）', '年龄'};
    dlgTitle = '信息录入';
    numLine = [1, 20];
    defAnswer = {'1', '1', '20'};
    opts.Resize = 'off';
    opts.WindowStyle = 'modal';
    opts.Interpreter = 'tex';

    while 1
        subinfo = inputdlg(prompt, dlgTitle, numLine, defAnswer, opts);
        [defAnswer, flags, flag] = check(subinfo);

        if flag == 1
            break
        end

        dlgTitle = '信息错误，请重新录入';
        prompt = {'编号', '性别（1=男性，2=女性）', '年龄'};

        text = '';

        if flags(1) == 0
            text = [text, '编号'];
            prompt{1} = '\color{red} 编号';
        end

        if flags(2) == 0

            if strlength(text) > 0
                text = [text, '、'];
            end

            text = [text, '性别'];
            prompt{2} = '\color{red} 性别（1=男性，2=女性）';
        end

        if flags(3) == 0

            if strlength(text) > 0
                text = [text, '、'];
            end

            text = [text, '年龄'];
            prompt{3} = '\color{red} 年龄';
        end

        text = [text, '填写错误！'];
        box = msgbox(text);
        WaitSecs(1);
        close(box);
    end

end
