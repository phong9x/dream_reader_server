/*
 * Created on 29 thg 9 2017 ( Time 12:01:28 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package org.dream_reader.bean;

import java.io.Serializable;

import javax.validation.constraints.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
@DynamicInsert
@DynamicUpdate
public class Category implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    

    private Integer parentId;

    @NotNull
    @Size( min = 1, max = 128 )
    private String categoryName;



    //----------------------------------------------------------------------
    // GETTER & SETTER FOR THE KEY FIELD
    //----------------------------------------------------------------------
    public void setId( Integer id ) {
        this.id = id ;
    }

    public Integer getId() {
        return this.id;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR FIELDS
    //----------------------------------------------------------------------
    public void setParentId( Integer parentId ) {
        this.parentId = parentId;
    }
    public Integer getParentId() {
        return this.parentId;
    }

    public void setCategoryName( String categoryName ) {
        this.categoryName = categoryName;
    }
    public String getCategoryName() {
        return this.categoryName;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(parentId);
        sb.append("|");
        sb.append(categoryName);
        return sb.toString(); 
    } 


}
