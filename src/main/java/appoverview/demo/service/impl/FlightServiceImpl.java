package appoverview.demo.service.impl;

import appoverview.demo.model.dto.FlightDTO;
import appoverview.demo.model.entity.Flight;
import appoverview.demo.model.entity.Trip;
import appoverview.demo.repository.FlightRepository;
import appoverview.demo.repository.TripRepository;
import appoverview.demo.service.FlightService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FlightServiceImpl implements FlightService {
  @Autowired
  private FlightRepository flightRepository;

  @Autowired
  private TripRepository tripRepository;

  @Override
  public void addFlight(FlightDTO flightDTO) {
    Trip trip = tripRepository.findById(flightDTO.getTripId()).get();
    Flight flight = flightDTO.convertDTOtoFlight(flightDTO);
    flight.setTrip(trip);
    flightRepository.save(flight);
  }
}
