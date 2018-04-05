using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTRoomMgmtInfoSys.form
{
    public partial class addNewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_submit_Click(object sender, EventArgs e)
        {
            //获取输入
            string name = Tb_name.Text;
            string pwd = Tb_pwd.Text;
            string phone = Tb_phone.Text;
            //sql
            string sql_insert_commodity = string.Format("insert into [user] values('{0}','{1}','{2}')", name, phone, pwd);
            int count = code.MySqlHelper.ExecuteNonQuery(sql_insert_commodity);
            if (count > 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('已成功添加用户！');location.href='addNewUser.aspx'", true);
            }
        }
    }
}