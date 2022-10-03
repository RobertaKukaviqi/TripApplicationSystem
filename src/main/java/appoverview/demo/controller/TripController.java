package appoverview.demo.controller;

import appoverview.demo.model.dto.TripDTO;
import appoverview.demo.model.entity.Trip;
import appoverview.demo.model.entity.User;
import appoverview.demo.model.enums.TripStatus;
import appoverview.demo.repository.TripRepository;
import appoverview.demo.service.TripService;
import appoverview.demo.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping(value = "/trips")
public class TripController {
  private static final Logger logger = LogManager.getLogger(TripController.class);
  @Autowired
  TripService tripService;

  @Autowired
  UserService userService;

  @Autowired
  TripRepository tripRepository;

  @GetMapping("")
  public ModelAndView getFutureTrips(){
    return new ModelAndView("futureTrips");
  }

  @GetMapping ("/apply")
  public ModelAndView showRegisterPage1(@ModelAttribute("trip") TripDTO tripDTO){
    User user = userService.findUserByUsername(userService.getLoggedInUser());
    logger.info(user.getUsername() + " is running showRegisterPage1() method");
    ModelAndView model = new ModelAndView("createTrip");
    tripDTO.setOrdered_by(userService.findUserByUsername(userService.getLoggedInUser()).getId());
    model.addObject(tripDTO);
    return model;
  }

  @PostMapping("/apply")
  public Integer applyForTrip(@RequestBody TripDTO tripDTO, HttpServletResponse httpServletResponse){
    User user = userService.findUserByUsername(userService.getLoggedInUser());
    logger.info(user.getUsername() + " is running applyForTrip() method");
    try {
      Trip trip = tripService.createTrip(tripDTO);
      logger.info(user.getFirstName() + " " + user.getLastName() + " just created a trip.");
      return trip.getId();
    }catch (Exception e){
      logger.error(e.getMessage());
    }
    return null;
//    httpServletResponse.setHeader("Location", "/checkStatus");
//    ModelAndView model = new ModelAndView("viewTrip");
//    httpServletResponse.setStatus(302);
//    return model;
  }

  @GetMapping ("/checkStatus")
  public ModelAndView checkStatus(@RequestParam Integer id){
    Trip trip = tripService.getTripById(id);
    User user = userService.findUserByUsername(userService.getLoggedInUser());
    logger.info(user.getUsername() + " is running checkStatus(Integer id) method");
    if(user.getTrips().contains(trip)) {
      ModelAndView model = new ModelAndView("viewTrip");
      model.addObject(trip);
      model.addObject(user);
      return model;
    }
    else {
      logger.error(user + " attempted to retrieve restricted data.");
      return new ModelAndView("fail");
    }
  }

  @PostMapping ("/changeStatus")
  public ModelAndView changeStatus(@RequestBody TripDTO tripDTO){
    User user = userService.findUserByUsername(userService.getLoggedInUser());
    logger.info(user.getUsername() + " is running changeStatus(TripDTO tripDTO) method");
    try {
      tripService.changeStatus(tripDTO.getId(), tripDTO.getStatus().value);
      tripRepository.save(tripService.getTripById(tripDTO.getId()));
      logger.info(user.getFirstName() + " " + user.getLastName() + " changed the status of the trip with id " + tripDTO.getId() + " to " + tripDTO.getStatus() + ".");
    } catch(Exception e){
      logger.error(e.getMessage());
    }
    ModelAndView model = new ModelAndView("success2");
    return model;
  }

  @GetMapping ("/waitForApproval")
  public ModelAndView waitForApproval(@RequestParam Integer id){
    User user = userService.findUserByUsername(userService.getLoggedInUser());
    logger.info(user.getUsername() + " is running changeStatus(TripDTO tripDTO) method");
    try {
      Trip trip = tripService.getTripById(id);
      trip.setStatus(TripStatus.WAITING_FOR_APPROVAL);
      tripRepository.save(trip);
      logger.info(user.getFirstName() + " " + user.getLastName() + " added the trip with id " + id + " to the waiting for approval list.");
    } catch(Exception e){
      logger.error(e.getMessage());
    }
    ModelAndView model = new ModelAndView("success2");
    return model;
  }
}
