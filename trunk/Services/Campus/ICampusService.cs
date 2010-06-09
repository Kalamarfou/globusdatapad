using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Campus
{
    public interface ICampusService
    {
        #region "Campus"

        void Create(DAL.Campus c, string authorId);

        DAL.Campus GetById(int id);

        List<DAL.Campus> GetAll(int pageNum, int pageSize, out int totalRecords);

        void Update(DAL.Campus c, string authorId);

        void Delete(int id, string authorId);

        #endregion

        #region "Venues"

        void CreateVenueForCampus(int campusId, DAL.Venue v, string authorId);

        DAL.Venue GetVenueById(int id);

        List<DAL.Venue> GetAllVenues(int pageNum, int pageSize, out int totalRecords);

        List<DAL.Venue> GetAllVenuesForCampus(int campusId, int pageNum, int pageSize, out int totalRecords);

        void UpdateVenue(DAL.Venue v, string authorId);

        void DeleteVenue(DAL.Venue v, string authorId);

        #endregion
    }
}
