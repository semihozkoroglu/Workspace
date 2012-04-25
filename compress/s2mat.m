function Q = s2mat(S)

    Q = [];
    
    for r = 1:size(S,1)
        for c = 1:size(S,2)
            for i = 1:length(S{r,c})
                if length(S{r,c}{i}) > 2
                    Q(length(Q) + 1) = str2num(S{r,c}{i});
                else
                    Q(length(Q) + 1) = S{r,c}{i};
                end
            end
            Q(length(Q) + 1) = 9999;
        end
    end