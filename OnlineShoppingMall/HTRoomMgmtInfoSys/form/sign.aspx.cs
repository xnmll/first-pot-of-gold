using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTRoomMgmtInfoSys.form
{
    public partial class sign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_signin_Click(object sender, EventArgs e)
        {
            //获取输入
            string name = Tb_name.Text;
            string pwd = Tb_passWord.Text;
            string sql = string.Format("select count(*) from [user] where u_name='{0}' and u_pwd='{1}'", name, pwd);
            int count = Convert.ToInt32(code.MySqlHelper.ExecuteScalar(sql));
            //判断登录
            if (count > 0)
            {
                Session["name"]= name;

                Response.Redirect("main.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('用户名或密码错误！');", true);
            }
        }
    }
}