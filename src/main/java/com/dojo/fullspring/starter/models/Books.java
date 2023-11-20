package com.dojo.fullspring.starter.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="books")
public class Books {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(min = 4, max = 200)
    private String title;


    @NotNull
    @Size(min = 4, max = 200)
    private String author;
    
    @NotNull( message="Must not be blank." )
    @Size(min = 4, max = 200)
    private String thoughts;



    @Column(updatable=false) // createdAt n sras pas mis à jr, sa valeur restra fixe
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;

    // add part borrower books
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="borrower_id")
    private User borrower;

    
    public Books() {
        
    }
  
     // other getters and setters removed for brevity
    @PrePersist // extrait la date actuelle avant de l'enregistrer dns la database
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate // enregistr chaq fois q l'on fera une mise à jour
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

    
    // getters and setters removed for brevity
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getThoughts() {
        return thoughts;
    }

    public void setThoughts(String thoughts) {
        this.thoughts = thoughts;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    
    
    // add part borrower books
    
    public User getBorrower() {
        return borrower;
    }

    public void setBorrower(User borrower) {
        this.borrower = borrower;
    }
    
    
}
