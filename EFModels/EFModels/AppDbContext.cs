using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace EFModels.EFModels
{
	public partial class AppDbContext : DbContext
	{
		public AppDbContext()
			: base("name=AppDbContext")
		{
		}

		public virtual DbSet<Activity> Activities { get; set; }
		public virtual DbSet<ActivityCategory> ActivityCategories { get; set; }
		public virtual DbSet<ActivityStatus> ActivityStatuses { get; set; }
		public virtual DbSet<AlternateAddress> AlternateAddresses { get; set; }
		public virtual DbSet<BlackList> BlackLists { get; set; }
		public virtual DbSet<Branch> Branches { get; set; }
		public virtual DbSet<CartItem> CartItems { get; set; }
		public virtual DbSet<ColorCategory> ColorCategories { get; set; }
		public virtual DbSet<CouponCategory> CouponCategories { get; set; }
		public virtual DbSet<Coupon> Coupons { get; set; }
		public virtual DbSet<CouponSending> CouponSendings { get; set; }
		public virtual DbSet<Customized_materials> Customized_materials { get; set; }
		public virtual DbSet<CustomizedOrder> CustomizedOrders { get; set; }
		public virtual DbSet<CustomizedShoesPo> CustomizedShoesPoes { get; set; }
		public virtual DbSet<Department> Departments { get; set; }
		public virtual DbSet<Discount> Discounts { get; set; }
		public virtual DbSet<JobTitle> JobTitles { get; set; }
		public virtual DbSet<logistics_companies> logistics_companies { get; set; }
		public virtual DbSet<MemberPoint> MemberPoints { get; set; }
		public virtual DbSet<Member> Members { get; set; }
		public virtual DbSet<MembershipLevel> MembershipLevels { get; set; }
		public virtual DbSet<OneToOneReservation> OneToOneReservations { get; set; }
		public virtual DbSet<order_statuses> order_statuses { get; set; }
		public virtual DbSet<orderItem> orderItems { get; set; }
		public virtual DbSet<order> orders { get; set; }
		public virtual DbSet<pay_methods> pay_methods { get; set; }
		public virtual DbSet<pay_statuses> pay_statuses { get; set; }
		public virtual DbSet<PointHistory> PointHistories { get; set; }
		public virtual DbSet<PointManage> PointManages { get; set; }
		public virtual DbSet<PointTradeIn> PointTradeIns { get; set; }
		public virtual DbSet<Privilege> Privileges { get; set; }
		public virtual DbSet<ProductCategory> ProductCategories { get; set; }
		public virtual DbSet<ProductGroup> ProductGroups { get; set; }
		public virtual DbSet<ProductImg> ProductImgs { get; set; }
		public virtual DbSet<Product> Products { get; set; }
		public virtual DbSet<ProductSubCategory> ProductSubCategories { get; set; }
		public virtual DbSet<ProjectTagItem> ProjectTagItems { get; set; }
		public virtual DbSet<ProjectTag> ProjectTags { get; set; }
		public virtual DbSet<ReservationStatus> ReservationStatuses { get; set; }
		public virtual DbSet<SalesCategory> SalesCategories { get; set; }
		public virtual DbSet<ShoesCategory> ShoesCategories { get; set; }
		public virtual DbSet<ShoesChoos> ShoesChooses { get; set; }
		public virtual DbSet<ShoesColorCategory> ShoesColorCategories { get; set; }
		public virtual DbSet<ShoesGroup> ShoesGroups { get; set; }
		public virtual DbSet<ShoesPicture> ShoesPictures { get; set; }
		public virtual DbSet<ShoppingCart> ShoppingCarts { get; set; }
		public virtual DbSet<SizeCategory> SizeCategories { get; set; }
		public virtual DbSet<SpeakerField> SpeakerFields { get; set; }
		public virtual DbSet<Speaker> Speakers { get; set; }
		public virtual DbSet<StaffPermission> StaffPermissions { get; set; }
		public virtual DbSet<Staff> Staffs { get; set; }
		public virtual DbSet<Supplier> Suppliers { get; set; }
		public virtual DbSet<Type> Types { get; set; }
		public virtual DbSet<AggregatedCounter> AggregatedCounters { get; set; }
		public virtual DbSet<Counter> Counters { get; set; }
		public virtual DbSet<Hash> Hashes { get; set; }
		public virtual DbSet<Job> Jobs { get; set; }
		public virtual DbSet<JobParameter> JobParameters { get; set; }
		public virtual DbSet<JobQueue> JobQueues { get; set; }
		public virtual DbSet<List> Lists { get; set; }
		public virtual DbSet<Schema> Schemata { get; set; }
		public virtual DbSet<Server> Servers { get; set; }
		public virtual DbSet<Set> Sets { get; set; }
		public virtual DbSet<State> States { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<ActivityCategory>()
				.HasMany(e => e.Activities)
				.WithRequired(e => e.ActivityCategory)
				.HasForeignKey(e => e.fk_ActivityCategoryId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<ActivityStatus>()
				.HasMany(e => e.Activities)
				.WithRequired(e => e.ActivityStatus)
				.HasForeignKey(e => e.fk_ActivityStatusId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<BlackList>()
				.HasMany(e => e.Members)
				.WithOptional(e => e.BlackList)
				.HasForeignKey(e => e.fk_BlackListId);

			modelBuilder.Entity<Branch>()
				.HasMany(e => e.OneToOneReservations)
				.WithRequired(e => e.Branch)
				.HasForeignKey(e => e.fk_BranchId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Branch>()
				.HasMany(e => e.Speakers)
				.WithOptional(e => e.Branch)
				.HasForeignKey(e => e.fk_SpeakerBranchId);

			modelBuilder.Entity<ColorCategory>()
				.HasMany(e => e.ProductGroups)
				.WithRequired(e => e.ColorCategory)
				.HasForeignKey(e => e.fk_ColorId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<CouponCategory>()
				.HasMany(e => e.Coupons)
				.WithRequired(e => e.CouponCategory)
				.HasForeignKey(e => e.fk_CouponCategoryId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Coupon>()
				.HasMany(e => e.CouponSendings)
				.WithRequired(e => e.Coupon)
				.HasForeignKey(e => e.fk_CouponId);

			modelBuilder.Entity<Customized_materials>()
				.HasMany(e => e.CustomizedOrders)
				.WithOptional(e => e.Customized_materials)
				.HasForeignKey(e => e.Customized_Eyelet);

			modelBuilder.Entity<Customized_materials>()
				.HasMany(e => e.CustomizedOrders1)
				.WithOptional(e => e.Customized_materials1)
				.HasForeignKey(e => e.Customized_EdgeProtection);

			modelBuilder.Entity<Customized_materials>()
				.HasMany(e => e.CustomizedOrders2)
				.WithOptional(e => e.Customized_materials2)
				.HasForeignKey(e => e.Customized_Rear);

			modelBuilder.Entity<Customized_materials>()
				.HasMany(e => e.CustomizedOrders3)
				.WithOptional(e => e.Customized_materials3)
				.HasForeignKey(e => e.Customized_Tongue);

			modelBuilder.Entity<Customized_materials>()
				.HasMany(e => e.CustomizedOrders4)
				.WithOptional(e => e.Customized_materials4)
				.HasForeignKey(e => e.Customized_Toe);

			modelBuilder.Entity<Customized_materials>()
				.HasMany(e => e.ShoesGroups)
				.WithRequired(e => e.Customized_materials)
				.HasForeignKey(e => e.fk_MaterialId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<CustomizedOrder>()
				.Property(e => e.Customized_number)
				.IsUnicode(false);

			modelBuilder.Entity<CustomizedShoesPo>()
				.HasMany(e => e.CustomizedOrders)
				.WithOptional(e => e.CustomizedShoesPo)
				.HasForeignKey(e => e.Customized_Shoes_Id);

			modelBuilder.Entity<CustomizedShoesPo>()
				.HasMany(e => e.ShoesPictures)
				.WithRequired(e => e.CustomizedShoesPo)
				.HasForeignKey(e => e.fk_ShoesPictureProduct_Id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<CustomizedShoesPo>()
				.HasMany(e => e.ShoesGroups)
				.WithRequired(e => e.CustomizedShoesPo)
				.HasForeignKey(e => e.fk_ShoesMainId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Department>()
				.HasMany(e => e.Staffs)
				.WithRequired(e => e.Department)
				.HasForeignKey(e => e.fk_DepartmentId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<JobTitle>()
				.HasMany(e => e.Staffs)
				.WithRequired(e => e.JobTitle)
				.HasForeignKey(e => e.fk_TitleId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<logistics_companies>()
				.Property(e => e.tel)
				.IsUnicode(false);

			modelBuilder.Entity<logistics_companies>()
				.HasMany(e => e.orders)
				.WithRequired(e => e.logistics_companies)
				.HasForeignKey(e => e.logistics_company_Id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.Mobile)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.Account)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.EncryptedPassword)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.ConfirmCode)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.AlternateAddresses)
				.WithOptional(e => e.Member)
				.HasForeignKey(e => e.fk_MemberId);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.CouponSendings)
				.WithOptional(e => e.Member)
				.HasForeignKey(e => e.fk_MemberId);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.CustomizedOrders)
				.WithOptional(e => e.Member)
				.HasForeignKey(e => e.Fk_ForMemberCustomized_Id);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.MemberPoints)
				.WithRequired(e => e.Member)
				.HasForeignKey(e => e.fk_MemberId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.orders)
				.WithRequired(e => e.Member)
				.HasForeignKey(e => e.fk_member_Id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.PointHistories)
				.WithOptional(e => e.Member)
				.HasForeignKey(e => e.fk_MemberId);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.OneToOneReservations)
				.WithRequired(e => e.Member)
				.HasForeignKey(e => e.fk_BookerId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.orders1)
				.WithRequired(e => e.Member1)
				.HasForeignKey(e => e.fk_member_Id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.PointTradeIns)
				.WithRequired(e => e.Member)
				.HasForeignKey(e => e.fk_MemberId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.ShoppingCarts)
				.WithRequired(e => e.Member)
				.HasForeignKey(e => e.fk_MemberID);

			modelBuilder.Entity<MembershipLevel>()
				.Property(e => e.MinSpending)
				.IsUnicode(false);

			modelBuilder.Entity<MembershipLevel>()
				.HasMany(e => e.Members)
				.WithRequired(e => e.MembershipLevel)
				.HasForeignKey(e => e.fk_LevelId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<MembershipLevel>()
				.HasMany(e => e.Privileges)
				.WithMany(e => e.MembershipLevels)
				.Map(m => m.ToTable("MembershipLevelPrivileges").MapLeftKey("fk_LevelId").MapRightKey("fk_PrivilegeId"));

			modelBuilder.Entity<order_statuses>()
				.HasMany(e => e.orders)
				.WithRequired(e => e.order_statuses)
				.HasForeignKey(e => e.order_status_Id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<order>()
				.Property(e => e.cellphone)
				.IsUnicode(false);

			modelBuilder.Entity<order>()
				.Property(e => e.receipt)
				.IsUnicode(false);

			modelBuilder.Entity<order>()
				.HasMany(e => e.orderItems)
				.WithRequired(e => e.order)
				.HasForeignKey(e => e.order_Id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<order>()
				.HasMany(e => e.PointHistories)
				.WithOptional(e => e.order)
				.HasForeignKey(e => e.fk_OrderId);

			modelBuilder.Entity<order>()
				.HasMany(e => e.PointTradeIns)
				.WithOptional(e => e.order)
				.HasForeignKey(e => e.fk_OrderId);

			modelBuilder.Entity<pay_methods>()
				.HasMany(e => e.orders)
				.WithRequired(e => e.pay_methods)
				.HasForeignKey(e => e.pay_method_Id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<pay_statuses>()
				.HasMany(e => e.orders)
				.WithRequired(e => e.pay_statuses)
				.HasForeignKey(e => e.pay_status_Id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<PointHistory>()
				.HasMany(e => e.MemberPoints)
				.WithRequired(e => e.PointHistory)
				.HasForeignKey(e => e.fk_PointHistoryId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<PointManage>()
				.HasOptional(e => e.PointManage1)
				.WithRequired(e => e.PointManage2);

			modelBuilder.Entity<PointTradeIn>()
				.Property(e => e.GetPoints)
				.IsUnicode(false);

			modelBuilder.Entity<PointTradeIn>()
				.Property(e => e.MaxGetPoints)
				.IsUnicode(false);

			modelBuilder.Entity<ProductCategory>()
				.HasMany(e => e.ProductSubCategories)
				.WithRequired(e => e.ProductCategory)
				.HasForeignKey(e => e.fk_ProductCategoryId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<ProductGroup>()
				.Property(e => e.fk_ProductId)
				.IsUnicode(false);

			modelBuilder.Entity<ProductImg>()
				.Property(e => e.fk_ProductId)
				.IsUnicode(false);

			modelBuilder.Entity<Product>()
				.Property(e => e.ProductId)
				.IsUnicode(false);

			modelBuilder.Entity<Product>()
				.HasMany(e => e.ProductGroups)
				.WithRequired(e => e.Product)
				.HasForeignKey(e => e.fk_ProductId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Product>()
				.HasMany(e => e.ProductImgs)
				.WithRequired(e => e.Product)
				.HasForeignKey(e => e.fk_ProductId);

			modelBuilder.Entity<Product>()
				.HasMany(e => e.ProjectTagItems)
				.WithRequired(e => e.Product)
				.HasForeignKey(e => e.fk_ProductId);

			modelBuilder.Entity<ProductSubCategory>()
				.HasMany(e => e.Products)
				.WithRequired(e => e.ProductSubCategory)
				.HasForeignKey(e => e.fk_ProductSubCategoryId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<ProjectTagItem>()
				.Property(e => e.fk_ProductId)
				.IsUnicode(false);

			modelBuilder.Entity<ProjectTagItem>()
				.HasOptional(e => e.ProjectTagItems1)
				.WithRequired(e => e.ProjectTagItem1);

			modelBuilder.Entity<ProjectTag>()
				.HasMany(e => e.Coupons)
				.WithOptional(e => e.ProjectTag)
				.HasForeignKey(e => e.fk_RequiredProjectTagID);

			modelBuilder.Entity<ProjectTag>()
				.HasMany(e => e.Discounts)
				.WithOptional(e => e.ProjectTag)
				.HasForeignKey(e => e.fk_ProjectTagId);

			modelBuilder.Entity<ReservationStatus>()
				.HasMany(e => e.OneToOneReservations)
				.WithRequired(e => e.ReservationStatus)
				.HasForeignKey(e => e.fk_ReservationStatusId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<SalesCategory>()
				.HasMany(e => e.ProductCategories)
				.WithRequired(e => e.SalesCategory)
				.HasForeignKey(e => e.fk_SalesCategoryId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<ShoesCategory>()
				.HasMany(e => e.CustomizedShoesPoes)
				.WithOptional(e => e.ShoesCategory)
				.HasForeignKey(e => e.fk_ShoesCategoryId);

			modelBuilder.Entity<ShoesChoos>()
				.HasMany(e => e.ShoesGroups)
				.WithRequired(e => e.ShoesChoos)
				.HasForeignKey(e => e.fk_OptionId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<ShoesColorCategory>()
				.HasMany(e => e.CustomizedShoesPoes)
				.WithOptional(e => e.ShoesColorCategory)
				.HasForeignKey(e => e.fk_ShoesColorId);

			modelBuilder.Entity<ShoesColorCategory>()
				.HasMany(e => e.ShoesGroups)
				.WithRequired(e => e.ShoesColorCategory)
				.HasForeignKey(e => e.fk_ShoesColorId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<ShoppingCart>()
				.HasOptional(e => e.CartItem)
				.WithRequired(e => e.ShoppingCart);

			modelBuilder.Entity<SizeCategory>()
				.HasMany(e => e.ProductGroups)
				.WithRequired(e => e.SizeCategory)
				.HasForeignKey(e => e.fk_SizeId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<SpeakerField>()
				.HasMany(e => e.Speakers)
				.WithRequired(e => e.SpeakerField)
				.HasForeignKey(e => e.fk_SpeakerFieldId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Speaker>()
				.Property(e => e.SpeakerPhone)
				.IsUnicode(false);

			modelBuilder.Entity<Speaker>()
				.Property(e => e.SpeakerImg)
				.IsUnicode(false);

			modelBuilder.Entity<Speaker>()
				.HasMany(e => e.Activities)
				.WithRequired(e => e.Speaker)
				.HasForeignKey(e => e.fk_SpeakerId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Speaker>()
				.HasMany(e => e.OneToOneReservations)
				.WithRequired(e => e.Speaker)
				.HasForeignKey(e => e.fk_ReservationSpeakerId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<StaffPermission>()
				.HasMany(e => e.Staffs)
				.WithRequired(e => e.StaffPermission)
				.HasForeignKey(e => e.fk_PermissionsId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Staff>()
				.Property(e => e.Mobile)
				.IsUnicode(false);

			modelBuilder.Entity<Staff>()
				.Property(e => e.Account)
				.IsUnicode(false);

			modelBuilder.Entity<Staff>()
				.Property(e => e.Password)
				.IsUnicode(false);

			modelBuilder.Entity<Staff>()
				.Property(e => e.ConfirmCode)
				.IsUnicode(false);

			modelBuilder.Entity<Type>()
				.HasMany(e => e.CartItems)
				.WithRequired(e => e.Type)
				.HasForeignKey(e => e.fk_Type)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Type>()
				.HasMany(e => e.orderItems)
				.WithRequired(e => e.Type)
				.HasForeignKey(e => e.fk_typeId)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Type>()
				.HasMany(e => e.PointHistories)
				.WithOptional(e => e.Type)
				.HasForeignKey(e => e.fk_TypeId);

			modelBuilder.Entity<Type>()
				.HasMany(e => e.PointManages)
				.WithRequired(e => e.Type)
				.HasForeignKey(e => e.fk_TypeId)
				.WillCascadeOnDelete(false);
		}
	}
}
