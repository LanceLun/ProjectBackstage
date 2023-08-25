-- Discount --
INSERT INTO [dbo].[Discounts] 
([DiscountName], [DiscountDescription], [fk_ProjectTagId], [DiscountType], [DiscountValue], 
[ConditionType], [ConditionValue], [StartDate], [EndDate], [OrderBy])
VALUES
    ('2022新年優惠', '新年優惠', null, 0, 5, 0, 100, '2022-01-01', '2022-01-10', 2),
    ('2022農曆春節特惠', '春節特惠', null, 1, 15, 1, 3, '2022-02-15', '2022-03-15', 3),
    ('2022春季換季', '春節換季', null, 0, 2, 1, 1, '2022-04-01', '2022-05-31', 11),
    ('2022暑假特惠', '暑期特惠', null, 1, 30, 0, 100, '2022-06-01', '2022-07-31', 6),
    ('2022開學特惠', '開學特會', null, 1, 18, 0, 70, '2022-08-01', '2022-09-30', 14),
    ('2022秋冬大特賣', '秋冬大特賣', null, 1, 25, 1, 4, '2022-10-01', '2022-12-31', 8),
    ('2023新年優惠', '新年優惠', null, 1, 20, 0, 50, '2023-01-01', '2023-01-30', 4),
    ('2023春節特惠', '農曆春節拍賣', null, 0, 10, 0, 30, '2023-02-01', '2023-02-27', 9),
    ('9折專區', '9折專區', null, 1, 90, 1, 1, '2023-03-01', NULL, 500),
    ('2件8折', '2件8折', null, 0, 8, 1, 2, '2023-04-10', NULL, 400),
    ('2023春夏換季特惠', '換季特惠', null, 0, 4, 0, 40, '2023-05-01', '2023-05-30', 15),
    ('2023暑期特惠', '暑期特惠', null, 1, 10, 1, 5, '2023-07-01', '2023-07-30', 1),
    ('2023返校特惠', '返校特惠', null, 0, 3, 1, 10, '2023-08-01', '2023-08-15', 7),
    ('2023入秋特惠', '入秋特惠', null, 1, 5, 0, 20, '2023-09-01', '2023-09-20', 10),
    ('2023冬季特賣', '冬季特賣', null, 0, 7, 1, 3, '2023-10-01', '2023-12-31', 100);
go

-- CounponCategories --
INSERT INTO [dbo].[CouponCategories] ([CouponCategoryId], [CouponCategoryName])
VALUES
    (1, '優惠券'),
    (2, '註冊券'),
    (3, '生日券'),
    (4, '購物獎勵券'),
    (5, '會員等級券');
go

-- Counpons --
--[DiscountType] 0:金額 1:百分比 2.運費
--[DiscountValue] 可null 如type為2，則可為null
--[EndType] bit 0:日期 1:天數
--[RequirementType] 0金額/ 1件數
INSERT INTO [dbo].[Coupons] (
[fk_CouponCategoryId], [CouponName], [CouponCode], [MinimumPurchaseAmount], [DiscountType], 
[DiscountValue], [StartDate], [EndType], [EndDays], [EndDate], 
[PersonMaxUsage], [RequirementType], [Requirement], [fk_RequiredProjectTagID])
VALUES
    (2, '註冊禮券', Null, 500, 0, 50, '2022-01-01', 1, 30, NULL, 1, 0, NULL, NULL),
    (3, '生日禮券', Null, 200, 1, 15, '2022-02-01', 1, 30, NULL, 2, 0, NULL, NULL),
    (1, '618活動券', Null, 150, 1, 10, '2023-06-18', 0, NULL, '2023-06-30', 1, 0, NULL, NULL),
    (1, '周年慶', Null, 250, 0, 20, '2022-04-01', 0, 15, '2023-04-30', 1, 0, NULL, NULL),
    (1, '情人節禮券', Null, 300, 0, 20, '2022-02-07', 0, NULL, '2023-02-17', 2, 0, NULL, NULL),
    (1, '月中免運券', Null, 180, 2, 0, '2023-06-15', 0, NULL, '2023-06-15', 5, 1, 5, NULL),
    (4, '好禮贈', Null, 500, 1, 20, '2023-07-01', 0, NULL, NULL, 3, 0, 1000, 13),
    (1, '暑假大FUN送', Null, 280, 0, 90, '2023-08-01', 0, NULL, '2023-08-15', 2, 0, NULL, NULL),
    (1, 'Criteria聯名券', Null, 190, 0, 80, '2023-09-01', 0, NULL, '2023-09-30', 1, 0, NULL, NULL),
    (1, '月中免運券', Null, 350, 1, 20, '2023-10-15', 0, NULL, '2023-10-15', 2, 0, NULL, NULL);
