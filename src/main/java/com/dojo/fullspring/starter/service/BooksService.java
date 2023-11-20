package com.dojo.fullspring.starter.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.dojo.fullspring.starter.models.Books;
import com.dojo.fullspring.starter.repositories.BooksRepository;



@Service
public class BooksService {
     // adding the Book repository as a dependency
     private final BooksRepository bookRepository;
    
     public BooksService(BooksRepository bookRepository) {
         this.bookRepository = bookRepository;
     }

     
     // returns all the books
     public List<Books> allBooks() {
         return bookRepository.findAll();
     }

     // return specific Book
     public Books findBook(Long id) {
        
         Optional<Books> optionalBook = bookRepository.findById(id);
         if(optionalBook.isPresent()) {
             return optionalBook.get();
         } else {
             return null;
         }
     }
     

     // creates a Book (one to many for session)
     public Books createBook(Books b) {
         return bookRepository.save(b);
     }

     // update (one to many for session)
	public Books updateBook(Books b) {
		return bookRepository.save(b);
	}
	//delete
	public void deleteBook(Long id) {
		Optional<Books> optionalBook = bookRepository.findById(id);
		if(optionalBook.isPresent()) {
			bookRepository.deleteById(id);
		}
	}
}

