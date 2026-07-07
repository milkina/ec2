package model;

import model.person.Person;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "learned_categories",
        uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "category_id"}))
public class LearnedCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private Person user;

    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    private Category category;

    @Column(name = "learned_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date learnedDate;

    public LearnedCategory() {
    }

    public LearnedCategory(Person user, Category category) {
        this.user = user;
        this.category = category;
        this.learnedDate = new Date();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Person getUser() {
        return user;
    }

    public void setUser(Person user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Date getLearnedDate() {
        return learnedDate;
    }

    public void setLearnedDate(Date learnedDate) {
        this.learnedDate = learnedDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LearnedCategory that = (LearnedCategory) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
