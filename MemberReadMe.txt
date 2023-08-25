[v]資料庫版本2
[v]在flexbackend建立EFModels
[v]建立Members.dll，並讓flexbackend參考它
[v]建立MembersController
[v]在Members.dll建立三層式架構資料夾


[-]會員註冊功能
	[v]擴充方法RegisterExts VM->Dto
	-Controllers
	  -MembersController.cs

	-Models
	  -Dtos 用來傳遞資料
	    RegisterDto.cs
	  
	  -Interfaces 類似轉接器，若需要存取資料庫都來實作這個介面
	    IMemberRepository.cs

	  -Infra 實作 Interfaces 
		add HashUtility.cs 雜湊密碼 (x 尚未完成)
		修改 web.config, add AppSetting <add key="salt" value="!@#$$DGTEGYT"/>

		add EmailHelper.cs (x 尚未完成)(....)

		sdd Files 放發email的文字檔
	    add Result.cs

	   -DapperRepositories
	   -EFRepositories
	     MemberEFRepository.cs
	 
	  -Services 商業邏輯判斷
	    MemberService.cs

	  -ViewsModels 寫驗證規則
		add RegisterVM.cs , 註冊頁面使用的view model
		add MemberController.cs , Register actions

	-Views
	  -Members
	   ComfirmRegister.cshtml 會員註冊成功頁面

[v]會員名單總覽 MembersList
	[v]擴充方法membersExts Dto->VM、entity->Dto
	-Controllers
	  -MembersController.cs 

	-Models
	  -ViewsModels 寫驗證規則
		add MembersIndexVM.cs , view model
		add MembersEditVM.cs , view model
		Search function
		Create Edit form 要加 Dropdown,Checkbox


	  -Dtos 用來傳遞資料，內具有擴充方法(Dto->VM)
	    MembersDto.cs

	-Views
	  -Members
	   MembersList.cshtml 頁面

[working on]會員資料管理
		add MembersEditDto
	    * MembersExts add entity->Dto
		add Controller EditMember()
		--卡住ㄌ--

