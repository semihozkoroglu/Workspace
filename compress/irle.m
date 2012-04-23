function Q = irle(R)

    len = length(R);
    
    Q = [];
    i = 1;
    
    while i < (len + 1)
        if length(R{i}) > 1
            tmp = R{i};
            if tmp(6) == 'X'
                if tmp(2) == 'T'
                    if tmp(1) == 'P'
                        for t = 1:str2num(tmp(3))
                            Q(length(Q) + 1) = str2num(tmp(5));
                        end
                    else
                        for t = 1:str2num(tmp(3))
                            Q(length(Q) + 1) = -1*str2num(tmp(5));
                        end
                    end
                else
                    if tmp(1) == 'P'
                        for t = 1:str2num(tmp(3:4))
                            Q(length(Q) + 1) = str2num(tmp(5));
                        end
                    else
                        for t = 1:str2num(tmp(3:4))
                            Q(length(Q) + 1) = -1*str2num(tmp(5));
                        end
                    end                
                end
            else
                if tmp(2) == 'T'
                    if tmp(1) == 'P'
                        for t = 1:str2num(tmp(3))
                            Q(length(Q) + 1) = str2num(tmp(5:6));
                        end
                    else
                        for t = 1:str2num(tmp(3))
                            Q(length(Q) + 1) = -1*str2num(tmp(5:6));
                        end
                    end
                else
                    if tmp(1) == 'P'
                        for t = 1:str2num(tmp(3:4))
                            Q(length(Q) + 1) = str2num(tmp(5:6));
                        end
                    else
                        for t = 1:str2num(tmp(3:4))
                            Q(length(Q) + 1) = -1*str2num(tmp(5:6));
                        end
                    end                
                end
            end
        else
            Q(length(Q) + 1) = R{i};
        end
        i = i + 1;
    end