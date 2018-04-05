﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HTRoomMgmtInfoSys.code;
using System.Data.SqlClient;
using System.Data;

namespace HTRoomMgmtInfoSys.form
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_login_Click(object sender, EventArgs e)
        {
            //sql语句 预处理sql
            string sql ="select count(*) from admin where a_name=@name and a_pwd=@passWord";
            SqlParameter[] pms = new SqlParameter[]
            {
                new SqlParameter("@name",SqlDbType.VarChar,20) {Value=Tb_name.Text.Trim()},
                new SqlParameter("@passWord",SqlDbType.VarChar,20) {Value=Tb_PassWord.Text}
            };
            int count=Convert.ToInt32(code.MySqlHelper.ExecuteScalar(sql,pms));
            string vCode = Session["CheckCode"].ToString();//获取验证码
            if (Tb_Vcode.Text.Trim().ToUpper()==vCode.ToUpper())
            {
                if (count>0)
                {
                    Session["userName"] = Tb_name.Text;
                    Session["passWord"] = Tb_PassWord.Text;
                    Response.Redirect("showInfo.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('用户名或密码错误！');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('验证码输入错误，请重新输入！');", true);
            }
        }

        protected void Img_Vcode_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}