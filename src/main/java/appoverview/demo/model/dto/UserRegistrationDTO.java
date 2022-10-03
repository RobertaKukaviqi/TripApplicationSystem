package appoverview.demo.model.dto;

import appoverview.demo.model.entity.User;

import javax.validation.constraints.NotEmpty;

public class UserRegistrationDTO {
  @NotEmpty
  private Integer id;

  @NotEmpty
  private String username;

  @NotEmpty
  private String password;

  @NotEmpty
  private String role;

  @NotEmpty
  private String firstName;

  @NotEmpty
  private String lastName;

  @NotEmpty
  private String confirmPassword;

  @NotEmpty
  private Boolean enabled;

  public Boolean getEnabled() {
    return enabled;
  }

  public void setEnabled(Boolean enabled) {
    this.enabled = enabled;
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

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getRole() {
    return role;
  }

  public void setRole(String role) {
    this.role = role;
  }

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

  public String getConfirmPassword() {
    return confirmPassword;
  }

  public void setConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
  }

  public User convertDTOtoUser(UserRegistrationDTO userDTO){
    User user = new User();
    user.setId(userDTO.getId());
    user.setFirstName(userDTO.getFirstName());
    user.setLastName(userDTO.getLastName());
    user.setRole(userDTO.getRole());
    user.setUsername(userDTO.getUsername());
    user.setPassword(userDTO.getPassword());
    user.setConfirmPassword(userDTO.getConfirmPassword());
    user.setEnabled(userDTO.getEnabled());
    return user;
  }
}
