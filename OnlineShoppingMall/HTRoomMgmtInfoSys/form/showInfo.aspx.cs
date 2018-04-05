using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTRoomMgmtInfoSys.form
{
    public partial class selectRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAll();
            }
        }
        /// <summary>
        /// 分页后点击页码事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (Tb_name.Text!=""||Tb_type.Text!="")
            {
                BindWithTerm();
            }
            else
            {
                BindAll();
            }
        }
        /// <summary>
        /// 查找事件
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
            string sql_select_Room = "SELECT c_id,c_name,c_price,c_origin,c_inventory,c_type FROM commodity";
            DataSet ds = code.MySqlHelper.GetDataSet(sql_select_Room);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        /// <summary>
        /// 条件查询绑定数据
        /// </summary>
        protected void BindWithTerm()
        {
            string r_Type = Tb_type.Text;
            string r_name = Tb_name.Text;
            string sql_select_RoomByTerm = string.Empty;
            //根据查询条件创建SQL语句
            if (r_Type == "")
            {
                if (r_name == "")
                {
                    sql_select_RoomByTerm = "SELECT c_id, c_name, c_price, c_origin, c_inventory, c_type FROM commodity";
                }
                else
                {
                    sql_select_RoomByTerm = string.Format("SELECT c_id,c_name,c_price,c_origin,c_inventory,c_type FROM commodity WHERE  c_name='{0}'",r_name);
                }
            }
            else
            {
                if (r_name == "")
                {
                    sql_select_RoomByTerm = string.Format("SELECT c_id,c_name,c_price,c_origin,c_inventory,c_type FROM commodity WHERE  c_type='{0}'", r_Type);
                }
                else
                {
                    sql_select_RoomByTerm = string.Format("SELECT c_id,c_name,c_price,c_origin,c_inventory,c_type FROM commodity WHERE  c_name='{0}' AND c_type='{1}'", r_name,r_Type);
                }
            }
            try
            {
                //查询
                DataSet ds = code.MySqlHelper.GetDataSet(sql_select_RoomByTerm);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            catch (Exception)
            {

            }
        }



        /// <summary>
        /// 重载，否则出现“类型“GridView”的控件“GridView1”必须放在具有 runat=server 的窗体标... ”的错误
        /// </summary>
        /// <param name="control"></param>
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
        /// <summary>
        /// 导出方法
        /// </summary>
        /// <param name="GridView"></param>
        /// <param name="filename">保存的文件名称</param>
        private void ExportGridViewForUTF8(GridView GridView, string filename)
        {
            GridView1.AllowPaging = false; //去除GridView的分页
            BindAll();
            string attachment = "attachment; filename=" + filename;

            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", attachment);

            Response.Charset = "UTF-8";
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
            Response.ContentType = "application/ms-excel";
            System.IO.StringWriter sw = new System.IO.StringWriter();

            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView.RenderControl(htw);

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();

        }
        /// <summary>
        /// 导出按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Btn_ToExcel_Click(object sender, EventArgs e)
        {
            ExportGridViewForUTF8(GridView1, "商品信息表"+DateTime.Now.ToShortDateString() + ".xls");//调用导出方法
        }
        /// <summary>
        /// 编辑事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindAll();
        }
        /// <summary>
        /// GridView中的取消事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindAll();
        }
        /// <summary>
        /// 更新事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //获取输入
            string id = GridView1.Rows[e.RowIndex].Cells[0].Text;
            string price= ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text;
            string type= ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text;
            string origin = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text;
            string inventory = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text;
            //sql语句
            string sql_Update_commodity =string.Format("update commodity set c_price={0},c_type='{1}',c_origin='{2}',c_inventory={3} where c_id={4}", price, type, origin, inventory,id);
            code.MySqlHelper.ExecuteNonQuery(sql_Update_commodity);
            GridView1.EditIndex = -1;
            BindAll();
        }
        /// <summary>
        /// 删除事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.Rows[e.RowIndex].Cells[0].Text;
            string sql_delete_commodity = "delete from commodity where c_id=" + id;
            code.MySqlHelper.ExecuteNonQuery(sql_delete_commodity);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('已成功删除该订单！');location.href='showInfo.aspx'", true);
        }
    }
}