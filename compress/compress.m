function [Image,C,Czigzag,Cpress,Cpresszip,Cpressunzip,Cunpress,Cunzigzag] = compress(I)

    f = double(imread(I));
    Image = f;
    for i = 1:3
        [Image(:,:,i),C{i},Czigzag{i},Cpress{i},Cpresszip{i},Cpressunzip{i},Cunpress{i},Cunzigzag{i}] = isleme(f(:,:,i));
    end
    
    Image = uint8(Image);
    
function [N,K,Szig,Srun,Szip,Sunzip,Sinrun,Sinzig] = isleme(f)

    [R C] = size(f);
    
    J = zeros(R,C);
    N = zeros(R,C);
    D = {};
    K = {};
    Szig = {};
    Srun = {};
    Sinrun = {};
    Sinzig = {};
    
% Quantization 10
    Q = [80 60 50 80 120 200 255 255;
     55 60 70 95 130 255 255 255;
     70 65 80 120 200 255 255 255;
     70 85 110 145 255 255 255 255;
     90 110 185 255 255 255 255 255;
     120 175 255 255 255 255 255 255;
     245 255 255 255 255 255 255 255;
     255 255 255 255 255 255 255 255];

% Quantization 50
%     Q = [16 11 10 16 24 40 51 61;
%          12 12 14 19 26 58 60 55;
%          14 13 16 24 40 57 69 56;
%          14 17 22 29 51 87 80 62;
%          18 22 37 56 68 109 103 77;
%          24 35 55 64 81 104 113 92;
%          49 64 78 87 103 121 120 101;
%          72 92 95 98 112 100 103 99];
    
    T = zeros(8,8);
    
    W = R/8;
    H = C/8;
    
    for a = 0:7
        for b= 0:7
            if a == 0
                T(a+1,b+1) = 1/sqrt(8);
            else
                T(a+1,b+1) = sqrt(2/8)*cos((((2*b+1)*a*pi)/(2*8)));
            end
        end
    end

    for r = 1:W
        for c = 1:H
            D{r,c} = round(discreate_cos(f(((r-1)*8 + 1):((r-1)*8 + 8),((c-1)*8 + 1):((c-1)*8 + 8)),T));
            K{r,c} = round(D{r,c}./Q);
            Szig{r,c} = zigzag(K{r,c});
            Srun{r,c} = rle(Szig{r,c});
            J(((r-1)*8 + 1):((r-1)*8 + 8),((c-1)*8 + 1):((c-1)*8 + 8)) = D{r,c};
        end
    end
    
    Szip = s2mat(Srun);
    Sunzip = mat2s(Szip,size(Srun,2));

    for r = 1:W
        for c = 1:H
            Sinrun{r,c} = irle(Sunzip{r,c});
            Sinzig{r,c} = izigzag(Sinrun{r,c});           
        end
    end
    
    N = decompress(Q,T,Sinzig,N);
    
function D = discreate_cos(G,T)
    
    [X Y] = size(G);
    D = zeros(X,Y);
    
    M = G - 128;
    
    D = T*M*inv(T);
    
function N = decompress(Q,T,K,N)

    [R C] = size(N);
    W = R/8;
    H = C/8;
    
    for r = 1:W
        for c = 1:H
            R = Q.*[K{r,c}];
            N(((r-1)*8 + 1):((r-1)*8 + 8),((c-1)*8 + 1):((c-1)*8 + 8)) = round(inv(T)*R*T) + 128;
        end
    end