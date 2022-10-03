package appoverview.demo.model.enums;

public enum TripStatus {
  CREATED(0),
  WAITING_FOR_APPROVAL(1),
  APPROVED(2);

  public final Integer value;

  TripStatus(Integer value) {
    this.value = value;
  }
}
