package model.task;

import model.Category;

import javax.persistence.*;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Set;

/**
 * Практическая задача — одна строка таблицы task (схема: audits/tasks-migration/01-create-task-tables.sql).
 * Имена FK, ключей и индексов совпадают с SQL, чтобы hbm2ddl=update не создавал дубликаты.
 *
 * Экземпляры из кэша (TASKS_BY_PAGE / TASKS_BY_LESSON) отсоединены от сессии:
 * pageCategory и lessons там не инициализированы — используйте getPageCategoryId() и getLessonIds().
 */
@Entity
@Table(name = "task",
        uniqueConstraints = @UniqueConstraint(name = "uk_task_page_slug", columnNames = {"page_category_id", "slug"}),
        indexes = {
                @Index(name = "idx_task_uid", columnList = "uid"),
                @Index(name = "idx_task_project", columnList = "project_code, project_part")
        })
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "page_category_id", nullable = false, foreignKey = @ForeignKey(name = "fk_task_page"))
    private Category pageCategory;

    @Column(name = "page_category_id", insertable = false, updatable = false)
    private Integer pageCategoryId;

    @Column(name = "uid", length = 80, nullable = false)
    private String uid;

    @Column(name = "slug", length = 100, nullable = false)
    private String slug;

    @Column(name = "title", nullable = false)
    private String title;

    @Lob
    @Column(name = "body_html", columnDefinition = "mediumtext", nullable = false)
    private String bodyHtml;

    @Column(name = "hint_title", length = 100)
    private String hintTitle;

    @Lob
    @Column(name = "hint_html", columnDefinition = "text")
    private String hintHtml;

    @Column(name = "solution_url", length = 500)
    private String solutionUrl;

    @Column(name = "video_url", length = 500)
    private String videoUrl;

    @Enumerated(EnumType.STRING)
    @Column(name = "difficulty", length = 16, nullable = false)
    private TaskDifficulty difficulty = TaskDifficulty.BEGINNER;

    @Column(name = "estimated_minutes")
    private Integer estimatedMinutes;

    @Column(name = "project_code", length = 40)
    private String projectCode;

    @Column(name = "project_part")
    private Integer projectPart;

    @Column(name = "order_id", nullable = false)
    private int orderId;

    @Column(name = "hidden", nullable = false)
    private boolean hidden = false;

    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    @Column(name = "modified_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date modifiedDate;

    /** Уроки, которые закрепляет задача (task_lesson). */
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "task_lesson",
            joinColumns = @JoinColumn(name = "task_id", foreignKey = @ForeignKey(name = "fk_tl_task")),
            inverseJoinColumns = @JoinColumn(name = "category_id", foreignKey = @ForeignKey(name = "fk_tl_cat")))
    private Set<Category> lessons;

    /** id уроков из task_lesson; заполняется при загрузке кэша, в БД не хранится. */
    @Transient
    private List<Integer> lessonIds = Collections.emptyList();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Category getPageCategory() {
        return pageCategory;
    }

    public void setPageCategory(Category pageCategory) {
        this.pageCategory = pageCategory;
    }

    public Integer getPageCategoryId() {
        return pageCategoryId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBodyHtml() {
        return bodyHtml;
    }

    public void setBodyHtml(String bodyHtml) {
        this.bodyHtml = bodyHtml;
    }

    public String getHintTitle() {
        return hintTitle;
    }

    public void setHintTitle(String hintTitle) {
        this.hintTitle = hintTitle;
    }

    public String getHintHtml() {
        return hintHtml;
    }

    public void setHintHtml(String hintHtml) {
        this.hintHtml = hintHtml;
    }

    public String getSolutionUrl() {
        return solutionUrl;
    }

    public void setSolutionUrl(String solutionUrl) {
        this.solutionUrl = solutionUrl;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public TaskDifficulty getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(TaskDifficulty difficulty) {
        this.difficulty = difficulty;
    }

    public Integer getEstimatedMinutes() {
        return estimatedMinutes;
    }

    public void setEstimatedMinutes(Integer estimatedMinutes) {
        this.estimatedMinutes = estimatedMinutes;
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    public Integer getProjectPart() {
        return projectPart;
    }

    public void setProjectPart(Integer projectPart) {
        this.projectPart = projectPart;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public boolean isHidden() {
        return hidden;
    }

    public void setHidden(boolean hidden) {
        this.hidden = hidden;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Date modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public Set<Category> getLessons() {
        return lessons;
    }

    public void setLessons(Set<Category> lessons) {
        this.lessons = lessons;
    }

    public List<Integer> getLessonIds() {
        return lessonIds;
    }

    public void setLessonIds(List<Integer> lessonIds) {
        this.lessonIds = lessonIds;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Task task = (Task) o;
        return id != null && Objects.equals(id, task.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", pageCategoryId=" + pageCategoryId +
                ", slug='" + slug + '\'' +
                ", difficulty=" + difficulty +
                '}';
    }
}
