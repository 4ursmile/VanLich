
using Microsoft.AspNetCore.Mvc;
namespace VanLichAPI.Controllers;
[ApiController]
[Route("api/[controller]")]
public class HealthController
{
    [HttpGet]
    public string Get()
    {
        return "I'm f****g OK";
    }
}