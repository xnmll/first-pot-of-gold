using HTRoomMgmtInfoSys.code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTRoomMgmtInfoSys.form
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 注册
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            //判断密码是否相同
            if (Tb_pwd.Text==Tb_pwd_ok.Text)
            {
                string sql = string.Format("insert into [user] (u_name,u_phone,u_pwd) values('{0}','{1}','{2}')", Tb_name.Text, Tb_phone.Text,Tb_pwd_ok.Text);
                try
                {
                    MySqlHelper.ExecuteNonQuery(sql);
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('注册成功，请登录！');location.href='sign.aspx'", true);
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('注册失败，请检查信息！');location.href='register.aspx'", true);
                }
            }
            else
            {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('两次输入的密码不一致，请检查！');", true);
            }
        }
    }
}