package util;

import model.Category;

import java.util.Comparator;

/**
 * Comparator for Category that sorts hierarchically:
 * 1. Top-level categories (modules) before their children
 * 2. Within the same parent, by orderId, then id
 */
public class CategoryComparator implements Comparator<Category> {

    @Override
    public int compare(Category c1, Category c2) {
        Category p1 = c1.getParentCategory();
        Category p2 = c2.getParentCategory();
        
        // Both are top-level (no parent): sort by orderId, then id
        if (p1 == null && p2 == null) {
            if (c1.getOrderId() != c2.getOrderId()) {
                return Integer.compare(c1.getOrderId(), c2.getOrderId());
            }
            return Integer.compare(c1.getId(), c2.getId());
        }
        // c1 is top-level, c2 is child: c1 comes first
        if (p1 == null) {
            return -1;
        }
        // c2 is top-level, c1 is child: c2 comes first
        if (p2 == null) {
            return 1;
        }
        // Both have parents: compare parents first
        if (p1.getOrderId() != p2.getOrderId()) {
            return Integer.compare(p1.getOrderId(), p2.getOrderId());
        }
        if (!p1.getId().equals(p2.getId())) {
            return Integer.compare(p1.getId(), p2.getId());
        }
        // Same parent: sort by orderId, then id
        if (c1.getOrderId() != c2.getOrderId()) {
            return Integer.compare(c1.getOrderId(), c2.getOrderId());
        }
        return Integer.compare(c1.getId(), c2.getId());
    }
}
