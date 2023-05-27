using VanLichAPI.Models;
using VanLichAPI.Services;
using VanLichAPI.Services.Models;
using Microsoft.AspNetCore.Mvc;
using MongoDB.Bson;
using VanLichAPI.Models.HTTPBinding;
namespace VanLichAPI.Controllers;


[ApiController]
[Route("api/v1/[controller]")]
public class ContentController:ControllerBase
{
    private readonly ContentServices _contentServices;
    public ContentController(ContentServices contentServices)
    {
        _contentServices = contentServices;
    }
    [HttpGet]
    [Route("debug/{id}")]
    public async Task<ActionResult<Content>> GetAsync(string id)
    {
        var content = await _contentServices.GetAsync(id);
        if (content == null)
        {
            return NotFound();
        }
        return content;
    }
    [HttpGet]
    public async Task<ActionResult<List<Content>>> GetAllAsync([FromQuery] Related r)
    {
        var contentList = await _contentServices.GetAllAsync(r.Skip, r.Limit);
        if (contentList == null)
        {
            return NotFound();
        }
        return contentList;
    }
    [HttpPost]
    public async Task<ActionResult<Content>> CreateAsync(Content content)
    {
        //content.Id = ObjectId.GenerateNewId().ToString();
        await _contentServices.CreateAsync(content);
        return CreatedAtAction(nameof(CreateAsync), new { id = content.Id }, content);
    }

    [HttpPut("{id:length(24)}")]
    public async Task<IActionResult> UpdateAsync(string id, Content contentIn)
    {
        var content = await _contentServices.GetAsync(id);
        if (content == null)
        {
            return NotFound();
        }
        contentIn.Id = id;
        await _contentServices.UpdateAsync(id, contentIn);
        return NoContent();
    }
    [HttpDelete()]
    [Route("{id:length(24)}")]
    public async Task<IActionResult> RemoveAsync(string id)
    {
        var content = await _contentServices.GetAsync(id);
        if (content == null)
        {
            return NotFound();
        }
        await _contentServices.RemoveAsync(content.Id);
        return NoContent();
    }
    [HttpGet]
    [Route("search")]
    public async Task<ActionResult<List<Content>>> GetByNameAsync([FromQuery] SearchBinder sb)
    {
        var contentList = await _contentServices.GetByNameAsync(sb.name, sb.Skip, sb.Limit);
        if (contentList == null)
        {
            return NotFound();
        }
        return contentList;
    }
    [HttpGet]
    [Route("collection")]
    public async Task<ActionResult<List<Content>>> GetByCollectionAsync([FromQuery] CollectionsBinder cb)
    {
        var contentList = await _contentServices.GetByCollectionAsync(cb.collectionId, cb.Skip, cb.Limit);
        if (contentList == null)
        {
            return NotFound();
        }
        return contentList;
    }
    [HttpGet]
    [Route("resetDebug")]
    public async Task<ActionResult> ResetDebug()
    {
        await _contentServices.ResetDebug();
        return NoContent();
    }
    [HttpGet]
    [Route("suggest")]
    public async Task<ActionResult<List<Content>>> GetSuggestAsync([FromQuery] int? skip, int limit = 3)
    {
        var contentList = await _contentServices.GetSuggestAsync(limit);
        if (contentList == null)
        {
            return NotFound();
        }
        return Accepted(contentList);
    }
    [HttpGet] [Route("related")]
    public async Task<ActionResult<List<Content>>> GetRelatedByTypeAsync([FromQuery] RelatedByType relatedType)
    {
        var contentList = await _contentServices.GetRelatedByTypeAsync(relatedType.Id, relatedType.Type, relatedType.Skip, relatedType.Limit);
        if (contentList == null)
        {
            return NotFound();
        }
        return Accepted(contentList);
    }
}