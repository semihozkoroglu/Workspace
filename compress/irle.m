function Q = irle(R)

    len = length(R);
    
    Q = [];
    i = 1;
    
    while i < (len + 1)
        if length(R{i}) > 1
            tmp = R{i};
            if tmp(4) == '0'
                if tmp(2) == '0'
                    if tmp(1) == '+'
                        for t = 1:str2num(tmp(3))
                            Q(length(Q) + 1) = str2num(tmp(5));
                        end
                    else
                        for t = 1:str2num(tmp(3))
                            Q(length(Q) + 1) = -1*str2num(tmp(5));
                        end
                    end
                else
                    if tmp(1) == '+'
                        for t = 1:str2num(tmp(2:3))
                            Q(length(Q) + 1) = str2num(tmp(5));
                        end
                    else
                        for t = 1:str2num(tmp(2:3))
                            Q(length(Q) + 1) = -1*str2num(tmp(5));
                        end
                    end                
                end
            else
                if tmp(2) == '0'
                    if tmp(1) == '+'
                        for t = 1:str2num(tmp(3))
                            Q(length(Q) + 1) = str2num(tmp(4:5));
                        end
                    else
                        for t = 1:str2num(tmp(3))
                            Q(length(Q) + 1) = -1*str2num(tmp(4:5));
                        end
                    end
                else
                    if tmp(1) == '+'
                        for t = 1:str2num(tmp(2:3))
                            Q(length(Q) + 1) = str2num(tmp(4:5));
                        end
                    else
                        for t = 1:str2num(tmp(2:3))
                            Q(length(Q) + 1) = -1*str2num(tmp(4:5));
                        end
                    end                
                end
            end
        else
            Q(length(Q) + 1) = R{i};
        end
        i = i + 1;
    end