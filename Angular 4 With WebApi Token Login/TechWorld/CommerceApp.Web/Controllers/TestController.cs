using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CommerceApp.Web.Controllers
{
 
    [RoutePrefix("api/test")]
    public class TestController : ApiController
    {
        static List<Student> students = new List<Student>()
        {
            new Student() { Id = 1, Name = "Tom" },
            new Student() { Id = 2, Name = "Sam" },
            new Student() { Id = 3, Name = "John" }
        };

        [Route("",Name ="first")]
        public IEnumerable<Student> Get()
        {
            return students;
        }

        [Route("", Name = "second")]
        public IEnumerable<Student> GetStudents()
        {
            return students;
        }

    }

    public class Student
    {
        public int Id { get; internal set; }
        public string Name { get; internal set; }
    }
}
