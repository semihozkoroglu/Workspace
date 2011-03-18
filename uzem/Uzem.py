#!/usr/bin/python
# -*- coding: utf-8 -*-
#-*-coding:cp1254
# -*- coding: iso-8859-9 -*-
import codecs
import csv
import string
import xlrd              #excel dosyasından okuma yapmamız için gerekli olan modül
import xlwt             #excel dosyasından yazma yapmamız için gerekli olan modül
s={}
top_para=0
yanlis_kayit=[]
tarihler={}
tarih=""
bosluk="--$--"
sayf1 = xlrd.open_workbook("T.C.ziraat 5039 ilk liste ve sonlit -.xls")
sayf2 = xlrd.open_workbook("EBELİK LİS.TAM.ÖĞR.LİS.4119 +2.xls")
sh1 = sayf1.sheet_by_index(0)
sh2 = sayf2.sheet_by_index(0)
for i in range(1,12292):
	kisi=sh1.cell(i,7).value
	para=sh1.cell(i,5).value
	tarih=sh1.cell(i,0).value
	if kisi[:kisi.find("Referans")-16].find("980") != -1:
		x = kisi[:kisi.find("Referans")-16].find("980")
		a=""
		j=0
		while j<8:
			a = a + kisi[x+j-1]
			j+=1
		if s.has_key(a):
			s[a]=s[a]+str(bosluk)+ str(para)
			tarihler[a]=tarihler[a]+str(bosluk)+str(tarih)
			top_para +=para
		else:
			s[a]=str(para)
			tarihler[a]=str(tarih)
			top_para +=para
	else:
		durum=0
		tc=""
		for i in kisi:
			if i.isdigit()== True:
				tc+=i
			else:
				if len(tc)<10:
					tc=""
				elif len(tc)==11:
					if s.has_key(tc):
						s[tc]=s[tc]+str(bosluk)+ str(para)
						tarihler[tc]=tarihler[tc]+str(bosluk)+str(tarih)
						top_para +=para
					else:
						s[tc]=str(para)
						tarihler[tc]=str(tarih)
						top_para +=para
						durum=1
						break
		if durum==0:
			yanlis_kayit.append(kisi)

book = xlwt.Workbook(encoding='cp1251')
sheet = book.add_sheet('Yes')
sheet.write(0, 0, "ODEME LISTESI")
j=1
top = 0
top2 = 0
for i in range(1,4120):
	no=sh2.cell(i,0).value
	tc=sh2.cell(i,5).value
	sheet.write(j, 0, str(j+1))
	if s.has_key(no):
		top += 1
		sheet.write(j, 1, no)
		sheet.write(j, 2, str(s[no]))
		sheet.write(j,3,tarihler[no])
		sheet.write(j, 4, "odedi")
		
	elif s.has_key(tc):
		top += 1
		sheet.write(j, 1, no)
		sheet.write(j, 2, str(s[no]))
		sheet.write(j,3,tarihler[no])
		sheet.write(j, 4, "odedi")
	else:
		top2 += 1
		sheet.write(j, 1, no)
		sheet.write(j, 2, "yanlis kayit veya odeme yapmadi")
	j += 1
sheet.write(4121, 0, str(top))
sheet.write(4121, 1, "	kisi")
sheet.write(4122, 0, str(top_para))
sheet.write(4122, 1, "	toplam odenen miktar")
sheet.write(4123, 0, str(top2))
sheet.write(4123, 1, "Kisi	Tc ve No eksik veya hic odeme yapmamis")
book.save('odeme_listesi.xls')

book = xlwt.Workbook(encoding='cp1251')
sheet = book.add_sheet('Yes')
j=1
sheet.write(0, 0, "YANLIS KAYIT LISTESI")
for kisi in yanlis_kayit:
	sheet.write(j,0 , str(j+1))
	sheet.write(j,1, kisi)
	j += 1
book.save('yanLis_odeme.xls')
