using VanLichAPI.Models;
using VanLichAPI.Models.HTTPBinding;
using VanLichAPI.Services;
using VanLichAPI.Services.Models;
using Microsoft.AspNetCore.Mvc;

namespace VanLichAPI.Controllers;
[ApiController]
[Route("api/[controller]")]
public class CollectionController : ControllerBase
{
    private readonly CollectionServices _collectionServices;
    public CollectionController(CollectionServices collectionServices)
    {
        _collectionServices = collectionServices;
    }
    [HttpGet]
    [Route("debug/{id:length(24)}")]
    public async Task<ActionResult<Collection>> GetAsync(string id)
    {
        var collection = await _collectionServices.GetAsync(id);
        if (collection == null)
        {
            return NotFound();
        }
        return collection;
    }
    [HttpGet]
    public async Task<ActionResult<List<Collection>>> GetAllAsync([FromQuery] Related r)
    {
        var collectionList = await _collectionServices.GetAllAsync(r.Skip, r.Limit);
        if (collectionList == null)
        {
            return NotFound();
        }
        return collectionList;
    }
    [HttpPost]
    public async Task<ActionResult<Collection>> CreateAsync(Collection collection)
    {
        await _collectionServices.CreateAsync(collection);
        return CreatedAtAction(nameof(CreateAsync), new { id = collection.Id }, collection);
    }
    [HttpPut]
    [Route("{id:length(24)}")]
    public async Task<IActionResult> UpdateAsync(string id, Collection collectionIn)
    {
        var collection = await _collectionServices.GetAsync(id);
        if (collection == null)
        {
            return NotFound();
        }
        collectionIn.Id = id;
        await _collectionServices.UpdateAsync(id, collectionIn);
        return NoContent();
    }
    [HttpDelete]
    [Route("{id:length(24)}")]
    public async Task<IActionResult> DeleteAsync(string? id)
    {
        var collection = await _collectionServices.GetAsync(id);
        if (collection == null)
        {
            return NotFound();
        }
        await _collectionServices.DeleteAsync(collection.Id);
        return NoContent();
    }
    [HttpGet] [Route("search")]
    public async Task<ActionResult<List<Collection>>> GetSearchAsync([FromQuery] SearchBinder sb)
    {
        var collections = await _collectionServices.GetCollectionsByNameAsync(sb.name, sb.Skip, sb.Limit);
        if (collections == null)
        {
            return NotFound();
        }
        return collections;
    }
    [HttpGet] [Route("suggest")]
    public async Task<ActionResult<List<Collection>>> GetSuggestAsync([FromQuery]  Related re)
    {
        var collections = await _collectionServices.GetSuggestAsync(re.Limit);
        if (collections == null)
        {
            return NotFound();
        }
        return collections;
    }
}