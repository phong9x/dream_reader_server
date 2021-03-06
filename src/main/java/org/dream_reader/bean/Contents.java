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
public class Contents implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @NotNull
    private Integer id;

    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @NotNull
    private Integer categoryId;

    @NotNull
    @Size( min = 1, max = 512 )
    private String title;

    @NotNull
    @Size( min = 1, max = 65535 )
    private String body;



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
    public void setCategoryId( Integer categoryId ) {
        this.categoryId = categoryId;
    }
    public Integer getCategoryId() {
        return this.categoryId;
    }

    public void setTitle( String title ) {
        this.title = title;
    }
    public String getTitle() {
        return this.title;
    }

    public void setBody( String body ) {
        this.body = body;
    }
    public String getBody() {
        return this.body;
    }


    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
 
        public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append(id);
        sb.append("|");
        sb.append(categoryId);
        sb.append("|");
        sb.append(title);
        // attribute 'body' not usable (type = String Long Text)
        return sb.toString(); 
    } 


}
