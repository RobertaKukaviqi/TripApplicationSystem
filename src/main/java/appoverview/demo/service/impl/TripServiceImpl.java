package appoverview.demo.service.impl;

import appoverview.demo.model.dto.TripDTO;
import appoverview.demo.model.entity.Trip;
import appoverview.demo.model.entity.User;
import appoverview.demo.model.enums.TripStatus;
import appoverview.demo.repository.TripRepository;
import appoverview.demo.repository.UserRepository;
import appoverview.demo.service.TripService;
import appoverview.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TripServiceImpl implements TripService {
  @Autowired
  private TripRepository tripRepository;

  @Autowired
  private UserService userService;

  @Autowired
  private UserRepository userRepository;

  @Override
  public Trip createTrip(TripDTO tripDTO) {
    Trip trip = tripDTO.convertDTOtoTrip(tripDTO);
    User user = userRepository.findById(tripDTO.getOrdered_by()).get();
    trip.setOrderedBy(user);
    trip.setStatus(TripStatus.CREATED);
    tripRepository.save(trip);
    return trip;
  }

  @Override
  public void changeStatus(Integer id, Integer status) {
    tripRepository.changeTripStatus(id, status);
    //Trip trip = tripRepository.findById(id).get();
    //trip.setStatus(status);
    //tripRepository.save(trip);
  }

  @Override
  public List<Trip> getTrips() {
    return tripRepository.getFutureTrips();
  }

  @Override
  public Trip getTripById(Integer id) {
    return tripRepository.getTripById(id);
  }

}
