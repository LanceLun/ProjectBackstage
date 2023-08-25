[v]新增Activity Index的VM
[v]新增Activity Index 的 Exts (entity 轉 ActivityIndexVM)
[v]新增ActivityController、新增 Activity的Index Action
[v]新增 【Index,Activity】的Layout連結

***Activity的增刪查改：參考Allen 的 202306.solution 【商品】

[Working On] Activity 的 Create
	[v]新增Activity Create的VM
	[v ]新增Activity Create 的 Exts (entity 轉 ActivityCreateVM)
	[v]新增ActivityController、新增 Activity 的 Create Action[Http]
	[v]新增ActivityController、新增 Activity 的 Create Action[Post]
	[v]新增Activity Create的檢視

[v] VM加上顯示中文 [Display(Name = "商品分類")]
[v ] Index的VM不用欄位驗證
[] Description太長的話，字數截斷
[v]寫Activity Create 的 Exts (vm 轉 entity)

--6/29 21:00 Activity 的  Create 照片新增的部分失敗 !
			 Allen錄影檔看到20230609 14:58

***【Activity 的 Create完成，但新增照片有問題，待修正】***
			

[ Working On ]Activity 的 Edit
	[v]新增Activity Edit的VM
	[v]新增Activity Edit 的 Exts (entity 轉 ActivityEditVM)
	[v]新增Activity Edit 的 Exts (ActivityEditVM 轉 entity )
	[v]新增ActivityController、新增 Activity 的 Edit Action[Http]
	
	

	Allen錄影檔看到20230609 15:16

	--6/30 18:24 Activity 的  Edit 編輯的部分無法順利編輯，已經填的表格還會跑出驗證訊息

*測試家裡電腦的git

***【Activity的Edit完成，但更新日期會不能寫時間，照片編輯無法成功，待修正】***
	[待修正]新增Activity Edit的檢視
	[待修正]新增ActivityController、新增 Activity 的 Edit Action[Post]


[ v ]Activity 的 Search

[ v ] 查詢功能 影片檔案20230609 15:17
[ v ] 把ViewBag的List寫成副程式，讓Action可以叫用它



[ v ]Activity的搜尋完成，修正好記住歷史資訊的部份

	Allen錄影檔看到20230609 整天結束

[ v ]Activity的刪除
[ v ]Activity的查看資訊


[ v ]Speaker的Index
	[ v ]SpeakerDto
	[ v ]SpeakerVM
	[ v ]建Interface資料夾，寫ISpeakerRepository
	[ v ]建Infra資料夾，寫SpeakerEFRepository，去實作ISpeakerRepository
	[ v ]建Service資料夾，寫SpeakerServices
	[ v ]寫Speaker Index的controller
	[ v ]新增Speaker Index檢視畫面
[ v ]新增Speaker講師管理的超連結到layout

    Allen錄影檔看到20230616 整天結束

[ V ]Speaker的Create
	[ V ]Speaker Create的VM
	[ V ]Speaker Create的Dto
	[ V ]Speaker Create 的 VM 轉 Dto擴充方法、Dto 轉 Entity擴充方法
	[ V ]Speaker的 ISpeakerRepository
	[ V ]Speaker的 SpeakerEFRepository
	[ V ]Speaker的 SpeakerServices
	[ V ]Speaker Create 的 Get Action
	[ V ]Speaker Create 的 Post Action

	Allen錄影檔看到20230619 9:03

	20230703 Speaker的Create Post方法還沒寫完
	尚未寫Speaker的Create的vm轉Dto的擴充方法!



	
	Speaker的Create完成
	已修正Speaker Create驗證規則
	
[ V ]Speaker 的 Edit
	[ V ]Speaker Edit 的 VM
	[ V ]Speaker Edit 的 Dto
	[ V ]Speaker Edit 的 VM 轉 Dto擴充方法、Dto 轉 Entity擴充方法
	[ V  ]Speaker Edit 的 Entity 轉 Dto 擴充方法、 Dto 轉 VM 擴充方法 
	[ V ]Speaker的 ISpeakerRepository
	[ V ]Speaker的 SpeakerEFRepository
	[ V ]Speaker的 SpeakerServices
	[ V ]Speaker Edit 的 Get Action
	[ V ]Speaker Edit 的 Post Action

	Speaker的Edit完成
	***【待邏輯驗證加入並修正】***

[ * ]Speaker 的 搜尋
	[ v ]Speaker Index 的 VM
	[ v ]Speaker Index 的 criteria
	[ v ]Speaker Index 的 Action

*****【Speaker的Edit無法記住之前輸入的值，待修正】*****

[ v ]Speaker 的 查看詳細資訊
	[ v ]Speaker Detail 的 Dto
	[ v ]Speaker Detail 的 VM
	[ v ]Speaker Detail 的 entity 轉 Dto、Dto 轉 VM
	[ v ]Speaker Detail的 Action (GET)

	【Speaker 的 查看詳細資訊 完成】

[ v ]Speaker 的 刪除
	[ v ]Speaker Delete 的 Action (GET) (就等於Speaker的查看詳細資訊Details)
	[ v ]Speaker Delete 的 Action (POST)

	【Speaker 的 刪除 完成】

[ v ]一對一預約 Index
	[ v ]Dto
	[ v ]VM
	[ v ]Dto 轉 VM 的 擴充方法
	[ v ]IRepository
	[ v ]Infra下面建立DapperRepositories資料夾、DapperRepository
	[ v ]Services
	[ v ]Controller的Action

	【一對一預約 Index 完成】



[ v ]一對一預約 講師預約紀錄 ReservationList
	[ v ] ReservationList Dto
	[ v ] ReservationList VM
	[ v ]Dto 轉 VM 的 擴充方法
	[ v ]IRepository
	[ v ]DapperRepository
	[ v ]Services
	[ v ]Controller的Action

	【一對一預約 講師預約紀錄 ReservationList 完成】


[ * ]一對一預約 刪除 (未完成的可以刪除) 【Dapper】
	[ V ]IRepository
	[ V ]DapperRepository
	[ V ]Services
	[ v ]Controller的Action

	***【刪除後跳不回去ReservationList頁面，已修正】***

[ v ]修正 Activity Create 日期的驗證bug
[ v ]修正 Reservation刪除之後可以跳回去ReservationList頁面
[  待修正   ]新增 Speaker Create、Edit 的電話不能重複



***[待修正】Activity Create、Edit 的時間日期、圖片

7/6
[   ]待修正 Speaker Create、Edit 的電話不能重複，如果輸入重複電話號碼，會死在html
[   ]待修正 Activity Create、Edit的邏輯驗證，錯誤訊息沒辦法一次一起出來
[   ]待修正 Activity Create、 Edit 照片的驗證，錯誤訊息不會出現
[ v ]待修正 Activity 已上架的活動只能編輯敘述
[ v ]待修正 Activity 未上架的活動 編輯時間的時候 用萬年曆dateTimePicker和datePicker會出 大 事!!!


7/7 【OneToOneReservation Detail】【Dapper】
	[ V ]OneToOneReservationDetailDapper Dto
	[ V ]OneToOneReservationDetailDapper VM
	[ V ]OneToOneReservationDetail擴充方法
	[ V ]OneToOneReservationDetail SQL語法
	[ V ] IReservationRepository
	[ V ] DapperReservationRepository
	[ V ]去上一頁的html把要傳入的參數打開
	[ V ] Services
	[ V ] Controller
	[ V ]改html

7/7-2 ~ 7/8 【OneToOneReservation Edit】 【Dapper】
	[ v ]OneToOneReservationEditlDapper Dto
	[ v ]OneToOneReservationEditlDapper VM
	[ v ]OneToOneReservationEdit擴充方法
	[ v ]OneToOneReservationEdit SQL語法
	[ v ] IReservationRepository
	[ v ] DapperReservationRepository
	[ v ]去上一頁的html把要傳入的參數打開
	[ *** ] Services
	[ v ] Controller
	[ v ]改html

[ ***  ]待修正 OneToOneReservation Edit 【Service層的邏輯驗證】


[ ]OneToOneReservation Delete 【Dapper】
	[ ]OneToOneReservation Delete VM
	[ ]OneToOneReservation Delete Dto
	[ ]OneToOneReservatoin Delete 擴充方法
	[ ]OneToOneReservation Delete SQL語法
	[ ] IReservationRepository
	[ ] DapperReservationRepository
	[ ]去上一頁的html把要傳入的參數打開
	[ ]Services
	[ ]Controller
	[ ]改html


[ ]Speaker 的 刪除待完善

【把講師改成dataTable和Ajax和CRUD同一頁】
[ v ]Speaker Index修改
[ v ]Speaker Create修改
[ v ]Speaker Edit資訊修改
[ v ]Speaker Index讓它顯示圖片

資料庫的照片路徑要改：/Public/Img/講師大頭貼/Allen.jpg

[ v ]Speaker Edit照片修改
[ V ]Speaker Delete修改
[ ]Database修改
[ ]Speaker Detail修改