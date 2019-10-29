package am.nelea.educenter.controller;

import am.nelea.educenter.model.Lesson;
import am.nelea.educenter.model.User;
import am.nelea.educenter.repository.LessonRepoitory;
import am.nelea.educenter.repository.UserRepository;
import am.nelea.educenter.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

@Controller
public class UserController {
    @Value("${upload.path}")
    private String imageUploadPath;
    private List<String> acceptContentType = Arrays.asList("image/jpeg", "image/png");

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private LessonRepoitory lessonRepoitory;

    @RequestMapping(value = "/userLesson")
    public String less(ModelMap map, @AuthenticationPrincipal UserDetails userDetails, @RequestParam("id") int id,
                       @ModelAttribute("add") User user, @RequestParam(name = "message", required = false) String message) {
        if (userDetails != null) {
            User currentUser = ((CurrentUser) userDetails).getUser();
            map.addAttribute("currentUser", currentUser);
        }
        map.addAttribute("message", message != null ? message : "");
        map.addAttribute("oneLesson", lessonRepoitory.findOne(id));
        map.addAttribute("allUsers", userRepository.findAll());
        map.addAttribute("allLessons", lessonRepoitory.findAll());
        return "lessonDetails";
    }

    @RequestMapping(value = "/add")
    public String addLesson( @ModelAttribute("add") User user, @RequestParam(name = "userId") int  userId,@RequestParam(name = "lessonId") int  lessonId) {
        User currentUser = userRepository.findOne(userId);
        Lesson lesson = lessonRepoitory.findOne(lessonId);
        if (currentUser.getLessons().contains(lesson)) {
          String  message = "you already registred on lesson";
            return "redirect:/userLesson?id=" + lesson.getId() + "&message="+message;
        } else {
            currentUser.getLessons().add(lesson);
            userRepository.save(currentUser);
        }
        return "redirect:/userLesson?id="+lessonId;
    }


    @RequestMapping(value = "/userProfile")
    public String profile(@RequestParam("id") int id, ModelMap map) {
        CurrentUser currentUser = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        map.addAttribute("userLess", lessonRepoitory.findOne(userRepository.findOne(id).getId()));
        map.addAttribute("currentUser", userRepository.findOne(currentUser.getId()));
        map.addAttribute("one", userRepository.findOne(id));
        map.addAttribute("all", userRepository.findAll());
        return "studentDetails";
    }
}
