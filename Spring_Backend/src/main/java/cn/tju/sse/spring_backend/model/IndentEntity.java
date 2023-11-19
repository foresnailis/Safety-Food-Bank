package cn.tju.sse.spring_backend.model;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Objects;

@Entity
@Table(name = "INDENT", schema = "food_bank", catalog = "")
public class IndentEntity {
      
    @Id
    @Column(name = "IND_ID")
    private int indId;
    @Basic
    @Column(name = "IND_QUANTITY")
    private Integer indQuantity;
    @Basic
    @Column(name = "IND_CREATIONTIME")
    private Date indCreationtime;
    @Basic
    @Column(name = "IND_VERIFICATIONCODE")
    private String indVerificationcode;
    @Basic
    @Column(name = "IND_NOTES")
    private String indNotes;
    @Basic
    @Column(name = "IND_STATE")
    private Integer indState;
    @Basic
    @Column(name = "CUS_ID")
    private Integer cusId;
    @Basic
    @Column(name = "COM_ID")
    private Integer comId;
    @Basic
    @Column(name = "IND_RTIME")
    private Date indRtime;
    @Basic
    @Column(name = "IND_RNOTES")
    private String indRnotes;
    @Basic
    @Column(name = "IND_MONEY")
    private BigDecimal indMoney;
    @Basic
    @Column(name = "IND_RMONEY")
    private BigDecimal indRmoney;
    @Basic
    @Column(name = "IND_RATING")
    private BigDecimal indRating;

    public int getIndId() {
        return indId;
    }

    public void setIndId(int indId) {
        this.indId = indId;
    }

    public Integer getIndQuantity() {
        return indQuantity;
    }

    public void setIndQuantity(Integer indQuantity) {
        this.indQuantity = indQuantity;
    }

    public Date getIndCreationtime() {
        return indCreationtime;
    }

    public void setIndCreationtime(Date indCreationtime) {
        this.indCreationtime = indCreationtime;
    }

    public String getIndVerificationcode() {
        return indVerificationcode;
    }

    public void setIndVerificationcode(String indVerificationcode) {
        this.indVerificationcode = indVerificationcode;
    }

    public String getIndNotes() {
        return indNotes;
    }

    public void setIndNotes(String indNotes) {
        this.indNotes = indNotes;
    }

    public Integer getIndState() {
        return indState;
    }

    public void setIndState(Integer indState) {
        this.indState = indState;
    }

    public Integer getCusId() {
        return cusId;
    }

    public void setCusId(Integer cusId) {
        this.cusId = cusId;
    }

    public Integer getComId() {
        return comId;
    }

    public void setComId(Integer comId) {
        this.comId = comId;
    }

    public Date getIndRtime() {
        return indRtime;
    }

    public void setIndRtime(Date indRtime) {
        this.indRtime = indRtime;
    }

    public String getIndRnotes() {
        return indRnotes;
    }

    public void setIndRnotes(String indRnotes) {
        this.indRnotes = indRnotes;
    }

    public BigDecimal getIndMoney() {
        return indMoney;
    }

    public void setIndMoney(BigDecimal indMoney) {
        this.indMoney = indMoney;
    }

    public BigDecimal getIndRmoney() {
        return indRmoney;
    }

    public void setIndRmoney(BigDecimal indRmoney) {
        this.indRmoney = indRmoney;
    }

    public BigDecimal getIndRating() {
        return indRating;
    }

    public void setIndRating(BigDecimal indRating) {
        this.indRating = indRating;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        IndentEntity that = (IndentEntity) o;
        return indId == that.indId && Objects.equals(indQuantity, that.indQuantity) && Objects.equals(indCreationtime, that.indCreationtime) && Objects.equals(indVerificationcode, that.indVerificationcode) && Objects.equals(indNotes, that.indNotes) && Objects.equals(indState, that.indState) && Objects.equals(cusId, that.cusId) && Objects.equals(comId, that.comId) && Objects.equals(indRtime, that.indRtime) && Objects.equals(indRnotes, that.indRnotes) && Objects.equals(indMoney, that.indMoney) && Objects.equals(indRmoney, that.indRmoney) && Objects.equals(indRating, that.indRating);
    }

    @Override
    public int hashCode() {
        return Objects.hash(indId, indQuantity, indCreationtime, indVerificationcode, indNotes, indState, cusId, comId, indRtime, indRnotes, indMoney, indRmoney, indRating);
    }
}
