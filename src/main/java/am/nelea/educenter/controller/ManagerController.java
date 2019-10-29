package am.nelea.educenter.controller;

import am.nelea.educenter.mail.EmailServiceImp;
import am.nelea.educenter.model.Lesson;
import am.nelea.educenter.model.User;
import am.nelea.educenter.repository.LessonRepoitory;
import am.nelea.educenter.repository.UserRepository;
import am.nelea.educenter.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
public class ManagerController {
    @Value("${upload.path}")
    private String imageUploadPath;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private LessonRepoitory lessonRepoitory;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private EmailServiceImp emailServiceImp;


    @RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
    public String loginSucces() {

        return "redirect:/";

    }

    @RequestMapping(value = "/lessonView")
    public String viewL(ModelMap map) {
        CurrentUser currentUser = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        map.addAttribute("currentUser", userRepository.findOne(currentUser.getId()));
        map.addAttribute("lessons", lessonRepoitory.findAll());
        return "course-list";

    }

    @RequestMapping(value = "/studentsView")
    public String view(ModelMap map) {
        CurrentUser currentUser = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        map.addAttribute("all",lessonRepoitory.findAll());
        map.addAttribute("currentUser", userRepository.findOne(currentUser.getId()));
        map.addAttribute("users", userRepository.findAll());

        return "students";
    }

    @RequestMapping(value = "/deleteStudent")
    public String deleteStudent(@RequestParam("id") int id) {
        userRepository.delete(id);
        return "redirect:/studentsView";
    }

    @RequestMapping(value = "/deleteLesson")
    public String deleteLesson(@RequestParam("id") int id) {
        lessonRepoitory.delete(id);
        return "redirect:/lessonView";
    }

    @RequestMapping(value = "/changeLesson")
    public String changeLesson(@ModelAttribute("change") Lesson lesson) {
        lessonRepoitory.save(lesson);
        return "redirect:/lessonView";
    }

    @RequestMapping(value = "/lessonParam", method = RequestMethod.GET)
    public String change(ModelMap map, @ModelAttribute("change") Lesson lesson,
                         @RequestParam("id") int id) {
        map.addAttribute("one", lessonRepoitory.findOne(id));

        return "lesChange";

    }

    @RequestMapping(value = "/changeStudent")
    public String changeStudent(@ModelAttribute("change") User user,@RequestParam(value = "image") MultipartFile multipartFile) throws IOException {
        User one = userRepository.findOne(user.getId());
        one.setName(user.getName());
        one.setSurname(user.getSurname());
        one.setEmail(user.getEmail());
        if (multipartFile.isEmpty()) {
            one.setPicUrl(one.getPicUrl());
        }else {
            String picName = System.currentTimeMillis() + "" + multipartFile.getOriginalFilename();
            File f = new File(imageUploadPath + picName);
            multipartFile.transferTo(f);
            one.setPicUrl(picName);
        }
        userRepository.save(one);
        return "redirect:/studentsView";
    }

    @RequestMapping(value = "/studentParam", method = RequestMethod.GET)
    public String changeS(ModelMap map, @ModelAttribute("changeStudent") User user,
                          @RequestParam("id") int id) {
        map.addAttribute("one", userRepository.findOne(id));
        return "studentChange";
    }


}
