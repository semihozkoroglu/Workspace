function S = mat2s(Q,R)

    begin = 1;
    tmp2 = {};
    
    indexs = find(Q == 9999);
    
    r = 1; c = 1;

    for i = 1:length(indexs)
        tmp1 = Q(begin:(indexs(i)-1));
        for j = 1:length(tmp1)
            if tmp1(j) > 999
                tmp2{length(tmp2) + 1} = strcat('+',num2str(tmp1(j)));
            elseif tmp1(j) < -999
                tmp2{length(tmp2)+1 } = strcat('-',num2str(-1*tmp1(j)));
            elseif tmp1(j) > 99
                tmp2{length(tmp2)+1 } = strcat('+0',num2str(tmp1(j)));
            elseif tmp1(j) < -99
                tmp2{length(tmp2)+1 } = strcat('-0',num2str(-1*tmp1(j)));
            else
                tmp2{length(tmp2)+1} = tmp1(j);
            end
        end
        S{r,c} = tmp2;
        tmp2 = {};
        if c < R
            c = c + 1;
        else
            r = r + 1;
            c = 1;
        end
        begin = indexs(i) + 1;
    end