package am.nelea.educenter.repository;


import am.nelea.educenter.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {

    User findOneByEmail(String email);
    @Query("SELECT u FROM User  u WHERE LOWER(u.name) LIKE LOWER(CONCAT('%', :searchUser, '%')) OR LOWER(u.surname) " +
            "LIKE LOWER(CONCAT('%', :searchUser, '%')) ORDER BY u.email ASC\n" + "  ")
    List<User> findUsersByTitleLike(@Param("searchUser") String find);


}
