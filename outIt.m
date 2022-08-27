function outIt(matrix, subjectid)
    num = 0;
    name = [num2str(subjectid), '_', num2str(num), '_ans.xlsx'];

    while exist (name, 'file')
        num = num + 1;
        name = [num2str(subjectid), '_', num2str(num), '_ans.xlsx'];
    end

    writematrix(matrix, name);

    % if there is a title line in matrix
    if ~exist ('total.xlsx', 'file')
        writematrix(matrix(1, :), 'total.xlsx'); % save the title line
    end

    writematrix(matrix(2:size(matrix, 1), :), 'total.xlsx', 'WriteMode', 'append'); % save from line 2

    % if no title line in matrix
    %{
    if ~exist ('total.xlsx', 'file')
        writematrix(matrix, 'total.xlsx');
    else
        writematrix(matrix, 'total.xlsx', 'WriteMode', 'append');
    end
    %}

end
