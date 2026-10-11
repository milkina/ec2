package spring.services.task;

import model.Category;
import model.task.Task;
import model.task.TaskProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.repositories.CategoryRepository;
import spring.repositories.TaskProjectRepository;
import spring.repositories.TaskRepository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private TaskProjectRepository taskProjectRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Task> getVisibleTasks() {
        List<Task> tasks = taskRepository.findAllVisible();

        Map<Integer, List<Integer>> lessonIdsByTask = new HashMap<>();
        for (Object[] link : taskRepository.findVisibleLessonLinks()) {
            lessonIdsByTask.computeIfAbsent((Integer) link[0], k -> new ArrayList<>()).add((Integer) link[1]);
        }
        for (Task task : tasks) {
            List<Integer> lessonIds = lessonIdsByTask.get(task.getId());
            task.setLessonIds(lessonIds == null ? Collections.emptyList() : Collections.unmodifiableList(lessonIds));
        }
        return tasks;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Task> getTasksOfPage(int pageCategoryId) {
        return taskRepository.findByPage(pageCategoryId);
    }

    @Override
    @Transactional(readOnly = true)
    public Task getTask(int taskId) {
        return taskRepository.findOne(taskId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Integer> getLessonIds(int taskId) {
        return taskRepository.findLessonIds(taskId);
    }

    @Override
    @Transactional(readOnly = true)
    public Map<Integer, Long> countTasksByPage() {
        Map<Integer, Long> counts = new HashMap<>();
        for (Object[] row : taskRepository.countByPage()) {
            counts.put((Integer) row[0], (Long) row[1]);
        }
        return counts;
    }

    @Override
    @Transactional(readOnly = true)
    public boolean isSlugTaken(int pageCategoryId, String slug, Integer exceptTaskId) {
        for (Task task : taskRepository.findByPageAndSlug(pageCategoryId, slug)) {
            if (!task.getId().equals(exceptTaskId)) {
                return true;
            }
        }
        return false;
    }

    @Override
    @Transactional
    public Task save(Task data, int pageCategoryId, List<Integer> lessonIds) {
        Task task = data.getId() == null ? new Task() : taskRepository.findOne(data.getId());
        if (task == null) {
            throw new IllegalArgumentException("Task " + data.getId() + " not found");
        }
        Category page = categoryRepository.findOne(pageCategoryId);
        if (page == null) {
            throw new IllegalArgumentException("Category " + pageCategoryId + " not found");
        }
        task.setPageCategory(page);
        task.setUid(data.getUid());
        task.setSlug(data.getSlug());
        task.setTitle(data.getTitle());
        task.setBodyHtml(data.getBodyHtml());
        task.setHintTitle(data.getHintTitle());
        task.setHintHtml(data.getHintHtml());
        task.setSolutionUrl(data.getSolutionUrl());
        task.setVideoUrl(data.getVideoUrl());
        task.setDifficulty(data.getDifficulty());
        task.setEstimatedMinutes(data.getEstimatedMinutes());
        task.setProjectCode(data.getProjectCode());
        task.setProjectPart(data.getProjectPart());
        task.setOrderId(data.getOrderId());
        task.setHidden(data.isHidden());

        Set<Category> lessons = new HashSet<>();
        for (Integer lessonId : lessonIds) {
            Category lesson = categoryRepository.findOne(lessonId);
            if (lesson != null) {
                lessons.add(lesson);
            }
        }
        task.setLessons(lessons);

        Date now = new Date();
        if (task.getCreatedDate() == null) {
            task.setCreatedDate(now);
        }
        task.setModifiedDate(now);
        return taskRepository.save(task);
    }

    @Override
    @Transactional
    public void delete(int taskId) {
        taskRepository.delete(taskId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<TaskProject> getProjects() {
        return taskProjectRepository.findAllOrdered();
    }

    @Override
    @Transactional(readOnly = true)
    public TaskProject getProject(int projectId) {
        return taskProjectRepository.findOne(projectId);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean isProjectCodeTaken(String code, String course, Integer exceptProjectId) {
        for (TaskProject project : taskProjectRepository.findByCodeAndCourse(code, course)) {
            if (!project.getId().equals(exceptProjectId)) {
                return true;
            }
        }
        return false;
    }

    @Override
    @Transactional
    public TaskProject saveProject(TaskProject data) {
        TaskProject project = data.getId() == null ? new TaskProject() : taskProjectRepository.findOne(data.getId());
        if (project == null) {
            throw new IllegalArgumentException("Task project " + data.getId() + " not found");
        }
        project.setCode(data.getCode());
        project.setCourse(data.getCourse());
        project.setName(data.getName());
        project.setTitle(data.getTitle());
        project.setDescription(data.getDescription());
        project.setNote(data.getNote());
        project.setFeatured(data.isFeatured());
        project.setOrderId(data.getOrderId());
        return taskProjectRepository.save(project);
    }

    @Override
    @Transactional
    public void deleteProject(int projectId) {
        taskProjectRepository.delete(projectId);
    }
}
