package appoverview.demo.repository;

import appoverview.demo.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User, Integer> {
  @Query(nativeQuery=true, value = "SELECT * FROM user u WHERE u.username = :username AND u.password = :password")
  User findUser(@Param("username") String userName, @Param("password") String password);

  @Query(nativeQuery=true, value = "SELECT * FROM user u WHERE u.username = :username")
  User findUserByUsername(@Param("username") String userName);
}
