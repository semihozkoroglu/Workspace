-------------------------------------------------------------------------------------------
--(1)- Yüzüncü yılını kutlamış olan takımlar
-------------------------------------------------------------------------------------------

SELECT Adi,K_Tarih FROM TAKIM WHERE EXTRACT(YEAR FROM CURDATE())-K_Tarih >= 100;

-------------------------------------------------------------------------------------------
--(2)- Ortalama yaş sınırının üzerindeki oyuncular
-------------------------------------------------------------------------------------------

SELECT Adi , Soyadi , Yas FROM OYUNCU WHERE Yas > ( SELECT AVG(Yas) FROM OYUNCU) ;

--------------------------------------------------------------------------------------------
--(3)- Girilen hafta için takımın yapacagı karsılasma
--------------------------------------------------------------------------------------------

SELECT ( SELECT Adi FROM TAKIM WHERE idTakim = idEvsahibi ) AS Evsahibi ,
	( SELECT Adi FROM TAKIM WHERE idTakim = idDeplasman ) AS Deplasman ,
	( SELECT CONCAT(Adi," ",Soyadi) FROM HAKEM H WHERE H.idHakem = K.idHakem ) AS Hakem ,	
	Tarih
	FROM KARSILASMALAR K WHERE Haftano = 18 AND 
		(idEvsahibi = ( SELECT idTakim FROM TAKIM WHERE Adi = "TRABZONSPOR") OR
		idDeplasman = ( SELECT idTakim FROM TAKIM WHERE Adi = "TRABZONSPOR")) ;

--------------------------------------------------------------------------------------------
--(4)- Girilen hafta numarasına göre puan tablosunu sıralı olarak gösterir.
--------------------------------------------------------------------------------------------

SELECT ( SELECT Adi FROM TAKIM WHERE idTakim = idP_Takim ) AS Adi,
	Oynanan AS O , Galibiyet AS G , Beraberlik AS B , Maglubiyet AS M ,
	Attigi_gol AS A , Yedigi_gol AS Y , Averaj AS Av , Puan AS P
FROM PUAN_TABLOSU WHERE Oynanan = 17 ORDER BY Puan DESC  ;

-------------------------------------------------------------------------------------------
--(5)- İstenilen bir takımın yabancı uyruklu oyuncularını listeler
-------------------------------------------------------------------------------------------
SELECT * FROM OYUNCU WHERE NOT Ulke = "Türkiye" AND idTakim IN 
	( SELECT idTakim FROM TAKIM WHERE Adi = "GALATASARAY" );

---------------------------------------------------------------------------------------------------------
--(6)- Girilen takımın yaptıgı karşılaşmalarını yöneten hakemler ve hangi hafta , hangi tarihte yapıldıgı.
---------------------------------------------------------------------------------------------------------

SELECT k.Haftano, h.Adi , h.Soyadi , k.Tarih
	FROM KARSILASMALAR k, HAKEM h  WHERE  
	(h.idHakem = k.idHakem AND
	idEvsahibi = ( SELECT idTakim FROM TAKIM WHERE Adi = "BURSASPOR") OR 
	h.idHakem = k.idHakem AND
	idDeplasman = ( SELECT idTakim FROM TAKIM WHERE Adi = "BURSASPOR"))
	AND CURDATE() > Tarih ;

--------------------------------------------------------------------------------------------------
--(7)- Girilen iki takımın karşılaşma sonucu
----------------------------------------------------------------------------------------------------

	SELECT ( SELECT Adi FROM TAKIM WHERE idTakim = idEvsahibi ) AS Evsahibi ,
		( SELECT Sonuc_evsahibi FROM MAC_SONUCU WHERE MAC_SONUCU.idMAC = KARSILASMALAR.idMAC) AS Sonuc ,
		( SELECT Sonuc_deplasman FROM MAC_SONUCU WHERE MAC_SONUCU.idMAC = KARSILASMALAR.idMAC) AS Sonuc ,
		( SELECT Adi FROM TAKIM WHERE idTakim = idDeplasman ) AS Deplasman
	FROM KARSILASMALAR WHERE idEvsahibi = ( SELECT idTakim FROM TAKIM  WHERE Adi = "TRABZONSPOR" ) 
		AND idDeplasman = ( SELECT idTakim FROM TAKIM  WHERE Adi = "FENERBAHCE" );

-------------------------------------------------------------------------------------------------------
--(8)- Berabere kalmayan takımlar ve karşılaşma sonucları
------------------------------------------------------------------------------------------------------

SELECT ( SELECT ( SELECT Adi FROM TAKIM WHERE idTakim = idEvsahibi) 
		FROM KARSILASMALAR k WHERE k.idMac = MAC_SONUCU.idMac ) AS Evsahibi ,
	Sonuc_evsahibi,
	Sonuc_deplasman,
	( SELECT ( SELECT Adi FROM TAKIM WHERE idTakim = idDeplasman) 
		FROM KARSILASMALAR k WHERE k.idMac = MAC_SONUCU.idMac ) AS Deplasman
FROM MAC_SONUCU WHERE NOT Sonuc_evsahibi = Sonuc_deplasman;

-------------------------------------------------------------------------------------------------------------
--(9)- Girilen tarih aralığana göre yapılan karşılaşmaların hakemlerini , tarihlerini ve sonuclarını gösterir
-------------------------------------------------------------------------------------------------------------

SELECT ( SELECT Adi FROM TAKIM WHERE idTakim = idEvsahibi ) AS Evsahibi ,
	( SELECT Adi FROM TAKIM WHERE idTakim = idDeplasman ) AS Deplasman ,
	( SELECT CONCAT(Adi," ",Soyadi) FROM HAKEM H WHERE H.idHakem = K.idHakem ) AS Hakem_Adi_Soyadi ,
	Tarih,
	(SELECT CONCAT(CAST(Sonuc_evsahibi AS CHAR ),"-",CAST(Sonuc_deplasman AS CHAR )) FROM MAC_SONUCU M WHERE M.idMac = K.idMac ) 		AS Sonuc
FROM KARSILASMALAR K WHERE EXTRACT( month FROM Tarih ) > "9" AND
 	EXTRACT( month FROM Tarih ) < "11" AND EXTRACT( year FROM Tarih ) = "2010";

-----------------------------------------------------------------------------------------------------------------------------
--(10)- Oyuncuları attıkları gol sayılarına göre sıralar ve belirlenen limit sayısı kadarını gösterir buda gol krallığımızdır.
-----------------------------------------------------------------------------------------------------------------------------

SELECT ( SELECT CONCAT(Adi," ",Soyadi) FROM OYUNCU WHERE idOyuncu = idG_Oyuncu) AS Oyuncu ,
	( SELECT Adi FROM TAKIM WHERE idTakim = idG_Takim) AS Takimi ,
	Golsayisi 
FROM GOL_TABLOSU ORDER BY Golsayisi DESC LIMIT 10;









