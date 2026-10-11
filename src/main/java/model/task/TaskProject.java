package model.task;

import javax.persistence.*;
import java.util.Objects;

/**
 * Серия (сквозной проект) задач для одного курса: тексты для хаба и бейджей.
 * Задачи серии — task.project_code = code на страницах этого курса.
 * Схема: audits/tasks-migration/02-task-project.sql.
 */
@Entity
@Table(name = "task_project",
        uniqueConstraints = @UniqueConstraint(name = "uk_task_project_code_course", columnNames = {"code", "course"}))
public class TaskProject {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "code", length = 40, nullable = false)
    private String code;

    @Column(name = "course", length = 64, nullable = false)
    private String course;

    @Column(name = "name", length = 100, nullable = false)
    private String name;

    @Column(name = "title", nullable = false)
    private String title;

    @Lob
    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Column(name = "note")
    private String note;

    @Column(name = "featured", nullable = false)
    private boolean featured;

    @Column(name = "order_id", nullable = false)
    private int orderId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public boolean isFeatured() {
        return featured;
    }

    public void setFeatured(boolean featured) {
        this.featured = featured;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TaskProject that = (TaskProject) o;
        return id != null && Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
