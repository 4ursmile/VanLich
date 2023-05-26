
using Microsoft.AspNetCore.Mvc;
namespace VanLichAPI.Controllers;
[ApiController]
[Route("api/v1/[controller]")]
public class HealthController
{
    [HttpGet]
    public string Get()
    {
        return "I'm f****g OK";
    }
}