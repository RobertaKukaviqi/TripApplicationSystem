package appoverview.demo.service;

import appoverview.demo.model.dto.UserLoginDTO;
import appoverview.demo.model.dto.UserRegistrationDTO;
import appoverview.demo.model.dto.UserResponseDTO;
import appoverview.demo.model.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
  void saveUser(UserRegistrationDTO userRegistrationDTO);
  User validUser (UserLoginDTO loginUser);
  List<UserResponseDTO> getUsers();
  String getLoggedInUser();
  User findUserByUsername(String username);
}
