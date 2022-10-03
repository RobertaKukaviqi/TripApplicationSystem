package appoverview.demo.controller;

import appoverview.demo.model.dto.UserRegistrationDTO;
import appoverview.demo.model.entity.User;
import appoverview.demo.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping( value = "/registration")
public class UserRegistrationController {
  private static final Logger logger = LogManager.getLogger(UserRegistrationController.class);
  @Autowired
  UserService userService;

//  @GetMapping("")
//  public List<UserResponseDTO> getUsers(){
//    return userService.getUsers();
//  }

  @ModelAttribute("user")
  public UserRegistrationDTO userRegistrationDto() {
    return new UserRegistrationDTO();
  }

  @GetMapping("")
  public ModelAndView showRegisterPage(){
    return new ModelAndView("register");
  }


  @PostMapping("")
  public ModelAndView saveUser(@RequestBody UserRegistrationDTO user) {
    User loggedInUser = userService.findUserByUsername(userService.getLoggedInUser());
    try {
      userService.saveUser(user);
      logger.info(loggedInUser.getFirstName() + " " + loggedInUser.getLastName() + " has registered the user " + user.getFirstName() + " " + user.getLastName());
    } catch (Exception ex){
      logger.error(ex.getMessage());
    }
    return new ModelAndView("success");
  }
}
