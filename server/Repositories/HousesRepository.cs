namespace gregslist_week9.Repositories;
public class HousesRepository 
{
  private readonly IDbConnection _db;
  public HousesRepository(IDbConnection db) 
  {
    _db = db;
  }
  internal List<House> GetHouses()
  {
    string sql = "SELECT * FROM houses;"; 
    List<House> houses = _db.Query<House>(sql).ToList();
    return houses;
  }

  internal House GetHouseById(int houseId)
  {
    string sql = "SELECT  * FROM houses WHERE id = @id;";
    House house = _db.Query<House>(sql, new { id = houseId }).FirstOrDefault();
    return house;
  }

}