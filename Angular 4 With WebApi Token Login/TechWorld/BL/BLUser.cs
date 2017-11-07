using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
   public class BLUser
    {
        public static bool Login(string UserName,string Password)
        {
            if(UserName=="admin" && Password=="1234")
            {
                return true;
            }
            return false;
        }

    }
}
