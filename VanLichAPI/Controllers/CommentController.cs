using Microsoft.AspNetCore.Mvc;
using VanLichAPI.Services.Models;
using VanLichAPI.Models;
using VanLichAPI.Services;
using VanLichAPI.Models.HTTPBinding;
namespace VanLichAPI.Controllers;
[ApiController]
[Route("api/v1/[controller]")]
public class CommentController : ControllerBase
{
    private readonly CommentServices _commentServices;
    public CommentController(CommentServices commentServices)
    {
        _commentServices = commentServices;
    }

    [HttpGet]
    [Route("debug/{id:length(24)}")]
    public async Task<ActionResult<Comment>> Get(string id)
    {
        var comment = await _commentServices.GetAsync(id);
        if (comment == null)
        {
            return NotFound();
        }
        return comment;
    }

    [HttpPost]
    public async Task<ActionResult<Comment>> CreateAsync(Comment comment)
    {
        await _commentServices.CreateAsync(comment);
        return CreatedAtAction(nameof(CreateAsync), new { id = comment.Id }, comment);
    }

    [HttpPut] [Route("{id:length(24)}")]
    public async Task<IActionResult> Update(string id, Comment commentIn)
    {
        var comment = await _commentServices.GetAsync(id);
        if (comment == null)
        {
            return NotFound();
        }
        commentIn.Id = comment.Id;
        await _commentServices.UpdateAsync(id, commentIn);
        return NoContent();
    }

    [HttpDelete] [Route("{id:length(24)}")]
    public async Task<IActionResult> Delete(string id)
    {
        var comment = await _commentServices.GetAsync(id);
        if (comment == null)
        {
            return NotFound();
        }
        await _commentServices.RemoveAsync(comment.Id);
        return NoContent();
    }
    [HttpGet] [Route("content")]
    public async Task<ActionResult<List<Comment>>> GetCommentByContentID([FromQuery] CommentBinder cb)
    {
        var comments = await _commentServices.GetCommentsAsync(cb.ContentId, cb.ParentCommentIds,cb.Skip, cb.Limit, cb.order);
        if (comments == null)
        {
            return NotFound();
        }
        return comments;
    }
}