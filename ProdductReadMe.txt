[V]ProductDto(CRUD共用)(index)
[V]ProductDto(CRUD共用)(create)
[處理中]ProductDto(CRUD共用)(Edit)
[處理中]ProductDto(CRUD共用)(EditImg)
[處理中]ProductDto(CRUD共用)(Delete)

[處理中]ProduxtIndex
[處理中]版面調整
[V]IndexVM,Exts(ToIndexDto,ToIndexVM,ToSaveChangeStatusDto,要編輯上下架)
[V]產生Index畫面
[V]Index,EFRepository=>Search(排除Logout)=>建立搜尋物件IndexSearchCriteria
[V]Index三層式(service,interface)
[V]Index主表的搜尋下拉清單
[V]Color size的Dto,Repository
[V]Index搜尋，改為ajax
[V]Index畫面跨表顯示欄位
[V]要能在Index編輯上下架狀態-勾選模式
[V]要能在Index編輯上下架狀態-全選模式

[處理中]新增商品
[處理中]版面調整
[V]CreateVM,Exts(ToCreateDto,ToCreateEntity)
[V]產生Create畫面
[V]Create,EFRepository=>CreateProduct,SaveChangeStatus
[V]規格要抓到selectlist
[V]照片上傳及呈現
[V]照片上傳異常，會直接上傳，非驗證通過後才上傳
[處理中]照片上傳刪除預覽，被刪除的照片不用上傳
[V]規格要能回傳值
[V]動態生成規格,新增按鈕(Color-SelectList,Size-SelectList,Qty-Number,刪除按鈕)
[V]照片上傳欄位驗證
[V]規格欄位驗證

[**************]暫改table設計，啟用Product-casecade方便測試

[處理中]編輯商品主檔&庫存
[處理中]版面調整
[V]EditProductVM,Exts(ToEditDto,ToEditVM,ToEditDto,ToEditEntity)
[V]產生Edit畫面
[V]Edit,EFRepository=>GetById()取得單筆要編輯的商品
[V]Edit資料寫入
[V]動態生成規格,新增按鈕(Color-SelectList,Size-SelectList,Qty-Number,刪除按鈕)
[V]規格欄位驗證
[V]編輯資料將，group清空，重新加入，主檔追蹤編輯


[處理中]編輯商品照片
[V]版面調整
[V]EditImgVM,Exts(ToEditImgDto,ToEditImgVM,ToEditImgDto,ToEditImgEntity)
[V]EditImg,EFRepository=>GetImgById()取得單筆要編輯的商品圖片
[V]產生EditImg畫面
[V]刪除現有照片，並回傳
[V]新增照片，可以刪除並回傳
[V]當沒有保留任何一張照片，要跳驗證未通過


[處理中]銷售分類(Dapper)
[V]SalesCategoryDto,SalesCategoryCreateVM,SalesCategoryEditVM
[處理中]Exts(ToIndexVM,ToCreateDto,ToEditVM,ToDto)
[處理中]DapperRepository=>GetById()取得單筆要編輯的商品



