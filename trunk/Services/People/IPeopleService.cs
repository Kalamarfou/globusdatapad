using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.People
{
    public interface IPeopleService
    {
        void createAvailability(DAL.Availability a, string authorId);

        void updateAvailability(DAL.Availability a, string authorId);

        DAL.Availability getAvailabilityById(int id);

        List<DAL.Availability> getAvailabilitiesForUser(string username, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords);

        List<DAL.Availability> getAvailablePeopleForCampus(int campusId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords);

        List<DAL.Availability> getAvailablePeopleForCampus(int id, int pageNum, int pageSize, out int totalRecords);

        void deleteAvailability(int id, string authorId);
    }
}
