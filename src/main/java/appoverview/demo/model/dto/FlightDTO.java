package appoverview.demo.model.dto;

import appoverview.demo.model.entity.Flight;

import javax.validation.constraints.NotEmpty;
import java.util.Date;

public class FlightDTO {
  private Integer Id;

  @NotEmpty
  private Date arrivalDate;

  @NotEmpty
  private Date departureDate;

  @NotEmpty
  private String from;

  @NotEmpty
  private String to;

  @NotEmpty
  private Integer tripId;

  public Integer getId() {
    return Id;
  }

  public void setId(Integer id) {
    Id = id;
  }

  public Date getArrivalDate() {
    return arrivalDate;
  }

  public void setArrivalDate(Date arrivalDate) {
    this.arrivalDate = arrivalDate;
  }

  public Date getDepartureDate() {
    return departureDate;
  }

  public void setDepartureDate(Date departureDate) {
    this.departureDate = departureDate;
  }

  public String getFrom() {
    return from;
  }

  public void setFrom(String from) {
    this.from = from;
  }

  public String getTo() {
    return to;
  }

  public void setTo(String to) {
    this.to = to;
  }

  public Integer getTripId() {
    return tripId;
  }

  public void setTripId(Integer tripId) {
    this.tripId = tripId;
  }

  public Flight convertDTOtoFlight(FlightDTO flightDTO){
    Flight flight = new Flight();
    flight.setArrivalDate(flightDTO.getArrivalDate());
    flight.setDepartureDate(flightDTO.getDepartureDate());
    flight.setFrom(flightDTO.getFrom());
    flight.setTo(flightDTO.getTo());
    return flight;
  }
}
