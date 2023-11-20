package com.dojo.fullspring.starter.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.dojo.fullspring.starter.models.LoginUser;
import com.dojo.fullspring.starter.models.User;
import com.dojo.fullspring.starter.service.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;




    
@Controller
public class HomeController {
    
    // Add once service is implemented:
    @Autowired
    private UserService userServ;

   
    
    @GetMapping("/")
    public String home() {
        
        return "redirect:/register";
    }
    
    
    
    @GetMapping("/register")
    public String register(Model model, 
                           HttpSession session) {
        
        if (session.getAttribute("userId")!= null){ // add
            return "redirect:/books";
        }
        
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User()); 
        return "register.jsp";
    }
    
    @GetMapping("/login")
    public String login(Model model, HttpSession session) {
        
        if (session.getAttribute("userId")!= null){  //add
            return "redirect:/books";
        }
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newLogin", new LoginUser());
        return "login.jsp";
    }

    
    @PostMapping("/register_process")
    public String register_process(@Valid @ModelAttribute("newUser") User newUser, 
                           BindingResult result, 
                           Model model, 
                           HttpSession session) {
        
        // TO-DO Later -- call a register method in the service 
        // to do some extra validations and create a new user!

        User registeredUser = userServ.register(newUser, result);  // add
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            return "register.jsp";
        }
        
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.

         session.setAttribute("userId", registeredUser.getId());  // on attribue le userID
    
        return "redirect:/books";
    }


    
    @PostMapping("/login_process")
    public String login_process(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
                        BindingResult result,
                         Model model, 
                         HttpSession session) {
        
        // Add once service is implemented:
         User user = userServ.login(newLogin, result); 
    
        if(result.hasErrors()) {
            return "login.jsp";
        }
    
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId()); // on attribue le userID
    
        return "redirect:/books";
    }



    
    @GetMapping ("/logout")
    public String logout(HttpSession session){
    	session.invalidate(); // supprime ttes ls données de la session
    	return "redirect:/";		
    }
    
}

