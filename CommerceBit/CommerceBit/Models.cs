﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommerceBit
{
    public class UserInfo
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public string CompanyCode { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool CanLogin { get; set; }
    }
}
