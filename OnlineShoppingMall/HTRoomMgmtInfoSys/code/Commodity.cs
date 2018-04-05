using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HTRoomMgmtInfoSys.code
{
    public class Commodity
    {

        private string name; //名
        private float price; //价
        private int count; //量

        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }

        public float Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

        public int Count
        {
            get
            {
                return count;
            }

            set
            {
                count = value;
            }
        }

       
        public Commodity(string name,float price)
        {
            Name = name;
            Price = price;
        }
    }
}