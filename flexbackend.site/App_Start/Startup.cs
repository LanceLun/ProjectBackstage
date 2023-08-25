using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Hangfire;
using Hangfire.SqlServer;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(flexbackend.site.App_Start.Startup))]
namespace flexbackend.site.App_Start
{
	public class Startup
	{
		public void Configuration(IAppBuilder app)
		{
			// 配置 Hangfire
			GlobalConfiguration.Configuration.UseSqlServerStorage("Server=.;Database=Flex;User Id=sa5;Password=sa5;");

			// 在每次啟動時執行
			BackgroundJob.Enqueue(() => UpdateOrderBy());
			// 午夜12:00時自動執行
			RecurringJob.AddOrUpdate("update-order-by-job", () => UpdateOrderBy(), "0 0 * * *");

			// 啟動 Hangfire 背景作業處理器
			app.UseHangfireServer();

			// 啟動 Hangfire 儀表板
			app.UseHangfireDashboard();

		}

		public void UpdateOrderBy()
		{
			using (var connection = new SqlConnection("Server=.;Database=Flex;User Id=sa5;Password=sa5;"))
			{
				connection.Open();
				var command = connection.CreateCommand();
				command.CommandText = "UPDATE Discounts SET OrderBy = NULL WHERE EndDate < GETDATE()";
				command.ExecuteNonQuery();
			}
		}
	}
}