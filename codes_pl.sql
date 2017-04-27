DELETE FROM codt WHERE CodeTypeID IN 
(1,2,3,4,7,10,11,138,139,194,260,261,272,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,999 );
DELETE FROM codt WHERE CodeTypeID IN 
(1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,
1023,1024,1025);

INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1','Prawa Podglądu','Opisowe nazwy dla praw podglądu','1','1','2005-05-24 18:02:08','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('2','Prawa Edycji','Opisowe nazwy dla praw edycji','1','1','2005-05-24 18:08:13','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('3','Prawa Podglądu Ikona','Ikony dla praw podglądu','1','1','2005-05-24 18:02:08','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('4','Prawa Edycji Ikona','Ikony dla praw edycji','1','1','2005-05-24 18:08:13','0');			
			
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('7','Zasięg organizacji',NULL,'0','0','0000-00-00 00:00:00','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('10','Bool Tak/Nie',NULL,'0','1','2005-07-01 14:24:35','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('11','Bool Tak/Null',NULL,'0','1','2005-07-01 14:24:35','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('138','Język użytkownika','Preferowany język użytkownika','0','1','2005-03-29 15:01:49','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('139','Język użytkownika skrót','Preferowany język użytkownika skrót','0','1','2005-03-29 15:01:49','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('194','Status dokumentacji','Status opracowania dokumentacji wspierającej','0','3','2006-03-21 11:32:14','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('272','Status modułu',NULL,'0','1','2004-11-12 09:46:57','0');

INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('298','Status znaku kolorem','Status znaku kolorem true/false','0','3','2007-11-01 13:46:23','0');			
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('299','Status kolorem','Status znaku true/false','0','3','2007-11-01 13:46:23','0');			
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('300','Bool Graficzne','Bool Graficzne true/false','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('301','Status graficznie tak/nie','Status graficznie tak/nie','0','3','2007-11-01 13:46:23','0');

INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('302','Typy logów zdarzeń użytkownika','Typy wpisów logów użytkownika','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('303','Status współpracy z organizacją','Czy osoba aktualnie pracuje w organizacji','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('304','Miesiące','Lista miesięcy z numerami','0','3','2011-09-14 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('305','Miesiące','Lista miesięcy','0','3','2011-09-14 13:46:23','0');			
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('306','Action state 1','Stan w którym jest działanie v1','0','3','2007-11-01 13:46:23','0');			
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('307','Action state command 1','Polecenia zmainy stanu działania v1','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('308','Locations','Funkcje lokalizacji','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('309','Periods','Częstotliwość wysyłania','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('310','Week days','Dni tygodnia','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('311','Week days short','Skróty dni tygodnia','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('312','Case status extented','Stan sprawy rozszerzony','0','3','2007-11-01 13:46:23','0');	
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('313','Action state 1','Stan w którym jest działanie v1','0','3','2007-11-01 13:46:23','0');	
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('314','Action state 2','Stan w którym jest działanie v2','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('315','Action state 3','Stan w którym jest działanie v3','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('316','Action state br','Stan w którym jest działanie z br','0','3','2007-11-01 13:46:23','0');	
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('317','Action state 2','Stan w którym jest działanie v2','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('318','Action state command 2','Polecenia zmainy stanu działania v2','0','3','2007-11-01 13:46:23','0');			
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('999','Granica zastrzeżonych kodów','Granica zastrzeżonej numeracji kodów','0','3','2007-11-01 13:46:23','0');

INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1000','Maskulinum Status','Status elementu rodzaju męskiego','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1001','Neutrum Status','Status elementu rodzaju nijakiego','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1002','Feminum Status','Status elementu rodzaju żeńskiego','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1003','Media types','Typy mediów publicznych','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','Room types','Typy pokoi hotelowych','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1005','Seat class','Klasa wagonu kolejowego','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1006','Wagoon type','Rodzaj wagonu','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1007','Ticket type','Rodzaj biletu','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1008','Vacation type','Rodzaj urlopu','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1009','Status of access','Sataus dostępności','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1010','Payment type','Płatność za fakturę osoba','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1011','Invoice type','Rodzaje dokumentów fiskalnych','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1012','Payment type','Płatność za fakturę firma','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1013','Payment type','Płatność za fakturę','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1014','Transportation','Środki lokomocji w delegacji','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1015','Transportation allowance','Własny pojazd w delegacji','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','Depart time','Godziny odlotu','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1017','Flight class','Klasa siedzenia w samolocie','0','3','2007-11-01 13:46:23','0');	
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1018','Labour units','Jednostki nakładu pracy','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1019','Availabilty feminum','Dostępność żeńska','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','Booking times','Czasy zamawiania','0','3','2007-11-01 13:46:23','0');	
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1021','Availabilty maskulinum','Dostępność męska','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1022','Work accounting','Rozliczanie pracy','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1023','Work accounting time interval','Czas rozlicznia pracy','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1024','Invoice status','Stan faktury','0','3','2007-11-01 13:46:23','0');
INSERT INTO codt (CodeTypeID,Name,Description,UseValue,_ModBy,_ModDate,_Deleted)
            VALUES ('1025','Invoice status br','Stan faktury','0','3','2007-11-01 13:46:23','0');		
			
DELETE FROM cod WHERE CodeTypeID IN 
(1,2,3,4,7,10,11,138,139,194,260,261,272,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,999);
DELETE FROM cod WHERE CodeTypeID IN 
(1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013, 1014,1015,1016,1017,1018,1019,1020,1021,1022,
1023,1024,1025);

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1','0','10','0','Brak','1','2005-05-24 18:11:56','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1','1','20','1','Jednostki organizacyjne','1','2005-05-24 18:06:18','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1','2','30','2','Wszyscy','1','2005-05-24 18:02:40','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('2','0','10','0','Brak','1','2005-05-24 18:10:59','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('2','1','20','1','Jednostki organizacyjne','1','2005-05-24 18:09:23','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('2','2','30','2','Wszyscy','1','2005-05-24 18:08:55','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('3','0','10','0','<img src="!themeDirectory!/img/noperm.png"/>','1','2005-05-24 18:11:56','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('3','1','20','1','<img src="!themeDirectory!/img/orgperm.png"/>','1','2005-05-24 18:06:18','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('3','2','30','2','<img src="!themeDirectory!/img/allperm.png"/>','1','2005-05-24 18:02:40','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('4','0','10','0','<img src="!themeDirectory!/img/noperm.png"/>','1','2005-05-24 18:10:59','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('4','1','20','1','<img src="!themeDirectory!/img/orgperm.png"/>','1','2005-05-24 18:09:23','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('4','2','30','2','<img src="!themeDirectory!/img/allperm.png"/>','1','2005-05-24 18:08:55','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('7','2',NULL,NULL,'Międzynarodowy','0','0000-00-00 00:00:00','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('7','4',NULL,NULL,'Narodowy','0','0000-00-00 00:00:00','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('7','5',NULL,NULL,'Wojewódzki','0','0000-00-00 00:00:00','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('7','6',NULL,NULL,'Miejscowość','1','2007-04-27 17:59:43','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('7','7',NULL,NULL,'Powiat','3','2006-05-30 12:57:25','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('7','8',NULL,NULL,'Gmina','3','2006-05-31 08:47:56','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('7','9',NULL,NULL,'Regionalny','1','2007-04-27 17:59:58','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('10','-1','20','0','Nie','1','2005-05-26 14:44:23','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('10','1','10','1','Tak','1','2005-05-26 14:42:00','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('11','1','10','1','Tak','1','2005-05-26 14:42:00','0');			
	
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('138','1',NULL,'en_US','English','1','2007-04-13 07:51:13','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('138','5',NULL,'pl_PL','Polski','1','2007-04-13 07:50:49','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('139','1',NULL,'en_US','EN','1','2007-04-13 07:51:13','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('139','5',NULL,'pl_PL','PL','1','2007-04-13 07:50:49','0');			

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('194','1',NULL,NULL,'Brak dokumentacji','3','2006-03-21 11:32:40','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('194','2',NULL,NULL,'Trochę dokumentacji','3','2006-03-21 11:32:57','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('194','3',NULL,NULL,'Podstawowa dokumentacja','3','2006-03-21 11:33:22','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('194','4',NULL,NULL,'Istotna dokumentacja','3','2006-03-21 11:33:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('194','5',NULL,NULL,'Pełna dokumentacja','3','2006-03-21 11:33:50','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('272','1','10','1','Nie wczytany','1','2004-11-16 11:14:38','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('272','2','60','6','Ukończony','1','2004-11-16 11:15:53','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('272','3','30','3','Tabele i pliki','1','2004-11-16 11:15:05','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('272','4','20','2','Tylko tabele','1','2004-11-16 11:14:51','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('272','5','40','4','Rozwój','1','2004-11-16 11:15:24','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('272','7','70','7','Zbędny','3','2005-01-27 11:47:26','0');


			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('298','1','1',NULL,'<div class="gsblt">','3','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('298','2','2',NULL,'<div class="gsbltR">','3','2011-07-30 13:48:35','0');			
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('299','1','1',NULL,'<span>','3','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('299','2','2',NULL,'<span class="sna">','3','2011-07-30 13:48:35','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('300','1','1',NULL,'&#9679;','3','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('300','0','2',NULL,'&#9675;','3','2011-07-30 13:48:35','0');			
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('301','1','1',NULL,'&#9679;','3','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('301','2','2',NULL,'&#9675;','3','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('302','1','1',NULL,'<span class="sya">Logged in</span>','3','2007-11-01 13:47:02','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('302','2','2',NULL,'<span class="sra">Logged out</span>','3','2007-11-01 13:47:14','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('302','3','5',NULL,'Pobranie strony','3','2007-11-01 13:47:27','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('302','9','3',NULL,'<span class="sna">Nieudany login</span>','3','2007-11-01 13:48:21','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('302','10','4',NULL,'<span class="sna">Odrzucenie</span>','3','2007-11-01 13:48:35','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('303','1','1',NULL,'<span class="sya">Obecny pracownik</span>','3','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('303','2','2',NULL,'<span class="sna">Były pracownik</span>','3','2011-07-30 13:48:35','0');	
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','1',NULL,'31','-01- Styczeń','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','2',NULL,'29','-02- Luty','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','3',NULL,'31','-03- Marzec','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','4',NULL,'30','-04- Kwiecień','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','5',NULL,'31','-05- Maj','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','6',NULL,'30','-06- Czerwiec','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','7',NULL,'31','-07- Lipiec','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','8',NULL,'31','-08- Sierpień','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','9',NULL,'30','-09- Wrzesień','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','10',NULL,'31','-10- Październik','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','11',NULL,'30','-11- Listopad','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('304','12',NULL,'31','-12- Grudzień','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','1', '1','31','Styczeń','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','2','2','29','Luty','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','3','3','31','Marzec','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','4','4','30','Kwiecień','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','5','5','31','Maj','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','6','6','30','Czerwiec','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','7','7','31','Lipiec','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','8','8','31','Sierpień','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','9','9','30','Wrzesień','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','10','10','31','Październik','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','11','11','30','Listopad','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('305','12','12','31','Grudzień','1','2011-07-30 13:48:35','0');	
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('306','1','2','1','<span class="sna"><img src="!themeDirectory!/img/status_nocall.png"/> Niezgłoszona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('306','2','3','2','<span class="sra"><img src="!themeDirectory!/img/status_wait.png"/> Zgłoszona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('306','3','4','3','<span class="sya"><img src="!themeDirectory!/img/status_allow.png"/> Zaakceptowana</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('306','4','5','3','<span class="sna"><img src="!themeDirectory!/img/status_reject.png"/> Odrzucona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('306','5','6','4','<span class="src"><img src="!themeDirectory!/img/status_closed.png"/> Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('306','6','7','5','<span class="sna"><img src="!themeDirectory!/img/status_reject1.png"/> Odmowa</span>','1','2011-07-30 13:48:35','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('307','1','5','1','Ponownie otwórz sprawę i edytuj Dane podstawowe','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('307','2','1','2','Zgłoś sprawę do dalszego działania i zablokuj edycję Danych podstawowych','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('307','3','2','3','Zaakceptuj sprawę do dalszego działania','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('307','4','3','3','Odrzuć wykonanie sprawy','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('307','5','4','4','Zamknij sprawę jako załatwioną','1','2011-07-30 13:48:35','0');								
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('307','6','6','4','Odmów realizacji sprawy','1','2011-07-30 13:48:35','0');

			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('308','1','1','1','Centrala','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('308','2','2','2','Oddział','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('308','3','3','3','Filia','1','2011-07-30 13:48:35','0');		
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('308','4','4','4','Punkt','1','2011-07-30 13:48:35','0');					

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('309','1','1','1','jeden raz w dzień','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('309','2','2','2','co tydzień od dnia','1','2011-07-30 13:48:35','0');		
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('309','3','3','3','co miesiąc od dnia','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('309','4','4','4','co roku od dnia','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('310','2','1','1','Poniedziałek','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('310','3','2','2','Wtorek','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('310','4','3','3','Środa','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('310','5','4','4','Czwartek','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('310','6','5','5','Piątek','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('310','7','6','6','Sobota','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('310','1','7','7','Niedziela','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('311','2','1','1','<span SortOrder="1"/>Pon.','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('311','3','2','2','<span SortOrder="2"/>Wto.','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('311','4','3','3','<span SortOrder="3"/>Śro.','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('311','5','4','4','<span SortOrder="4"/>Czw.','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('311','6','5','5','<span SortOrder="5"/>Pią.','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('311','7','6','6','<span SortOrder="6"/>Sob.','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('311','1','7','7','<span SortOrder="7"/>Nie.','1','2011-07-30 13:48:35','0');	

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('312','1','2','1','<span class="sna"><img src="!themeDirectory!/img/status_nocall.png"/><br/>Niezgłoszona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('312','2','3','2','<span class="sra"><img src="!themeDirectory!/img/status_wait.png"/><br/>Zgłoszona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('312','3','4','3','<span class="sya"><img src="!themeDirectory!/img/status_allow.png"/><br/>Zaakceptowana</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('312','4','5','3','<span class="sna"><img src="!themeDirectory!/img/status_reject.png"/><br/>Odrzucona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('312','5','6','4','<span class="src"><img src="!themeDirectory!/img/status_closed.png"/><br/>Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('312','6','7','5','<span class="sna"><img src="!themeDirectory!/img/status_reject1.png"/><br/>Odmowa</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('312','10','1','10','<img src="!themeDirectory!/img/status_assigned.png"/><br/>Przydzielona','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('312','11','8','11','Usunięta','1','2011-07-30 13:48:35','0');	

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('313','1','5','1','Ponownie otwórz sprawę i edytuj Dane podstawowe','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('313','2','1','2','Zgłoś sprawę do dalszego działania i zablokuj edycję Danych podstawowych','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('313','3','2','3','Zaakceptuj sprawę do dalszego działania','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('313','4','3','3','Odrzuć realizację sprawy','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('313','5','4','4','Zatwierdź sprawę do załatwienia i zamknij ją','1','2011-07-30 13:48:35','0');								
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('313','6','6','4','Odmów zatwierdzenia sprawy i jej realizacji','1','2011-07-30 13:48:35','0');			

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('314','1','2','1','<span class="sna"><img src="!themeDirectory!/img/status_nocall.png"/> Niezgłoszona</span><span class="pra"> &mdash;&mdash;&rsaquo; Zgłoszona &mdash;&mdash;&rsaquo; Zaakceptowana &mdash;&mdash;&rsaquo; Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('314','2','3','2','<span class="prb">&nbsp; Niezgłoszona &mdash;&mdash;&rsaquo;</span><span class="sra"><img src="!themeDirectory!/img/status_wait.png"/> Zgłoszona</span><span class="pra"> &mdash;&mdash;&rsaquo; Zaakceptowana &mdash;&mdash;&rsaquo; Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('314','3','4','3','<span class="prb">&nbsp; Niezgłoszona &mdash;&mdash;&rsaquo; Zgłoszona &mdash;&mdash;&rsaquo;</span><span class="sya"><img src="!themeDirectory!/img/status_allow.png"/> Zaakceptowana</span><span class="pra"> &mdash;&mdash;&rsaquo; Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('314','4','5','3','<span class="prb">&nbsp; Niezgłoszona &mdash;&mdash;&rsaquo; Zgłoszona &mdash;&mdash;&rsaquo;</span><span class="sna"><img src="!themeDirectory!/img/status_reject.png"/> Odrzucona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('314','5','6','4','<span class="prb">&nbsp; Niezgłoszona &mdash;&mdash;&rsaquo; Zgłoszona &mdash;&mdash;&rsaquo; Zaakceptowana &mdash;&mdash;&rsaquo;</span><span class="src"><img src="!themeDirectory!/img/status_closed.png"/> Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('314','6','7','5','<span class="prb">&nbsp; Niezgłoszona &mdash;&mdash;&rsaquo; Zgłoszona &mdash;&mdash;&rsaquo; Zaakceptowana &mdash;&mdash;&rsaquo;</span><span class="sna"><img src="!themeDirectory!/img/status_reject1.png"/> Odmowa</span>','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('315','1','2','1','<span class="sna"><img src="!themeDirectory!/img/status_nocall.png"/> Niezgłoszona</span><span class="pra"> &mdash;&mdash;&rsaquo; Zgłoszona &mdash;&mdash;&rsaquo;  Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('315','2','3','2','<span class="prb">&nbsp; Niezgłoszona &mdash;&mdash;&rsaquo;</span><span class="sra"><img src="!themeDirectory!/img/status_wait.png"/> Zgłoszona</span><span class="pra"> &mdash;&mdash;&rsaquo; Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('315','5','6','4','<span class="prb">&nbsp; Niezgłoszona &mdash;&mdash;&rsaquo; Zgłoszona &mdash;&mdash;&rsaquo;</span><span class="src"><img src="!themeDirectory!/img/status_closed.png"/> Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('315','6','7','5','<span class="prb">&nbsp; Niezgłoszona &mdash;&mdash;&rsaquo; Zgłoszona &mdash;&mdash;&rsaquo;</span><span class="sna"><img src="!themeDirectory!/img/status_reject1.png"/> Odmowa</span>','1','2011-07-30 13:48:35','0');

			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('316','1','2','1','<span class="sna"><img src="!themeDirectory!/img/status_nocall.png"/><br/>Niezgłoszona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('316','2','3','2','<span class="sra"><img src="!themeDirectory!/img/status_wait.png"/><br/>Zgłoszona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('316','3','4','3','<span class="sya"><img src="!themeDirectory!/img/status_allow.png"/><br/>Zaakceptowana</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('316','4','5','3','<span class="sna"><img src="!themeDirectory!/img/status_reject.png"/><br/>Odrzucona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('316','5','6','4','<span class="src"><img src="!themeDirectory!/img/status_closed.png"/><br/>Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('316','6','7','5','<span class="sna"><img src="!themeDirectory!/img/status_reject1.png"/><br/>Odmowa</span>','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('317','1','2','1','<span class="sna"><img src="!themeDirectory!/img/status_nocall.png"/> Niezgłoszona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('317','2','3','2','<span class="sra"><img src="!themeDirectory!/img/status_wait.png"/> Zgłoszona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('317','5','6','4','<span class="src"><img src="!themeDirectory!/img/status_closed.png"/> Załatwiona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('317','6','7','5','<span class="sna"><img src="!themeDirectory!/img/status_reject1.png"/> Odmowa</span>','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('318','1','5','1','Ponownie otwórz sprawę i edytuj Dane podstawowe','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('318','2','1','2','Zgłoś sprawę do dalszego działania i zablokuj edycję Danych podstawowych','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('318','5','4','4','Zaakceptuj i zamknij sprawę jako załatwioną','1','2011-07-30 13:48:35','0');								
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('318','6','6','4','Odmów realizacji sprawy','1','2011-07-30 13:48:35','0');
			
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1000','1','1','1','<span class="sya">otwarty</span>','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1000','2','2','2','<span class="sna">zamknięty</span>','1','2011-07-30 13:48:35','0');			
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1001','1','1','1','<span class="sya">otwarte</span>','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1001','2','2','2','<span class="sna">zamknięte</span>','1','2011-07-30 13:48:35','0');			
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1002','1','1','1','<span class="sya">otwarta</span>','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1002','2','2','2','<span class="sna">zamknięta</span>','1','2011-07-30 13:48:35','0');	

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1003','1','1','1','prasa','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1003','2','2','2','internet','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1003','3','3','3','telewizja','1','2011-07-30 13:48:35','0');		
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1003','4','4','4','radio','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','1','1',NULL,'1 osoba - 1 łóżko','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','2','2',NULL,'2 osoby - 1 łóżko','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','3','3',NULL,'2 osoby - 2 łóżka','1','2011-07-30 13:48:35','0');		
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','4','4',NULL,'3 osoby - 2 łóżka','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','5','5',NULL,'3 osoby - 3 łóżka','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','6','6',NULL,'4 osoby - 2 łóżka','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','7','7',NULL,'4 osoby - 3 łóżka','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','8','8',NULL,'4 osoby - 4 łóżka','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1004','9','9',NULL,'patrz uwagi do rezerwacji','1','2011-07-30 13:48:35','0');			
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1005','1','1','1','1. klasa','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1005','2','2','2','2. klasa','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1006','1','1','1','Przedziałowy','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1006','2','2','2','Bezprzedziałowy','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1007','1','1','1','Normalny','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1007','2','2','2','Ulgowy','1','2011-07-30 13:48:35','0');	

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1008','1','1','1','Bezpłatny','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1008','2','2','2','Na żadanie','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1008','3','3','3','Nieobecność usprawiedliwiona','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1008','4','4','4','Okolicznościowy','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1008','5','5','5','Opieka nad dzieckiem do 14 roku życia','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1008','6','6','6','Urlop ojcowski','1','2011-07-30 13:48:35','0');	
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1008','7','7','7','Urlop wypoczynkowy','1','2011-07-30 13:48:35','0');	

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1009','1','1','1','<span class="sya">dostępny</span>','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1009','2','2','2','<span class="sna">niedostępny</span>','1','2011-07-30 13:48:35','0');	

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1010','1','1','1','do zwrotu przedkładającemu fakturę','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1010','2','2','2','z zaliczki przedkładającego fakturę','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1010','3','3','3','służbową kartą płatniczą przedkładającego','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1010','6','4','6','służbową kartą płatniczą organizacji','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1010','4','5','4','przelew za fakturę przez organizację','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1011','1','1','1','faktura VAT','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1011','2','2','2','rachunek','1','2011-07-30 13:48:35','0');	
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1011','3','3','3','paragon fiskalny','1','2011-07-30 13:48:35','0');		
				
	
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1012','4','1','4','przelew za fakturę przez organizację','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1012','5','2','5','gotówką z kasy organizacji','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1012','6','3','6','służbową kartą płatniczą organizacji','1','2011-07-30 13:48:35','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1013','1','1','1','do zwrotu przedkładającemu fakturę','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1013','2','2','2','z zaliczki przedkładającego fakturę','1','2011-07-30 13:48:35','0');	
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1013','3','3','3','służbową kartą płatniczą przedkładającego','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1013','4','4','4','przelew za fakturę przez organizację','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1013','5','5','5','gotówką z kasy organizacji','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1013','6','6','6','służbową kartą płatniczą organizacji','1','2011-07-30 13:48:35','0');
			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1014','1','1','1','inny niż własny pojazd','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1014','2','2','2','własny samochód osobowy o pojemności do 900cm3
','1','2011-07-30 13:48:35','0');	
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1014','3','3','3','własny samochód osobowy o pojemności powyżej 900cm3
','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1014','4','4','4','własny motocykl','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1014','5','5','5','własny motorower','1','2011-07-30 13:48:35','0');
		
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1015','2','2','2','samochód osobowy o pojemności do 900cm3
','1','2011-07-30 13:48:35','0');	
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1015','3','3','3','samochód osobowy o pojemności powyżej 900cm3
','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1015','4','4','4','motocykl','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1015','5','5','5','motorower','1','2011-07-30 13:48:35','0');

			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','1','1','1','dowolny czas wylotu','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','2','2','2','zgodny z "Uwagami do czasu wylotu"','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','3','3','3','wcześnie rano między 4 a 7','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','4','4','4','rano między 7 a 9','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','5','5','5','przed południem między 9 a 12','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','6','6','6','wczesnym popołudniem między 12 a 15','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','7','7','7','po południu między 15 a 17','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','8','8','8','wieczorem między 17 a 21','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1016','9','9','9','w nocy między 21 a 24','1','2011-07-30 13:48:35','0');
			

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1017','1','1','1','dowolna','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1017','2','2','2','ekonomiczna','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1017','3','3','3','biznes','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1017','4','4','4','pierwsza','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1018','1','1','1','<span style="color:grey">&nbsp; [&nbsp;roboczogodzina&nbsp;]</span>','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1018','2','2','2','<span style="color:grey">&nbsp; [&nbsp;roboczodzień&nbsp;]</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1018','3','3','3','<span style="color:grey">&nbsp; [&nbsp;roboczotydzień&nbsp;]</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1018','4','4','4','<span style="color:grey">&nbsp; [&nbsp;roboczomiesiąc&nbsp;]</span>','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1019','1','1','1','<span class="sya">dostępna</span>','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1019','2','2','2','<span class="sna">niedostępna</span>','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','1','1','1','08.00','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','2','2','2','08.30','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','3','3','3','09.00','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','4','4','4','09.30','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','5','5','5','10.00','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','6','6','6','10.30','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','7','7','7','11.00','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','8','8','8','11.30','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','9','9','9','12.00','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','10','10','10','12.30','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','11','11','11','13.00','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','12','12','12','13.30','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','13','13','13','14.00','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','14','14','14','14.30','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','15','15','15','15.00','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','16','16','16','15.30','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','17','17','17','16.00','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','18','18','18','16.30','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1020','19','19','19','17.00','1','2011-07-30 13:48:35','0');	

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1021','1','1','1','<span class="sya">dostępny</span>','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1021','2','2','2','<span class="sna">niedostępny</span>','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1022','1','1','1','zadaniowe','1','2011-07-30 13:48:35','0');			
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1022','2','2','2','godzinowe co tydzień','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1022','3','3','3','godzinowe co miesiąc','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1023','2','1','2','tygodniowe za tydzień kalendarzowy','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1023','3','2','3','miesięczne za','1','2011-07-30 13:48:35','0');

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1024','1','1','1','<span class="sna"><img src="!themeDirectory!/img/status_question.png"/> Nieprzydzielona</span>','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1024','2','2','2','<span class="sya"><img src="!themeDirectory!/img/status_assigned.png"/> Przydzielona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1024','3','3','3','<span class="sna"><img src="!themeDirectory!/img/status_reject.png"/> Odrzucona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1024','4','4','4','<span class="src"><img src="!themeDirectory!/img/status_closed.png"/> Załatwiona</span>','1','2011-07-30 13:48:35','0');	

INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1025','1','1','1','<span class="sna"><img src="!themeDirectory!/img/status_question.png"/><br/> Nieprzydzielona</span>','1','2011-07-30 13:48:35','0');				
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1025','2','2','2','<span class="sya"><img src="!themeDirectory!/img/status_assigned.png"/> <br/>Przydzielona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1025','3','3','3','<span class="sna"><img src="!themeDirectory!/img/status_reject.png"/> <br/>Odrzucona</span>','1','2011-07-30 13:48:35','0');
INSERT INTO cod (CodeTypeID,CodeID,SortOrder,Value,Description,_ModBy,_ModDate,_Deleted)
            VALUES ('1025','4','4','4','<span class="src"><img src="!themeDirectory!/img/status_closed.png"/> <br/>Załatwiona</span>','1','2011-07-30 13:48:35','0');	