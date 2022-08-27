function [defAnswer, flags, flag] = check(subinfo)
    flag = 1;
    flags = ones(3);
    id = strtrim(subinfo{1});
    sex = strtrim(subinfo{2});
    age = strtrim(subinfo{3});
    defAnswer = {'1', '1', '20'};

    idLen = strlength(id);

    if idLen < 1
        flag = 0;
        flags(1) = 0;
    end

    for i = 1:idLen

        if not((id(i) >= '0') && (id(i) <= '9'))
            flag = 0;
            flags(1) = 0;
        end

    end

    if flags(1) == 1
        defAnswer(1) = cellstr(id);
    end

    sexLen = strlength(sex);

    if not(sexLen == 1)
        flag = 0;
        flags(2) = 0;
    elseif not((sex == '1') || (sex == '2'))
        flag = 0;
        flags(2) = 0;
    end

    if flags(2) == 1
        defAnswer(2) = cellstr(sex);
    end

    ageLen = strlength(age);

    if ageLen < 1
        flag = 0;
        flags(3) = 0;
    end

    for i = 1:ageLen

        if not((age(i) >= '0') && (age(i) <= '9'))
            flag = 0;
            flags(3) = 0;
        end

    end

    if flags(3) == 1
        defAnswer(3) = cellstr(age);
    end

end
