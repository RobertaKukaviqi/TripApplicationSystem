package appoverview.demo.service.impl;

import appoverview.demo.model.dto.UserLoginDTO;
import appoverview.demo.model.dto.UserRegistrationDTO;
import appoverview.demo.model.dto.UserResponseDTO;
import appoverview.demo.model.entity.User;
import appoverview.demo.repository.UserRepository;
import appoverview.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {
  @Autowired
  UserRepository userRepository;

  @Override
  public void saveUser(UserRegistrationDTO userRegistrationDTO) {
    userRepository.save(userRegistrationDTO.convertDTOtoUser(userRegistrationDTO));
  }

  @Override
  public User validUser (UserLoginDTO loginUser) {
    return userRepository.findUser(loginUser.getUsername(), loginUser.getPassword());
  }

  @Override
  public List<UserResponseDTO> getUsers() {
    UserResponseDTO userDtoResponse = new UserResponseDTO();
    return userRepository.findAll()
        .stream()
        .map(user -> userDtoResponse.convertUserToDTO(user))
        .collect(Collectors.toList());
  }

  @Override
  public String getLoggedInUser() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (!(authentication instanceof AnonymousAuthenticationToken)) {
      String currentUserName = authentication.getName();
      return authentication.getName();
    }
    return "";
  }

  @Override
  public User findUserByUsername(String username) {
    return userRepository.findUserByUsername(username);
  }
}
