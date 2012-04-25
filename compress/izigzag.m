function I = izigzag(Q)

    A = 16;
    I = [];
    buyuk = 2;
    katman = buyuk;
    kucuk = 1; i = 1; j = 1;
    index = 1;
    
    while A > 0
        if (i ==1 & j == 1)
            I(i,j) = Q(index);
            j = j + 1;
            index = index + 1;
        else
            if i < j
                i = kucuk;
                j = buyuk;
            else
                j = kucuk;
                i = buyuk;
            end
            while katman > 0
                I(i,j) = Q(index);
                index = index + 1;
                if i == buyuk
                    if mod(katman,2) == 0
                        x_etiket = 1;
                        y_etiket = 0;
                    else
                        x_etiket = -1;
                        y_etiket = +1;
                    end
                end
                if j == buyuk
                    if ~(mod(katman,2) == 0)
                        x_etiket = 0;
                        y_etiket = 1;
                    else
                        x_etiket = +1;
                        y_etiket = -1;
                    end
                end
                katman = katman -1;
                if ~(katman == 0) 
                    i = i + x_etiket;
                    j = j + y_etiket;
                end
            end
            if ~( buyuk == 8 )
                buyuk = buyuk + 1;
                katman = buyuk;
            elseif buyuk == 8
                kucuk = kucuk + 1;
                katman = buyuk - kucuk +1;
            end
        end
        A = A -1;
    end