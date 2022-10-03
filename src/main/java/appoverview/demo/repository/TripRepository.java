package appoverview.demo.repository;

import appoverview.demo.model.dto.TripDTO;
import appoverview.demo.model.entity.Trip;
import appoverview.demo.model.entity.User;
import appoverview.demo.model.enums.TripStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface TripRepository extends JpaRepository<Trip, Integer> {
  @Query(nativeQuery=true, value = "SELECT * " +
      "FROM trip t inner join flight f on t.id = f.trip_flight where f.departure_date > CURDATE()")
  List<Trip> getFutureTrips();

  @Query(nativeQuery=true, value = "SELECT * FROM trip where id=?1")
  Trip getTripById(Integer id);

  @Transactional
  @Modifying
  @Query(nativeQuery = true, value = "Update trip set status = ?2 where id=?1")
  void changeTripStatus(Integer id, Integer status);
}
