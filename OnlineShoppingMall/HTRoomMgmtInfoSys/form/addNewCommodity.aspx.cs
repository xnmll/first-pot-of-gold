using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HTRoomMgmtInfoSys.form
{
    public partial class addNewRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Btn_submit_Click(object sender, EventArgs e)
        {
            //获取输入
            string name = Tb_name.Text;
            string type = Tb_type.Text;
            float price = float.Parse(Tb_price.Text);
            string origin = Tb_origin.Text;
            int inventory = Convert.ToInt32(Tb_inventory.Text);
            //sql
            string sql_insert_commodity = string.Format("insert into commodity values('{0}',{1},'{2}',{3},'{4}')", name, price, origin, inventory, type);
            int count= code.MySqlHelper.ExecuteNonQuery(sql_insert_commodity);
            if (count>0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Startup", "alert('已成功添加商品！');location.href='addNewCommodity.aspx'", true);
            }
            
        }
    }
}