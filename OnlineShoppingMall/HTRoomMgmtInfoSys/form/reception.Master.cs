using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTRoomMgmtInfoSys.form
{
    public partial class reception : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lbtn_log.Text = "当前用户： " + Session["name"].ToString() + "    点击注销";
            }
            catch
            {
                Response.Redirect("sign.aspx");//防止非法登录
            }
        }
        /// <summary>
        /// 登录&注销
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtn_log_Click(object sender, EventArgs e)
        {
            if (lbtn_log.Text == "登录")
            {
                Response.Redirect("signin.aspx");
            } else if (lbtn_log.Text.Contains("注销"))
            {
                lbtn_log.Text = "登录";
                Session.Abandon();//取消Session
                Response.Redirect("sign.aspx");
            }
        }
    }
}