﻿using CommerceApp.DAL.EFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommerceApp.BL.EFramework
{
    public class BrandRepository : GenericRepository<CommerceAppDBEntities, Brand>, IBrandRepository
    {
    }
}