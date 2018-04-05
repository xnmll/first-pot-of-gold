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
    public partial class purchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindAll();
        }

        /// <summary>
        /// 查询购物车绑定所有数据
        /// </summary>
        protected void BindAll()
        {
            //查询购物车id内容
            string select_car = string.Format("select u_car from [user] where u_name='{0}'",Session["name"]);
            string car =MySqlHelper.ExecuteScalar(select_car).ToString();
            //取id值
            string[] carId = car.Split(',');
            string sql_select_car = string.Empty;
            if (carId !=null)
            {
                //生成sql
                sql_select_car = "SELECT c_id,c_name,c_price FROM commodity where 1=1 and";
                for (int i = 1; i < carId.Length; i++)
                {
                    sql_select_car += " c_id=" + carId[i]+" or";
                }
                sql_select_car = sql_select_car.Substring(0,sql_select_car.Length - 3);
            }
            //无id时购物车为空
            if (sql_select_car== "SELECT c_id,c_name,c_price FROM commodity where 1=1 ")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('您的购物为空，请先选购商品！');location.href='main.aspx'", true);
            }
            else
            {
                try
                {
                    DataSet ds = code.MySqlHelper.GetDataSet(sql_select_car);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                catch (Exception)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('查询失败！');", true);
                }
            }
            getSum();
        }
        /// <summary>
        /// 计算总价
        /// </summary>
        protected void getSum()
        {
            float price = 0;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                price+=float.Parse(GridView1.Rows[i].Cells[2].Text);
            }
            Label1.Text = string.Format("总价：{0}元", price);
        }

        /// <summary>
        /// 分页
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindAll();
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.Rows[e.RowIndex].Cells[0].Text;
            string select_car = string.Format("select u_car from [user] where u_name='{0}'", Session["name"]);
            string car = MySqlHelper.ExecuteScalar(select_car).ToString();
            
            int index = car.IndexOf(","+id);//建立索引
            if (index > -1)
            {
                car = car.Remove(index, 2);//从索引处移除2个字符
            }

            string sql_update_car = string.Format("update [user] set u_car='{0}' where u_name='{1}'",car,Session["name"]);
            MySqlHelper.ExecuteNonQuery(sql_update_car);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('已成功从购物车删除！');location.href='purchase.aspx'", true);
        }
        /// <summary>
        /// 清空购物车
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            string sql_update_car = string.Format("update [user] set u_car='' where u_name='{0}'",Session["name"]);
            MySqlHelper.ExecuteNonQuery(sql_update_car);
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('已清空您的购物车！');location.href='purchase.aspx'", true);
        }
    }
}