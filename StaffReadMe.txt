[v]資料庫版本2
[v]在flexbackend建立EFModels
[v]建立StaffsController
[v]建立Dapper連線字串

[v]員工名單總覽
	add StaffsIndexDto class
	add IStaffRepository interface
	add StaffDapperRepository : IStaffRepository
	add StaffService
	add StaffsController
	add StaffsIndexVM
	add StaffList.cshtml

[v]新增員工
	StaffsController add CreateStaff()*2 Get/Post ,傳入StaffsCreateVM
					 通過驗證VM->Dto傳入service
	add IStaffRepository 準備接收StaffService傳入的Dto
	add StaffService 收到Controller傳入的Dto，將資料做檢查，將驗證完畢的Dto傳入IStaffRepository
	add StaffDapperRepository : IStaffRepository 收到 IStaffRepository 傳來的Dto 存入資料庫

	*資料格式還沒有判斷
	*新增成功回到總覽畫面

[v]員工登入/登出
	add loginVM
    web.config 在<system.web> add <authentication>
	StaffsController add Login() action , add Login.cshtml , 若沒登入過會自動等向/Staff/Login
					 add Login(LoginVM vm) action 
					 add ValidLogin() method , 對帳號密碼進行驗證,驗證成功並將密碼編碼之後加到 Cookie裡面
					 add ProcessLogin() method , 產生Cookie
	_Layout.cshtml   add 判斷 User.Identity.IsAuthenticated 可以進行變更密碼及登出

	*沒有將密碼雜湊

[working on]忘記密碼
	StaffsController add ForgetPassword() action , add ForgetPassWord.cshtml

[-]修改密碼


[-]大頭照