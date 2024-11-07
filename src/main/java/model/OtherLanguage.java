package model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "other_language")
public class OtherLanguage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int categoryId;

    @ManyToOne
    @JoinColumn(name = "language_id")
    private Language language;

    private String url;

    private String original;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OtherLanguage that = (OtherLanguage) o;
        return id == that.id && Objects.equals(language, that.language) && Objects.equals(url, that.url);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, language, url);
    }

    @Override
    public String toString() {
        return "CanonicalUrl{" +
                "id=" + id +
                ", language=" + language +
                ", url='" + url + '\'' +
                '}';
    }
}
