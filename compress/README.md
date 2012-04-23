# Resim sıkıştırma

Kullanımı: `J,N,K,Szig,Srun,Sinrun,Sinzig] = compress(I)`

`I`: Girdi resmimiz

`J`: Ayrık kosinus işleminden geçirilmiş resim

`N`: Sıkıştırma işlemi ve çözme işlemlerinden geçirilmiş sonuç resim

`K`: 8x8'lik blokların nihai katsayıları

`Szig`: K'nın zigzag fonksiyonundan geçirilerek vektorleştirilmiş bloklar

`Srun`: Vektorleştirilmiş 8x8'lik blokların sıkıştırılarak küçültülmüş hali

`Sinrun`: Küçültülmüş blokların normal vektorleştirilmiş hali (inverse)

`Sinzig`: Vektorleştirilmiş blokların 8x8'lik yapıya dönüştürülmüş hali

