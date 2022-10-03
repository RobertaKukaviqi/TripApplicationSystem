package appoverview.demo.model.dto;

import appoverview.demo.model.entity.User;

public class UserResponseDTO {
  private Integer id;
  private String username;
  private String firstName;
  private String lastName;

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public UserResponseDTO convertUserToDTO(User user){
    UserResponseDTO userResponseDTO = new UserResponseDTO();
    userResponseDTO.setId(user.getId());
    userResponseDTO.setUsername(user.getUsername());
    userResponseDTO.setFirstName(user.getFirstName());
    userResponseDTO.setLastName(user.getLastName());
    return userResponseDTO;
  }
}
