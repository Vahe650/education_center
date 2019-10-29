package am.nelea.educenter.controller;

import am.nelea.educenter.mail.EmailServiceImp;
import am.nelea.educenter.model.Lesson;
import am.nelea.educenter.model.User;
import am.nelea.educenter.model.UserType;
import am.nelea.educenter.repository.LessonRepoitory;
import am.nelea.educenter.repository.UserRepository;
import am.nelea.educenter.security.CurrentUser;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

@Controller


public class AdminController {
    @Autowired
    private EmailServiceImp emailServiceImp;
    @Value("${upload.path}")
    private String imageUploadPath;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private LessonRepoitory lessonRepoitory;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/loginPage")
    public String logIn() {
        return "login";
    }
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String addBrand(ModelMap map) {
        CurrentUser currentUser = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        map.addAttribute("currentUser", userRepository.findOne(currentUser.getId()));
        map.addAttribute("user", new User());
        return "register";
    }

    @RequestMapping(value = "/userRegister", method = RequestMethod.POST)
    public String addBrand(@ModelAttribute(name = "user") User user, @RequestParam(value = "image") MultipartFile file) throws IOException {
        File dir = new File(imageUploadPath);
        if (!dir.exists()) {
            dir.mkdir();
        }
        String picName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        File picture = new File(imageUploadPath + picName);
        file.transferTo(picture);
        user.setPicUrl(picName);
        String pass = user.getPassword();
        user.setPassword(passwordEncoder.encode(pass));
        user.setToken(UUID.randomUUID().toString());
        String url = String.format("http://localhost:8080/verify?token=%s&email=%s", user.getToken(), user.getEmail());
        String text = String.format("hello %s you are registred,%s -this is your password,click on this link for visiting your profile %s", user.getName(), pass, url);
        user.setType(UserType.USER);
        userRepository.save(user);
//        emailServiceImp.sendSimpleMessage(user.getEmail(), "welcome!!!", text);
        return "redirect:/studentsView";
    }

    @RequestMapping(value = "/lesson", method = RequestMethod.GET)
    public String less(ModelMap map) {
        map.addAttribute("lesson", new Lesson());
        return "knowledgebase";
    }

    @RequestMapping(value = "/addLesson", method = RequestMethod.POST)
    public String addLesson(@ModelAttribute(name = "lesson") Lesson lesson) {
        lessonRepoitory.save(lesson);
        return "redirect:/lessonView";
    }

    @RequestMapping(value = "/student/image", method = RequestMethod.GET)
    public void getImageAsByteArray(HttpServletResponse response, @RequestParam("fileName") String fileName) throws IOException {
        InputStream in = new FileInputStream(imageUploadPath + fileName);
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String adminPage(ModelMap map, @AuthenticationPrincipal UserDetails userDetails) {
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("lessons", lessonRepoitory.findAll());
        if (userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            map.addAttribute("currentUser", user);
            return "indax";
        }
        return "indax";

    }

    @RequestMapping(value = "/verify", method = RequestMethod.GET)
    public String verify(@RequestParam("token") String token, @RequestParam("email") String email) {
        User one = userRepository.findOneByEmail(email);
        if (one != null) {
            if (one.getToken() != null && one.getToken().equals(token)) {
                one.setToken("");
                one.setVerify(true);
                userRepository.save(one);
            }
        }
        return "redirect:/";

    }
    @RequestMapping(value = "/searchResult")
    public String search(@RequestParam(value = "search",required = false)String search,@RequestParam(value = "lessonSearch",required = false)String lessonSearch,ModelMap map, @AuthenticationPrincipal UserDetails userDetails) {
        List<Lesson> lessonByTitleLike = lessonRepoitory.findLessonByTitleLike(lessonSearch);
        if (lessonByTitleLike.isEmpty()&&lessonSearch!=null){
            map.addAttribute("message","lesson with '"+lessonSearch+"' name dosent exist");
        }
        map.addAttribute("lessonSearch",lessonByTitleLike);
        List<User> usersByTitleLike = userRepository.findUsersByTitleLike(search);
        if (usersByTitleLike.isEmpty()&&search!=null){
            map.addAttribute("message","user with '"+search+"' name dosent exist");
        }
        map.addAttribute("search", usersByTitleLike);
        map.addAttribute("users", userRepository.findAll());
        if (userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            map.addAttribute("currentUser", user);
            return "result";
        }
        return "result";


    }

}
