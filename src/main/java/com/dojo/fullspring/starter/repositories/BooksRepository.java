package com.dojo.fullspring.starter.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.dojo.fullspring.starter.models.Books;



@Repository
public interface BooksRepository extends CrudRepository<Books, Long> { 
	
         List<Books> findAll();
}

