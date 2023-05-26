using Microsoft.AspNetCore.Mvc;
using VanLichAPI.Models;
using VanLichAPI.Services;
using VanLichAPI.Services.Models;
using VanLichAPI.Models.HTTPBinding;

namespace VanLichAPI.Controllers;
[ApiController]
[Route("api/v1/[controller]")]
public class UserController : ControllerBase
{
    private readonly UserServices _userServices;
    public UserController(UserServices userServices)
    {
        _userServices = userServices;
    }
    [HttpGet]
    [Route("debug/{id:length(24)}")]
    public async Task<ActionResult<User>> GetAsync(string id)
    {
        var user = await _userServices.GetAsync(id);
        if (user == null)
        {
            return NotFound();
        }
        return user;
    }
    [HttpGet]
    public async Task<ActionResult<List<User>>> GetAllAsync([FromQuery] Related r)
    {
        var userList = await _userServices.GetAllAsync(r.Skip, r.Limit);
        if (userList == null)
        {
            return NotFound();
        }
        return userList;
    }
    [HttpPost]
    public async Task<ActionResult<User>> CreateAsync(User user)
    {
        await _userServices.CreateAsync(user);
        return CreatedAtAction(nameof(CreateAsync), new { id = user.Id }, user);
    }
    [HttpPut]
    [Route("{id:length(24)}")]
    public async Task<IActionResult> UpdateAsync(string id, User userIn)
    {
        var user = await _userServices.GetAsync(id);
        if (user == null)
        {
            return NotFound();
        }
        userIn.Id = id;
        await _userServices.UpdateAsync(id, userIn);
        return NoContent();
    }
    [HttpDelete]
    [Route("{id:length(24)}")]
    public async Task<IActionResult> DeleteAsync(string? id)
    {
        var user = await _userServices.GetAsync(id);
        if (user == null)
        {
            return NotFound();
        }
        await _userServices.RemoveAsync(user.Id);
        return NoContent();
    }
    [HttpGet] [Route("active")]
    public async Task <ActionResult<User>> GetActiveUserAsync()
    {
        var user = await _userServices.GetSampleUserAsync();
        if (user == null)
        {
            return NotFound();
        }
        return user;
    }
}
