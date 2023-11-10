create table members_info (
name varchar(20),
 phone_no varchar(20),
 address varchar(20),
 age_group varchar(10),
 member_status varchar(10) );
 
 select * from members_info
insert into members_info (name, phone_no, address, age_group, member_status)
values ('ADEBOLA JOHNSON',7065182912,'FADEYI STREET', 'youth','new');
insert into members_info values ('VICTORIA BADA', 8082827458, 'PEACE ESTATE','youth', 'old');
insert into members_info values ('GODSWILL JOHN',7085963214, 'AJAYI ROAD', 'adult', 'new');
insert into members_info values ('GODSWILL GLORIA', 8054217896, 'AJAYI ROAD', 'adult', 'new');
insert into members_info values ('OGUNDARE OLAYINKA', 9065214789, 'LAGOS STREET', 'adult', 'old');
insert into members_info values ('EMERENI  JAMES', 7017394569, 'FADEYI STREET', 'youth', 'old');
insert into members_info values ('JOHN OKON', 7066763934, 'AJAYI ROAD', 'teen','old');
insert into members_info values ('DAVID SANUSI', 7012548963, 'A&G ESTATE', 'teen', 'old');
insert into members_info values ('JUMOKE SANUSI', 8164488555, 'A&G ESTATE', 'youth', 'old');
insert into members_info values ('EMERENI JAMES', 7017394569, 'FADEYI STREET','youth', 'new');
insert into members_info values ('AKPAN UDOH',7036521478, 'MUIBI CLOSE','adult', 'old');
insert into members_info values ('EDIKAN UDOH', 7045632178, 'ogba', 'teen', 'new');

create table harvest_of_miracle (
name varchar(20),
attendance_yes_no varchar(5),
 payment_mode varchar(10),
 tithe_offering varchar(10) );
 select * from members_info
select * from harvest_of_miracle
insert into harvest_of_miracle values ('ADEBOLA JOHNSON', 'yes', 'offering', 'transfer');
insert into harvest_of_miracle values ('VICTORIA BADA', null, null, null);
insert into harvest_of_miracle values ('GODSWILL JOHN', 'yes', 'both', 'transfer');
insert into harvest_of_miracle values ('GODSWILL GLORIA', 'yes', 'offering', 'transfer');
insert into harvest_of_miracle values ('OGUNDARE OLAYINKA', 'yes', 'offering', 'transfer');
insert into harvest_of_miracle values ('EMERENI  JAMES', 'yes', 'offering', 'cash');
insert into harvest_of_miracle values ('JOHN OKON', 'yes', null, null);
insert into harvest_of_miracle values ('DAVID SANUSI', 'no', null, null);
insert into harvest_of_miracle values ('JUMOKE SANUSI', 'yes', 'offering', 'cash');
insert into harvest_of_miracle values ('AKPAN UDOH', 'yes', 'offering', 'transfer');
insert into harvest_of_miracle values ('EDIKAN UDOH', 'yes', 'offering', 'cash');


create table friday_vigil (
name varchar(20), 
attendance_yes_no varchar(5),
payment_mode varchar(10), 
tithe_offering varchar(10) );

select * from friday_vigil
insert into friday_vigil values ('ADEBOLA JOHNSON', 'yes', 'offering', 'transfer');
insert into friday_vigil values ('VICTORIA BADA', null, null, null);
insert into friday_vigil values ('GODSWILL JOHN', 'yes', 'both', 'transfer');
insert into friday_vigil values ('GODSWILL GLORIA', 'yes', 'offering', 'transfer');
insert into friday_vigil values ('OGUNDARE OLAYINKA', 'yes', 'offering', 'transfer');
insert into friday_vigil values ('EMERENI  JAMES', 'yes', 'offering', 'cash');
insert into friday_vigil values ('JOHN OKON', 'yes', null, null);
insert into friday_vigil values ('DAVID SANUSI', 'no', null, null);
insert into friday_vigil values ('JUMOKE SANUSI', 'yes', 'offering', 'cash');
insert into friday_vigil values ('AKPAN UDOH', 'yes', 'offering', 'transfer');
insert into friday_vigil values ('EDIKAN UDOH', 'yes', 'offering', 'cash');

CREATE TABLE Donations (
    Donation_Id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    donation_amount DECIMAL(10, 2) NOT NULL,
    donation_date DATE,
    payment_mode VARCHAR(50),
    purpose VARCHAR(255)
);
select * from Donations
INSERT INTO Donations (name, donation_amount, donation_date, payment_mode, purpose)
VALUES
    ('ADEBOLA JOHNSON', 100.00, '2023-11-08', 'cash', 'General Fund'),
    ('VICTORIA BADA', 50.00, '2023-11-09', 'bank transfer', 'Education Fund'),
    ('OKON JOHN', 200.00, '2023-11-10', 'Cash', 'Medical Fund'),
    ('EMERENI JAMES', 75.50, '2023-11-11', 'bank transfer', 'Emergency Fund'),
    ('JUMOKE SANUSI', 150.00, '2023-11-12', 'Bank Transfer', 'General Fund'),
    ('DAVID SANUSI', 300.00, '2023-11-13', 'cash', 'Education Fund'),
    ('AKPAN UDOH', 25.00, '2023-11-14', 'bank transfer', 'General Fund'),
    ('EDIKAN UDOH', 85.25, '2023-11-15', 'Cash', 'Medical Fund');
    
    joining the donations and members_info tables
    select * from members_info
    inner join donations
    on members_info.name=donations.name;
    
    
members that didnt donate    
SELECT m.name AS member_name
FROM members_info AS m
LEFT JOIN Donations AS d ON m.name = d.name
WHERE d.name IS NULL;

total members that paid offering
SELECT name AS name
FROM members_info AS m
LEFT JOIN harvest_of_miracle AS hm ON m.name = hm.name
LEFT JOIN friday_vigil AS fv ON m.name = fv.name
WHERE hm.name IS NULL AND fv.name IS NULL;

join all table
SELECT
    mi.name AS member_name,
    mi.phone_no,
    mi.address,
    mi.age_group,
    mi.member_status,
    IFNULL(dm.donation_amount, 0) AS donation_amount,
    IFNULL(hm.attendance_yes_no, 'no') AS friday_vigil_attendance,
    IFNULL(hm.payment_mode, 'not specified') AS friday_vigil_payment_mode,
    IFNULL(hm.tithe_offering, 'not specified') AS friday_vigil_tithe_offering,
    IFNULL(fv.attendance_yes_no, 'no') AS friday_vigil_attendance,
    IFNULL(fv.payment_mode, 'not specified') AS friday_vigil_payment_mode,
    IFNULL(fv.tithe_offering, 'not specified') AS friday_vigil_tithe_offering
FROM members_info AS mi
LEFT JOIN Donations AS dm ON mi.name = dm.name
LEFT JOIN harvest_of_miracle AS hm ON mi.name = hm.name
LEFT JOIN friday_vigil AS fv ON mi.name = fv.name;







