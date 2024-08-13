using Microsoft.AspNetCore.Mvc;

namespace ASPNETPROJECT1.Controllers
{
    public class ContactsController : Controller
    {
        public IActionResult Index() //contacts
        {
            return View();
        }
    }
}
