package appoverview.demo.model.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "flight")
public class Flight {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "flightId", nullable = false, unique = true)
  private Integer id;

  @OneToOne(mappedBy = "flight")
  private Trip trip;

  @Column(name = "fromLocation", nullable = false)
  private String from;

  @Column(name = "toLocation", nullable = false)
  private String to;

  @Column(name = "departureDate", nullable = false)
  @Temporal(value = TemporalType.DATE)
  private Date departureDate;

  @Column(name = "arrivalDate", nullable = false)
  @Temporal(value = TemporalType.DATE)
  private Date arrivalDate;


  public Trip getTrip() {
    return trip;
  }

  public void setTrip(Trip trip) {
    this.trip = trip;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
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

  public Date getDepartureDate() {
    return departureDate;
  }

  public void setDepartureDate(Date departureDate) {
    this.departureDate = departureDate;
  }

  public Date getArrivalDate() {
    return arrivalDate;
  }

  public void setArrivalDate(Date arrivalDate) {
    this.arrivalDate = arrivalDate;
  }
}
