using HTRoomMgmtInfoSys.code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTRoomMgmtInfoSys.form
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindAll();
        }

        /// <summary>
        /// 查询绑定所有数据
        /// </summary>
        protected void BindAll()
        {
            string sql_select_Room = "SELECT c_id,c_name,c_price,c_origin,c_inventory FROM commodity";
            DataSet ds = code.MySqlHelper.GetDataSet(sql_select_Room);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        /// <summary>
        /// 条件查询绑定数据
        /// </summary>
        protected void BindWithTerm()
        {
            string r_name = Tb_name.Text;
            string sql_select_RoomByTerm = string.Empty;
            //根据查询条件创建SQL语句
            if (r_name == "")
            {
                sql_select_RoomByTerm = "SELECT c_id, c_name, c_price, c_origin, c_inventory FROM commodity";
            }
            else
            {
                sql_select_RoomByTerm = string.Format("SELECT c_id,c_name,c_price,c_origin,c_inventory FROM commodity WHERE  c_name like '%{0}%'", r_name);
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
        /// 添加购物车
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.Rows[e.RowIndex].Cells[0].Text;
            string name = GridView1.Rows[e.RowIndex].Cells[1].Text;
            float price = float.Parse(GridView1.Rows[e.RowIndex].Cells[2].Text);
            int inventory = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[4].Text) - 1;
            string sql_update_inventory = "update commodity set c_inventory=" + inventory + " where c_id=" + id;
            //根据当前登录用户查询购物车
            string sql_select_car = string.Format("SELECT u_car FROM [user] where u_name='{0}'", Session["name"]);
            string car = (string)MySqlHelper.ExecuteScalar(sql_select_car);
            car += "," + id;
            //添加到购物车
            string sql_update_car = string.Format("update [user] set u_car='{0}' where u_name='{1}'", car, Session["name"]);
            MySqlHelper.ExecuteNonQuery(sql_update_car);
            //更新库存
            MySqlHelper.ExecuteNonQuery(sql_update_inventory);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('已添加商品到购物车！');location.href='main.aspx'", true);
        }
        /// <summary>
        /// 分页后点击页码事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (Tb_name.Text != "")
            {
                BindWithTerm();
            }
            else
            {
                BindAll();
            }
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

    }
}