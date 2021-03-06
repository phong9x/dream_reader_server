/*
 * Created on 3 thg 10 2017 ( Time 15:15:16 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
// This Bean has a basic Primary Key (not composite) 

package org.dream_reader.bean.jpa;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import java.io.Serializable;
import com.fasterxml.jackson.annotation.JsonIgnore;

//import javax.validation.constraints.* ;
//import org.hibernate.validator.constraints.* ;

import java.util.Date;

import javax.persistence.*;

/**
 * Persistent class for entity stored in table "payment_history"
 *
 * @author Telosys Tools Generator
 *
 */

@Entity
@Table(name="payment_history")
// Define named queries here
@NamedQueries ( {
  @NamedQuery ( name="PaymentHistoryEntity.countAll", query="SELECT COUNT(x) FROM PaymentHistoryEntity x" )
} )
@DynamicInsert
@DynamicUpdate
public class PaymentHistoryEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    //----------------------------------------------------------------------
    // ENTITY PRIMARY KEY ( BASED ON A SINGLE FIELD )
    //----------------------------------------------------------------------
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id", nullable=false)
    private Integer    id           ;


    //----------------------------------------------------------------------
    // ENTITY DATA FIELDS 
    //----------------------------------------------------------------------    
    @Column(name="user_id", nullable=false)
    private Integer    userId       ;

    @Column(name="money")
    private Integer    money        ;

    @Column(name="point")
    private Integer    point        ;

    @Column(name="status", nullable=false)
    private Short      status       ;

    @Column(name="payment_method", length=50)
    private String     paymentMethod ;

    @Column(name="tid", length=500)
    private String     tid          ;

    @Column(name="reason", length=50)
    private String     reason       ;

    @Column(name="account_info")
    private String     accountInfo  ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="create_date", nullable=false)
    private Date       createDate   ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="update_date")
    private Date       updateDate   ;



    //----------------------------------------------------------------------
    // ENTITY LINKS ( RELATIONSHIP )
    //----------------------------------------------------------------------
    //----------------------------------------------------------------------
    // CONSTRUCTOR(S)
    //----------------------------------------------------------------------
    public PaymentHistoryEntity() {
		super();
    }
    
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
    //--- DATABASE MAPPING : user_id ( INT ) 
    public void setUserId( Integer userId ) {
        this.userId = userId;
    }
    public Integer getUserId() {
        return this.userId;
    }

    //--- DATABASE MAPPING : money ( INT ) 
    public void setMoney( Integer money ) {
        this.money = money;
    }
    public Integer getMoney() {
        return this.money;
    }

    //--- DATABASE MAPPING : point ( INT ) 
    public void setPoint( Integer point ) {
        this.point = point;
    }
    public Integer getPoint() {
        return this.point;
    }

    //--- DATABASE MAPPING : status ( SMALLINT ) 
    public void setStatus( Short status ) {
        this.status = status;
    }
    public Short getStatus() {
        return this.status;
    }

    //--- DATABASE MAPPING : payment_method ( VARCHAR ) 
    public void setPaymentMethod( String paymentMethod ) {
        this.paymentMethod = paymentMethod;
    }
    public String getPaymentMethod() {
        return this.paymentMethod;
    }

    //--- DATABASE MAPPING : tid ( VARCHAR ) 
    public void setTid( String tid ) {
        this.tid = tid;
    }
    public String getTid() {
        return this.tid;
    }

    //--- DATABASE MAPPING : reason ( VARCHAR ) 
    public void setReason( String reason ) {
        this.reason = reason;
    }
    public String getReason() {
        return this.reason;
    }

    //--- DATABASE MAPPING : account_info ( TEXT ) 
    public void setAccountInfo( String accountInfo ) {
        this.accountInfo = accountInfo;
    }
    public String getAccountInfo() {
        return this.accountInfo;
    }

    //--- DATABASE MAPPING : create_date ( DATETIME ) 
    public void setCreateDate( Date createDate ) {
        this.createDate = createDate;
    }
    public Date getCreateDate() {
        return this.createDate;
    }

    //--- DATABASE MAPPING : update_date ( DATETIME ) 
    public void setUpdateDate( Date updateDate ) {
        this.updateDate = updateDate;
    }
    public Date getUpdateDate() {
        return this.updateDate;
    }


    //----------------------------------------------------------------------
    // GETTERS & SETTERS FOR LINKS
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // toString METHOD
    //----------------------------------------------------------------------
    public String toString() { 
        StringBuffer sb = new StringBuffer(); 
        sb.append("["); 
        sb.append(id);
        sb.append("]:"); 
        sb.append(userId);
        sb.append("|");
        sb.append(money);
        sb.append("|");
        sb.append(point);
        sb.append("|");
        sb.append(status);
        sb.append("|");
        sb.append(paymentMethod);
        sb.append("|");
        sb.append(tid);
        sb.append("|");
        sb.append(reason);
        // attribute 'accountInfo' not usable (type = String Long Text)
        sb.append("|");
        sb.append(createDate);
        sb.append("|");
        sb.append(updateDate);
        return sb.toString(); 
    } 

}
