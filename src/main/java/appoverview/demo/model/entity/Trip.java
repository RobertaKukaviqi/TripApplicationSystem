package appoverview.demo.model.entity;

import appoverview.demo.model.enums.TripReasonsEnum;
import appoverview.demo.model.enums.TripStatus;

import javax.persistence.*;

@Entity
@Table(name = "trip")
public class Trip {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false, unique = true)
  private Integer id;

  @Enumerated(value = EnumType.STRING)
  @Column(name = "reason", nullable = false)
  private TripReasonsEnum reason;

  @Column(name = "description", nullable = false)
  private String description;

  @Column(name = "status", nullable = false)
  private TripStatus status;

  @OneToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "flight_id", referencedColumnName = "flightId")
  private Flight flight;

  @ManyToOne()
  @JoinColumn(name = "orderedBy", referencedColumnName = "id")
  private User orderedBy;

  public Trip(){
    this.status = TripStatus.CREATED;
  }

  public TripReasonsEnum getReason() {
    return reason;
  }

  public Flight getFlight() {
    return flight;
  }

  public void setFlight(Flight flight) {
    this.flight = flight;
  }

  public void setReason(TripReasonsEnum reason) {
    this.reason = reason;
  }

  public TripStatus getStatus() {
    return status;
  }

  public void setStatus(TripStatus status) {
    this.status = status;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public TripReasonsEnum getreason() {
    return reason;
  }

  public void setreason(TripReasonsEnum reason) {
    this.reason = reason;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public User getOrderedBy() {
    return orderedBy;
  }

  public void setOrderedBy(User orderedBy) {
    this.orderedBy = orderedBy;
  }
}
