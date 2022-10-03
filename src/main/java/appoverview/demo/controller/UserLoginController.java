package appoverview.demo.controller;

import appoverview.demo.model.entity.User;
import appoverview.demo.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

//@RequestMapping(value = "/login")
@RestController
public class UserLoginController {
  private static final Logger logger = LogManager.getLogger(UserLoginController.class);
  @Autowired
  UserService userService;

  @GetMapping
  public ModelAndView homePage() {
    User user = userService.findUserByUsername(userService.getLoggedInUser());
    logger.info(user.getFirstName() + " " + user.getLastName() + " has logged in.");
    if(user.getRole().equals("admin")) return new ModelAndView("adminhome");
    else return new ModelAndView("homePage");
  }

//  @RequestMapping(value = { "/login"}, method = RequestMethod.GET)
//  public ModelAndView userLogin (@ModelAttribute("login") UserLoginDTO loginUser,
//                                 @RequestParam(value = "error",required = false) String error,
//                                 @RequestParam(value = "logout",	required = false) String logout) {
//
//    ModelAndView model = new ModelAndView();
//    if (error != null) {
//      model.addObject("error", "Invalid Credentials provided.");
//    }
//
//    if (logout != null) {
//      model.addObject("message", "Logged out from App successfully.");
//    }
//
//    model.setViewName("login");
//
//    ModelAndView adminPage = adminController.adminPage();
//    ModelAndView userPage = userController.userPage();
//
//    User user = userService.validUser(loginUser);
//
//    if (user != null) {
//      if (user.getRole().equals("admin")) {
//        adminPage.addObject("firstname", user.getFirstName());
//        return adminPage;
//      }else {
//        String firstName = user.getFirstName();
//        userPage.addObject("firstname", firstName);
//        return userPage;
//      }
//    }else {
//      model = new ModelAndView ("login");
//      model.addObject("message", "Username ose Password eshte i pasakte!");
//      return model;
//    }
//  }
}