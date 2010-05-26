using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Campus
{
    public interface ICampusService
    {
        void Create(DAL.Campus c, string authorId);

        DAL.Campus GetById(int id);

        List<DAL.Campus> GetAll();

        void Update(int id, DAL.Campus c);

        void Delete(int id);

        void CreateVenue(DAL.Venue v, string authorId, int campusId);

        DAL.Venue GetVenueById(int id);

        List<DAL.Venue> GetAllVenues();

        void UpdateVenue(int id, DAL.Venue v);

        void DeleteVenue(int id);
    }
}
