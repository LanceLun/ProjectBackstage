INSERT INTO ColorCategories (ColorName)
VALUES
    ('黑'),
    ('白'),
    ('灰'),
    ('紅'),
    ('藍'),
    ('黃');

INSERT INTO SizeCategories ( SizeName)
VALUES ('S'),
       ('M'),
       ('L'),
	   ('XL'),
	   ('XXL'),
	   ('XXXL'),
	   ('XXXL'),
	   ('16'),
	   ('16.5'),
	   ('17'),
	   ('17.5'),
	   ('18'),
	   ('18.5'),
	   ('19'),
	   ('19.5'),
	   ('20'),
	   ('20.5'),
	   ('21'),
	   ('21.5'),
	   ('22'),
	   ('22.5'),
	   ('23'),
	   ('23.5'),
	   ('24'),
	   ('24.5'),
	   ('25'),
	   ('25.5'),
	   ('26'),
	   ('26.5'),
	   ('27'),
	   ('27.5'),
	   ('28'),
	   ('單一規格');


INSERT INTO SalesCategories (SalesCategoryName)
VALUES ('男裝'),
       ('女裝'),
       ('童裝');


INSERT INTO ProductCategories( ProductCategoryName,fk_SalesCategoryId,CategoryPath)
VALUES ('上衣',1,'男裝/上衣'),
	   ('上衣',2,'女裝/上衣'),
	   ('上衣',3,'童裝/上衣'),
       ('褲子',1,'男裝/褲子'),
	   ('褲子',2,'女裝/褲子'),
	   ('褲子',3,'童裝/褲子'),
       ('鞋子',1,'男裝/鞋子'),
	   ('鞋子',2,'女裝/鞋子'),
	   ('鞋子',3,'童裝/鞋子'),
       ('配件',1,'男裝/配件'),
	   ('配件',2,'女裝/配件'),
	   ('配件',3,'童裝/配件');


INSERT INTO ProductSubCategories( ProductSubCategoryName,fk_ProductCategoryId,SubCategoryPath)
VALUES 
('短袖',1,'男裝/上衣/短袖'),
('短袖',2,'女裝/上衣/短袖'),
('短袖',3,'童裝/上衣/短袖'),
('長袖',1,'男裝/上衣/長袖'),
('長袖',2,'女裝/上衣/長袖'),
('長袖',3,'童裝/上衣/長袖'),
('短褲',4,'男裝/褲子/短褲'),
('短褲',5,'女裝/褲子/短褲'),
('短褲',6,'童裝/褲子/短褲'),
('長褲',4,'男裝/褲子/長褲'),
('長褲',5,'女裝/褲子/長褲'),
('長褲',6,'童裝/褲子/長褲'),
('休閒鞋',7,'男裝/鞋子/休閒鞋'),
('休閒鞋',8,'女裝/鞋子/休閒鞋'),
('休閒鞋',9,'童裝/鞋子/休閒鞋'),
('運動鞋',7,'男裝/鞋子/運動鞋'),
('運動鞋',8,'女裝/鞋子/運動鞋'),
('運動鞋',9,'童裝/鞋子/運動鞋'),
('包包',10,'男裝/配件/包包'),
('包包',11,'女裝/配件/包包'),
('包包',12,'童裝/配件/包包'),
('帽子',10,'男裝/配件/帽子'),
('帽子',11,'女裝/配件/帽子'),
('帽子',12,'童裝/配件/帽子');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0001','男款純棉短袖上衣','簡單實用的基本款 T 恤，無論作為運動服或日常穿著都非常合適。物超所值，絕對讓你愛不釋手一款採用圓領、短袖、柔軟的純棉材質打造，物超所值的 T 恤。','98% 棉, 2% 彈性纖維','台灣',1200,1000,'false','false',null,1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0001',1,1,100),
('M_CL_ST_0001',1,2,200),
('M_CL_ST_0001',2,3,220),
('M_CL_ST_0001',2,4,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_CL_ST_0001','Product_0011.jpg'),
('M_CL_ST_0001','Product_0012.jpg'),
('M_CL_ST_0001','Product_0013.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_ST_0002','男款快乾透氣短袖上衣','對環境友善的吸濕排汗 T 恤，適合偶爾登山健行時穿著。','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',1300,1100,'false','限量',1);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_ST_0002',3,1,220),
('M_CL_ST_0002',3,2,100),
('M_CL_ST_0002',4,4,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_CL_ST_0002','Product_0021.jpg'),
('M_CL_ST_0002','Product_0022.jpg'),
('M_CL_ST_0002','Product_0023.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0001','女款透氣跑步短袖上衣','讓你在夏日跑步時保持涼爽！輕盈透氣微孔布料搭配背部通風設計，讓空氣能在這款女款跑步 T 恤流通。','90% 的再生聚酯纖維（Polyester）和 10% 的 Lyocell 製成','台灣',null,800,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0001',2,1,220),
('F_CL_ST_0001',6,4,50),
('F_CL_ST_0001',6,5,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_CL_ST_0001','Product_0031.jpg'),
('F_CL_ST_0001','Product_0032.jpg'),
('F_CL_ST_0001','Product_0033.jpg'),
('F_CL_ST_0001','Product_0034.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_ST_0002','女款透氣排汗跑步短袖上衣','輕盈透氣這款透氣、舒適又柔美的 T 恤，是你夏天跑步時的必備衣物。','主要布料 100% 聚酯纖維','台灣',null,1000,'false',null,2);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_ST_0002',3,1,220),
('F_CL_ST_0002',3,2,100),
('F_CL_ST_0002',5,4,50),
('F_CL_ST_0002',5,5,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_CL_ST_0002','Product_0041.jpg'),
('F_CL_ST_0002','Product_0042.jpg'),
('F_CL_ST_0002','Product_0043.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0001','兒童款高爾夫排汗短袖上衣','適合兒童在 10°C 以上的天候中打高爾夫時穿著。透氣且輕量。這款採用柔軟輕量布料製成的高爾夫 Polo 衫，能有效排汗並保持乾爽，適合打高爾夫時穿著。','主要布料 100% 聚酯纖維','台灣',700,600,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0001',1,1,220),
('C_CL_ST_0001',2,4,50),
('C_CL_ST_0001',2,5,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_CL_ST_0001','Product_0051.jpg'),
('C_CL_ST_0001','Product_0052.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_ST_0002','兒童款純棉圓領T恤','色彩活潑、適合每日穿著的 T 恤。孩子的心情變化就像他們換 T 恤的次數一樣頻繁，所以我們打造了具有多種色彩的 100% 純棉系列。','棉 100%','台灣',750,650,'false',null,3);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_ST_0002',1,1,220),
('C_CL_ST_0002',3,2,300),
('C_CL_ST_0002',3,3,220),
('C_CL_ST_0002',3,4,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_CL_ST_0002','Product_0061.jpg'),
('C_CL_ST_0002','Product_0062.jpg'),
('C_CL_ST_0002','Product_0063.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0001','上衣007','這是長袖上衣001','88% 聚酯纖維/12% 彈性纖維','台灣',1500,1300,'false',null,4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0001',2,1,220),
('M_CL_LG_0001',2,2,100),
('M_CL_LG_0001',2,3,80),
('M_CL_LG_0001',3,4,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_CL_LG_0001','Product_0071.jpg'),
('M_CL_LG_0001','Product_0072.jpg'),
('M_CL_LG_0001','Product_0073.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_CL_LG_0002','上衣008','這是長袖上衣002','88% 聚酯纖維/12% 彈性纖維','台灣',null,1350,'true','true',null,4);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_CL_LG_0002',4,1,0),
('M_CL_LG_0002',4,2,0),
('M_CL_LG_0002',5,4,0);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_CL_LG_0002','Product_0081.jpg'),
('M_CL_LG_0002','Product_0082.jpg'),
('M_CL_LG_0002','Product_0083.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0001','上衣009','這是長袖上衣003','88% 聚酯纖維/12% 彈性纖維','台灣',1500,1300,'true','false','限量',5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0001',1,1,220),
('F_CL_LG_0001',1,2,100),
('F_CL_LG_0001',1,3,80),
('F_CL_LG_0001',2,4,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_CL_LG_0001','Product_0091.jpg'),
('F_CL_LG_0001','Product_0092.jpg'),
('F_CL_LG_0001','Product_0093.jpg'),
('F_CL_LG_0001','Product_0094.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_CL_LG_0002','上衣010','這是長袖上衣004','78-79% 聚酯纖維/21-22% 彈性纖維','台灣',null,1300,'false',null,5);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_CL_LG_0002',1,1,220),
('F_CL_LG_0002',3,4,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_CL_LG_0002','Product_00101.jpg'),
('F_CL_LG_0002','Product_00102.jpg'),
('F_CL_LG_0002','Product_00103.jpg'),
('F_CL_LG_0002','Product_00104.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0001','上衣011','這是長袖上衣005','88% 聚酯纖維/12% 彈性纖維','台灣',null,1300,'false',null,6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0001',1,1,220),
('C_CL_LG_0001',1,2,100),
('C_CL_LG_0001',1,5,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_CL_LG_0001','Product_00111.jpg'),
('C_CL_LG_0001','Product_00112.jpg'),
('C_CL_LG_0001','Product_00113.jpg'),
('C_CL_LG_0001','Product_00114.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_CL_LG_0002','上衣012','這是長袖上衣006','88% 聚酯纖維/12% 彈性纖維','台灣',null,1000,'false',null,6);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_CL_LG_0002',1,1,220),
('C_CL_LG_0002',1,2,100),
('C_CL_LG_0002',1,3,80);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_CL_LG_0002','Product_00121.jpg'),
('C_CL_LG_0002','Product_00122.jpg'),
('C_CL_LG_0002','Product_00123.jpg');


-------------------------------------------------

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0001','褲子001','這是短褲001','88% 聚酯纖維 12% 彈性纖維','台灣',1200,1000,'false',null,7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0001',1,1,100),
('M_PA_ST_0001',1,2,200),
('M_PA_ST_0001',1,3,80),
('M_PA_ST_0001',1,4,110);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_PA_ST_0001','Product_00131.jpg'),
('M_PA_ST_0001','Product_00132.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_ST_0002','短褲002','這是短褲002','純棉','台灣',1300,1100,'false','限量',7);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_ST_0002',3,1,220),
('M_PA_ST_0002',3,2,100),
('M_PA_ST_0002',3,3,80),
('M_PA_ST_0002',3,4,130);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_PA_ST_0002','Product_00141.jpg'),
('M_PA_ST_0002','Product_00142.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0001','短褲003','這是短褲003','純棉','台灣',null,800,'true','false',null,8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0001',2,1,220),
('F_PA_ST_0001',2,2,100),
('F_PA_ST_0001',6,4,50),
('F_PA_ST_0001',6,5,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_PA_ST_0001','Product_00151.jpg'),
('F_PA_ST_0001','Product_00152.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_ST_0002','短褲004','這是短褲004','純棉','台灣',null,1000,'false',null,8);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_ST_0002',3,1,220),
('F_PA_ST_0002',3,2,100),
('F_PA_ST_0002',3,3,80),
('F_PA_ST_0002',5,5,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_PA_ST_0002','Product_00161.jpg'),
('F_PA_ST_0002','Product_00162.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0001','短褲005','這是短褲005','純棉','台灣',700,600,'false',null,9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0001',1,1,220),
('C_PA_ST_0001',1,2,100),
('C_PA_ST_0001',1,3,80),
('C_PA_ST_0001',2,4,50),
('C_PA_ST_0001',2,5,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_PA_ST_0001','Product_00161.jpg'),
('C_PA_ST_0001','Product_00162.jpg'),
('C_PA_ST_0001','Product_00163.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_ST_0002','短褲006','這是短褲006','純棉','台灣',750,650,'false',null,9);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_ST_0002',1,1,220),
('C_PA_ST_0002',1,2,100),
('C_PA_ST_0002',1,3,80);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_PA_ST_0002','Product_00171.jpg'),
('C_PA_ST_0002','Product_00172.jpg');

--------------------------------------------------------------

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0001','褲子001','這是長褲001','88% 聚酯纖維 12% 彈性纖維','台灣',1200,1000,'false',null,10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES

('M_PA_LG_0001',2,1,120),
('M_PA_LG_0001',2,2,900),
('M_PA_LG_0001',2,3,220),
('M_PA_LG_0001',2,4,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_PA_LG_0001','Product_00181.jpg'),
('M_PA_LG_0001','Product_00182.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_PA_LG_0002','長褲002','這是長褲002','純棉','台灣',1300,1100,'false','限量',10);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_PA_LG_0002',3,1,220),
('M_PA_LG_0002',3,2,100),
('M_PA_LG_0002',3,3,80),
('M_PA_LG_0002',3,4,130);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_PA_LG_0002','Product_00191.jpg'),
('M_PA_LG_0002','Product_00192.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0001','長褲003','這是長褲003','純棉','台灣',null,800,'true','false',null,11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0001',2,1,220),
('F_PA_LG_0001',2,2,100),
('F_PA_LG_0001',6,4,50),
('F_PA_LG_0001',6,5,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_PA_LG_0001','Product_00201.jpg'),
('F_PA_LG_0001','Product_00202.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_PA_LG_0002','長褲004','這是長褲004','純棉','台灣',null,1000,'false',null,11);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_PA_LG_0002',3,1,220),
('F_PA_LG_0002',3,2,100),
('F_PA_LG_0002',3,3,80);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_PA_LG_0002','Product_00211.jpg'),
('F_PA_LG_0002','Product_00212.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0001','長褲005','這是長褲005','純棉','台灣',700,600,'false',null,12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0001',1,1,220),
('C_PA_LG_0001',1,2,100),
('C_PA_LG_0001',2,3,220),
('C_PA_LG_0001',2,4,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_PA_LG_0001','Product_00221.jpg'),
('C_PA_LG_0001','Product_00222.jpg'),
('C_PA_LG_0001','Product_00223.jpg'),
('C_PA_LG_0001','Product_00224.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_PA_LG_0002','長褲006','這是長褲006','純棉','台灣',750,650,'false',null,12);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_PA_LG_0002',1,1,220),
('C_PA_LG_0002',1,2,100),
('C_PA_LG_0002',3,3,220),
('C_PA_LG_0002',3,4,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_PA_LG_0002','Product_00231.jpg'),
('C_PA_LG_0002','Product_00232.jpg');


---------------------------------------------------------

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0001','休閒鞋001','這是休閒鞋001',null,'台灣',null,3600,'false',null,13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0001',1,28,100),
('M_SH_CL_0001',1,29,200),
('M_SH_CL_0001',1,30,80),
('M_SH_CL_0001',2,28,120);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_SH_CL_0001','Product_00241.jpg'),
('M_SH_CL_0001','Product_00242.jpg'),
('M_SH_CL_0001','Product_00243.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_CL_0002','休閒鞋002','這是休閒鞋002',null,'台灣',2500,2000,'false','限量',13);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_CL_0002',3,28,220),
('M_SH_CL_0002',3,29,100),
('M_SH_CL_0002',3,30,80),
('M_SH_CL_0002',4,31,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_SH_CL_0002','Product_00251.jpg'),
('M_SH_CL_0002','Product_00252.jpg'),
('M_SH_CL_0002','Product_00253.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0001','休閒鞋003','這是休閒鞋003',null,'台灣',2300,1890,'false',null,14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0001',2,20,220),
('F_SH_CL_0001',2,21,100),
('F_SH_CL_0001',6,23,50),
('F_SH_CL_0001',6,24,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_SH_CL_0001','Product_00261.jpg'),
('F_SH_CL_0001','Product_00262.jpg'),
('F_SH_CL_0001','Product_00263.jpg'),
('F_SH_CL_0001','Product_00264.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_CL_0002','休閒鞋004','這是休閒鞋004','純棉','台灣',null,2200,'false',null,14);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_CL_0002',1,20,220),
('F_SH_CL_0002',1,21,100),
('F_SH_CL_0002',2,23,50),
('F_SH_CL_0002',2,24,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_SH_CL_0002','Product_00271.jpg'),
('F_SH_CL_0002','Product_00272.jpg'),
('F_SH_CL_0002','Product_00273.jpg'),
('F_SH_CL_0002','Product_00274.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0001','休閒鞋005','這是休閒鞋005',null,'台灣',null,1500,'false',null,15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0001',1,8,220),
('C_SH_CL_0001',1,9,100),
('C_SH_CL_0001',1,10,80),
('C_SH_CL_0001',2,8,190),
('C_SH_CL_0001',2,9,300);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_SH_CL_0001','Product_00281.jpg'),
('C_SH_CL_0001','Product_00282.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_CL_0002','休閒鞋006','這是休閒鞋006',null,'台灣',2000,1650,'true',null,15);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_CL_0002',1,8,220),
('C_SH_CL_0002',3,8,190),
('C_SH_CL_0002',3,9,300),
('C_SH_CL_0002',3,10,220);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_SH_CL_0002','Product_00291.jpg'),
('C_SH_CL_0002','Product_00292.jpg');


----------------------------------------------------------------


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0001','運動鞋001','這是運動鞋001',null,'台灣',null,3600,'false',null,16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0001',1,28,100),
('M_SH_SP_0001',1,29,200),
('M_SH_SP_0001',2,31,100),
('M_SH_SP_0001',2,32,50);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_SH_SP_0001','Product_00301.jpg'),
('M_SH_SP_0001','Product_00302.jpg'),
('M_SH_SP_0001','Product_00303.jpg');



INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('M_SH_SP_0002','運動鞋002','這是運動鞋002',null,'台灣',2500,2000,'false','限量',16);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('M_SH_SP_0002',3,28,220),
('M_SH_SP_0002',3,29,100),
('M_SH_SP_0002',4,28,190),
('M_SH_SP_0002',4,29,300);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('M_SH_SP_0002','Product_00311.jpg'),
('M_SH_SP_0002','Product_00312.jpg'),
('M_SH_SP_0002','Product_00313.jpg'),
('M_SH_SP_0002','Product_00314.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_SP_0001','運動鞋003','這是運動鞋003',null,'台灣',2300,1890,'false','限量',17);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_SP_0001',2,20,220),
('F_SH_SP_0001',2,21,100),
('F_SH_SP_0001',2,22,80);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_SH_SP_0001','Product_00321.jpg'),
('F_SH_SP_0001','Product_00322.jpg'),
('F_SH_SP_0001','Product_00323.jpg'),
('F_SH_SP_0001','Product_00324.jpg');

INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('F_SH_SP_0002','運動鞋004','這是運動鞋004','純棉','台灣',null,2200,'false',null,17);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('F_SH_SP_0002',1,20,220),
('F_SH_SP_0002',1,21,100),
('F_SH_SP_0002',1,22,80);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('F_SH_SP_0002','Product_00331.jpg'),
('F_SH_SP_0002','Product_00332.jpg'),
('F_SH_SP_0002','Product_00333.jpg'),
('F_SH_SP_0002','Product_00334.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,Status,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_SP_0001','運動鞋005','這是運動鞋005',null,'台灣',null,1500,'true','false',null,18);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_SP_0001',1,8,220),
('C_SH_SP_0001',2,11,50),
('C_SH_SP_0001',2,12,30);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_SH_SP_0001','Product_00341.jpg'),
('C_SH_SP_0001','Product_00342.jpg'),
('C_SH_SP_0001','Product_00343.jpg'),
('C_SH_SP_0001','Product_00344.jpg');


INSERT INTO Products(ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,UnitPrice,SalesPrice,LogOut,Tag,fk_ProductSubCategoryID)
VALUES
('C_SH_SP_0002','運動鞋006','這是運動鞋006',null,'台灣',2000,1650,'true',null,18);

INSERT INTO ProductGroups(fk_ProductId,fk_ColorId,fk_SizeId,Qty)
VALUES
('C_SH_SP_0002',1,8,220),
('C_SH_SP_0002',1,9,100),
('C_SH_SP_0002',3,8,190),
('C_SH_SP_0002',3,9,300);

INSERT INTO ProductImgs(fk_ProductId,ImgPath)
VALUES 
('C_SH_SP_0002','Product_00351.jpg'),
('C_SH_SP_0002','Product_00352.jpg'),
('C_SH_SP_0002','Product_00353.jpg');