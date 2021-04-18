-- 1. feladat:
CREATE DATABASE TorpeTarnak
CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;

-- 3. feladat:
ALTER TABLE kihol
ADD FOREIGN KEY (torpe_id) REFERENCES torpek(id);

ALTER TABLE kihol
ADD FOREIGN KEY (tarna_id) REFERENCES tarnak(id);

ALTER TABLE tarnak
ADD FOREIGN KEY (kozet_id) REFERENCES kozetek(id);

-- 4. feladat:
SELECT nev,magassag 
FROM torpek 
ORDER BY magassag 
DESC LIMIT 1;

-- 5. feladat:
SELECT COUNT(kihol.torpe_id) 
FROM kihol JOIN tarnak 
ON kihol.tarna_id=tarnak.id 
WHERE tarnak.nev='Gir Lodur';


-- 6. feladat:
SELECT tarnak.nev AS 'Tárna neve',SUM(kihol.kitermelt_mennyiseg) AS 'Arany'
FROM tarnak
JOIN kihol
ON tarnak.id=kihol.tarna_id
WHERE tarnak.kozet_id=(SELECT id FROM kozetek WHERE nev='arany')
GROUP BY tarnak.nev
ORDER BY Arany DESC;

-- 7. feladat:
SELECT torpek.nev,SUM(kihol.kitermelt_mennyiseg) AS 'Mennyit' 
FROM `torpek` JOIN kihol ON torpek.id=kihol.torpe_id 
WHERE torpek.klan='Vasököl' AND torpek.nem='N'
GROUP BY torpek.nev
ORDER BY Mennyit DESC
LIMIT 1;

-- 8. feladat:
INSERT INTO `torpek` (`id`, `nev`, `klan`, `nem`, `suly`, `magassag`) VALUES (NULL, 'Trad Morf', 'Vasököl', 'F', '69', '136'); 

-- 9. feladat:
INSERT INTO `kihol`(`torpe_id`, `tarna_id`, `kitermelt_mennyiseg`) 
VALUES ((SELECT id FROM torpek WHERE nev='Trad Morf'),
       (SELECT id FROM tarnak WHERE nev='Gir Lodur'),43);

INSERT INTO `kihol`(`torpe_id`, `tarna_id`, `kitermelt_mennyiseg`) 
VALUES ((SELECT id FROM torpek WHERE nev='Trad Morf'),
       (SELECT id FROM tarnak WHERE nev='Moldirth'),28);