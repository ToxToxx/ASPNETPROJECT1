using ASPNETPROJECT1.Models;
using Microsoft.AspNetCore.Mvc;

namespace ASPNETPROJECT1.Controllers
{
    public class ContactsController : Controller
    {
        public IActionResult Index() //contacts
        {
            return View();
        }

        [HttpPost]
        public IActionResult Check(Contact contact)
        {
            if (ModelState.IsValid)
            {
                return Redirect("/");
            }

            return View("Index");
        }
    }
}
