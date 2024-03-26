namespace gregslist_week9.Controllers;

[ApiController]
[Route("api/[controller]")]
public class HousesController : ControllerBase 
{
  private readonly HousesService _housesService;
  private readonly Auth0Provider _auth0Provider;
  public HousesController(HousesService housesService, Auth0Provider auth0Provider)
  {
    _housesService = housesService;
    _auth0Provider = auth0Provider;
  }
  [HttpGet]
  public ActionResult<List<House>> GetHouses()
  {
    try
    {
      List<House> houses = _housesService.GetHouses();
      return Ok(houses);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }
  [HttpGet("{houseId}")]
  public ActionResult<House> GetHouseById(int houseId)
  {
    try
    {
      House house = _housesService.GetHouseById(houseId);
      return Ok(house);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }

  [HttpPost]
  [Authorize]
  public async Task<ActionResult<House>> CreateHouse([FromBody] House houseData) 
  {
    try
    {
      Account userInfo = await _auth0Provider.GetUserInfoAsync<Account>(HttpContext);
      houseData.CreatorId = userInfo.Id;
      House house = _housesService.CreateHouse(houseData);
      return Ok(house);
    }
    catch (Exception exception)
    {
      return BadRequest(exception.Message);
    }
  }
}