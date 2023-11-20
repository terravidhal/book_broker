package com.dojo.fullspring.starter.service;


import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.dojo.fullspring.starter.models.LoginUser;
import com.dojo.fullspring.starter.models.User;
import com.dojo.fullspring.starter.repositories.UserRepository;



@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;
    
	 public User findUserByEmail(String email) {
	     Optional<User> result = userRepo.findByEmail(email);
	     if(result.isPresent()) {
	         return result.get();
	     } 
	    return null;
	 }

	 public User findUserById(long id) {
	     Optional<User> result = userRepo.findById(id);
	     if(result.isPresent()) {
	         return result.get();
	     }
	     return null;
	 }
     
    
	 
    public User register(User newUser, BindingResult result) {
        
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
        
		// Reject if email is taken (present in database)
    	if (potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "Email already exists");
    	}
    	
		// Reject if password doesn't match confirmation
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    	    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	
		//Check Pattern username
    	String toCheckPattern = newUser.getUserName();
    	if (!toCheckPattern.matches("[a-zA-Z]+")) {
    		 result.rejectValue("userName", "Matches", "Must contain letters only");
		}
    	
		// Return null if result has errors
    	if (result.hasErrors()) {
    		return null;
    	}
    	
		// Hash and set password, save user to database
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);

		//save user to database
        userRepo.save(newUser);

		//return new user
        return newUser;
    
    }



    public User login(LoginUser newLogin, BindingResult result) {
    	
    	
		// Find user in the DB by email
        // Reject if NOT present
    	Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
    	if (!potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "Unknown email");
    		return null;
    	}
    	
		// User exists, retrieve user from DB
    	User user = potentialUser.get();

		// Reject if BCrypt password match fails
    	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	
		// Return null if result has errors
    	if (result.hasErrors()) {
    		return null;
    	}

		// Otherwise, return the user object
		return user;
		
    }
}