using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTRoomMgmtInfoSys.form
{
    public partial class userInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAll();
            }
        }
        /// <summary>
        /// 分页
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (Tb_name.Text != "")
            {
                BindWithTerm();//有查询条件时分页 
            }
            else
            {
                BindAll();//没有条件时分页
            }
        }
        /// <summary>
        /// 取消按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindAll();
        }
        /// <summary>
        /// 删除行
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.Rows[e.RowIndex].Cells[0].Text;//获取该行主键id值
            string sql_delete_commodity = "delete from [user] where u_id=" + id;
            code.MySqlHelper.ExecuteNonQuery(sql_delete_commodity);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('已成功删除该用户！');location.href='userInfo.aspx'", true);
        }
        /// <summary>
        /// 编辑行
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindAll();
        }
        /// <summary>
        /// 数据更新按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = GridView1.Rows[e.RowIndex].Cells[0].Text;
            string pwd = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text;
            string phone = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text;

            string sql_Update_commodity = string.Format("update [user] set u_pwd='{0}',u_phone='{1}' where u_id={2}", pwd,phone, id);
            code.MySqlHelper.ExecuteNonQuery(sql_Update_commodity);
            GridView1.EditIndex = -1;
            BindAll();
        }
        /// <summary>
        /// 查询按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Btn_seach_Click(object sender, EventArgs e)
        {
            BindWithTerm();
        }

        /// <summary>
        /// 查询绑定所有数据
        /// </summary>
        protected void BindAll()
        {
            string sql_select_Room = "SELECT * FROM [user]";
            DataSet ds = code.MySqlHelper.GetDataSet(sql_select_Room);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        /// <summary>
        /// 条件查询绑定数据
        /// </summary>
        protected void BindWithTerm()
        {
            string name = Tb_name.Text;
            string sql_select_ByTerm = string.Empty;
            //根据查询条件创建SQL语句

            if (name == "")
            {
                sql_select_ByTerm = "SELECT * FROM [user]";
            }
            else
            {
                sql_select_ByTerm = string.Format("SELECT * FROM [user] WHERE  u_name='{0}'", name);
            }

            try
            {
                //查询
                DataSet ds = code.MySqlHelper.GetDataSet(sql_select_ByTerm);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception)
            {

            }
        }
    }
}