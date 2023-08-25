--1.黑名單
INSERT INTO BlackLists 
(Behavior) 
VALUES 
('詐欺行為'),('未經授權的行為'),('違反使用條款'),('頻繁退貨'),('不當行為'),('違反隱私權政策'),('其他');

SELECT * FROM BlackLists;
--------------------------------------------------
--2.特權
INSERT INTO Privileges 
(PrivilegeName,[Description]) 
VALUES 
('生日優惠','根據會員的生日提供獨家優惠和禮物'),
('專屬活動','邀請特定等級的會員參加線上或線下的活動'),
('訪問新品','新品推出優先讓VVIP會員購買'),
('限量商品','限量商品僅限VVIP會員購買');

SELECT * FROM Privileges;
--------------------------------------------------
--3.等級
INSERT INTO MembershipLevels 
(LevelName,MinSpending,Discount,[Description]) 
VALUES 
('一般會員',0,0,'新註冊的會員自動成為基本級別會員'),
('VIP',8888,88,'消費門檻達8,888即可升級'),
('VVIP',12000,85,'消費門檻達12,000即可升級');

SELECT * FROM MembershipLevels;
--------------------------------------------------
--4.會員等級與特權中介資料表
INSERT INTO MembershipLevelPrivileges (fk_LevelId, fk_PrivilegeId)
VALUES
  (1, 1), -- 一般會員的生日優惠
  (2, 1), -- VIP會員的生日優惠
  (2, 2), -- VIP會員的專屬活動優惠
  (3, 1), -- VVIP會員的生日優惠
  (3, 2), -- VVIP會員的專屬活動優惠
  (3, 3), -- VVIP會員的訪問新品優惠
  (3, 4); -- VVIP會員的限量商品優惠

SELECT * FROM MembershipLevels;
SELECT * FROM Privileges;
SELECT * FROM MembershipLevelPrivileges;

--不同等級的會員享有的福利
SELECT * 
FROM Privileges
JOIN MembershipLevelPrivileges ON Privileges.PrivilegeId=MembershipLevelPrivileges.fk_PrivilegeId
JOIN MembershipLevels ON fk_LevelId = MembershipLevels.levelId;
--------------------------------------------------
--5.會員
INSERT INTO Members ([Name], Age, Gender, Mobile, Email, Birthday, CommonAddress, Account, EncryptedPassword, IsConfirmed, ConfirmCode, fk_LevelId, fk_BlackListId)
VALUES
('David Wu', 28, 0, '0912378555', 'amyjohnson@example.com', '1995-07-08', '台北市信義區忠孝東路五段55號', 'a123', '123', 1, 'Confirmed', 1, NULL),
('Tina Lin', 41, 1, '0923456719', 'kevinchen@example.com', '1982-04-28', '台中市南區建國北路123號', 'b123', '123', 1, 'Confirmed', 2, NULL),
('Tony Chen', 48, 0, '0911654321', 'lisawang@example.com', '1975-10-17', '台北市中山區中正路789號', 'c23', '123', 1, 'Confirmed', 3, NULL),
('Ryan Liu', 20, 1, '0911456222', 'ryanliu@example.com', '2003-05-20', '新竹市東區光復路456號', 'ryanliu123', '123', 1, 'Confirmed', 2, NULL),
('Sophia Huang', 33, 0, '0933777244', 'sophiahuang@example.com', '1990-08-12', '桃園市中壢區環中東路111號', 'sophiahuang123', '123', 1, 'Confirmed', 1, NULL),
('Chris Lee', 30, 1, '0955753666', 'chrislee@example.com', '1993-11-05', '台南市北區成功路222號', 'chrislee123', '123', 1, 'Pending', 1, 3),
('Olivia Lin', 35, 0, '0922245633', 'olivialin@example.com', '1988-12-29', '彰化縣員林市中山路333號', 'olivialin123', '123', 1, 'Confirmed', 2, NULL),
('Daniel Yang', 45, 1, '096685277', 'danielyang@example.com', '1978-07-17', '新北市三峽區民生路456號', 'danielyang123', '123', 1, 'Confirmed', 1, NULL),
('Ava Tsai', 22, 0, '0912345678', 'avatsai@example.com', '2001-03-02', '基隆市中山區中正路567號', 'avatsai123', '123', 1, 'Confirmed', 2, NULL),
('Jason Huang', 38, 1, '0923556789', 'jasonhuang@example.com', '1985-08-28', '桃園市桃園區中正路789號', 'jasonhuang123', '123', 1, 'Confirmed', 3, NULL),
('Ella Wang', 29, 0, '0987654321', 'ellawang@example.com', '1994-11-14', '高雄市鳳山區鳳松路123號', 'ellawang123', '123', 1, 'Confirmed', 1, NULL),
('Eric Chen', 25, 1, '0911896233', 'ericchen@example.com', '1998-04-18', '新竹市北區光復路456號', 'ericchen123', '123', 1, 'Confirmed', 3, 4),
('Mia Liu', 42, 0, '0933312444', 'mialiu@example.com', '1981-01-09', '台南市南區成功路222號', 'mialiu123', '123', 1, 'Confirmed', 2, NULL),
('William Chang', 32, 1, '0955578966', 'williamchang@example.com', '1991-09-24', '彰化縣彰化市中山路333號', 'williamchang123', '123', 1, 'Confirmed', 1, NULL),
('Grace Lin', 27, 0, '0922224563', 'gracelin@example.com', '1996-06-10', '新北市板橋區民生路456號', 'gracelin123', '123', 1, 'Confirmed', 1, NULL),
('Alex Wu', 37, 1, '0966825777', 'alexwu@example.com', '1986-09-02', '基隆市仁愛區中正路567號', 'alexwu123', '123', 1, 'Pending', 2, 1),
('Chloe Huang', 23, 0, '0912348888', 'chloehuang@example.com', '2000-02-15', '新竹市東區民生路456號', 'chloehuang123', '123', 1, 'Confirmed', 1, 6),
('Andrew Liu', 44, 1, '0923456789', 'andrewliu@example.com', '1979-05-27', '桃園市中壢區中正路789號', 'andrewliu123', '123', 1, 'Confirmed', 2, 4),
('Lily Chen', 30, 0, '0981114321', 'lilychen@example.com', '1993-08-21', '高雄市前鎮區忠孝東路123號', 'lilychen123', '123', 1, 'Confirmed', 1, NULL),
('Henry Wang', 26, 1, '0910562562', 'henrywang@example.com', '1997-07-12', '台南市北區成功路222號', 'henrywang123', '123', 1, 'Confirmed', 2, 5),
('John Doe', 25, 1, '0934567890', 'johndoe@example.com', '1997-05-10', '新北市土城區學府路一段6號', 'johndoe123', '123', 1, 'Confirmed', 1, NULL),
('Jane Smith', 30, 0, '0976543210', 'janesmith@example.com', '1992-08-15', '新北市新莊區南雅路354號', 'janesmith456', '456', 1, 'Confirmed', 2, 1),
('Michael Johnson', 35, 1, '0958889999', 'michaeljohnson@example.com', '1987-03-20', '台中市太平區中正路一段111號', 'mjohnson789', '789', 1, 'Pending', 2, NULL),
('Emily Davis', 28, 0, '0972221111', 'emilydavis@example.com', '1993-11-05', '新北市鶯歌區鶯桃路三段7號', 'emilyd321', '444', 1, 'Confirmed', 1, NULL),
('David Wilson', 32, 1, '0947778888', 'davidwilson@example.com', '1989-07-12', '台東縣東河鄉濱海路33號', 'dwilson567', '555', 1, 'Confirmed', 1,NULL);

SELECT * FROM Members;


--[會員名單總覽]
SELECT MemberId,[Name],Gender,Email,LevelName,PointSubtotal,Registration,Behavior 
FROM Members
JOIN MembershipLevels ON fk_LevelId=MembershipLevels.LevelId
JOIN MemberPoints ON fk_MemberId=Members.MemberId
LEFT JOIN BlackLists ON fk_BlackListId=BlackLists.BlackListId;

--JOIN Members & MembershipLevel & BlackList 
--找出是黑名單的會員
SELECT * 
FROM Members
JOIN MembershipLevels ON fk_LevelId=MembershipLevels.LevelId
JOIN BlackLists ON fk_BlackListId=BlackLists.BlackListId;

--會員資料管理資訊
SELECT MemberId,[Name],Age,Gender,Email,Birthday,Registration,LevelName,Behavior 
FROM Members
JOIN MembershipLevels ON fk_LevelId=MembershipLevels.LevelId
LEFT JOIN BlackLists ON fk_BlackListId=BlackLists.BlackListId;
--------------------------------------------------
--6.備用地址
INSERT INTO AlternateAddresses (AlternateAddress1, AlternateAddress2, fk_MemberId)
VALUES
  ('新北市新莊區南雅路354號',null ,1),
  (NULL, NULL,2),
  ('新北市板橋區府中路一段6號', null,3),
  ('桃園市中壢區聖德路三段7號', NULL,5),
  ('台南市白河鎮白河路354號', '新北市土城區學士路一段36號',4);

SELECT * FROM AlternateAddresses;

--Members & AlternateAddresses
SELECT * FROM 
Members
JOIN AlternateAddresses
ON Members.MemberId=AlternateAddresses.fk_MemberId;

SELECT MemberId,[Name],CommonAddress,AlternateAddress1,AlternateAddress2 FROM 
Members
JOIN AlternateAddresses
ON Members.MemberId=AlternateAddresses.fk_MemberId;
--------------------------------------------------
--9.類型
INSERT INTO [Type] (TypeName)
VALUES
('商品'),
('活動'),
('課程'),
('客製化商品');

SELECT * FROM [Type];
--------------------------------------------------
--7.歷史積分,需要與訂單建立關聯
INSERT INTO PointHistories (GetOrDeduct, UsageAmount,fk_MemberId,fk_TypeId)
VALUES
  (1,100,1,1),
  (0,50,2,2),
  (0,200,3,3),
  (0,30,4,4),
  (1,0,5,1),
  (1,100,6,1),
  (0,50,7,2),
  (0,200,8,3),
  (0,30,8,4),
  (1,0,10,1),
  (1,100,12,1),
  (0,50,25,2),
  (0,200,13,3),
  (0,30,13,4),
  (1,0,5,1),
  (1,100,13,1),
  (0,50,2,2),
  (0,200,3,3),
  (0,30,11,4),
  (1,0,8,1),
  (1,100,1,1),
  (0,50,10,2),
  (0,200,3,3),
  (0,30,4,4),
  (1,0,5,1);

SELECT * FROM PointHistories;


--------------------------------------------------
--8.會員積分
INSERT INTO MemberPoints (PointSubtotal, fk_PointHistoryId, fk_MemberId)
VALUES 
	(110, 1, 1),(60, 2, 2),(420, 3, 3),(21, 4, 4),(70, 5, 5),	
	(110, 6, 6),(21, 9, 9),(70, 10, 10),(110, 11, 11),(60, 12, 12),    
	(420, 13, 13),(21, 14, 14),(70, 15, 15),(110, 16, 16),(0, 17, 17),
	(0, 18, 18),(0, 19, 19),(420, 20, 20),(21, 21, 21),(70, 22, 22),	
	(0, 23, 23),(0, 24, 24),(0, 25, 25),(420, 7, 7),(21, 8, 8);

SELECT * FROM MemberPoints;
--------------------------------------------------
--10.積分管理
INSERT INTO PointManage (GetOrDeduct,Amount,fk_TypeId,PointExpirationDate)
VALUES
(0, 100, 4, '2023-06-25'),(1, 200, 1, '2023-06-27'),(1, 200, 3, '2023-06-25'),(0, 100, 4, '2023-06-25'),(0, 100, 4, '2023-06-25'),
(1, 200, 4, '2023-06-27'),(0, 100, 2, '2023-06-25'),(0, 100, 3, '2023-06-27'),(1, 200, 4, '2023-06-25'),(1, 200, 4, '2023-06-27'),
(0, 100, 1, '2023-06-27'),(1, 200, 2, '2023-06-27'),(1, 200, 3, '2023-06-25'),(0, 100, 2, '2023-06-25'),(0, 100, 1, '2023-06-25'),
(0, 100, 3, '2023-06-27'),(1, 200, 2, '2023-06-25'),(1, 200, 1, '2023-06-25'),(0, 100, 2, '2023-06-27'),(0, 100, 1, '2023-06-27'),
(1, 200, 4, '2023-06-25'),(1, 200, 3, '2023-06-27'),(0, 100, 1, '2023-06-25'),(1, 200, 4, '2023-06-27'),(1, 200, 2, '2023-06-27');

SELECT * FROM PointManage;
--------------------------------------------------
--11.積分折抵
INSERT INTO PointTradeIn (GiftThreshold,GetPoints,MaxGetPoints,EffectiveDate,ExpirationDate,fk_MemberId)
VALUES
(100,1,1000,'2023-6-27','2024-6-27',1),
(200, 3, 900, '2023-06-05', '2024-06-05', 18),
(120, 1, 700, '2023-07-10', '2024-07-10', 5),
(180, 2, 600, '2023-08-15', '2024-08-15', 24),
(100, 1, 800, '2023-09-20', '2024-09-20', 7),
(250, 3, 900, '2023-10-25', '2024-10-25', 16),
(160, 2, 700, '2023-11-30', '2024-11-30', 23),
(140, 1, 1000, '2023-12-05', '2024-12-05', 9),
(200, 2, 800, '2024-01-10', '2025-01-10', 3),
(180, 2, 700, '2024-02-15', '2025-02-15', 21),
(130, 1, 600, '2024-03-20', '2025-03-20', 14),
(150, 2, 800, '2024-04-25', '2025-04-25', 10),
(170, 2, 900, '2024-05-30', '2025-05-30', 19),
(120, 1, 700, '2024-06-05', '2025-06-05', 6),
(190, 3, 1000, '2024-07-10', '2025-07-10', 25),
(160, 2, 800, '2024-08-15', '2025-08-15', 2),
(140, 1, 700, '2024-09-20', '2025-09-20', 17),
(210, 2, 800, '2024-10-25', '2025-10-25', 8),
(130, 1, 600, '2024-11-30', '2025-11-30', 22),
(150, 2, 800, '2024-12-05', '2025-12-05', 11),
(190, 3, 900, '2025-01-10', '2026-01-10', 15),
(170, 2, 700, '2025-02-15', '2026-02-15', 20),
(140, 1, 1000, '2025-03-20', '2026-03-20', 13),
(160, 2, 800, '2025-04-25', '2026-04-25', 4),
(180, 2, 900, '2025-05-30', '2026-05-30', 1);

SELECT * FROM PointTradeIn
--------------------------------------------------
--------------------------------------------------
--員工權限
INSERT INTO StaffPermissions (LevelName)
VALUES
  ('一般權限'),
  ('中級權限'),
  ('高級權限');

SELECT * FROM StaffPermissions;
--------------------------------------------------
--員工職稱
INSERT INTO JobTitles (TitleName,fk_StaffPermissions)
VALUES ('助理',1),
       ('專員',2),
       ('主管',3),
       ('經理',3);

SELECT * FROM JobTitles;

SELECT * 
FROM JobTitles
JOIN StaffPermissions
ON JobTitles.fk_StaffPermissions=StaffPermissions.PermissionsId;
--------------------------------------------------
--部門
INSERT INTO Departments (DepartmentName)
VALUES ('行銷部門'),
       ('技術部門'),
       ('銷售部門'),
       ('商品部門'),
       ('客服部門');

SELECT * FROM Departments;
--------------------------------------------------
--員工名單
INSERT INTO Staffs ([Name], Age, Gender, Mobile, Email, Birthday, Account, [Password], fk_PermissionsId,fk_TitleId,fk_DepartmentId,[DueDate])
VALUES
('吳依頒', 29, 0, '0912345601', 'amy.johnson@example.com', '1994-10-01', '123', '123', 1, 1, 5,'2021-01-01'),
('王盅集', 37, 1, '0987654302', 'kevin.chen@example.com', '1986-05-20', '456', '123', 2, 2, 4,'2000-01-03'),
('陳高吉', 42, 0, '0922334035', 'lisa.wang@example.com', '1981-03-15', '789', '123', 3, 4, 1,'2011-11-01'),
('Ryan Liu', 24, 1, '0933445046', 'ryan.liu@example.com', '1999-08-10', 'ryanliu', '123', 1, 1, 2,'2021-01-01'),
('Nana Su', 24, 1, '0933445777', 'nana@example.com', '1999-08-10', 'nana', '123', 1, 1, 2,'2023-06-08'),
('Sophia Huang', 26, 0, '0977880459', 'sophia.huang@example.com', '1997-07-22', 'sophiahuang', '123', 2, 4, 5,'2022-01-01'),
('Chris Lee', 38, 1, '0911223084', 'chris.lee@example.com', '1985-01-18', 'chrislee', '123', 1, 1, 3,'2000-01-11'),
('Olivia Lin', 33, 0, '0922112053', 'olivia.lin@example.com', '1990-06-05', 'olivialin', '123', 1, 2, 3,'2022-01-21'),
('Daniel Yang', 45, 1, '0933223094', 'daniel.yang@example.com', '1978-02-20', 'danielyang', '123', 3, 1, 1,'2022-01-01'),
('Ava Tsai', 22, 0, '0911122134', 'ava.tsai@example.com', '2001-11-05', 'avatsai', '123', 1, 1, 4,'2021-01-01'),
('Jason Huang', 32, 1, '0977882299', 'jason.huang@example.com', '1989-04-15', 'jasonhuang', '123', 1, 2, 1,'2021-01-01'),
('Ella Wang', 29, 0, '0922112563', 'ella.wang@example.com', '1994-07-30', 'ellawang', '123', 1, 4, 3,'2008-07-01'),
('Eric Chen', 25, 1, '0911227544', 'eric.chen@example.com', '1998-10-24', 'ericchen', '123', 1, 2, 5,'2010-01-15'),
('Mia Liu', 42, 0, '0933223584', 'mia.liu@example.com', '1981-01-10', 'mialiu', '123', 1, 1, 4,'2023-01-01'),
('William Chang', 30, 1, '0911562334', 'william.chang@example.com', '1993-06-25', 'williamchang', '123', 2, 1, 1,'2020-05-01'),
('Grace Lin', 27, 0, '0977689555', 'grace.lin@example.com', '1996-02-08', 'gracelin', '123', 3, 4, 2,'2021-01-01'),
('Alex Wu', 37, 1, '0913311556', 'alex.wu@example.com', '1986-09-30', 'alexwu', '123', 1, 2, 3,'2021-01-01'),
('Chloe Huang', 23, 0, '0933256344', 'chloe.huang@example.com', '2000-07-17', 'chloehuang', '123', 1, 1, 5,'2021-01-01'),
('Andrew Liu', 44, 1, '0911223854', 'andrew.liu@example.com', '1979-12-20', 'andrewliu', '123', 2, 1, 4,'2021-01-01'),
('Lily Chen', 30, 0, '0922112543', 'lily.chen@example.com', '1993-09-05', 'lilychen', '123', 1, 1, 1,'2021-01-01'),
('Henry Wang', 26, 1, '0911127734', 'henry.wang@example.com', '1997-04-22', 'henrywang', '123', 3, 2, 2,'2021-01-01'),
('Zoe Lin', 47, 0, '0977666605', 'zoe.lin@example.com', '1976-11-25', 'zoelin', '123', 1, 1, 3,'2021-01-01'),
('Sophia Chen', 29, 0, '0913347896', 'sophia.chen@example.com', '1994-03-11', 'sophiachen', '123', 1, 3, 4,'2021-01-01'),
('Chris Wang', 31, 1, '0933221114', 'chris.wang@example.com', '1992-12-28', 'chriswang', '123', 1, 2, 5,'2021-01-01'),
('Emily Liu', 36, 0, '0911223224', 'emily.liu@example.com', '1987-09-15', 'emilyliu', '123', 1, 1, 1,'2021-01-01'),
('Jason Chen', 24, 1, '0922112783', 'jason.chen@example.com', '1999-05-30', 'jasonchen', '123', 1, 1, 3,'2021-01-01'),
('Olivia Wu', 27, 0, '0977889639', 'olivia.wu@example.com', '1996-08-20', 'oliviawu', '123', 3, 1, 4,'2009-01-21'),
('Henry Lee', 34, 1, '0913341156', 'henry.lee@example.com', '1989-11-03', 'henrylee', '123', 1, 3, 5,'2021-01-01'),
('Sophie Wang', 41, 0, '0933275344', 'sophie.wang@example.com', '1982-10-18', 'sophiewang', '123', 3, 3, 1,'2021-01-01'),
('Benjamin Liu', 25, 1, '0911223621', 'benjamin.liu@example.com', '1998-05-12', 'benjaminliu', '123', 1, 1, 2,'2021-01-01'),
('John Doe', 25, 1, '0912345678', 'john.doe@example.com', '1998-05-15', 'johndoe', '123', 1,1,1,'2021-01-01'),
('Jane Smith', 30, 0, '0987654321', 'jane.smith@example.com', '1991-09-20', 'janesmith', '456', 1,4,2,'2021-01-01'),
('David Lee', 35, 1, '0922334455', 'david.lee@example.com', '1988-12-10', 'davidlee', '789', 2,1,2,'2021-01-01'),
('Sarah Wang', 28, 0, '0933445566', 'sarah.wang@example.com', '1993-06-25', 'sarahwang', 'abc', 3,4,4,'2000-12-31'),
('Michael Chen', 32, 1, '0977888999', 'michael.chen@example.com', '1989-04-05', 'michaelchen', 'xyz', 1,4,3,'2021-01-01');

SELECT * FROM Staffs;

--[員工名單總覽]
SELECT *
FROM Staffs
JOIN Departments ON Staffs.fk_DepartmentId=Departments.DepartmentId
JOIN JobTitles ON Staffs.fk_TitleId=JobTitles.TitleId
JOIN StaffPermissions ON Staffs.fk_PermissionsId=StaffPermissions.PermissionsId;

SELECT StaffId,D.DepartmentName as [Department],TitleName,[Name],Age,Gender,Email,LevelName,dueDate
FROM Staffs as S
JOIN Departments as D ON S.fk_DepartmentId=D.DepartmentId
JOIN JobTitles as J ON S.fk_TitleId=J.TitleId
JOIN StaffPermissions as SP ON S.fk_PermissionsId=SP.PermissionsId;
