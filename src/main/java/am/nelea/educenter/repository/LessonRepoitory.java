package am.nelea.educenter.repository;

import am.nelea.educenter.model.Lesson;
import am.nelea.educenter.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface LessonRepoitory extends JpaRepository<Lesson,Integer>{
    List<Lesson> findByUsers(User user);
    @Query("SELECT u FROM Lesson  u WHERE LOWER(u.name) LIKE LOWER(CONCAT('%', :searchUser, '%')) OR LOWER(u.lecturer) " +
            "LIKE LOWER(CONCAT('%', :searchUser, '%')) ORDER BY u.name ASC\n" + "  ")
    List<Lesson> findLessonByTitleLike(@Param("searchUser") String find);
}
