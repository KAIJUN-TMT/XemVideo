package com.j4.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
@NamedQueries({
	@NamedQuery(name = "User.findAll", query = "select u from User u order by u.id desc"),
	@NamedQuery(name = "User.findByEmail", query = "select u from User u where u.email = :email")
})

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    
    @Column(unique = true)
    String email;
    
    String password;
    
    @Column(name = "fullname")
    String fullName;
    
    Boolean admin;  
    
  
    @Column(name = "status")
    private boolean status; 
    @OneToMany(mappedBy = "user")
    List<Like> likes;
    
    @OneToMany(mappedBy = "user")
    List<Share> shares;
}
