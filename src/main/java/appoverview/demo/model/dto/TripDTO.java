package appoverview.demo.model.dto;

import appoverview.demo.model.entity.Trip;
import appoverview.demo.model.enums.TripReasonsEnum;
import appoverview.demo.model.enums.TripStatus;

import javax.validation.constraints.NotEmpty;

public class TripDTO {
  private Integer Id;

  @NotEmpty
  private String description;

  @NotEmpty
  private TripReasonsEnum tripReasonsEnum;

  @NotEmpty
  private Integer ordered_by;

  @NotEmpty
  private TripStatus status;

  public TripStatus getStatus() {
    return status;
  }

  public void setStatus(TripStatus status) {
    this.status = status;
  }

  public Integer getId() {
    return Id;
  }

  public void setId(Integer id) {
    Id = id;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public TripReasonsEnum getTripReasonsEnum() {
    return tripReasonsEnum;
  }

  public void setTripReasonsEnum(TripReasonsEnum tripReasonsEnum) {
    this.tripReasonsEnum = tripReasonsEnum;
  }

  public Integer getOrdered_by() {
    return ordered_by;
  }

  public void setOrdered_by(Integer ordered_by) {
    this.ordered_by = ordered_by;
  }

  public Trip convertDTOtoTrip(TripDTO tripDTO){
    Trip trip = new Trip();
    trip.setDescription(tripDTO.getDescription());
    trip.setreason(tripDTO.getTripReasonsEnum());
    trip.setStatus(tripDTO.getStatus());
    return trip;
  }
}
