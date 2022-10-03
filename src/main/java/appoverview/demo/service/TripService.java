package appoverview.demo.service;

import appoverview.demo.model.dto.TripDTO;
import appoverview.demo.model.entity.Trip;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TripService {
  Trip createTrip(TripDTO tripDTO);
  void changeStatus(Integer id, Integer status);
  List<Trip> getTrips();
  Trip getTripById(Integer id);
}
