function R = rle(Q)

    len = length(Q);
    son_eleman = len;
    i = 1; eleman = 1;
    
    R = {};
    
    while len > 0
        tmp = str2mat('PTXXXX');
        if ~(i == son_eleman)
            if Q(i) == Q(i+1)
                eleman = eleman + 1;
            else
                if ~(eleman == 1)
                    if Q(i) < 0
                        tmp(1) = 'N';
                        Q(i) = -1*Q(i);
                    end
                    if eleman > 9
                        tmp(2) = 'C';
                        tmp(3:4) = num2str(eleman);
                    else
                        tmp(3) = num2str(eleman);
                    end
                    if Q(i) > 9
                        tmp(5:6) = num2str(Q(i));
                    else
                        tmp(5) = num2str(Q(i));
                    end
                    R{length(R)+1} = tmp;
                    eleman = 1;
                else
                    R{length(R)+1} = Q(i);
                end
            end
        else
            if ~(eleman == 1)
                if Q(i) < 0
                    tmp(1) = 'N';
                    Q(i) = -1*Q(i);
                end               
                if eleman > 9
                    tmp(2) = 'C';
                    tmp(3:4) = num2str(eleman);
                else
                    tmp(3) = num2str(eleman);
                end
                if Q(i) > 9
                    tmp(5:6) = num2str(Q(i));
                else
                    tmp(5) = num2str(Q(i));
                end                
                R{length(R)+1} = tmp;
                eleman = 1;
            else
                R{length(R)+1} = Q(i);
            end
        end
        i = i + 1;
        len = len -1;
    end