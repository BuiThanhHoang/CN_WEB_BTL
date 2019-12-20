using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_WEB.Code
{
    [Serializable]
    public class UserLogin
    {
        public long id { set; get; }
        public string tentaikhoan { set; get; }

        public int id_ttcn { set; get; }
    }
}