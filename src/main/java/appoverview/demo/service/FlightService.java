package appoverview.demo.service;

import appoverview.demo.model.dto.FlightDTO;
import org.springframework.stereotype.Service;

@Service
public interface FlightService {
  void addFlight(FlightDTO flightDTO);
}
