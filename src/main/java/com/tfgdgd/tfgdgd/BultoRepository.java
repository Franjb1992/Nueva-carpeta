/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tfgdgd.tfgdgd;

/**
 *
 * @author Francisco
 */
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;



public interface BultoRepository extends JpaRepository<Bulto, Long> {
    
    List<Bulto> findByDgd(Dgd dgd);

}