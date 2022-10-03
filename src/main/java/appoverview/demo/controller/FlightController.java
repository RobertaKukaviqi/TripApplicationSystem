package appoverview.demo.controller;

import appoverview.demo.model.dto.FlightDTO;
import appoverview.demo.model.entity.User;
import appoverview.demo.service.FlightService;
import appoverview.demo.service.TripService;
import appoverview.demo.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "")
public class FlightController {
  private static final Logger logger = LogManager.getLogger(FlightController.class);
  @Autowired
  UserService userService;
  @Autowired
  private FlightService flightService;

  @Autowired
  private TripService tripService;

  @PostMapping("/addFlight")
  public ModelAndView addFlight(@RequestBody FlightDTO flightDTO){
    User user = userService.findUserByUsername(userService.getLoggedInUser());
    logger.info(user.getUsername() + " is running showRegisterPage1() method");
    try {
      flightService.addFlight(flightDTO);
      logger.info(user.getFirstName() + " " + user.getLastName() + " added a flight to trip with id = " + flightDTO.getTripId());
    }catch (Exception e){
      logger.error(e.getMessage());
    }
    ModelAndView model = new ModelAndView("success3");
    return model;
  }

  @GetMapping("/addFlight")
  public ModelAndView addFlightView(){
    return new ModelAndView("addFlight");
  }

}
