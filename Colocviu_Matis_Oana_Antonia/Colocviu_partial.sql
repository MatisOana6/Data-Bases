--Baza de date Cabinet de Avocatura--
--1.
-- Ajuta la re-crearea tabelelor (cand deja exista)
  DROP TABLE Rata;
  DROP TABLE Contract_j;
  DROP TABLE Contract_m;
  DROP TABLE Persoana;

--a)
  CREATE TABLE Persoana
  (id_p NUMBER NOT NULL,
  nume VARCHAR2(50) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  adresa VARCHAR2(50) NOT NULL );

--b)
  CREATE TABLE Contract_j
  (id_cj NUMBER  NOT NULL,
  data DATE NOT NULL,
  obiect VARCHAR2(50) NOT NULL,
  onorar NUMBER NOT NULL,
  nr_pagini NUMBER NOT NULL,
  id_client NUMBER NOT NULL,
  id_avocat NUMBER NOT NULL);

--c)
  CREATE TABLE Contract_m
  (id_cm NUMBER NOT NULL,
  data DATE NOT NULL,
  functie VARCHAR(50) NOT NULL,
  salar_baza NUMBER NOT NULL,
  comision NUMBER(8,2) NOT NULL,
  id_angajat NUMBER NOT NULL);

--d)
  CREATE TABLE Rata
  (id_cj NUMBER NOT NULL,
  id_r NUMBER NOT NULL,
  data DATE NOT NULL,
  suma NUMBER NOT NULL);

--e)
  ALTER TABLE Persoana 
  ADD CONSTRAINT pk_persoana PRIMARY KEY(id_p);

  ALTER TABLE Contract_j 
  ADD CONSTRAINT pk_contract_j PRIMARY KEY(id_cj);

  ALTER TABLE Contract_m 
  ADD CONSTRAINT pk_contract_m PRIMARY KEY(id_cm);

  ALTER TABLE Rata
  ADD CONSTRAINT pk_rata PRIMARY KEY(id_r);

  ALTER TABLE Rata 
  ADD CONSTRAINT fk_rata FOREIGN KEY(id_cj) REFERENCES Contract_j(id_cj) ON DELETE CASCADE;

  ALTER TABLE Contract_j
  ADD CONSTRAINT fk_id_client FOREIGN KEY (id_client) REFERENCES Persoana(id_p) ON DELETE CASCADE;
 
  ALTER TABLE Contract_j
  ADD CONSTRAINT fk_id_avocat FOREIGN KEY (id_avocat) REFERENCES Persoana(id_p) ON DELETE CASCADE;

  ALTER TABLE Contract_m
  ADD CONSTRAINT fk_id_angajat FOREIGN KEY (id_angajat) REFERENCES Persoana(id_p) ON DELETE CASCADE;
 

--f)
  ALTER TABLE Persoana
  ADD telefon VARCHAR2(15);

--inserarea de date in tabel
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(1,'John Doe','john.doe.12@yahoo.com','str Ciresilor, nr 87','0742587728');
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(2,'Pop Ioana','pop.ioana09@yahoo.com','str Observatorului, nr 14','0722567128');
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(3,'Tarta Antonia','anto.t16@yahoo.com','str Principala, nr 34','0734567138');
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(4,'Ianchis Alexandru','ianchis_alex12@yahoo.com','str Mihai Eminescu, nr 128','0784547239');
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(5,'Breje Tania','b_tania11@yahoo.com','str Giordano Bruno, nr 10','0789464447');
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(6,'Todorutiu Daniela','danielatodorutiu@yahoo.com','str Porolissum, nr 219','0747064447');
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(7,'Filip David','david.filip.23@yahoo.com','str Frunzisului, nr 13','0757324437');
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(8,'Miclea Paula','m.paula_15@yahoo.com','str Teiului, nr 23','0767354837');
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(9,'Pop Cristian','popcristian_12@yahoo.com','str Mihai Viteazu, nr 223','0767254897');
  INSERT INTO Persoana(id_p,nume,email,adresa,telefon) VALUES(10,'Matis Oana','matisoana06@yahoo.com','str Giordano Bruno, nr 98','0787464449');
 
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(1,'01-Oct-2022','actiune civila',200,50,4,3);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(2,'21-Oct-2022','actiune civila',1000,100,8,5);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(3,'12-Nov-2022','actiune penala',1000,20,7,5);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(4,'07-Jun-2021','actiune civila',200,50,2,3);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(5,'22-Nov-2021','actiune civila',250,50,3,6);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(6,'09-Aug-2022','actiune civila',200,50,4,6);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(7,'20-May-2020','actiune civila',100,30,2,10);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(8,'12-Mar-2021','actiune penala',700,50,7,5);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(9,'30-May-2021','actiune civila',400,150,9,5);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(10,'30-May-2021','actiune civila',600,450,8,10);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES(11,'25-Jul-2020','actiune penala',850,350,2,10);
  
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(1,'06-Aug-2021','avocat',20000,15,1);
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(2,'18-Mar-2021','client',1340,10,2);
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(3,'16-Mar-2021','angajat',2890,20,3);
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(4,'25-Jun-2021','client',3400,20,4);
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(5,'06-Aug-2021','avocat',42000,15,5);
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(6,'09-Sep-2021','avocat',15000,25,6);
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(7,'09-Sep-2022','angajat',15000,20,7);
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(8,'21-Jul-2022','client',13000,10,8);
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(9,'26-Aug-1990','angajat',20600,15,9);   
  INSERT INTO Contract_m(id_cm,data,functie,salar_baza,comision,id_angajat) VALUES(10,'17-Apr-1990','avocat',34000,30,10);  
  
  INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(1,1,'01-Oct-2022',200);
  INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(2,2,'21-Oct-2022',500);
  INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(3,3,'12-Nov-2022',500);
  INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(3,4,'13-Nov-2022',500);
  INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(4,5,'22-Oct-2021',200);
  INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(5,6,'21-Nov-2021',200);
  INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(6,7,'20-May-2020',100);
  INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(7,8,'25-Jul-2020',425);
  INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(7,9,'25-Jul-2020',425);


--2.
--a) 
  ALTER TABLE Contract_j 
  ADD CONSTRAINT check_obiect CHECK (obiect IN('actiune civila','actiune penala'));
--b)
  ALTER TABLE Contract_j 
  ADD CONSTRAINT check_onorar CHECK (LOWER(obiect)!='actiune penala' OR onorar>500);

--3.
--a)
  
  SELECT *
  FROM Contract_j
  WHERE data BETWEEN '01-Oct-2022' AND '31-Oct-2022' AND onorar BETWEEN 900 AND 1500
  ORDER BY data ASC;

--b)
  SELECT *
  FROM Contract_m
  WHERE functie LIKE 'a%' 
  ORDER BY salar_baza DESC, functie ASC;

--4.
--a)
 
  SELECT nume
  FROM Persoana
  JOIN Contract_m ON id_p=id_angajat
  WHERE data BETWEEN '01-Jan-2022' AND '31-Dec-2022' AND functie!='avocat';

--b)
  SELECT cj1.id_cj ||' '|| cj2.id_cj AS pereche 
  FROM Contract_j cj1
  INNER JOIN Contract_j cj2 ON cj1.id_cj < cj2.id_cj
  WHERE cj1.id_client != cj2.id_client AND cj1.id_avocat=cj2.id_avocat;

--5.
--a)
  SELECT *
  FROM Contract_m contractm1 
  WHERE EXISTS (SELECT comision 
                FROM Contract_m contractm2
                WHERE contractm1.comision=contractm2.comision AND contractm1.id_cm!=contractm2.id_cm)
  ORDER BY comision;

--b)
  SELECT DISTINCT nume FROM Persoana Join Contract_j
  ON Persoana.id_p=Contract_j.id_avocat 
  WHERE Contract_j.onorar>=ALL(SELECT Contract_j.onorar FROM Contract_j);

--6.
--a)
  SELECT nume, TRUNC((Contract_m.salar_baza+castig/12),2) AS Salar_mediu
  FROM
  (SELECT id_angajat as Angajat, SUM(total) AS castig
   FROM 
  (SELECT Contract_j.data, id_angajat, (comision/100*onorar) AS total 
  FROM Contract_m JOIN Contract_j ON id_angajat=id_avocat
  WHERE Contract_j.data BETWEEN '01-Jan-2022' AND '31-Dec-2022')
  GROUP BY id_angajat)
  JOIN Contract_m ON Angajat=Contract_m.id_angajat
  JOIN Persoana ON Angajat=Persoana.id_p

--b)
  SELECT id_cj, data, obiect, onorar, nr_pagini, id_client, id_avocat
  FROM
  (SELECT id_cj AS ID, SUM(suma) AS Platit
   FROM Rata
   GROUP BY id_cj
  )
  JOIN Contract_j ON ID=Contract_j.id_cj
  WHERE (Contract_j.onorar-Platit) > 0 

  UNION 
  SELECT *
  FROM Contract_j
  WHERE id_cj NOT IN (SELECT id_cj
                      FROM Rata);


--7.
--a)
  INSERT INTO Contract_m VALUES(80,'01-SEP-2022','avocat',10000,12.5,1);
  SELECT * FROM Contract_m;
--b)
  DELETE
  FROM Contract_j WHERE id_cj NOT IN (SELECT id_cj 
                                    FROM Rata)
  AND data < '01-Jan-2021';
  
  SELECT * FROM Contract_j;
--c)
  UPDATE Contract_m 
  SET salar_baza = CASE 
                   WHEN functie!='avocat' THEN salar_baza+0.02*salar_baza
                   WHEN functie ='avocat' AND MONTHS_BETWEEN(CURRENT_DATE,data)>=60 THEN salar_baza+0.025*salar_baza
                   ELSE salar_baza 
                   END ;   
  SELECT * FROM Contract_m;

--8.
--a)
  CREATE OR REPLACE TRIGGER Contract_j_trigger 
  BEFORE UPDATE 
  OF onorar 
  ON Contract_j 
  FOR EACH ROW
  DECLARE
  v_numar_rate NUMBER;
  BEGIN
  SELECT COUNT (*) INTO v_numar_rate 
  FROM Rata 
  WHERE rata.id_cj=:new.id_cj AND rata.suma!=0;
  IF v_numar_rate>0 THEN
  :NEW.onorar:=:OLD.onorar;
  END IF;
  END; 
/
UPDATE Contract_j
SET onorar=590
WHERE id_cj=3;

--b)
  CREATE OR REPLACE TRIGGER Rata_trigger 
  BEFORE INSERT 
  ON Rata 
  FOR EACH ROW
  DECLARE
  data_contract DATE;
  suma_rata NUMBER;
  onorar_contract NUMBER;

  BEGIN
  SELECT data INTO data_contract  
  FROM Contract_j 
  WHERE Contract_j.id_cj=:new.id_cj;
  IF (data_contract >:new.data) THEN 
  RAISE_APPLICATION_ERROR(-20500,'Data este ulterioara datei contractului');
  END IF;

  SELECT SUM(suma) INTO suma_rata
  FROM Rata
  WHERE Rata.id_cj=:new.id_cj;
  SELECT onorar INTO onorar_contract
  FROM Contract_j 
  WHERE Contract_j.id_cj=:new.id_cj;

  IF (suma_rata+:new.suma>onorar_contract)THEN 
  RAISE_APPLICATION_ERROR(-20500,'Suma ratelor este mai mare decat valoarea onorariului');
  END IF;
  END; 
/

INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(3,13,'03-Mar-2018',4000);
INSERT INTO Rata(id_cj,id_r,data,suma) VALUES(1,14,'02-Oct-2022',49000);



--c)
  CREATE OR REPLACE VIEW Clienti_John_Doe AS
  SELECT c.id_client, b.nume nume_client, b.email, b.adresa, id_cj, data, obiect,onorar, nr_pagini
  FROM Persoana a, Contract_j c, Persoana b
  WHERE a.nume = 'John Doe' AND
  c.id_avocat = a.id_p AND
  b.id_p = c.id_client; 

  CREATE OR REPLACE TRIGGER TRIGGER_INSTEAD_OF
  INSTEAD OF INSERT ON Clienti_John_Doe
  FOR EACH ROW
  DECLARE
  id NUMBER;
  BEGIN
  SELECT id_p INTO id FROM Persoana WHERE nume='John Doe';
  INSERT INTO Persoana(id_p,nume,email,adresa) VALUES (:new.id_client,:new.nume_client,:new.email,:new.adresa);
  INSERT INTO Contract_j(id_cj,data,obiect,onorar,nr_pagini,id_client,id_avocat) VALUES (:new.id_cj,:new.data,:new.obiect,:new.onorar,:new.nr_pagini,:new.id_client,id);
  END;
/

  INSERT INTO Clienti_John_Doe(id_client,nume_client,email,adresa,id_cj,data,obiect,onorar,nr_pagini) VALUES (11,'Pop Ioan','popioan@yahoo.com','Str Carei, nr 81',30,'01-DEC-2022','actiune civila',200,17);
  INSERT INTO Clienti_John_Doe(id_client,nume_client,email,adresa,id_cj,data,obiect,onorar,nr_pagini) VALUES (12,'Varodi Rebeca','var_rebe9@yahoo.com','Str Macilor, nr 128',31,'03-AUG-2022','actiune penala',700,20);
  INSERT INTO Clienti_John_Doe(id_client,nume_client,email,adresa,id_cj,data,obiect,onorar,nr_pagini) VALUES (13,'Mitrea George','m.george.12@yahoo.com','Str Florilor, nr 79',32,'06-nov-2022','actiune civila',360,40);
  SELECT * FROM  Clienti_John_Doe;
